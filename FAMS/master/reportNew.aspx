<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="reportNew.aspx.cs" Inherits="FAMS.master.reportNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <style>
        #reportGrid .bankmasterTable tbody {
            max-height: 48vh !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Report</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" ><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 
                      <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack"><i class="fa fa fa-undo" aria-hidden="true"></i> Back</button> 
                   
                    </div>         
                    </div>
                </div>


               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                       <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Customer Name:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select</option>
                <option>Customer 1</option>
                <option>Customer 2</option>
                <option>Customer 3</option>
                <option>Customer 4</option>
                <option>Customer 5</option>
                <option>Customer 6</option>
            </select>
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Accounts:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select</option>
                <option>Accounts 1</option>
                <option>Accounts 2</option>
                <option>Accounts 3</option>
                <option>Accounts 4</option>
                <option>Accounts 5</option>
                <option>Accounts 6</option>
            </select>
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Accounts Sub Level:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select</option>
                <option>Sub Level 1</option>
                <option>Sub Level 2</option>
                <option>Sub Level 3</option>
                <option>Sub Level 4</option>
                <option>Sub Level 5</option>
                <option>Sub Level 6</option>
            </select>
        </div>
       
        </div>
         </div>  
                           <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">From Date:</label>
  
            <input type="text" id="fromdate" name="" class="col-md-7 col-xs-12 col-sm-7" placeholder="Select Date" />
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">To Date:</label>
  
            <input type="text" id="todate" class="col-md-7 col-xs-12 col-sm-7" placeholder="Select Date" />
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Account Type:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select</option>
                <option>Account Type 1</option>
                <option>Account Type 2</option>
                <option>Account Type 3</option>
            </select>
        </div>
       
        </div>
         </div>  
                            <button type="button" id="btnseach" class="pull-right btn btn-sm btnconinsideBtn">Search</button>
                          </div>
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
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                     <div id="reportGrid">
                       <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                        
                                     <th style="width:50px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                       <th style="width:50px">
                                             Sr No.
                                        </th>
                                        <th style="width:150px">
                                             Customer Name
                                        </th>
                                        <th style="width:150px">
                                             Accounts
                                        </th>
                                        <th style="width:150px">
                                            Accounts Sub Level
                                        </th>
                                        <th style="width:150px">
                                             From Date
                                        </th>
                                        <th style="width:150px">
                                             To Date
                                        </th>
                                        <th style="width:200px">
                                            Acount Type
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:150px">
                                            Account 1
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 1
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 1
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            2
                                        </td>
                                       <td style="width:150px">
                                           Customer 2
                                        </td>
                                        <td style="width:150px">
                                            Account 2
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 2
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 2
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            3
                                        </td>
                                          <td style="width:150px">
                                           Customer 3
                                        </td>
                                        <td style="width:150px">
                                            Account 3
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 3
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 3
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            4
                                        </td>
                                         <td style="width:150px">
                                           Customer 4
                                        </td>
                                        <td style="width:150px">
                                            Account 4
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 4
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 4
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            5
                                        </td>
                                      <td style="width:150px">
                                           Customer 5
                                        </td>
                                        <td style="width:150px">
                                            Account 5
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 5
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 5
                                        </td>
                                            </tr>

                                    </tbody>
                                </table>

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
               $("#fromdate").datepicker();
                   $("#todate").datepicker();

           });
  </script>
    

</asp:Content>
