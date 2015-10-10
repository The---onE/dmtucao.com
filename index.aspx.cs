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

public partial class _Default : System.Web.UI.Page
{
    public void makeThumbnail(string it, string Imageurl)
    {
        if (File.Exists(Server.MapPath("~/images/" + it + ".jpg")))
        {
            return;
        }
        else
        {
            try
            {
                System.Net.WebRequest request = System.Net.WebRequest.Create(Imageurl);
                request.Timeout = 10000;
                System.Net.HttpWebResponse httpresponse = (System.Net.HttpWebResponse)request.GetResponse();
                Stream s = httpresponse.GetResponseStream();
                System.Drawing.Image img = System.Drawing.Image.FromStream(s);
                int towidth = 135;
                int toheight = 80;
                int x = 0;
                int y = 0;
                int ow = img.Width;
                int oh = img.Height;
                System.Drawing.Image bitmap = new System.Drawing.Bitmap(towidth, toheight);
                System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap);
                g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
                g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                g.Clear(System.Drawing.Color.Transparent);
                g.DrawImage(img, new System.Drawing.Rectangle(0, 0, towidth, toheight),
                new System.Drawing.Rectangle(x, y, ow, oh),
                System.Drawing.GraphicsUnit.Pixel);
                try
                {
                    bitmap.Save(Server.MapPath("~/images/" + it + ".jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);
                }
                catch (System.Exception e)
                {
                    throw e;
                }
                finally
                {
                    img.Dispose();
                    bitmap.Dispose();
                    g.Dispose();
                }
                return;
            }
            catch
            {
                return;
            }
        }
    }

    public void readTopic(SqlConnection con)
    {
        SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM [ImageText] WHERE ([state]=1 AND [type]=1) ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            string url = reader["imageurl"].ToString();
            string it = reader["it"].ToString();
            reader.Close();
            TopicImage.ImageUrl = url;
            string link = "~/it/it.aspx?it=" + it;
            TopicLink.NavigateUrl = link;
        }
        reader.Close();
    }

    public void readNew(SqlConnection con)
    {
        Image[] newimage = { newimage1, newimage2, newimage3, newimage4, newimage5, newimage6};
        HyperLink[] newtitle = { newtitle1, newtitle2, newtitle3, newtitle4, newtitle5, newtitle6};
        HyperLink[] newimagelink = { newimagelink1, newimagelink2, newimagelink3, newimagelink4, newimagelink5, newimagelink6};
        SqlCommand cmd = new SqlCommand("SELECT TOP 6 * FROM [ImageText] WHERE [state]=1 ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 6; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            newimage[i].ImageUrl = "~/images/" + it + ".jpg";
            newtitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            newimagelink[i].NavigateUrl = url;
            newtitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    public void readHot(SqlConnection con)
    {
        Image[] hotimage = { hotimage1, hotimage2, hotimage3, hotimage4, hotimage5, hotimage6};
        HyperLink[] hottitle = { hottitle1, hottitle2, hottitle3, hottitle4, hottitle5, hottitle6};
        HyperLink[] hotimagelink = { hotimagelink1, hotimagelink2, hotimagelink3, hotimagelink4, hotimagelink5, hotimagelink6};
        SqlCommand cmd = new SqlCommand("SELECT TOP 6 * FROM [ImageText] WHERE [state]=1 ORDER BY ([read]+[danmaku]) DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 6; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            hotimage[i].ImageUrl = "~/images/" + it + ".jpg";
            hottitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            hotimagelink[i].NavigateUrl = url;
            hottitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    public void readClass1(SqlConnection con)
    {
        Image[] classimage = { classimage11, classimage12, classimage13, classimage14, classimage15 };
        HyperLink[] classtitle = { classtitle11, classtitle12, classtitle13, classtitle14, classtitle15 };
        HyperLink[] classimagelink = { classimagelink11, classimagelink12, classimagelink13, classimagelink14, classimagelink15 };
        SqlCommand cmd = new SqlCommand("SELECT TOP 5 * FROM [ImageText] WHERE [state]=1 AND [class]>=100 AND [class]<200 ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 5; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            classimage[i].ImageUrl = "~/images/" + it + ".jpg";
            classtitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            classimagelink[i].NavigateUrl = url;
            classtitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    public void readClass2(SqlConnection con)
    {
        Image[] classimage = { classimage21, classimage22, classimage23, classimage24, classimage25 };
        HyperLink[] classtitle = { classtitle21, classtitle22, classtitle23, classtitle24, classtitle25 };
        HyperLink[] classimagelink = { classimagelink21, classimagelink22, classimagelink23, classimagelink24, classimagelink25 };
        SqlCommand cmd = new SqlCommand("SELECT TOP 5 * FROM [ImageText] WHERE [state]=1 AND [class]>=200 AND [class]<300 ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 5; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            classimage[i].ImageUrl = "~/images/" + it + ".jpg";
            classtitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            classimagelink[i].NavigateUrl = url;
            classtitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    public void readClass3(SqlConnection con)
    {
        Image[] classimage = { classimage31, classimage32, classimage33, classimage34, classimage35 };
        HyperLink[] classtitle = { classtitle31, classtitle32, classtitle33, classtitle34, classtitle35 };
        HyperLink[] classimagelink = { classimagelink31, classimagelink32, classimagelink33, classimagelink34, classimagelink35 };
        SqlCommand cmd = new SqlCommand("SELECT TOP 5 * FROM [ImageText] WHERE [state]=1 AND [class]>=300 AND [class]<400 ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 5; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            classimage[i].ImageUrl = "~/images/" + it + ".jpg";
            classtitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            classimagelink[i].NavigateUrl = url;
            classtitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    public void readClass4(SqlConnection con)
    {
        Image[] classimage = { classimage41, classimage42, classimage43, classimage44, classimage45 };
        HyperLink[] classtitle = { classtitle41, classtitle42, classtitle43, classtitle44, classtitle45 };
        HyperLink[] classimagelink = { classimagelink41, classimagelink42, classimagelink43, classimagelink44, classimagelink45 };
        SqlCommand cmd = new SqlCommand("SELECT TOP 5 * FROM [ImageText] WHERE [state]=1 AND [class]>=400 AND [class]<500 ORDER BY [it] DESC", con);
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 5; i++)
        {
            string it = reader["it"].ToString();
            makeThumbnail(it, reader["imageurl"].ToString());
            classimage[i].ImageUrl = "~/images/" + it + ".jpg";
            classtitle[i].Text = reader["title"].ToString();
            string url = "~/it/it.aspx?it=" + reader["it"].ToString();
            classimagelink[i].NavigateUrl = url;
            classtitle[i].NavigateUrl = url;
        }
        reader.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();

        readTopic(con);
        readNew(con);
        readHot(con);
        readClass1(con);
        readClass2(con);
        readClass3(con);
        readClass4(con);

        con.Close();
        con = null;
        return;
    }
}
