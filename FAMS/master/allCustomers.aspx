<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="allCustomers.aspx.cs" Inherits="FAMS.master.allCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script> var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../js/jquery_ui_1.12.1.js" type="text/javascript"></script>
    <script>        var jquery_1_12_1 = jQuery.noConflict();</script>
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script>        var jquery_1_11_3_min = jQuery.noConflict();</script>
    <script type="text/javascript">
    jquery_1_11_3_min_p(document).ready(function () {
          BindGrid();
          jquery_1_11_3_min_p('#btnCreateCustomerPopUp').click(function () {
            var UserId = jquery_1_11_3_min_p('#lblUserid').text(); 
	        //var activityNo = jquery_1_11_3_min_p('#lblActivityCancelShowPopup').text();
              var UserName = jquery_1_11_3_min_p('#txtUserName').val();
              var UserEmail = jquery_1_11_3_min_p('#txtUserEmail').val();
              var UserAccount=jquery_1_11_3_min_p('#txtUserAccount').val();
              if (UserName == "") {
                  alert('Please fill User Name');
                  return false;
              }else  if (UserEmail == "") {
                  alert('Please fill User Email');
                  return false;
              }else  if (UserAccount == "") {
                  alert('Please fill User Account');
                  return false;
              }

	        jquery_1_11_3_min_p.ajax({
		        type: "POST",
		        contentType: "application/json; charset=utf-8",
		        url: "../WebServices/Customer.asmx/CreateUser",
		        data: "{'UserName':'" + UserName + "','UserEmail':'" + UserEmail + "','UserAccount':'" + UserAccount + "','UserId':'" + UserId + "'}",
		        dataType: "json",
		        async: false,
		        success: function (result) {
                    var jsonData = eval(result.d);
                    if (result.d != -1) {
                        //alert('User create successfully !');
                       // jquery_1_12_1("#changepasswordpop").dialog("close");
                        $("#createCustomers").modal('hide');
                         $("#customercrpopup").modal('show');
                        BindGrid();
                    }
                    else {
                        alert('User already exists !');
                    }
                   
		        },
		        error: function (result) {}
	        });
          });
        
        jquery_1_11_3_min_p('#btnNew').click(function () {   
            //jquery_1_12_1("#changepasswordpop").dialog("close");
            $("#createCustomers").modal('show');
        });
        jquery_1_11_3_min_p('#btnCancelCustomerPopUp').click(function () {   
            //jquery_1_12_1("#changepasswordpop").dialog("close");
            $("#createCustomers").modal('hide');
        });
        });

    
        
   
       
    function BindGrid() {
     jquery_1_11_3_min_p("#tblUserMaster tbody").html("");
    jquery_1_11_3_min_p.ajax({
        url: "../WebServices/Customer.asmx/BindGrid",
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        async: false,
        data: "{}",
        type: "POST",
        success: function (result) {
            var i = 0;
            var jsonData = eval(result.d);
            var Query = "";
            for (i = 0; i < jsonData.Table.length; i++) {
                Query = Query + "<tr>";
                Query = Query +"<td width='10%'>" + jsonData.Table[i].Sno + "</td>";
                Query = Query + "<td width='50%'>" + jsonData.Table[i].AccountNo + "</td>";
                Query = Query + "<td width='50%'>" + jsonData.Table[i].UserName + "</td>";
                Query = Query + "<td width='50%'>" + jsonData.Table[i].EmailId + "</td>";
                Query = Query+ "<td width='10%'>" + jsonData.Table[i].Active + "</td>";
                Query = Query + "</tr>";
            }
            jquery_1_11_3_min_p("#tblUserMaster tbody").append(Query);
        },
        error: function (result) {
        }
    });
}
$(function () {
    $("table tr").dblclick(function () {
        $("#customerDetail").modal("show");
    });
});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    All Customers</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <%--<button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target="#createCustomers"><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> --%>
                        <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal"><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 
                      <button type="button" class="btn btn-sm btnconinsideBtn" id="btnEdit"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button> 
                    <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack" style="display:none"><i class="fa fa fa-undo" aria-hidden="true" style="padding-right:2px"></i>Back</button> 
                   
                    </div>         
                    </div>
                </div>

               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12" id="pmsProviderHeader">
                      <div class="row boxrow">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2">  
        <div class="searchDropdown">
         <div class="row">
            <label class=" col-md-8 showLebel">  Show Records :</label>
			<select id="ddlLoadMore" class=" col-md-4  showrecords pull-right">
												<option>2 </option>
                                                <option>5 </option>
                                                <option>50 </option>
												<option>100 </option>
												<option>150</option>
                                                <option>200</option>
                                                 <option>500</option>
                                                </select>
    </div>
					
     </div>  </div>
    <div class="col-md-2 pull-right mt-2 ">
    
                           
    <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" id="searchText">
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                     <div class="tableScroll" style="border-left: 1px solid #ddd; border-right: 1px solid #ddd;">
                                <table class="bankmasterTable" id="tblUserMaster">
                                <thead>
                                    <tr>
                                      
                                       <th style="width:10px">
                                             Sr No.
                                        </th>
                                         <th style="width:50px">
                                             Customer Account
                                        </th>                                       
                                        <th style="width:50px">
                                             User Name
                                        </th>
                                        <th style="width:50px">
                                           User Email
                                        </th>
                                        <th style="width:10px">
                                            Active
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                     
                                       
                                    </tbody>
                                </table>
                        
                     <%-- <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                      <th style="width:60px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                       <th style="width:60px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             List Code
                                        </th>
                                        <th style="width:100px">
                                             Custodian
                                        </th>
                                         <th style="width:150px">
                                             Customer Account
                                        </th>
                                        <th style="width:150px">
                                            Customer Name
                                        </th>
                                        <th style="width:100px">
                                             Portfolio
                                        </th>
                                        <th style="width:150px">
                                            PMS Employee
                                        </th>
                                        <th style="width:100px">
                                             Inception Date
                                        </th>
                                        <th style="width:200px">
                                            Address Line
                                        </th>
                                        <th style="width:100px">
                                            City
                                        </th>
                                        <th style="width:100px">
                                            State
                                        </th>
                                        <th style="width:100px">
                                            PAN
                                        </th>
                                        <th style="width:200px">
                                             Primary Contact Name
                                        </th>
                                         <th style="width:200px">
                                             Primary Contact Designation
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Email
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Phone
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Mobile
                                        </th>
                                        <th style="width:200px">
                                             Billing Contact Name
                                        </th>
                                         <th style="width:200px">
                                             Billing Contact Designation
                                        </th>
                                        <th style="width:200px">
                                           Billing Contact Email
                                        </th>
                                        <th style="width:200px">
                                            Billing Contact Phone
                                        </th>
                                        <th style="width:200px">
                                            Billing Contact Mobile
                                        </th>
                                        <th style="width:100px">
                                           Logo
                                        </th>
                                        <th style="width:150px">
                                             User Name
                                        </th>
                                        
                                        <th style="width:200px">
                                           User Email
                                        </th>
                                        <th style="width:200px">
                                            User Mobile No.
                                        </th>
                                        <th style="width:200px">
                                           Login with Acc No.
                                        </th>
                                        <th style="width:200px">
                                            Login with Mobile No.
                                        </th>
                                        <th style="width:200px">
                                            Login with User Email
                                        </th>
                                        <th style="width:100px">
                                            Active
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                     
                                        <tr>
                                      <td style="width:60px">
                                         <input type="checkbox" />
                                        </td>
                                       <td style="width:60px">
                                             1
                                        </td>
                                        <td style="width:100px">
                                             LC01
                                        </td>
                                        <td style="width:100px">
                                             CUS1
                                        </td>
                                         <td style="width:150px">
                                             1100011
                                        </td>
                                        <td style="width:150px">
                                            Customer 1
                                        </td>
                                        <td style="width:100px">
                                             Portfolio 1
                                        </td>
                                        <td style="width:150px">
                                            EMP01
                                        </td>
                                        <td style="width:100px">
                                             09/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Greater Noida, UP
                                        </td>
                                        <td style="width:100px">
                                            GN
                                        </td>
                                        <td style="width:100px">
                                            UP
                                        </td>
                                        <td style="width:100px">
                                            AKQPT7688O
                                        </td>
                                        <td style="width:200px">
                                             ABC
                                        </td>
                                         <td style="width:200px">
                                             MD
                                        </td>
                                        <td style="width:200px">
                                            abc@gmail.com
                                        </td>
                                        <td style="width:200px">
                                            01122345679
                                        </td>
                                        <td style="width:200px">
                                           9876543210
                                        </td>
                                        <td style="width:200px">
                                             ABC
                                        </td>
                                         <td style="width:200px">
                                             MD
                                        </td>
                                        <td style="width:200px">
                                           abc@gmail.com
                                        </td>
                                        <td style="width:200px">
                                            01122345679
                                        </td>
                                        <td style="width:200px">
                                            9876543210
                                        </td>
                                        <td style="width:100px">
                                           Logo.png
                                        </td>
                                        <td style="width:150px">
                                             User 1
                                        </td>
                                        
                                        <td style="width:200px">
                                          user@gmail.com
                                        </td>
                                        <td style="width:200px">
                                            9809876543
                                        </td>
                                        <td style="width:200px">
                                          No
                                        </td>
                                        <td style="width:200px">
                                            No
                                        </td>
                                        <td style="width:200px">
                                            Yes
                                        </td>
                                        <td style="width:100px">
                                            Active
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>--%>

                    </div>

                     </div>


                 <div class="cardinside col-md-12 col-sm-12 col-xs-12" id="pmsProviderDetail" style="display:none" >
                      <div class="boxrow">
                          <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                              <div class="form-group">
          <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">TB Head Code:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">TB Head Name:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
       <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Parent:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select Parent</option>
                <option>Parent 1</option>
                <option>Parent 2</option>
                <option>Parent 3</option>
              
            </select>
               
        </div>
        </div>
         </div>  
<button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnSave"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 
                     

                          </div>
    <div class="col-md-8 pull-left pl-0">    
    <div class="pdfexport">
   <button type="button" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2">  
        </div>
    <div class="col-md-2 pull-right mt-2 pr-0">
    
                           
    <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                      <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                      <th style="width:30px">
                                         <input type="checkbox" > All
                                        </th>
                                       <th style="width:30px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             TB Head Code
                                        </th>
                                         <th style="width:100px">
                                             TB Head Name
                                        </th>
                                        <th style="width:100px">
                                             Parent
                                        </th>
                                        
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            1
                                        </td>
                                        <td style="width:100px">
                                           TB01
                                        </td>
                                        <td style="width:100px">
                                            TB Head 1
                                        </td>
                                            <td style="width:100px">
                                            Parent 5
                                        </td>
                                       
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            2
                                        </td>
                                       <td style="width:100px">
                                           TB02
                                        </td>
                                        <td style="width:100px">
                                            TB Head 2
                                        </td>
                                            <td style="width:100px">
                                            Parent 4
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            3
                                        </td>
                                          <td style="width:100px">
                                           TB03
                                        </td>
                                        <td style="width:100px">
                                            TB Head 3
                                        </td>
                                            <td style="width:100px">
                                            Parent 3
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            4
                                        </td>
                                            <td style="width:100px">
                                           TB04
                                        </td>
                                        <td style="width:100px">
                                            TB Head 4
                                        </td>
                                            <td style="width:100px">
                                            Parent 1
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            5
                                        </td>
                                           <td style="width:100px">
                                           TB05
                                        </td>
                                        <td style="width:100px">
                                            TB Head 5
                                        </td>
                                            <td style="width:100px">
                                            Parent 2
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>

                    

                     </div>

</div>
            </div>
         </div>


    <div class="modal fade" id="createCustomers" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Customers Detail</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">List Code:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <label class="col-md-12 col-xs-12 col-sm-12">LC01</label>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <label class="col-md-12 col-xs-12 col-sm-12">CUS1</label>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Customer Acc:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" id="txtUserAccount" />
    
        </div>
            </div>
        <%--<div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Country:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Country</option>
                <option>IND</option>
                <option>AUS</option>
                <option>PAK</option>
                <option>USA</option>
                <option>AFG</option>
            </select>
    
        </div>
            </div>
        
        <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>--%>
        </div>
        </div>
            <div class="form-group">
    <div class="row">
        
        
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block pr-0">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Customer Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12"  />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Portfolia:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Portfolia</option>
                <option>Portfolia 1</option>
                <option>Portfolia 2</option>
                <option>Portfolia 3</option>
                <option>Portfolia 4</option>
                <option>Portfolia 5</option>
            </select>
    
        </div>
            </div>
        
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS Employee:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>EMP01</option>
                <option>EMP02</option>
                <option>EMP03</option>
                <option>EMP04</option>
                <option>EMP05</option>
            </select>
    
        </div>
            </div>
        </div>
        </div>
            <div class="form-group">
    <div class="row">
       <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Inception Date:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" id="txtdate1" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Address Line:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">City:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <select class="dropdown">
                <option>SD</option>
                <option>GN</option>
                <option>SH</option>
                <option>JP</option>
            </select>
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
         <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">State:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <select class="dropdown">
                <option>DL</option>
                <option>UP</option>
                <option>HP</option>
                <option>RJ</option>
            </select>
    
        </div>
            </div>
     
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PAN:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
         <div class="col-md-4 col-xs-12 col-sm-4 ">
   
            </div>
        </div>
        </div>

        <div class="detailsBox">

            <h6>Primary Contact Details</h6>
           <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0"> Designation:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Designation</option>
                <option>MD</option>
                <option>CEO</option>
                <option>CFO</option>
                <option>SE</option>
                <option>AE</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Phone:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>
        </div>

             <div class="detailsBox">

            <h6>Billing Contact Details</h6>
            <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0"> Designation:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Designation</option>
                <option>MD</option>
                <option>CEO</option>
                <option>CFO</option>
                <option>SE</option>
                <option>AE</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Phone:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>
        </div>

             <div class="detailsBox">

            <h6>User Details</h6>
            
                 <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Logo:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="file" />
    
        </div>
            </div>
      <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">User Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" id="txtUserName" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">User Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" id="txtUserEmail" />
    
        </div>
            </div>
     
        </div>
        </div>
            <div class="form-group">
    <div class="row">
       
      
      <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile No.:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-5 col-xs-12 col-sm-5 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Login with Acc No.:</label>
        </div>
        <div class="col-md-6 col-xs-12 col-sm-6 d-inline-block p-0">
               <input type="checkbox" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-6 col-xs-12 col-sm-6 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Login with Mobile No.:</label>
        </div>
        <div class="col-md-5 col-xs-12 col-sm-5 d-inline-block p-0">
               <input type="checkbox" />
    
        </div>
            </div>
        </div>
        </div>
                 <div class="form-group">
    <div class="row">
       
      
  
            <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-6 col-xs-12 col-sm-6 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Login with User Email:</label>
        </div>
        <div class="col-md-5 col-xs-12 col-sm-5 d-inline-block p-0">
               <input type="checkbox" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Active:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              
                <select class="dropdown">
                 <option>Active</option>
                <option>Inactive</option>
            </select>
        </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4 ">
   
            </div>
        </div>
        </div>
        </div>


            

         <div class="pull-right mt-1">
    <%--<button type="button" class="btn btn-default mr-1" >Create</button>
             <button type="button" class="btn btn-default " >Cancel</button>--%>
          <%--    <input type="submit" class="btnSubmit" id="btnSubmit"   value="Done"/>
               <input type="submit" class="btnSubmit" id="btnSubmit"   value="Done"/>--%>
            <input type="button" class="btn btn-default mr-1"  value="Create" id="btnCreateCustomerPopUp"  />
            <input type="button" class="btn btn-default" value="Cancel" id="btnCancelCustomerPopUp" />
        </div>
   
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div> 


    <div class="modal fade" id="customerDetail" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Customers Detail</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   

<div class="boxrow">
     <div class="col-md-12 col-sm-12 col-xs-12 ">
    
         </div>
                          <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              <div class="form-group">
          <div class="row">
       
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">GSTN:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7">
        </div>
               <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">State:</label>
                   <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
             <select class="dropdown">
                <option>DL</option>
                <option>UP</option>
                <option>HP</option>
                <option>RJ</option>
            </select>
                       </div>
        </div>
         <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
       
        </div>
        </div>
         </div>  
    
                          </div>
    <button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnRemove"><i class="fa fa-trash" aria-hidden="true"></i> Remove</button> 
               <button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnSave"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 
   
<div class="clearfix"></div>
    <div class="col-md-8 pull-left pl-0">    
    <div class="pdfexport">
   <button type="button" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2">  
        </div>
    <div class="col-md-2 pull-right mt-2 pr-0">
    
                           
    <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" id="searchText">
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
         
            <div class="clearfix"></div>
      
   <table class="bankmasterTable mt-1" >
                                <thead>
                                    <tr>
                                        
                                     <th style="width:30px">
                                         <input type="checkbox"> All
                                        </th>
                                       <th style="width:30px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             GSTN
                                        </th>
                                        
                                        <th style="width:350px">
                                            State
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            1
                                        </td>
                                        <td style="width:100px">
                                           GSTN 1
                                        </td>
                                        
                                        <td style="width:350px">
                                            UP
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            2
                                        </td>
                                      <td style="width:100px">
                                           GSTN 2
                                        </td>
                                        
                                        <td style="width:350px">
                                            HP
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            3
                                        </td>
                                          <td style="width:100px">
                                           GSTN 3
                                        </td>
                                        
                                        <td style="width:350px">
                                            RJ
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            4
                                        </td>
                                           <td style="width:100px">
                                           GSTN 4
                                        </td>
                                        
                                        <td style="width:350px">
                                            MP
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            5
                                        </td>
                                          <td style="width:100px">
                                           GSTN 5
                                        </td>
                                        
                                        <td style="width:350px">
                                            DL
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div>

      <div class="modal fade" id="customercrpopup" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="height: 53px;">
                  <%--  <h4 class="modal-title">Customer Create</h4>--%>
                    <div class="col-md-12" style="text-align:center">
                    <img src="../Assets/image/success-icon.png" style="width: 12%;text-align: center;margin-top: -9px;" />
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="text" style="text-align:center">
                    <label style="font-size: 13px;">Customer Created Successfully</label>
                   </div></div>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                  <button type="button" class="col-md-3 btn btn-default closexbtn mt-1"  data-dismiss="modal" >OK</button>
           </div>
                </div>




            </div>

        </div>



    </div>




              <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/date-pickers.min.js"></script>
    <script src="../Assets/js/jquery-ui.min.js"></script>
     <script>
           $(function () {
               $("#txtdate1").datepicker();

           });
  </script>
</asp:Content>
