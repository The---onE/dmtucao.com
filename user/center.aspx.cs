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

public partial class user_center : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = null; ;
        if (!IsPostBack)
        {
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE [id]=@id", con);
            cmd.Parameters.AddWithValue("@id", Context.Request["id"]);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                username = reader["username"].ToString();
                NickName.Text = reader["nickname"].ToString();
                Face.ImageUrl = reader["face"].ToString();
                FaceUrl.Text = reader["face"].ToString();
                Sex.SelectedIndex = Convert.ToInt32(reader["sex"]);
                Email.Text = reader["email"].ToString();
                QQ.Text = reader["qq"].ToString();
                PhoneNumber.Text = reader["telephone"].ToString();
                Birthday.Text = reader["birthday"].ToString();
                Point.Text = reader["point"].ToString();
                Money.Text = reader["money"].ToString();
                Introduction.Text = reader["introduction"].ToString();
            }
            reader.Close();
            con.Close();
            con = null;
        }
        if (!(bool)Session["pass"] && Session["UserName"].ToString() != username)
        {
            FaceUrl.Enabled = false;
            Sex.Enabled = false;
            Email.Enabled = false;
            QQ.Enabled = false;
            PhoneNumber.Enabled = false;
            Birthday.Enabled = false;
            Introduction.Enabled = false;
            Submit.Visible = false;
        }
        return;
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [User] WHERE [username]='" + Session["UserName"] + "'", con);
        SqlCommandBuilder scb = new SqlCommandBuilder(da);
        DataSet ds = new DataSet();
        da.Fill(ds, "user");

        if (ds.Tables["user"].Rows.Count > 0)
        {
            ds.Tables["user"].Rows[0]["face"] = FaceUrl.Text;
            ds.Tables["user"].Rows[0]["sex"] = Sex.SelectedIndex;
            ds.Tables["user"].Rows[0]["email"] = Email.Text;
            ds.Tables["user"].Rows[0]["qq"] = QQ.Text;
            ds.Tables["user"].Rows[0]["telephone"] = PhoneNumber.Text;
            ds.Tables["user"].Rows[0]["birthday"] = Birthday.Text;
            ds.Tables["user"].Rows[0]["introduction"] = Introduction.Text;
            if (da.Update(ds, "user") == 1)
                ClientScript.RegisterStartupScript(GetType(), "成功", "<script>alert('修改成功');location.reload();</script>");
        }
        con.Close();
        con = null;
        return;
    }
}