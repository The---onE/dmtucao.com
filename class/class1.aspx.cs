using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class class_class1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string value = Context.Request["class"];
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Class] WHERE [class] = @class", con);
            cmd.Parameters.AddWithValue("@class", value);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Page.Title = reader["title"].ToString();
                TitleLink.Text = reader["title"].ToString();
            }
            reader.Close();

            con.Close();
            con = null;
            return;
        }
    }
}