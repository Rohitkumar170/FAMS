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
    <style>
#entitygrid {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#entitygrid td, #entitygrid th {
  border: 1px solid #ddd;
  padding: 8px;
  font-size:12px;
}

#entitygrid tr:nth-child(even){background-color: #f2f2f2;}

#entitygrid tr:hover {background-color: #ddd;}

#entitygrid th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #6d6d6d;
  color: white;
}
</style>
     <link href="../Assets/css/bootstrap.min.css" rel="stylesheet"   type="text/css" />
    <script src="Assets/js/jquery.min.js"></script>
    <script src="JavaScript/GetReport.js"></script>

</head>
<body>
    <form id="form1" runat="server" style="border: 1px solid #cdcdcd;padding: 9px;border-radius: 5px;background-color: #f5f5f5;">
     

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
     <label for="fname">From Date:</label>
  <input type="date" id="fromdate" name=""/>
        </div>
            <div style="width:33%;display: inline-block;">
     <label for="fname">To Date:</label>
  <input type="date" id="todate" name=""/>
        </div>
        </div>
            <div>
            <div style="width:33%;display: none;">
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
               <%-- <asp:Button ID="btnseach" runat="server" OnClick="btnseach_Click" Text="Search" />--%>
     <button type="button" id="btnseach">Search</button>
                      <button type="button" id="btnExcel">Excel</button>
                     <input type="hidden" name="CustomerJSON"/>
<asp:Button ID = "btnPdf" Text="PDF" runat="server" OnClientClick = "GenratePDF() " OnClick ="btnPdf_Click" />
                     <%-- <button type="button" id="btnPdf" runat="server"  OnClick="btnPdf_Click">PDF</button>--%>
        </div>
        </div>

        
    </form>

     <table class="bankmasterTable" id="entitygrid"  style="margin-top:10px;">
                               <thead>
                                   <tr>
                                       <th style="width:150px ;display:none;"></th>
                                       <th style="width:1000px"></th>
                                     <th style="width:300px"></th>
                                       <th style="width:1000px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>


                                   </tr>

                               </thead>
                                    <tbody class="scrollbar" >
                                    
                                  </tbody>
                                </table>
</body>
</html>