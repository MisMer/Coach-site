<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="TreningCo1.UserPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Личный кабинет</title>

    <style type="text/css">
         body {
            background: url(Images/userpage.jpg), rgba(255,255,255,0.8);
            background-size: 100%;
            background-blend-mode: screen;
            overflow-x: hidden;
        }

         @import url('https://fonts.googleapis.com/css?family=Cormorant');

        ul {
  list-style: none; /*убираем маркеры списка*/
  margin: 0; /*убираем верхнее и нижнее поле, равное 1em*/
  padding-left: 0; /*убираем левый отступ, равный 40px*/
}
a {text-decoration: none; /*убираем подчеркивание текста ссылок*/}

.menu-main {
  list-style: none;
  margin: 10px 0 5px;
  padding: 10px 0 5px;
  text-align: right;
}
.menu-main li {display: inline-block;}
.menu-main li:after {
  content: "|";
  color: #A03737;
  display: inline-block;
  vertical-align:top;
}
.menu-main li:last-child:after {content: none;}
.menu-main a {
  text-decoration: none;
  font-family: 'Cormorant', serif;
  letter-spacing: 2px;
  position: relative;
  padding-bottom: 5px;
  margin: 0 10px 0 10px;
  font-size: 20px;
  text-transform: uppercase;
  display: inline-block;
  transition: color .2s;
}
.menu-main a, .menu-main a:visited {color: #A03737;}
.menu-main a.current, .menu-main a:hover{color: #F0CA51;}
.menu-main a:before,
.menu-main a:after {
  content: "";
  position: absolute;
  height: 2px;
  top: auto;
  right: 50%;
  bottom: -3px;
  left: 50%;
  background: #F0CA51;
  transition: .8s;
}
.menu-main a:hover:before, .menu-main .current:before {left: 0;}
.menu-main a:hover:after, .menu-main .current:after {right: 0;}   
@media (max-width: 550px) {
.menu-main {padding-top: 0;}
.menu-main li {display: block;}
.menu-main li:after {content: none;}
.menu-main a {
  padding: 20px 0 20px; 
  margin: 0 30px;
}
}

.link1,.link2,.link3{

  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes fadeInDown {
  0% {
  opacity: 0;
  -webkit-transform: translate3d(0, -100%, 0);
  transform: translate3d(0, -100%, 0);
  }
  100% {
  opacity: 1;
  -webkit-transform: none;
  transform: none;
  }
  }
  @keyframes fadeInDown {
  0% {
  opacity: 0;
  -webkit-transform: translate3d(0, -100%, 0);
  transform: translate3d(0, -100%, 0);
  }
  100% {
  opacity: 1;
  -webkit-transform: none;
  transform: none;
  }
  } 

.link1, .link2, .link3
{
  animation-delay: 0s;
}

.link1{
     animation-delay: 1s;
}

.link2
{
  animation-delay: 2s;
}
.link3
{
  animation-delay: 3s;
}

.Lk{
    list-style: none;
    padding: 10px 20px 0px;
    text-align: left;
    float:left;
}

.Lk li{
    display: inline-block; /* Отображать как строчный элемент */
}

.Lk a {
  font-family: 'Cormorant', serif;
  color: #A03737;
  position: relative;
  padding-bottom: 0px;
  margin: 0 40px 0 10px;
  font-size: 17px;
  font-style:italic;
}

.Space
{
   margin-left: 50px;
}

.Glav {
  list-style: none;
    padding: 10px 10px 0px;
    text-align: right;
    float:right; /* Выравнивание с обтеканием элементов */
    font-family: 'Cormorant', serif;
      color: #A03737;
      position: relative;
      padding-bottom: 0px;
      margin: 0 0px 0 10px;
      font-size: 17px;
      font-style:italic;
}

fieldset{
    display:inline-block;
  text-transform: uppercase;
  text-align:center; 
  font-family: 'Cormorant', serif;
  color: #474842;
  background-color:white;
  border:none;
  width:100%;
}

p{
    text-indent: 70px;  /* Делаем отступ строки*/
           font-family: Century;
            font-style: italic;
            color: #474842;
            font-size: 25px;
}
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <ul class="Lk">
                <li><asp:Label ID="Label1" runat="server" Font-Size="20px" Text="Label" Font-Italic="True"></asp:Label></li>
                <li><asp:Button ID="Button1" CssClass="Space" runat="server" Font-Size="15px" Height="27px" Width="60px" Text="Выйти" OnClick="Button1_Click"/></li>
            </ul>
            <a href="Default-center.aspx" class="Glav">На главную</a>
            <br />
            <ul class="menu-main">
                <li><a href="/Trening.aspx" class="link1">Тренинги</a></li>                 
                <li><a href="/Treneri.aspx" class="link2" runat="server">Наши тренеры</a></li>
                <li><a href="/Company.aspx" class="link3" runat="server">О компании</a></li>     
            </ul>
        </header>
        <br />
        <br />
        <p>Ваши тренинги, на которые вы записаны:</p>
        <br />
        <br />
        <fieldset>
        <asp:GridView ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderStyle="None" CellPadding="10">
            <Columns>
                <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="ТРЕНЕР" HeaderText="ТРЕНЕР" ReadOnly="True" SortExpression="ТРЕНЕР" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="НОМЕР ГРУППЫ" HeaderText="НОМЕР ГРУППЫ" SortExpression="НОМЕР ГРУППЫ" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="РЕЗУЛЬТАТ КОНТРОЛЯ" HeaderText="РЕЗУЛЬТАТ КОНТРОЛЯ" SortExpression="РЕЗУЛЬТАТ КОНТРОЛЯ" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                <ItemStyle BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="КВИТАНЦИЯ" HeaderText="КВИТАНЦИЯ" ReadOnly="True" SortExpression="КВИТАНЦИЯ" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                    <ItemStyle BorderStyle="None" />
                </asp:BoundField>
                <asp:BoundField DataField="ОПЛАТА" HeaderText="ОПЛАТА" ReadOnly="True" SortExpression="ОПЛАТА" >
                <ControlStyle BorderStyle="None" />
                <FooterStyle BorderStyle="None" />
                <HeaderStyle BorderStyle="None" />
                    <ItemStyle BorderStyle="None" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BorderStyle="None" />
            <FooterStyle BackColor="White" BorderStyle="None" />
            <HeaderStyle BackColor="White" />
            <PagerStyle BackColor="White" BorderStyle="None" BorderWidth="0px" />
            <RowStyle BorderStyle="None" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerConnection %>" SelectCommand="select trening.[НАЗВАНИЕ], trener.[ФАМИЛИЯ]+' '+trener.[ИМЯ]+' '+trener.[ОТЧЕСТВО] as 'ТРЕНЕР', grup.[НОМЕР_ГРУППЫ] as 'НОМЕР ГРУППЫ',kontrol.[РЕЗУЛЬТАТ] as 'РЕЗУЛЬТАТ КОНТРОЛЯ', isnull(oplata.[КВИТАНЦИЯ],' ') as 'КВИТАНЦИЯ', isnull(oplata.[ОПЛАТА], ' ') as 'ОПЛАТА' from [MARI].[TRENINGI] trening
join [MARI].[OPLATA] oplata
on oplata.idtrening=trening.idtrening
join [MARI].[KLIENTI] klient
on klient.IDKL=oplata.IDKL
join [MARI].[GRUPPA] grup
on grup.IDKL=klient.IDKL and grup.IDTRENING=trening.IDTRENING
join [MARI].[TRENERI] trener
on grup.IDTRENER=trener.IDTRENER
join [MARI].[KONTROL] kontrol
on kontrol.IDKL=klient.IDKL and kontrol.IDTRENING=trening.IDTRENING
where klient.IDKL = @id">
            <SelectParameters>
                <asp:CookieParameter CookieName="id" Name="id" />
            </SelectParameters>
        </asp:SqlDataSource>
        </fieldset>
    </form>
</body>
</html>
