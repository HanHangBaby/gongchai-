<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="score.aspx.cs" Inherits="gongchai.score" %>

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
       <center> <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="mission_name" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="178px" Width="347px">
                <Columns>
                    <asp:BoundField DataField="mission_name" HeaderText="公差名称" SortExpression="mission_name" ReadOnly="True" />
                    <asp:BoundField DataField="time" HeaderText="时间计分" SortExpression="time" />
                    <asp:BoundField DataField="status" HeaderText="难度评分" SortExpression="status" />
                    <asp:TemplateField HeaderText="操作">
                          <ItemTemplate>
                        <asp:Button ID="submit" runat="server" style="border-radius:30px" BackColor="#5AC8D8" Font-Names="等线" Text="登记" OnClick="submit_Click" />
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
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gongchaiConnectionString %>" SelectCommand="SELECT [mission_name], [time], [status] FROM [T_mission]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="B_return" runat="server" style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" OnClick="B_return_Click" Text="返回" />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Visible="False" Font-Names="等线" Font-Size="X-Large">
                <br />
                <br />
                公差名称<asp:TextBox ID="TextBox1" runat="server" style="margin-left: 20px" Height="40px" Width="200px"></asp:TextBox>
                &nbsp; 时间计分<asp:TextBox ID="TextBox2" runat="server" style="margin-left: 20px" Height="40px" Width="200px"></asp:TextBox>
                &nbsp;&nbsp; 难度评定<asp:TextBox ID="TextBox3" runat="server" style="margin-left: 20px" Height="40px" Width="200px"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" Text="提交" OnClick="Button1_Click" />
            </asp:Panel>
        </div>
           </center>
    </form>
</body>
</html>
