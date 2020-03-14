<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="FAMS.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}


tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
    <form id="form1" runat="server" style="border: 1px solid #cdcdcd;padding: 9px;border-radius: 5px;background-color: #f5f5f5;">
        <div>
            <div style="width:33%;display: inline-block;">
            <label for="cars">Account Type:</label>
   <asp:DropDownList ID="ddlaccounttype" runat="server">
       <asp:ListItem Value="0">Select</asp:ListItem>
       <asp:ListItem Value="1">Trial Balance</asp:ListItem>
       <asp:ListItem Value="2">NAV</asp:ListItem>
       <asp:ListItem Value="3">Holding Report</asp:ListItem>
       <asp:ListItem Value="4">Transaction Report</asp:ListItem>
         <asp:ListItem Value="5">Cash Equivalent</asp:ListItem>
   </asp:DropDownList>

       
               </div>
            <div style="width:33%;display: inline-block;">
     <label for="fname">From Date:</label>
  <input type="date" id="" name=""/>
        </div>
            <div style="width:33%;display: inline-block;">
     <label for="fname">To Date:</label>
  <input type="date" id="" name=""/>
        </div>
        </div>

         <div style="margin-top: 1%;">
            <div style="width:33%;display: inline-block;">
            <label for="cars">Customer Name:</label>
   
<asp:DropDownList ID="ddlcustomer" runat="server">
       <asp:ListItem Value="0">Select</asp:ListItem>
       <asp:ListItem Value="1">Milind  Goyal</asp:ListItem>
       <asp:ListItem Value="2">Shyam Roy</asp:ListItem>
       <asp:ListItem Value="3">Mitali Roy</asp:ListItem>
       <asp:ListItem Value="4">Raushan Raj</asp:ListItem>
     
   </asp:DropDownList>
        
               </div>
            <div style="width:33%;display: inline-block;">
            <label for="cars">Accounts:</label>
   
<asp:DropDownList ID="ddlaccounts" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlaccounts_SelectedIndexChanged">
   
   </asp:DropDownList>
    
               </div>
             <div style="width:33%;display: inline-block;">
            <label for="cars">Accounts Sub Level</label>
   
<asp:DropDownList ID="ddlaccountsublevel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlaccountsublevel_SelectedIndexChanged">
   
   </asp:DropDownList>
    
               </div>
             <div style="width:33%;display: inline-block;margin-top: 1%;">
            <label for="cars">Accounts Sub Level:</label>
   
<asp:DropDownList ID="ddlsubcate" runat="server">
   
   </asp:DropDownList>
    
               </div>
            <div style="width:33%;display: inline-block;">
                <asp:Button ID="btnseach" runat="server" OnClick="btnseach_Click" Text="Search" />
    <%-- <button type="button" id="btnseach" runat="server">Search</button>--%>
        </div>
        </div>
        
    </form>

    
</body>
</html>