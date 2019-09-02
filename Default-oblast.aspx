<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default-oblast.aspx.cs" Inherits="TreningCo1.Default_oblast" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Академия Тренингов</title>
</head>
    <style type="text/css">
        body {
            background: url(Images/fon-kazan.jpg), rgba(255,255,255,0.7);
            background-size: 100%;
            background-blend-mode: screen;
            overflow-y:scroll;
        }

        .t1{
            font-size:60px;
            color:#943E42;
            text-align:center;
        }

        .t2{
            font-size: 40px;
            color:	#C42D58;
            text-align:center;
        }

        .t3{
            font-size:30px;
            color: #4F002A;
            text-align:center;
        }

        .t4{
    font-size:40px;
    padding-left:200px;
    color: #9F1A57;
}

        a, p{
            font-size:20px;
            color: #4F002A;
        }
        .table{

            font-size:20px;
        }

        .t1,.t2,.t3, .t4, .table, p{

	opacity:0; /*Элемент полностью прозрачный (невидимый)*/
	transition: 2s; /*Скорость перехода состояния элемента*/
	
	animation: zoomIn 1s 1; /* Указываем название анимации, её время и количество повторов*/
    animation-fill-mode: forwards; /* Чтобы элемент оставался в конечном состоянии анимации */
    /*animation-delay: 1s;*/ /* Задержка перед началом */
    animation-timing-function: linear; 
}

.t1
{
  animation-delay: 1s;
}

.t2
{
  animation-delay: 2s;

}

.t3{
    animation-delay: 3s;

}

.t4{
    animation-delay:4s;
}
.table{
    animation-delay: 4s;
}

p{
    animation-delay:5s;
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
  100% {
  opacity: 1;
  }
  } 

        </style>

<body>
    <form id="form1" runat="server">
             <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="t1">
            Добро пожаловать!
            </div>
        <br />
        <div class="t2">
            Вас приветсвует Академия Тренингов. Вы находитесь на странице филиала в городе Казань.
        </div>
        <br />
        <div class="t3">К сожалению, сайт пока находится в разработке. Вы можете записаться к нам на тренинги по телефону: +7 (495) 195-66-65</div>
        <br />
        <div class="t4">Наши тренинги:</div>
        <center>
        <div class="table">
            <asp:GridView ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="648px" style="">
                <Columns>
                    <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ" />
                    <asp:BoundField DataField="ЦЕНА" HeaderText="ЦЕНА" SortExpression="ЦЕНА" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SecondConnection %>" SelectCommand="SELECT [НАЗВАНИЕ], [ЦЕНА] FROM [MARI].[TRENINGI]"></asp:SqlDataSource>
        </div>
            <p>Чтобы вернуться на страницу выбора филиала, нажмите</p>
        <a href="StartPage.aspx">Назад</a>
            </center>
    </form>
</body>
</html>
