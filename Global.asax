<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新会话启动时运行的代码
        if (Session["Pass"] == null)
        {
            Session.Add("Pass", false);
            Session.Add("UserName", "");
            Session.Add("NickName", "");
            Session.Add("Key", 0);
        }
        
        HttpCookie login = Request.Cookies["login"];
        if (login != null)
        {
            if (login.Values["pass"] == "true")
            {
                string strConn = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["dmtucaoConnectionString"].ConnectionString;
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(strConn);
                con.Open();
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand("SELECT [nickname] FROM [User] WHERE [username]=@username", con);
                cmd.Parameters.AddWithValue("@username", login.Values["username"]);
                System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["Pass"] = true;
                    Session["UserName"] = login.Values["username"];
                    Session["NickName"] = reader["nickname"];
                    Session["Key"] = login.Values["key"];
                }
            }
        }
    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为 InProc 时，才会引发 Session_End 事件。
        // 如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
