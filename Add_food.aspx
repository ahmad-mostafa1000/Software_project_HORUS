<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_food.aspx.cs" Inherits="WebApplication1.Add_food" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:Label ID="Label1_food" runat="server" Text="Food"></asp:Label>
        <asp:TextBox ID="TextBox1_food" runat="server"></asp:TextBox>
          <br />
        <asp:Label ID="Label2_price" runat="server" Text="Price"></asp:Label>
        <asp:TextBox ID="TextBox2price" runat="server"></asp:TextBox>
          <br />
        <asp:Label ID="Label3_estimatedtime" runat="server" Text="Estimated Time"></asp:Label>
        <asp:TextBox ID="TextBox3time" runat="server"></asp:TextBox>
       <br />
       <br />
        <asp:Button ID="Button_addmeal" runat="server" Text="Add Meal" onclick="Button_addmeal_Click"/>

        <asp:Literal ID="feedback" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
