<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOG_IN.aspx.cs" Inherits="WebApplication1.LOG_IN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lbel_username" runat="server" Text="Username:"></asp:Label>
        <asp:TextBox ID="textBox_username" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="textBox_username" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator><b />


        <asp:Label ID="label_pass" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="textBox_pass" runat="server" TextMode="Password"></asp:TextBox>
        
         <b />
        <asp:Button ID="button_login" runat="server" Text="LOG IN" OnClick="button_login_Click" /> 
        <asp:Literal ID="feedback" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
