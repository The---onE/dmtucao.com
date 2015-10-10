using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Text;
using System.Security.Cryptography;

public partial class user_login : System.Web.UI.Page
{
    Encrypt encrypt = new Encrypt();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT [id],[username],[password],[nickname],[key] FROM [User] WHERE [username]='" + UserName.Text + "'", con);
        SqlCommandBuilder scb = new SqlCommandBuilder(da);
        DataSet ds = new DataSet();
        da.Fill(ds, "user");

        if (ds.Tables["user"].Rows.Count > 0)
        {
            if (encrypt.PasswordHash(Password.Text) == ds.Tables["user"].Rows[0]["password"].ToString())
            {
                string key;
                Random seed = new Random();
                key = seed.Next(1, int.MaxValue).ToString();
                ds.Tables["user"].Rows[0]["key"] = encrypt.KeyHash(key);
                da.Update(ds, "user");

                Session["Pass"] = true;
                Session["UserName"] = UserName.Text;
                Session["NickName"] = ds.Tables["user"].Rows[0]["nickname"].ToString();
                Session["Key"] = key;
                if (Remember.Checked)
                {
                    HttpCookie login = new HttpCookie("login");
                    login.Expires = DateTime.Today.AddDays(10);
                    login.Values.Add("pass", "true");
                    login.Values.Add("username", UserName.Text);
                    login.Values.Add("nickname", ds.Tables["user"].Rows[0]["nickname"].ToString());
                    login.Values.Add("key", key);
                    Response.AppendCookie(login);
                }

                ClientScript.RegisterStartupScript(GetType(), "成功", "<script>alert('登录成功，将跳转至首页');window.location.href='../index.aspx'</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('用户名或密码错误');</script>");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('用户名不存在');</script>");
        }
        con.Close();
        con = null;
        return;
    }
}