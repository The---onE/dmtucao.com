using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class class_class2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string value = Context.Request["class"];
            if (Convert.ToInt16(value) % 100 == 0)
            {
                Response.Redirect("~/class/class1.aspx?page=1&class=" + value);
            }
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Class] WHERE [class] = @class", con);
            cmd.Parameters.AddWithValue("@class", value);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string title = reader["title"].ToString();
                Page.Title = title;
                TitleLink.Text = title;
                reader.Close();
                string super = (Convert.ToInt16(value) / 100 * 100).ToString();
                SqlCommand read = new SqlCommand("SELECT * FROM [Class] WHERE [class] = @class", con);
                read.Parameters.AddWithValue("@class", super);
                reader = read.ExecuteReader();
                if (reader.Read())
                {
                    ClassLink1.Text = reader["title"].ToString();
                    ClassLink1.NavigateUrl = "~/class/class1.aspx?page=1&class=" + super;
                }
                reader.Close();
            }
            else
            {
                reader.Close();
                con.Close();
                con = null;
                Response.Redirect("~/class/class1.aspx?page=1&class=" + (Convert.ToInt16(value) / 100 * 100).ToString());
            }

            con.Close();
            con = null;
            return;
        }
    }
}