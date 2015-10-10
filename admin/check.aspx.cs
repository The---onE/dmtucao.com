using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class admin_check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Attributes.Add("style", "word-break:break-all;word-wrap:break-word"); 
        if (!IsPostBack)
        {
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE [limit]='1' AND [username]=@username", con);
            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read() && reader["limit"].ToString() == "1" && reader["username"].ToString() == Session["username"].ToString())
            {
                ClientScript.RegisterStartupScript(GetType(), "欢迎", "<script>alert('欢迎访问审核页面');</script>");
            }
            else
            {
                SqlDataSource.SelectCommand = null;
                ClientScript.RegisterStartupScript(GetType(), "权限不足", "<script>alert('对不起，您无权访问审核页面');window.location.href='../index.aspx'</script>");
            }
        }
    }
}