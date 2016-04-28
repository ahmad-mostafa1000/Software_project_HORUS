<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_customer.aspx.cs" Inherits="WebApplication1.add_customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

        
         <asp:Panel ID="Panel_InsertCustomer" runat="server">
            <asp:Label ID="Label_UName" runat="server" Text="Customer Name"></asp:Label>
            <asp:TextBox ID="UserName" runat="server" Width="120px"></asp:TextBox>
            <br />
            <asp:Label ID="Label_Gender" runat="server" Text="Gender"></asp:Label>
            <asp:DropDownList ID="DropDownList_Gender" runat="server">
            <asp:ListItem Value="M" Text="Male" />
            <asp:ListItem Value="F" Text="Female" />
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label_BDATE" runat="server" Text="Date of Birth"></asp:Label>
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <br />
            <asp:Label ID="Label_Adress" runat="server" Text="Adress"></asp:Label>
            <asp:TextBox ID="TextBox_Address" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label_Phone" runat="server" Text="Phone"></asp:Label>
            <asp:TextBox ID="TextBox_Phone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox_Phone" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><b />
            <br />
            <asp:Button ID="InsertCustomer" runat="server" Text="Insert Customer" OnClick="InsertCustomer_Click" />
            <br />
            <asp:Literal ID="FeedBack" runat="server"></asp:Literal>
            <br />
         </asp:Panel>

        <br />
        <br />

        

      




    </div>
    </form>
</body>
</html>
