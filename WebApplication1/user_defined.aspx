<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_defined.aspx.cs" Inherits="user_defined.user_defined" %>

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
    <form id="form1" runat="server" class="auto-style1">
        <div>
            <center>
                <br />
                <br />
                <br />
                <br />
            <asp:Label ID="Lbl_workname" runat="server" Text="公差名称" Font-Size="X-Large" Font-Names="等线"></asp:Label>
            <asp:TextBox ID="Tb_workname" style="margin-left: 147px" runat="server" Height="40px" Width="250px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="Lbl_pername" runat="server" Text="人员姓名" Font-Size="X-Large" Font-Names="等线"></asp:Label>
            <asp:TextBox ID="Tb_pername"  runat="server" style="margin-left: 147px" Height="40px" Width="250px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Btn_save" runat="server"  style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" OnClick="Btn_save_Click" Text="保存" />
&nbsp;&nbsp;
                  
                       
           <asp:Button ID="Btn_done" runat="server" style="margin-left: 100px; border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" OnClick="Btn_done_Click" Text="显示" />

            <asp:Button ID="Btn_return" runat="server"  style="margin-left: 100px;border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" OnClick="Btn_return_Click" Text="返回" />
            </center>
        </div>
        <center>
      
                       
        <asp:Panel ID="Panel_2" runat="server" Height="300px" Width="759px" Visible="False">
            &nbsp;&nbsp;
            <br />
            公差人员名单<br /> 
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="name" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                    <asp:BoundField DataField="mission_name" HeaderText="任务" SortExpression="mission_name" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gongchaiConnectionString %>" SelectCommand="SELECT [name], [mission_name] FROM [T_people]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="Btn_confirm" runat="server" style="border-radius:30px" Width="150px" Height="40px" BackColor="#5AC8D8" Font-Names="等线" Font-Size="Large" OnClick="Btn_confirm_Click" Text="确认" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            </asp:Panel>
            </center>
    </form>
</body>
</html>
