<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="people_information.aspx.cs" Inherits="WebApplication2.people_information" %>

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
<center><body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <br />
                        <br />
                        <br />
                       <center> <asp:Label ID="B_name" runat="server" Text="姓名" Font-Names="等线" Font-Size="X-Large"></asp:Label>
                        <asp:TextBox ID="TB_name" runat="server" style="margin-left: 50px" Width="250px" Height="40px"></asp:TextBox></center>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                       <center> <asp:Label ID="B_major" runat="server" Text="专业" Font-Names="等线" Font-Size="X-Large"></asp:Label>
                        <asp:TextBox ID="TB_major" runat="server" style="margin-left: 50px" Width="250px" Height="40px"></asp:TextBox></center>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                       <center> <asp:Label ID="B_sex" runat="server" Text="性别" Font-Names="等线" Font-Size="X-Large"></asp:Label>
                        <asp:TextBox ID="TB_sex" runat="server" style="margin-left: 50px" Width="250px" Height="40px"></asp:TextBox></center>
                        <br />
                        <br />
                        <asp:Button ID="B_add" runat="server" OnClick="B_add_Click" Text="添加" style="border-radius:30px; margin-left: 0px;" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large"/>
                        <asp:Button ID="B_modify" runat="server" OnClick="B_modify_Click" Text="修改" style="margin-left: 50px;border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large"/>
                        <asp:Button ID="B_return" runat="server" OnClick="B_return_Click" Text="返回" style="margin-left: 50px;border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large"/>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="name" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                <asp:BoundField DataField="points" HeaderText="总分" SortExpression="points" />
                <asp:BoundField DataField="mission_name" HeaderText="公差名称" SortExpression="mission_name" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                       <asp:Button ID="B_select"   runat="server" Text="选择" style="border-radius:30px" BackColor="#5AC8D8" Font-Names="等线" OnClick="B_select_Click"  />
                        <asp:Button ID="B_delete"  runat="server"  Text="删除" style="border-radius:30px" BackColor="#5AC8D8" Font-Names="等线" OnClick="B_delete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gongchaiConnectionString %>" SelectCommand="SELECT * FROM [T_people]"></asp:SqlDataSource>
    </form>
</body>
    </center>
</html>
