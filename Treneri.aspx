<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Treneri.aspx.cs" Inherits="TreningCo1.Treneri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Наши тренеры</title>
    <style>
        body {
            background: url(Images/treneri1.jpg), rgba(255,255,255,0.85);
            background-size: 100%;
            background-blend-mode: screen;
            overflow: scroll;
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

  .foto1, .foto2, .foto3, .foto4, .discl1, .discl2, .discl3, .discl4 {
  -webkit-animation-name: fadeIn;
  animation-name: fadeIn;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes fadeIn {
  0% {opacity: 0;}
  100% {opacity: 1;}
  }

   .foto1, .foto2, .foto3, .foto4, .discl1, .discl2, .discl3, .discl4
{
  animation-delay: 0s;
}

.foto1, .discl1{
     animation-delay: 4s;
}

.foto2,.discl2
{
  animation-delay: 5s;
}
.foto3,.discl3
{
  animation-delay: 6s;
}

.foto4,.discl4
{
  animation-delay: 7s;
}

  @keyframes fadeIn {
  0% {opacity: 0;}
  100% {opacity: 1;}
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
                <li><a href="/Trening.aspx" class="link1">Тренинги</a></li>                 
                <li><a href="#" class="link2" runat="server">Наши тренеры</a></li>
                <li><a href="/Company.aspx" class="link3" runat="server">О компании</a></li>     
            </ul>
        </header>
            <br />
            <br />
            <br />
            <br />
            <br />
        <div align="center" style="height: 252px">

           <img  src="Images/roman4.jpg" class="foto1" align="left" style="float:left; padding-left:200px;"/>
           <div id="fio1" runat="server" class="discl1" style="font-weight:bold; text-align:left; font-size:20px; display:inline-block; padding-left:20px; float:left;">
               <asp:Label ID="Label1" runat="server"></asp:Label>
           </div>
            <br />
            <br />
           <div id="dicslaim1" runat="server" class="discl1" style="text-align:left; display:inline-block; padding-left:20px; float:left;">
               <asp:Label ID="Label5" runat="server" Font-Size="14" Text="Label"></asp:Label></div>

            <img src="Images/mama2.jpg" class="foto2" style="float:left; padding-left:210px;  margin-top: -40px;"/>
            <div id="fio2" runat="server" class="discl2" style="font-weight:bold;  display:inline-block; padding-left:20px; vertical-align:top; float:left; margin-top: -40px;">
                <asp:Label ID="Label2" runat="server" Font-Size="14" Text=""></asp:Label></div>
            <br />
           <div id="disclaim2" runat="server" class="discl2" style="text-align:left; display:inline-block; float:left; vertical-align:top; padding-left:20px; font-size:20px; margin-top: -20px;">
               <asp:Label ID="Label6" runat="server" Text=""></asp:Label></div>

            </div>
        <br />
        <br />
        <br />
        <div align="center" style="height: 278px">
             <img src="Images/nadya3.jpg" class="foto3" align="left" style="float:left; padding-left:200px;"/>
           <div id="fio3" runat="server" class="discl3" style="font-weight:bold; text-align:left; display:inline-block; padding-left:20px; float:left;">
               <asp:Label ID="Label3" runat="server" Font-Size="14" Text=""></asp:Label></div>
            <br />
            <br />
           <div id="disclaim3" runat="server" class="discl3" style="text-align:left; display:inline-block; padding-left:20px; font-size:20px; float:left;">
               <asp:Label ID="Label7" runat="server" Text=""></asp:Label></div>

            <img src="Images/asya3.jpg" class="foto4" style="float:left; padding-left:200px; margin-top: -40px;"/>
            <div id="fio4" runat="server" class="discl4" style="font-weight:bold;  display:inline-block; padding-left:20px; vertical-align:top; float:left; margin-top: -20px;"><asp:Label ID="Label4" runat="server" Font-Size="14" Text=""></asp:Label></div>
            <br />
            <br />
           <div id="disclaim4" runat="server" class="discl4" style="text-align:left; display:inline-block; float:left; vertical-align:top; padding-left:20px; font-size:20px; margin-top: -20px;">
               <asp:Label ID="Label8" runat="server"  Text=""></asp:Label></div>
        </div>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
