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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn1 = null;
        string[] getid = new string[20];

        protected void Page_Load(object sender, EventArgs e)
        {
            string ConnStr = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString; //по ключу ServerConnection получим из configuration строку, и обратимся к свойству ConnectionString

            conn1 = new SqlConnection(ConnStr);

            try
            { 
            conn1.Open();
                SqlCommand command;
                command = conn1.CreateCommand();

                command.CommandText = "SELECT top 1 IDKL FROM TreningCo.MARI.KLIENTI ORDER BY IDKL DESC";
                SqlDataReader reader = command.ExecuteReader();

                int i = 0;
                while (reader.Read())
                {
                    getid[i] = Convert.ToString(reader.GetValue(0));
                    i++;
                }
                reader.Close();
            }
            catch
            {
                string script = "alert('Ошибка подключения к серверу. Пожалуйста, перезагрузите страницу или зайдите позднее')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> db = new Dictionary<string, string>();

            SqlCommand getUsrCred = new SqlCommand("select login.Login, login.Password from MARI.login", conn1);

            SqlDataReader sqlReader = null;

            sqlReader = getUsrCred.ExecuteReader();

            while (sqlReader.Read())
            {
                db.Add(Convert.ToString(sqlReader["Login"]), Convert.ToString(sqlReader["Password"]));
            }

            if (sqlReader != null)
                sqlReader.Close();

            if (!db.Keys.Contains(TextBox1.Text.Trim()))
            {
                SqlCommand sqlcmd = new SqlCommand("UserReg", conn1);
                sqlcmd.CommandType = CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@id", Convert.ToString(Convert.ToDecimal(getid[0]) + 1));
                sqlcmd.Parameters.AddWithValue("@name", TextBox3.Text.Trim()); //trim для удаления лишних пробелов
                sqlcmd.Parameters.AddWithValue("@fam", TextBox4.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@otch", TextBox5.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@tel", TextBox6.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@email", TextBox7.Text.Trim());
                sqlcmd.ExecuteNonQuery();

                SqlCommand regUser = new SqlCommand("UserLogin", conn1);
                regUser.CommandType = CommandType.StoredProcedure;
                regUser.Parameters.AddWithValue("id", Convert.ToString(Convert.ToDecimal(getid[0]) + 1));
                regUser.Parameters.AddWithValue("Login", TextBox1.Text.Trim());
                regUser.Parameters.AddWithValue("Password", TextBox2.Text.Trim());

                regUser.ExecuteNonQuery();

                Response.Redirect("Login.aspx");
            }
            else
            {
                string script = "alert('Такой логин уже есть!')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }
        }

        protected void Page_Unload(object sender, EventArgs e) //чтобы не было утечки памяти, закрываем подключение при уничтожении (разгрузке) страницы
        {
            if (conn1 != null && conn1.State != ConnectionState.Closed)
                conn1.Close();
        }
    }
}