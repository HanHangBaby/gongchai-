<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="system_allocate.aspx.cs" Inherits="WebApplication2.zidongxuanze" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        html{
             height: 100%;width: 100%;
             background-image:url('1.jpg');background-size:100% 100%;
          } 

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div style="width: 370px ">
                <br />
                <br />
                <br />
            <asp:Label ID="Label1" runat="server" Text="公差人员筛选" Font-Names="等线" Font-Size="XX-Large" ></asp:Label>
                <br />
                <br />
        </div>
        <div style="width: 675px">
        <asp:Label ID="Label2" runat="server" Text="专业" Font-Names="等线" Font-Size="X-Large"></asp:Label>
        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" style="margin-left: 172px" Width="250px" DataSourceID="SqlDataSource2" DataTextField="major" DataValueField="major">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gongchaiConnectionString %>" SelectCommand="SELECT DISTINCT [major] FROM [T_people]"></asp:SqlDataSource>
        <p>
            <asp:Label ID="Label3" runat="server" Text="性别"  Font-Names="等线" Font-Size="X-Large"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" Height="40px" style="margin-left: 172px" Width="250px">
                <asp:ListItem Value="all">全部</asp:ListItem>
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="公差名称"  Font-Names="等线" Font-Size="X-Large"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 147px" Width="250px" Height="40px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="公差人数"  Font-Names="等线" Font-Size="X-Large"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 147px" Width="250px" Height="40px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="确认" style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" OnClick="Button1_Click" Font-Names="等线" Font-Size="Large" />
            <asp:Button ID="Button2" runat="server" Text="返回" Width="150px" Height="40px" BackColor="#5AC8D8" style="margin-left: 365px;border-radius:30px" OnClick="Button2_Click" Font-Names="等线" Font-Size="Large" />
        </p>
           
            
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <br />
             <p>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gongchaiConnectionString %>" SelectCommand="SELECT DISTINCT [major], [name], [sex], [points] FROM [T_people]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" style="margin-left: 11px" Width="715px" AutoGenerateColumns="False" DataKeyNames="name" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                        <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                        <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                        <asp:BoundField DataField="points" HeaderText="积分" SortExpression="points" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
        </p>
            <asp:Button ID="Button3" runat="server" Text="保存" style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" OnClick="Button3_Click" Font-Names="等线" Font-Size="Large"/>
        </asp:Panel>
            </div>
            </center>
    </form>
</body>
</html>
