using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; // чтобы получать строку подключения

namespace TreningCo1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = null;
        HttpCookie metka = null;
        HttpCookie login = null;
        HttpCookie sign = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString; //по ключу ServerConnection получим из configuration строку и обратимся к свойству ConnectionString

            conn = new SqlConnection(ConnectionString);

            try
            {
                conn.Open();
            }
            catch
            {
                string script = "alert('Ошибка подключения к серверу. Пожалуйста, перезагрузите страницу или зайдите позднее')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> db_user = new Dictionary<string, string>();
            SqlCommand getUsrCred = new SqlCommand("select login.Login, login.Password from MARI.login", conn);

            SqlDataReader sqlReader = null;

            sqlReader = getUsrCred.ExecuteReader();

            while (sqlReader.Read())
            {
                db_user.Add(Convert.ToString(sqlReader["Login"]), Convert.ToString(sqlReader["Password"]));
            }

            if (sqlReader != null)
                sqlReader.Close();

            Dictionary<string, string> db_trener = new Dictionary<string, string>();
            SqlCommand getTrenCred = new SqlCommand("select Login, Password from MARI.LogTren", conn);

            sqlReader = getTrenCred.ExecuteReader();

            while (sqlReader.Read())
            {
                db_trener.Add(Convert.ToString(sqlReader["Login"]), Convert.ToString(sqlReader["Password"]));
            }

            if (sqlReader != null)
                sqlReader.Close();

            try {
                if (TextBox2.Text == db_user[TextBox1.Text.Trim()]) //словарь сравнивает значение пароля в текстбоксе и в словаре по ключу-логину
                {
                    login = new HttpCookie("login", TextBox1.Text.Trim());
                    sign = new HttpCookie("sign", SignGenerator.GetSign(TextBox1.Text.Trim() + "bytepp"));
                    metka = new HttpCookie("authorize", "authorize");

                    SqlCommand getid = new SqlCommand("select [IDKL] from [MARI].[KLIENTI] klient join[MARI].[Login] userauth on userauth.[Id] = klient.[IDKL] where userauth.[Login] = @login", conn);
                    getid.CommandType = CommandType.Text;
                    getid.Parameters.AddWithValue("login", TextBox1.Text.Trim());
                    getid.ExecuteNonQuery();

                    HttpCookie id = null;

                    SqlDataReader reader = getid.ExecuteReader();
                    while (reader.Read())
                    {
                        id = new HttpCookie("id", Convert.ToString(reader.GetValue(0)));
                    }
                    reader.Close();

                    Response.Cookies.Add(login); //добавляем в коллекцию кукисов свои
                    Response.Cookies.Add(sign);
                    Response.Cookies.Add(metka);
                    Response.Cookies.Add(id);

                    Response.Redirect("UserPage.aspx"); //передаем на след. страницу кукисы
                }
            }
            catch { }

            try { 
            if (TextBox2.Text.Trim() == db_trener[TextBox1.Text.Trim()])
            {
                login = new HttpCookie("login", TextBox1.Text.Trim());
                sign = new HttpCookie("sign", SignGenerator.GetSign(TextBox1.Text.Trim() + "bytepp"));
                metka = new HttpCookie("authorize", "authorize");

                SqlCommand getid = new SqlCommand("select trener.[IDTRENER] from [MARI].[TRENERI] trener join[MARI].[LogTren] trenauth on trenauth.[IDTRENER] = trener.[IDTRENER] where trenauth.[Login] = @login", conn);
                getid.CommandType = CommandType.Text;
                getid.Parameters.AddWithValue("login", TextBox1.Text.Trim());
                getid.ExecuteNonQuery();

                HttpCookie idtren = null;

                SqlDataReader reader = getid.ExecuteReader();
                while (reader.Read())
                {
                    idtren = new HttpCookie("idtren", Convert.ToString(reader.GetValue(0)));
                }
                reader.Close();

                Response.Cookies.Add(login); //добавляем в коллекцию кукисов свои
                Response.Cookies.Add(sign);
                Response.Cookies.Add(metka);
                Response.Cookies.Add(idtren);

                Response.Redirect("TrenerPage.aspx"); //передаем на след. страницу кукисы
            }
            }
            catch { }

        }

        protected void Page_Unload(object sender, EventArgs e) //чтобы не было утечки памяти, закрываем подключение при уничтожении (разгрузке) страницы
        {
            if (conn != null && conn.State != ConnectionState.Closed)
                conn.Close();
        }

    }
}