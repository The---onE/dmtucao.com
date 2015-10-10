using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class it_it : System.Web.UI.Page
{
    public bool readClass1(SqlConnection con,int classindex)
    {
        bool flag = true;
        string super = (classindex / 100 * 100).ToString();
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Class] WHERE [class] = @class", con);
        cmd.Parameters.AddWithValue("@class", super);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            ClassLink1.Text = reader["title"].ToString();
        }
        else
        {
            point2.Visible = false;
            point3.Visible = false;
            flag = false;
        }
        if (Convert.ToInt16(classindex) % 100 == 0)
        {
            point3.Visible = false;
            flag = false;
        }
        reader.Close();
        return flag;
    }
    public void readClass2(SqlConnection con, string strclass)
    {

        SqlCommand cmd = new SqlCommand("SELECT * FROM [Class] WHERE [class] = @class", con);
        cmd.Parameters.AddWithValue("@class", strclass);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            ClassLink2.Text = reader["title"].ToString();
        }
        else
        {
            point3.Visible = false;
        }
        reader.Close();
    }

    public void readPicture(SqlConnection con)
    {
        string value = Context.Request["it"];
        if (value == null)
            return;
        ((HiddenField)Master.FindControl("PageIndex")).Value = value;
        SqlCommand cmd = new SqlCommand("SELECT * FROM [ImageText] WHERE [it] = @it", con);
        cmd.Parameters.AddWithValue("@it", value);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string title = reader["title"].ToString();
            string strclass = reader["class"].ToString();
            int classindex = Convert.ToInt16(strclass);
            string state = reader["state"].ToString();
            string url = reader["imageurl"].ToString();
            int oldreaders = Convert.ToInt32(reader["read"].ToString());
            reader.Close();

            Page.Title = title;
            TitleLink.Text = title;
            ClassLink1.NavigateUrl = "~/class/class1.aspx?page=1&class=" + (classindex / 100 * 100).ToString();
            ClassLink2.NavigateUrl = "~/class/class2.aspx?page=1&class=" + strclass;
            if (readClass1(con, classindex))
                readClass2(con, strclass);
            if (state == "1")
            {
                SqlCommand read = new SqlCommand("UPDATE [ImageText] SET [read]=@read WHERE [it]=@it", con);
                read.Parameters.AddWithValue("@read", (oldreaders + 1).ToString());
                read.Parameters.AddWithValue("@it", value);
                read.ExecuteNonQuery();
                picture.ImageUrl = url;
                picturelink.NavigateUrl = url;
                page0.Value = url;
                try
                {
                    System.Net.WebRequest request = System.Net.WebRequest.Create(url);
                    request.Timeout = 10000;
                    System.Net.HttpWebResponse httpresponse = (System.Net.HttpWebResponse)request.GetResponse();
                    Stream s = httpresponse.GetResponseStream();
                    System.Drawing.Image img = System.Drawing.Image.FromStream(s);
                    if (img.Width > img.Height)
                    {
                        picture.Width = 630;
                    }
                    else
                    {
                        picture.Height = 630;
                    }
                }
                catch
                {
                    return;
                }
            }
        }
        reader.Close();
    }

    public void readPage(SqlConnection con)
    {
        string value = Context.Request["it"];
        if (value == null)
            return;
        ((HiddenField)Master.FindControl("PageIndex")).Value = value;
        SqlCommand cmd = new SqlCommand("SELECT * FROM [Url] WHERE [it] = @it ORDER BY [index]", con);
        cmd.Parameters.AddWithValue("@it", value);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 1; reader.Read(); i++)
        {
            HiddenField hid = new HiddenField();
            hid.ID = "page" + i.ToString();
            hid.Value = reader["url"].ToString();
            Url.Controls.Add(hid);
        }
        reader.Close();
    }

    public void readAbout(SqlConnection con)
    {
        string value = Context.Request["it"];
        if (value == null)
            return;
        ((HiddenField)Master.FindControl("PageIndex")).Value = value;
        SqlCommand cmd = new SqlCommand("SELECT * FROM [ImageText] WHERE [it] = @it", con);
        cmd.Parameters.AddWithValue("@it", value);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string title = reader["title"].ToString();
            string up = reader["up"].ToString();
            string tag = reader["tag"].ToString();
            string description = reader["description"].ToString();
            string state = reader["state"].ToString();
            string date = reader["date"].ToString();
            string read = reader["read"].ToString();
            string danmaku = reader["danmaku"].ToString();
            if (state == "1")
            {
                itTitle.Text = title;
                Date.Text = date;
                Read.Text = read;
                Danmaku.Text = danmaku;
                Uploader.Text = up;
                Tag.Text = tag;
                Description.Text = description;
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();

            readPicture(con);
            readPage(con);
            readAbout(con);
            
            con.Close();
            con = null;
            return;
        }
    }
}