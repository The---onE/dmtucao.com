using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class admin_submit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO [ImageText] ([title],[imageurl],[date],[up],[description],[class],[tag]) values(@title,@imageurl,@date,@up,@description,@class,@tag)", con);
        cmd.Parameters.AddWithValue("@title", Title.Text);
        cmd.Parameters.AddWithValue("@imageurl", Imageurl.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        if ((bool)Session["pass"])
        {
            cmd.Parameters.AddWithValue("@up", Session["NickName"].ToString());
        }
        else
        {
            cmd.Parameters.AddWithValue("@up", "_guest");
        }
        cmd.Parameters.AddWithValue("@description", Description.Text);
        cmd.Parameters.AddWithValue("@class", classList.SelectedValue);
        cmd.Parameters.AddWithValue("@tag", Tag.Text);
        int count = cmd.ExecuteNonQuery();
        if (1 == count)
        {
            ClientScript.RegisterStartupScript(GetType(), "成功", "<script>alert('投稿成功');window.location.reload();</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('投稿失败，请重试');</script>");
        }
        cmd = null;
        con.Close();
        con = null;
        return;
    }
}