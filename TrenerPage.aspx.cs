using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace TreningCo1
{
    public partial class TrenerPage : System.Web.UI.Page
    {
        HttpCookie metka = null;
        string stroka = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString;
        SqlConnection cnn2;
        string[] getidusr = new string[20];

        HttpCookie idtren = null;

        int index;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie login = Request.Cookies["login"]; //получаем из запроса куки по ключу login
            HttpCookie sign = Request.Cookies["sign"];

            metka = Request.Cookies["authorize"];
            idtren = Request.Cookies["idtren"];


            if (sign != null && login != null)   //проверяем, есть ли у пользователя кукисы
            {
                if (sign.Value == SignGenerator.GetSign(login.Value + "bytepp")) //сравниваем с цифровой подписью
                {
                    cnn2 = new SqlConnection(stroka);
                    cnn2.Open();

                    SqlCommand getname = new SqlCommand("select trener.[ИМЯ] from [MARI].[TRENERI] trener join [MARI].[LogTren] login on login.IDTRENER = trener.IDTRENER where trener.IDTRENER = @id", cnn2);
                    getname.CommandType = CommandType.Text;
                    getname.Parameters.AddWithValue("id", idtren.Value);

                    HttpCookie name = null;
                    SqlDataReader rdr = null;
                    rdr = getname.ExecuteReader();

                    while (rdr.Read())
                    {
                        name = new HttpCookie("idtren", Convert.ToString(rdr.GetValue(0)));
                    }
                    rdr.Close();

                    Label1.Text = "Добро пожаловать, " + name.Value + "!";
                    return;
                }
            }

            GridView2.DataBind();
            GridView3.DataBind();
            Response.Redirect("Login.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "Edit")
            {
                SqlDataReader rdr = null;
                SqlCommand telmail = new SqlCommand("select [Телефон], [E-mail] from[MARI].[Zayavki]", cnn2);

                rdr = telmail.ExecuteReader();

                string[] telefon = new string[20];
                int i = 0;
                while (rdr.Read())
                {
                    telefon[i] = Convert.ToString(rdr.GetValue(0));
                    i++;
                }
                rdr.Close();
                GetIndex.telefon = telefon[index];
                
            }

            if (e.CommandName == "Zapis")
            {
                index = Convert.ToInt32(e.CommandArgument);

                cnn2 = new SqlConnection(stroka);
                cnn2.Open();
                SqlDataReader reader = null;
                int i = 0;

                string[] mail = new string[20];

                cnn2 = new SqlConnection(stroka);
                cnn2.Open();

                SqlCommand command;
                command = cnn2.CreateCommand();

                command.CommandText = "SELECT top 1 IDKL FROM TreningCo.MARI.KLIENTI ORDER BY IDKL DESC";
                reader = command.ExecuteReader();

                i = 0;
                while (reader.Read())
                {
                    getidusr[i] = Convert.ToString(reader.GetValue(0));
                    i++;
                }
                reader.Close();

                string[] telefon = new string[20];
                SqlDataReader rdr;
                SqlCommand telmail = new SqlCommand("select [Телефон], [E-mail] from[MARI].[Zayavki]", cnn2);

                rdr = telmail.ExecuteReader();

                i = 0;
                while (rdr.Read())
                {
                    telefon[i] = Convert.ToString(rdr.GetValue(0));
                    mail[i] = Convert.ToString(rdr.GetValue(1));
                    i++;
                }
                rdr.Close();

                SqlCommand fiocom = new SqlCommand("SELECT TOP 1 [Фамилия], [Имя], [Отчество], [IDTRENING] FROM(select row_number() over(order by[N_Заявки]) as n, * from[MARI].[Zayavki]) x where n = @index", cnn2);

                fiocom.Parameters.AddWithValue("@index", index+1);

                string[] fam = new string[20];
                string[] name = new string[20];
                string[] otch = new string[20];
                string[] idtrening = new string[20];

                rdr = fiocom.ExecuteReader();

                i = 0;
                while (rdr.Read())
                {
                    fam[i] = Convert.ToString(rdr.GetValue(0));
                    name[i] = Convert.ToString(rdr.GetValue(1));
                    otch[i] = Convert.ToString(rdr.GetValue(2));
                    idtrening[i] = Convert.ToString(rdr.GetValue(3));
                    i++;
                }
                rdr.Close();

                SqlCommand proverka = new SqlCommand("if exists (select [ИМЯ], [ФАМИЛИЯ], [ОТЧЕСТВО] FROM [TreningCo].[MARI].[KLIENTI] where [ИМЯ]=@name and [Фамилия]=@fam and [Отчество]=@otch) select 1 else select 0", cnn2);
                proverka.Parameters.AddWithValue("@name", name[0]);
                proverka.Parameters.AddWithValue("@fam", fam[0]);
                proverka.Parameters.AddWithValue("otch", otch[0]);

                rdr = proverka.ExecuteReader();

                string[] prov = new string[5];

                i = 0;
                while (rdr.Read())
                {
                    prov[i] = Convert.ToString(rdr.GetValue(0));
                    i++;
                }
                rdr.Close();


                DropDownList DropDownList1 = GridView1.Rows[index].Cells[index].FindControl("DropDownList1") as DropDownList;

                string ngruppa;
                ngruppa = DropDownList1.SelectedItem.Value;

                SqlCommand grupins = new SqlCommand("InsertGrup", cnn2);
                grupins.CommandType = CommandType.StoredProcedure;

                SqlCommand kontrolins = new SqlCommand("insert into [MARI].[KONTROL] ([IDKL], [IDTRENING]) values (@idkl, @idtr)", cnn2);

                string[] usrid = new string[5];

                if (prov[0] == "0")
                {

                    SqlCommand commandins = new SqlCommand("UserReg", cnn2);
                    commandins.CommandType = CommandType.StoredProcedure;

                    commandins.Parameters.AddWithValue("@id", Convert.ToString(Convert.ToDecimal(getidusr[0]) + 1));
                    commandins.Parameters.AddWithValue("@fam", fam[0]);
                    commandins.Parameters.AddWithValue("@name", name[0]);
                    commandins.Parameters.AddWithValue("@otch", otch[0]);
                    commandins.Parameters.AddWithValue("@tel", telefon[index]);
                    commandins.Parameters.AddWithValue("@email", mail[index]);

                    commandins.ExecuteNonQuery();

                    grupins.Parameters.AddWithValue("@idkl", Convert.ToDecimal(getidusr[0]) + 1);
                    grupins.Parameters.AddWithValue("@idtrening", idtrening[0]);
                    grupins.Parameters.AddWithValue("@idtrener", idtren.Value);
                    grupins.Parameters.AddWithValue("@ngrup", ngruppa);

                    grupins.ExecuteNonQuery();

                    kontrolins.Parameters.AddWithValue("@idkl", Convert.ToDecimal(getidusr[0]) + 1);
                    kontrolins.Parameters.AddWithValue("@idtr", idtrening[0]);
                    kontrolins.ExecuteNonQuery();

                }
                if (prov[0] == "1")
                {
                    SqlCommand poiskusrid = new SqlCommand("select [IDKL] from [MARI].[KLIENTI] where [ФАМИЛИЯ]=@fam and [ИМЯ]=@name and [ТЕЛЕФОН]=@tel", cnn2);
                    poiskusrid.Parameters.AddWithValue("@fam", fam[0]);
                    poiskusrid.Parameters.AddWithValue("@name", name[0]);
                    poiskusrid.Parameters.AddWithValue("@tel", telefon[index]);

                    rdr = poiskusrid.ExecuteReader();

                    i = 0;
                    while (rdr.Read())
                    {
                        usrid[i] = Convert.ToString(rdr.GetValue(0));
                        i++;
                    }
                    rdr.Close();

                    grupins.Parameters.AddWithValue("@idkl", Convert.ToDecimal(usrid[0]));
                    grupins.Parameters.AddWithValue("@idtrening", idtrening[0]);
                    grupins.Parameters.AddWithValue("@idtrener", idtren.Value);
                    grupins.Parameters.AddWithValue("@ngrup", ngruppa);

                    grupins.ExecuteNonQuery();

                    kontrolins.Parameters.AddWithValue("@idkl", Convert.ToDecimal(usrid[0]));
                    kontrolins.Parameters.AddWithValue("@idtr", idtrening[0]);
                    kontrolins.ExecuteNonQuery();

                }


                SqlCommand getnazv = new SqlCommand("select [НАЗВАНИЕ] from [TreningCo].[MARI].[TRENINGI] where [IDTRENING]=@idtrening", cnn2);

                getnazv.Parameters.AddWithValue("@idtrening", idtrening[0]);
                string[] nazv = new string[20];

                rdr = getnazv.ExecuteReader();

                i = 0;
                while (rdr.Read())
                {
                    nazv[i] = Convert.ToString(rdr.GetValue(0));
                    i++;
                }
                rdr.Close();

                SqlCommand viewins1 = new SqlCommand("insert into [TreningCo].[dbo].[InfaGoup] ([ФАМИЛИЯ],[ИМЯ],[ОТЧЕСТВО]) values (@fam, @name, @otch)", cnn2);
                viewins1.Parameters.AddWithValue("@fam", fam[0]);
                viewins1.Parameters.AddWithValue("@name", name[0]);
                viewins1.Parameters.AddWithValue("@otch", otch[0]);

                SqlCommand viewins2 = new SqlCommand("update [TreningCo].[dbo].[InfaGoup] set [IDTRENER]=@idtrener where [ФАМИЛИЯ] = @fam and [ИМЯ]=@name and [ОТЧЕСТВО]=@otch", cnn2);
                viewins2.Parameters.AddWithValue("@idtrener", idtren.Value);
                viewins2.Parameters.AddWithValue("@fam", fam[0]);
                viewins2.Parameters.AddWithValue("@name", name[0]);
                viewins2.Parameters.AddWithValue("@otch", otch[0]);
                viewins2.ExecuteNonQuery();

                SqlCommand viewins3 = new SqlCommand("update [TreningCo].[dbo].[InfaGoup] set [НАЗВАНИЕ]=@nazv where [ФАМИЛИЯ] = @fam and [ИМЯ]=@name and [ОТЧЕСТВО]=@otch", cnn2);
                viewins3.Parameters.AddWithValue("@nazv", nazv[0]);
                viewins3.Parameters.AddWithValue("@fam", fam[0]);
                viewins3.Parameters.AddWithValue("@name", name[0]);
                viewins3.Parameters.AddWithValue("@otch", otch[0]);
                viewins3.ExecuteNonQuery();

                GridView2.DataBind();
                GridView3.DataBind();

            }

            if (e.CommandName == "Delete")
            {
                //index = Convert.ToInt32(e.CommandArgument);
                //DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                //string fam = (string)dv1.Table.Rows[index][0];
                //string name = (string)dv1.Table.Rows[index][1];
                //string tel = GetIndex.telefon;
                ////Label2.Text = Convert.ToString(tel + fam + name);

                ////SqlCommand delet = new SqlCommand("delete from [MARI].[Zayavki] where ([ФАМИЛИЯ]=@fam and [ИМЯ]=@name and [ТЕЛЕФОН]=@tel)", cnn2);
                ////delet.Parameters.AddWithValue("@fam", fam);
                ////delet.Parameters.AddWithValue("@name", name);
                ////delet.Parameters.AddWithValue("@tel", tel);

                ////delet.ExecuteNonQuery();

                //SqlDataSource1.DeleteParameters["fam"].DefaultValue = fam;
                //SqlDataSource1.DeleteParameters["name"].DefaultValue = name;
                //SqlDataSource1.DeleteParameters["tel"].DefaultValue = tel;


                //SqlDataSource1.Delete();
            }


            if (e.CommandName == "Udali")
            {
                index = Convert.ToInt32(e.CommandArgument);
                DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                string fam = (string)dv1.Table.Rows[index][0];
                string name = (string)dv1.Table.Rows[index][1];
                string tel = GetIndex.telefon;
                //Label2.Text = Convert.ToString(tel + fam + name);

                SqlCommand delet = new SqlCommand("delete from [MARI].[Zayavki] where ([ФАМИЛИЯ]=@fam and [ИМЯ]=@name and [ТЕЛЕФОН]=@tel)", cnn2);
                delet.Parameters.AddWithValue("@fam", fam);
                delet.Parameters.AddWithValue("@name", name);
                delet.Parameters.AddWithValue("@tel", tel);

                delet.ExecuteNonQuery();
            }
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataView dv3 = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            
            if (e.CommandName == "Update")
            {
                index = Convert.ToInt32(e.CommandArgument);

                string fam = (string)dv3.Table.Rows[index][0];
                string name = (string)dv3.Table.Rows[index][1];
                string otch = (string)dv3.Table.Rows[index][2];

                DropDownList DropDownList2 = GridView3.Rows[index].Cells[index].FindControl("DropDownList2") as DropDownList;
                string rezult = DropDownList2.SelectedValue;

                SqlDataSource3.UpdateParameters["fam"].DefaultValue = fam;
                SqlDataSource3.UpdateParameters["name"].DefaultValue = name;
                SqlDataSource3.UpdateParameters["otch"].DefaultValue = otch;
                SqlDataSource3.UpdateParameters["Result"].DefaultValue = rezult;

                SqlDataSource3.Update();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(metka);
            Response.Redirect("Logout.aspx");
        }

        protected void Page_Unload(object sender, EventArgs e) //чтобы не было утечки памяти, закрываем подключение при уничтожении (разгрузке) страницы
        {
            if (cnn2 != null && cnn2.State != ConnectionState.Closed)
                cnn2.Close();
        }

    }
}
    
