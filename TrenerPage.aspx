<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrenerPage.aspx.cs" Inherits="TreningCo1.TrenerPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Личный кабинет</title>
    <style>
        body {
            background: url(Images/trener2.jpg), rgba(255,255,255,0.8);
            background-size: 100%;
            background-blend-mode: screen;
            overflow:scroll;
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

p{
    text-indent: 30px;  /* Делаем отступ строки*/
           font-family: Century;
            font-style: italic;
            color: #474842;
            font-size: 25px;
}

.Zayav{
    padding-left: 30px;
}

.Trening{
    padding-left: 30px;
    float: left;
}

.Group{
    float:right;
    padding-right:100px;

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
        <div class="Zayav">
            <p>Заявки на тренинги:</p>
            <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ФАМИЛИЯ" HeaderText="ФАМИЛИЯ" SortExpression="ФАМИЛИЯ" ReadOnly="true" />
                    <asp:BoundField DataField="ИМЯ" HeaderText="ИМЯ" SortExpression="ИМЯ" ReadOnly="true" />
                    <asp:BoundField DataField="ОТЧЕСТВО" HeaderText="ОТЧЕСТВО" SortExpression="ОТЧЕСТВО" ReadOnly="true" />
                    <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ"  />
                    <asp:TemplateField HeaderText="Группа">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>Группа</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button5" runat="server" CausesValidation="True" CommandName="Zapis" CommandArgument="<%# Container.DataItemIndex %>" Text="Добавить" />
                            &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Udali" CommandArgument="<%# Container.DataItemIndex %>" Text="Удалить заявку" />
                            &nbsp;<asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Edit" Text="Добавить в группу" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ServerConnection %>" SelectCommand="select klient.[ФАМИЛИЯ], klient.[ИМЯ], klient.[ОТЧЕСТВО], trening.[НАЗВАНИЕ] from [MARI].[Zayavki] klient join [MARI].[TRENINGI] trening on trening.IDTRENING=klient.IDTRENING" DeleteCommand="delete from [MARI].[Zayavki] where ([ФАМИЛИЯ]=@fam and [ИМЯ]=@name and [ТЕЛЕФОН]=@tel)">
                <DeleteParameters>
                    <asp:Parameter Name="fam" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="tel" Type="String" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <br />
        <div class="Trening">
            <p>Ваши тренинги</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ServerConnection %>" SelectCommand="  select distinct trening.[НАЗВАНИЕ] from [MARI].[TRENINGI] trening
  join [TreningCo].[MARI].[GRUPPA] grup
  on trening.IDTRENING=grup.IDTRENING
  where grup.IDTRENER=@id">
                <SelectParameters>
                    <asp:CookieParameter CookieName="idtren" Name="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class ="Group">
            <p>Ваши группы</p>
            <asp:GridView ID="GridView3" runat="server" OnRowCommand="GridView3_RowCommand" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="ФАМИЛИЯ" HeaderText="ФАМИЛИЯ" SortExpression="ФАМИЛИЯ" ReadOnly="true"/>
                    <asp:BoundField DataField="ИМЯ" HeaderText="ИМЯ" SortExpression="ИМЯ" ReadOnly="true" />
                    <asp:BoundField DataField="ОТЧЕСТВО" HeaderText="ОТЧЕСТВО" SortExpression="ОТЧЕСТВО" ReadOnly="true" />
                    <asp:BoundField DataField="НАЗВАНИЕ" HeaderText="НАЗВАНИЕ" SortExpression="НАЗВАНИЕ" />
                    <asp:BoundField DataField="НОМЕР_ГРУППЫ" HeaderText="НОМЕР_ГРУППЫ" SortExpression="НОМЕР_ГРУППЫ" />
                    <asp:TemplateField HeaderText="РЕЗУЛЬТАТ" SortExpression="РЕЗУЛЬТАТ"  >
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" >
                                <asp:ListItem>Результат</asp:ListItem>
                                <asp:ListItem>Прошел</asp:ListItem>
                                <asp:ListItem>Не прошел</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("РЕЗУЛЬТАТ") %>' DataValueField="Result"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Update" Text="Обновить" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Изменить" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ServerConnection %>" SelectCommand="SELECT [ФАМИЛИЯ], [ИМЯ], [ОТЧЕСТВО], [НАЗВАНИЕ], [НОМЕР_ГРУППЫ], [РЕЗУЛЬТАТ] FROM [InfaGoup] WHERE ([IDTRENER] = @IDTRENER) ORDER BY [НОМЕР_ГРУППЫ]"  UpdateCommand="UPDATE [InfaGoup] SET [РЕЗУЛЬТАТ] = @Result WHERE ([ФАМИЛИЯ]=@fam and [ИМЯ]=@name and [ОТЧЕСТВО]=@otch)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="idtren" Name="IDTRENER" Type="Decimal" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Result" Type="String"/>
                    <asp:Parameter Name="fam" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="otch" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

