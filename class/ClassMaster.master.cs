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

public partial class class_ClassMaster : System.Web.UI.MasterPage
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

    public void readNew(SqlConnection con)
    {
        Image[] newimage = { newimage11, newimage12, newimage13, 
                             newimage21, newimage22, newimage23, 
                             newimage31, newimage32, newimage33, 
                             newimage41, newimage42, newimage43, 
                             newimage51, newimage52, newimage53, 
                             newimage61, newimage62, newimage63 };
        HyperLink[] newtitle = { newtitle11, newtitle12, newtitle13, 
                                 newtitle21, newtitle22, newtitle23, 
                                 newtitle31, newtitle32, newtitle33, 
                                 newtitle41, newtitle42, newtitle43, 
                                 newtitle51, newtitle52, newtitle53, 
                                 newtitle61, newtitle62, newtitle63 };
        HyperLink[] newimagelink = { newimagelink11, newimagelink12, newimagelink13, 
                                     newimagelink21, newimagelink22, newimagelink23, 
                                     newimagelink31, newimagelink32, newimagelink33, 
                                     newimagelink41, newimagelink42, newimagelink43, 
                                     newimagelink51, newimagelink52, newimagelink53, 
                                     newimagelink61, newimagelink62, newimagelink63 };
        int classindex = Convert.ToInt32(Context.Request["class"].ToString());
        SqlCommand cmd;
        if (classindex % 100 == 0)
        {
            string min = classindex.ToString();
            string max = (classindex + 100).ToString();
            cmd = new SqlCommand("SELECT TOP 18 * FROM [ImageText] WHERE [state]=1 AND [class]>=" + min + " AND [class]<" + max + " ORDER BY [it] DESC", con);
        }
        else
        {
            cmd = new SqlCommand("SELECT TOP 18 * FROM [ImageText] WHERE [state]=1 AND [class]=" + classindex + " ORDER BY [it] DESC", con);
        }
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 18; i++)
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
        Image[] hotimage = { hotimage11, hotimage12, hotimage13, 
                             hotimage21, hotimage22, hotimage23, 
                             hotimage31, hotimage32, hotimage33, 
                             hotimage41, hotimage42, hotimage43, 
                             hotimage51, hotimage52, hotimage53, 
                             hotimage61, hotimage62, hotimage63 };
        HyperLink[] hottitle = { hottitle11, hottitle12, hottitle13, 
                                 hottitle21, hottitle22, hottitle23, 
                                 hottitle31, hottitle32, hottitle33, 
                                 hottitle41, hottitle42, hottitle43, 
                                 hottitle51, hottitle52, hottitle53, 
                                 hottitle61, hottitle62, hottitle63 };
        HyperLink[] hotimagelink = { hotimagelink11, hotimagelink12, hotimagelink13, 
                                     hotimagelink21, hotimagelink22, hotimagelink23, 
                                     hotimagelink31, hotimagelink32, hotimagelink33, 
                                     hotimagelink41, hotimagelink42, hotimagelink43, 
                                     hotimagelink51, hotimagelink52, hotimagelink53, 
                                     hotimagelink61, hotimagelink62, hotimagelink63 };
        int classindex = Convert.ToInt32(Context.Request["class"].ToString());
        SqlCommand cmd;
        if (classindex % 100 == 0)
        {
            string min = classindex.ToString();
            string max = (classindex + 100).ToString();
            cmd = new SqlCommand("SELECT TOP 18 * FROM [ImageText] WHERE [state]=1 AND [class]>=" + min + " AND [class]<" + max + " ORDER BY ([read]+[danmaku]) DESC", con);
        }
        else
        {
            cmd = new SqlCommand("SELECT TOP 18 * FROM [ImageText] WHERE [state]=1 AND [class]=" + classindex + " ORDER BY ([read]+[danmaku]) DESC", con);
        }
        SqlDataReader reader = cmd.ExecuteReader();
        for (int i = 0; reader.Read() && i < 18; i++)
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

    protected void Page_Load(object sender, EventArgs e)
    {
        string value = Context.Request["class"];
        string strConn = WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();

        readNew(con);
        readHot(con);
    }
}
