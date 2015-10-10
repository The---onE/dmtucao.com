using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class ImageText : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PageIndex.Value == "-1")
        {
            data.Visible = false;
            review.Visible = false;
            control.Visible = false;
            danmaku.Visible = false;
        }
        string sql = "SELECT [index] AS 序号, [comment] AS 评论, [date] AS 日期, [user] AS 发送者, [type]  AS 类型, [color] AS 颜色, [size] AS 字体 FROM [comment] WHERE [it] = @it ORDER BY [index] DESC";
        sql = sql.Replace("@it", PageIndex.Value);
        Comment.SelectCommand = sql;
    }

    protected void Comment_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows <= 0)
        {
            NoComment.Visible = true;
        }
        else
        {
            NoComment.Visible = false;
        }
    }

    protected void btnPost_Click(object sender, EventArgs e)
    {
        if (txtComment.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('内容不能为空')", true);
            return;
        }
        else
        {
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [comment] ([comment],[date],[user],[type],[it]) values(@comment,@date,@user,@type,@it)", con);
            cmd.Parameters.AddWithValue("@comment", txtComment.Text);
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            if ((bool)Session["pass"])
            {
                cmd.Parameters.AddWithValue("@user", Session["NickName"].ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@user", "_guest");
            }
            cmd.Parameters.AddWithValue("@type", Convert.ToByte(ddlType.SelectedValue));
            cmd.Parameters.AddWithValue("@it", Convert.ToInt32(PageIndex.Value));
            int count = cmd.ExecuteNonQuery();
            if (1 == count)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('评论成功')", true);
                CommentTable.DataBind();
                SqlCommand read = new SqlCommand("UPDATE [ImageText] SET [danmaku]=@danmaku WHERE [it]=@it", con);
                read.Parameters.AddWithValue("@danmaku", CommentTable.Rows.Count.ToString());
                read.Parameters.AddWithValue("@it", Context.Request["it"]);
                read.ExecuteNonQuery();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('评论失败，请重试')", true);
            }
            cmd = null;
            con.Close();
            con = null;
            return;
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        CommentTable.DataBind();
    }
}
