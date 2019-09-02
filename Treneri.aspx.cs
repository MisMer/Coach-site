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
    public partial class Treneri : System.Web.UI.Page
    {
        HttpCookie metka = null;
        Control lichkab = null;
        Control vhod = null;
        Control registr = null;
        Control dicsl1 = null;
        SqlConnection conn3 = null;
        string[] gettrener = new string[20];
        string[] getdolzh = new string[20];



        protected void Page_Load(object sender, EventArgs e)
        {
            metka = Request.Cookies["authorize"];
            lichkab = FindControl("LichKab");
            vhod = FindControl("Login");
            registr = FindControl("Reg");
            dicsl1 = FindControl("disclaim1");
            lichkab.Visible = false;
            
            


            if (metka != null)
            {
                lichkab.Visible = true;
                Button2.Visible = true;
                vhod.Visible = false;
                registr.Visible = false;
            }
            else
            {
                lichkab.Visible = false;
                Button2.Visible = false;
                vhod.Visible = true;
                registr.Visible = true;
            }

            string ConnectionString = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString; //по ключу ServerConnection получим из configuration строку и обратимся к свойству ConnectionString

            conn3 = new SqlConnection(ConnectionString);

            try
            {
                conn3.Open();
                
            }

            catch
            {
                string script = "alert('Ошибка подключения к серверу. Пожалуйста, перезагрузите страницу или зайдите позднее')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }

            SqlCommand command1;
            SqlCommand command2;
            command1 = conn3.CreateCommand();
            command2 = conn3.CreateCommand();

            command1.CommandText = "SELECT TOP (4) ИМЯ, ФАМИЛИЯ, ОТЧЕСТВО FROM TreningCo.mari.TRENERI";
            SqlDataReader reader = null;
            reader = command1.ExecuteReader();
            
            
            int i = 0;
            while (reader.Read())
            {
                gettrener[i] = Convert.ToString(reader.GetValue(0)) + " " + Convert.ToString(reader.GetValue(1)) + " " + Convert.ToString(reader.GetValue(2));
                i++;
            }
            reader.Close();
            reader = null; i = 0;
            command2.CommandText = "SELECT TOP (4) [Должность] FROM TreningCo.mari.TRENERI";
            reader = command2.ExecuteReader();

            while (reader.Read())
            {
                getdolzh[i] = Convert.ToString(reader.GetValue(0));
                i++;
            }
            reader.Close();

            Label1.Text = gettrener[0];
            Label2.Text = gettrener[1];
            Label3.Text = gettrener[2];
            Label4.Text = gettrener[3];
            Label5.Text = getdolzh[0];
            Label6.Text = getdolzh[1];
            Label7.Text = getdolzh[2];
            Label8.Text = getdolzh[3];
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(metka);
            Response.Redirect("Logout.aspx");
        }

    }
}