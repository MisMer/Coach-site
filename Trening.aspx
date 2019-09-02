<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trening.aspx.cs" Inherits="TreningCo1.Trening" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Тренинги</title>
    <style>
        body {
            background: url(Images/background.jpg), rgba(255,255,255,0.85);
            background-size: 100%;
            background-blend-mode: screen;
            /*overflow-y:scroll;*/
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

@keyframes show{
	 0%{
		 opacity:0;
	 }

	 100% {
		 opacity:1;
	 }
}

.LogReg {
  list-style: none;
    padding: 0px 10px 0px;
    text-align: right;
    float:right; /* Выравнивание с обтеканием элементов */
}
.LogReg li{
    display: inline-block; /* Отображать как строчный элемент */
}

.LogReg a {
  font-family: 'Cormorant', serif;
  color: #A03737;
  position: relative;
  padding-bottom: 0px;
  margin: 0 0px 0 10px;
  font-size: 17px;
  font-style:italic;
}

.Lk{
    list-style: none;
    padding: 0px 10px 0px;
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

.trening {
text-transform: uppercase;
font-family: 'Cormorant', serif;
border-right: 40px solid transparent;
border-bottom: 40px solid transparent;
border-left: 40px solid transparent;
border-image: url(Images/Ramka1.png);
border-image-slice: 100 100;
display: inline-block;
margin-left:270px;
border-image-repeat:round round;
}

.zoomIn {
  -webkit-animation-name: zoomIn;
  animation-name: zoomIn;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes zoomIn {
  0% {
  opacity: 0;
  -webkit-transform: scale3d(.3, .3, .3);
  transform: scale3d(.3, .3, .3);
  }
  50% {
  opacity: 1;
  }
  }
  @keyframes zoomIn {
  0% {
  opacity: 0;
  -webkit-transform: scale3d(.3, .3, .3);
  transform: scale3d(.3, .3, .3);
  }
  50% {
  opacity: 1;
  }
  } 

    .label{
      text-align: left;
  }

    .confirm {
        text-align:center;
    }


    </style>
</head>
<body>
    <form id="form1" runat="server">
         <br />
        <header>
            <ul class="Lk">
                <li><a id="LichKab" href="UserPage.aspx" runat="server">Личный кабинет</a></li>
                <li><asp:Button ID="Button2" runat="server" Text="Выйти" Font-Size="15px" Height="30px" OnClick="Button2_Click" Visible="False" Width="60px" /></li>
            </ul>
            <ul class="LogReg">
            <li><a id="Login" href="/Login.aspx" runat="server">Вход</a></li>
            <li><a id="Reg" href="/Registration.aspx" runat="server">Регистрация</a></li>
            </ul>
            <br />
            <ul class="menu-main">
                <li><a href="#" class="link1">Тренинги</a></li>                 
                <li><a href="/Treneri.aspx" class="link2" runat="server">Наши тренеры</a></li>
                <li><a href="/Company.aspx" class="link3" runat="server">О компании</a></li>     
            </ul>
        </header>
        <br />
        <br />
        <br />
        <div class="zoomIn">
        <div class="trening">
            <asp:GridView ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" BorderStyle="None" CellPadding="10">
                <Columns>
                    <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ" >
                        <ControlStyle BorderStyle="None" />
                        <FooterStyle BorderStyle="None" />
                        <HeaderStyle BorderStyle="None" HorizontalAlign="Center" />
                        <ItemStyle BorderStyle="None" HorizontalAlign="Left" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ЦЕНА" HeaderText="ЦЕНА (руб.)" SortExpression="ЦЕНА" >
                        <ControlStyle BorderStyle="None" />
                        <FooterStyle BorderStyle="None" />
                        <HeaderStyle BorderStyle="None" HorizontalAlign="Center"/>
                        <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="ZapisClick" OnClick="btn_Click" CommandArgument="<%# Container.DataItemIndex %>" Text="Записаться" />
                        </ItemTemplate>
                        <ControlStyle BorderStyle="None" />
                        <FooterStyle BorderStyle="None" />
                        <HeaderStyle BorderStyle="None" HorizontalAlign="Center"/>
                        <ItemStyle BorderStyle="None" HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerConnection %>" SelectCommand="select [НАЗВАНИЕ], [ЦЕНА] from [MARI].[TRENINGI]"></asp:SqlDataSource>
            </div>
            </div>
        <br />

        <div id="zayavka" runat="server">
            <p style="text-align:center;  font-style:italic; ">Поля, помеченные *, обязательны для заполнения</p>
            <asp:Table runat="server" HorizontalAlign="Center" style="text-align: right" CellSpacing="10">
            <asp:TableRow>
                    <asp:TableCell Text="Имя *" CssClass="label" Font-Size="17px">
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>                   
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell CssClass="label" Font-Size="17px">
                        Фамилия *
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell CssClass="label" Font-Size="17px">
                        Отчество
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                   <asp:TableRow>
                    <asp:TableCell CssClass="label" Font-Size="17px">
                        Телефон *                 
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>   
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell CssClass="label" Font-Size="17px">
                        E-mail
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" ColumnSpan="2">
                        <asp:Button ID="Button3" runat="server" Text="Записаться" Font-Size="17px" Font-Names="Cormorant, serif" OnClick="Button3_Click" />
                    </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
        </div>
         <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
