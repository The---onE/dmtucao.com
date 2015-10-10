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

public partial class control_userinfo : System.Web.UI.UserControl
{
    Encrypt encrypt = new Encrypt();

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((bool)Session["Pass"])
        {
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 [key],[id] FROM [User] WHERE [username]='" + Session["UserName"].ToString() + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                if (encrypt.KeyHash(Session["key"].ToString()) == reader["key"].ToString())
                {
                    LoggedIn.Visible = true;
                    NotLoggedIn.Visible = false;
                    nickname.Text = this.Session["NickName"].ToString();
                    usercenter.NavigateUrl = "~/user/center.aspx?id=" + reader["id"].ToString();
                }
                else
                {
                    LoggedIn.Visible = false;
                    NotLoggedIn.Visible = true;
                    Session["Pass"] = false;
                    Session["UserName"] = "";
                    Session["NickName"] = "";
                    Session["Key"] = 0;
                    HttpCookie login = new HttpCookie("login");
                    login.Expires = DateTime.Today.AddDays(10);
                    login.Values.Add("pass", "false");
                    login.Values.Add("username", "");
                    login.Values.Add("nickname", "");
                    login.Values.Add("key", "0");
                    Response.AppendCookie(login);
                }
            }
            else
            {
                LoggedIn.Visible = false;
                NotLoggedIn.Visible = true;
                Session["Pass"] = false;
                Session["UserName"] = "";
                Session["NickName"] = "";
                Session["Key"] = 0;
                HttpCookie login = new HttpCookie("login");
                login.Expires = DateTime.Today.AddDays(10);
                login.Values.Add("pass", "false");
                login.Values.Add("username", "");
                login.Values.Add("nickname", "");
                login.Values.Add("key", "0");
                Response.AppendCookie(login);
            }
        }
        else
        {
            LoggedIn.Visible = false;
            NotLoggedIn.Visible = true;
            Session["Pass"] = false;
            Session["UserName"] = "";
            Session["NickName"] = "";
            Session["Key"] = 0;
            HttpCookie login = new HttpCookie("login");
            login.Expires = DateTime.Today.AddDays(10);
            login.Values.Add("pass", "false");
            login.Values.Add("username", "");
            login.Values.Add("nickname", "");
            login.Values.Add("key", "0");
            Response.AppendCookie(login);
        }
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        if ((bool)Session["pass"])
        {
            LoggedIn.Visible = false;
            NotLoggedIn.Visible = true;
            Session["Pass"] = false;
            Session["UserName"] = "";
            Session["NickName"] = "";
            Session["Key"] = 0;
            HttpCookie login = new HttpCookie("login");
            login.Expires = DateTime.Today.AddDays(10);
            login.Values.Add("pass", "false");
            login.Values.Add("username", "");
            login.Values.Add("nickname", "");
            login.Values.Add("key", "0");
            Response.AppendCookie(login);
        }
        Response.Redirect(Request.Url.ToString()); 
    }
}