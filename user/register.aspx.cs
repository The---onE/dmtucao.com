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

public partial class user_register : System.Web.UI.Page
{
    Encrypt encrypt = new Encrypt();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();

        SqlCommand usertest = new SqlCommand("SELECT [username] FROM [User] WHERE [username]=@username", con);
        usertest.Parameters.AddWithValue("@username", UserName.Text);
        SqlDataReader usersdr = usertest.ExecuteReader();
        if (usersdr.Read())
        {
            ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('用户名已存在，请尝试其他用户名');</script>");
            con.Close();
            con = null;
            return;
        }
        usersdr.Close();

        SqlCommand nicktest = new SqlCommand("SELECT [nickname] FROM [User] WHERE [nickname]=@nickname", con);
        nicktest.Parameters.AddWithValue("@nickname", NickName.Text);
        SqlDataReader nicksdr = nicktest.ExecuteReader();
        if (nicksdr.Read())
        {
            ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('昵称已存在，请尝试其他昵称');</script>");
            con.Close();
            con = null;
            return;
        }
        nicksdr.Close();

        SqlCommand cmd = new SqlCommand("INSERT INTO [User] ([username],[password],[nickname],[key],[time],[email]) values(@username,@password,@nickname,@key,@time,@email)", con);
        string key;
        Random seed = new Random();
        key = seed.Next(1, int.MaxValue).ToString();
        cmd.Parameters.AddWithValue("@username", UserName.Text);
        cmd.Parameters.AddWithValue("@password", encrypt.PasswordHash(Password.Text));
        cmd.Parameters.AddWithValue("@nickname", NickName.Text);
        cmd.Parameters.AddWithValue("@key", encrypt.KeyHash(key));
        cmd.Parameters.AddWithValue("@time", DateTime.Now);
        cmd.Parameters.AddWithValue("@email", Email.Text);
        int count = cmd.ExecuteNonQuery();
        if (1 == count)
        {
            Session["Pass"] = true;
            Session["UserName"] = UserName.Text;
            Session["NickName"] = NickName.Text;
            Session["Key"] = key;
            ClientScript.RegisterStartupScript(GetType(), "成功", "<script>alert('注册成功，将跳转至首页');window.location.href='../index.aspx'</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "失败", "<script>alert('注册失败，请重试');</script>");
        }
        cmd = null;
        con.Close();
        con = null;
        return;
    }
}