using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TreningCo1
{
    public partial class UserPage : System.Web.UI.Page
    {
        HttpCookie metka = null;
        string stroka = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie login = Request.Cookies["login"]; //получаем из запроса куки по ключу login
            HttpCookie sign = Request.Cookies["sign"];

            metka = Request.Cookies["authorize"];
            HttpCookie id = Request.Cookies["id"];

            SqlConnection conn2 = new SqlConnection(stroka);

            if (sign != null && login != null)   //проверяем, есть ли у пользователя кукисы
            {
                if (sign.Value == SignGenerator.GetSign(login.Value + "bytepp")) //сравниваем с цифровой подписью
                {

                    conn2.Open();

                    SqlCommand getname = new SqlCommand("select klient.[ИМЯ] from [MARI].[KLIENTI] klient join[MARI].[Login] login on login.Id = klient.IDKL where klient.IDKL = @id", conn2);
                    getname.CommandType = CommandType.Text;
                    getname.Parameters.AddWithValue("id", id.Value);

                    HttpCookie name = null;
                    SqlDataReader rdr = null;
                    rdr = getname.ExecuteReader();

                    while (rdr.Read())
                    {
                        name = new HttpCookie("id",Convert.ToString(rdr.GetValue(0)));
                    }
                    rdr.Close();

                    Label1.Text = "Добро пожаловать, " + name.Value + "!";
                    return;
                }
            }
            

            Response.Redirect("Login.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(metka);
            Response.Redirect("Logout.aspx");
        }
    }
}