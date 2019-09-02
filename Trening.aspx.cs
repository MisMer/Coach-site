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
    public partial class Trening : System.Web.UI.Page
    {
        HttpCookie metka = null;
        Control lichkab = null;
        Control vhod = null;
        Control registr = null;
        Control zayvk = null;
        SqlConnection cnn;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            metka = Request.Cookies["authorize"];
            lichkab = FindControl("LichKab");
            vhod = FindControl("Login");
            registr = FindControl("Reg");
            zayvk = FindControl("zayavka");
            lichkab.Visible = false;
            zayvk.Visible = false;

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

            string comm = ConfigurationManager.ConnectionStrings["ServerConnection"].ConnectionString;

            cnn = new SqlConnection(comm);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Cookies.Add(metka);
            Response.Redirect("Logout.aspx");
        }


        protected void zapis(int index)
        {
            int index1 = index;
            cnn.Open();
            string[] getid = new string[20];
            SqlCommand command;
            command = cnn.CreateCommand();

            command.CommandText = "SELECT top 1 N_Заявки FROM [MARI].[Zayavki] ORDER BY N_Заявки DESC";
            SqlDataReader reader = command.ExecuteReader();

            int i = 0;
            while (reader.Read())
            {
                getid[i] = Convert.ToString(reader.GetValue(0));
                i++;
            }
            reader.Close();

            SqlCommand RegZayav = new SqlCommand("insert into [MARI].[Zayavki] values (@Nzayav, @Name, @Fam, @Otch, @Tel, @Email, @idtr)", cnn);
            RegZayav.CommandType = CommandType.Text;

            string[] idtr = new string[20];

            SqlCommand getIdTrening = new SqlCommand("select IDTRENING from [MARI].[TRENINGI]", cnn);

            reader = getIdTrening.ExecuteReader();

            i = 0;
            while (reader.Read())
            {
                idtr[i] = Convert.ToString(reader.GetValue(0));
                i++;
            }
            reader.Close();

            RegZayav.Parameters.AddWithValue("@Nzayav", Convert.ToString(Convert.ToDecimal(getid[0]) + 1));
            RegZayav.Parameters.AddWithValue("@Name", TextBox3.Text.Trim());
            RegZayav.Parameters.AddWithValue("@Fam", TextBox4.Text.Trim());
            RegZayav.Parameters.AddWithValue("@Otch", TextBox5.Text.Trim());
            RegZayav.Parameters.AddWithValue("@Tel", TextBox6.Text.Trim());
            RegZayav.Parameters.AddWithValue("@Email", TextBox7.Text.Trim());
            RegZayav.Parameters.AddWithValue("@idtr", idtr[index1]);

            RegZayav.ExecuteNonQuery();


        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (e.CommandName == "ZapisClick")
            {
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                
                zayvk.Visible = true; 
            }
 
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            GridView grd = row.NamingContainer as GridView;
            //финиш ))
            Int32 id = 0;
            // это обращение если в DataKeyNames много перечислено полей
            Int32.TryParse(row.RowIndex.ToString(), out id);
            //если используешь только одно поле:
            //Int32.TryParse(grd.DataKeys[row.RowIndex].Value.ToString(), out id);
            GetIndex.Index = id;
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text == String.Empty || TextBox4.Text == String.Empty || TextBox6.Text == String.Empty)
            {
                
                string script = "alert('Введите данные заявки!')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                int index = GetIndex.Index;
                zapis(index);
            }
        }


        protected void Page_Unload(object sender, EventArgs e) //чтобы не было утечки памяти, закрываем подключение при уничтожении (разгрузке) страницы
        {
            if (cnn != null && cnn.State != ConnectionState.Closed)
                cnn.Close();
        }
    }
}