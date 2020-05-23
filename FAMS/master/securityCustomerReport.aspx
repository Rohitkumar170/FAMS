<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="securityCustomerReport.aspx.cs" Inherits="FAMS.master.securityCustomerReport" %>
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
                        Security-Customer Report
                    </div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                        <div class="btnpannel">
                            <%-- <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack"><i class="fa fa fa-undo" aria-hidden="true"></i> Back</button>--%>
                        </div>
                    </div>
                </div>



                <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-12 col-sm-12 col-xs-12 detailBox">

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
                                    <label class="col-md-3 col-xs-12 col-sm-3 p-0">Date:</label>

                                    <input type="text" id="fromdate" name="" class="col-md-7 col-xs-12 col-sm-7" placeholder=" " />

                                </div>
                                
                                <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
                                    <button type="button" id="btnsearch" class="btn btn-sm btnconinsideBtn">Search</button>
                                </div>

                            </div>
                        </div>

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
                                             Securities
                                        </th>
                                        <th style="width:150px">
                                             Customer
                                        </th>
                                        <th style="width:100px">
                                            Unit
                                        </th>
                                        <th class="price" style="width:100px">
                                             Unit Cost
                                        </th>
                                        <th class="price" style="width:100px">
                                             Amount
                                        </th>
                                        <th width="200px"></th>
                                        
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
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                           <td width="200px"></td> 
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                           <td width="200px"></td>   
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                      <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                            <td style="width:150px">
                                           Indian Oil
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:100px">
                                            50
                                        </td>
                                        <td class="price" style="width:100px">
                                            500
                                        </td>
                                            <td class="price" style="width:100px">
                                           25000
                                        </td>
                                            <td width="200px"></td>  
                                    </tr>
                                     

                                    </tbody>
                                </table>

                     </div>
                    
                </div>

            </div>
        </div>
    </div>

    <script src="../Assets/js/date-pickers.min.js"></script>
    <script src="../Assets/js/jquery-ui.min.js"></script>

    <script>
        $(function () {
            $("#fromdate").datepicker();

        });
    </script>
</asp:Content>
