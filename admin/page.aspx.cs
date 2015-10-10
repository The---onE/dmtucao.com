using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class admin_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string value = Context.Request["it"];
        if (value == null)
            return;
        string sql = "SELECT [index], [url] FROM [Url] WHERE [it] = @it ORDER BY [index]";
        sql = sql.Replace("@it", value);
        SqlDataSource.SelectCommand = sql;
    }
    protected void Add_Click(object sender, EventArgs e)
    {
        string value = Context.Request["it"];
        if (value == null)
            return;
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        string insert = "INSERT INTO [Url] ([index],[it],[url]) values(@index,@it,@url)";
        insert = insert.Replace("@it", "'" + value + "'");
        insert = insert.Replace("@url", "'" + txtUrl.Text + "'");
        string replace = string.Copy(insert);
        int index = Convert.ToInt32(value) * 1000 + GridView1.Rows.Count + 1;
        insert = insert.Replace("@index", "'" + index.ToString() + "'");
        for (int i = 0; i < 1000; i++ )
        {
            try
            {
                SqlCommand cmd = new SqlCommand(insert, con);
                int count = cmd.ExecuteNonQuery();
                if (1 == count)
                {
                    ClientScript.RegisterStartupScript(GetType(), "成功", "<script>alert('添加成功');window.location.reload();</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('添加失败，请重试');</script>");
                }
                break;
            }
            catch
            {
                insert = string.Copy(replace);
                index++;
                insert = insert.Replace("@index", "'" + index.ToString() + "'");
            }
        }
        con.Close();
        con = null;
        return;
    }
}