<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="cashEquivalent.aspx.cs" Inherits="FAMS.Reports.cashEquivalent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <style>
        .bodypartnav {
            max-width: 100%
        }

        .sidenav {
            display: none
        }

       
        #cashEquivalentGrid .bankmasterTable tbody {
            max-height: 49vh !important;
        }
        #cashEquivalentGrid { overflow:hidden; overflow-x: scroll; border-right:1px solid #ddd; border-left:1px solid #ddd  
        }
            #cashEquivalentGrid table {
            width:100%}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                       Client Cash Equivalent Report
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
                                    <label class="col-md-3 col-xs-12 col-sm-3 p-0">From Date:</label>

                                    <input type="text" id="fromdate" name="" class="col-md-7 col-xs-12 col-sm-7" placeholder=" " />

                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4">
                                    <label class="col-md-3 col-xs-12 col-sm-3 p-0">To Date:</label>

                                    <input type="text" id="todate" class="col-md-7 col-xs-12 col-sm-7" placeholder=" " />
                                </div>
                                <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
                                    <button type="button" id="btnsearch" class="btn btn-sm btnconinsideBtn">Search</button>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="row boxrow">
                       <%-- <div class="col-md-12 col-sm-12 col-xs-12">
                            <label>Account: <span>100345 Milind Goyal</span></label>

                        </div>--%>
                        <div class="col-md-8 pull-left">
                            <div class="pdfexport">
                                <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                                    <i class="fa fa-file-excel-o"></i>
                                </button>
                                <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                                    <i class="fa fa-file-pdf-o"></i>
                                </button>


                            </div>


                        </div>

<%--                        <div class="col-md-2 pull-left mt-2">
                            <div class="searchDropdown">
                                <div class="row">
                                    <label class=" col-md-8 showLebel">Show Records :</label>
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

                            </div>
                        </div>--%>
                      <%--  <div class="col-md-2 pull-right mt-2 ">


                            <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">



                                <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                                <div class="faiconsarch">
                                    <i class="fa fa-search"></i>
                                </div>

                            </div>
                        </div>--%>
                        <div class="btncon col-md-4 col-sm-4 col-xs-12 pt-2">
                            <div class="pull-right">
                             <button type="button" class="btn btn-sm btnconinsideBtn"> Yesterday</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn"> Last Week</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn"> Last 2 Weeks</button>
                                </div>
                        
                    </div>
                    </div>
                    <div id="cashEquivalentGrid">
                        <table class="bankmasterTable">
                            <thead>
                                <tr>

                                    <th style="width: 100px">Account</th>
                                    <th style="width: 150px">Account Name</th>
                                    <th style="width: 150px">Bank Balance</th>
                                     <th style="width: 150px">Liquid Fund MV</th>
                                    <th style="width: 150px">Payable</th>
                                    <th style="width: 150px">Receivable</th>
                                    <th style="width: 150px">Pending Orders Cash</th>
                                    <th style="width: 150px">Available Cash & Eq.</th>
                                    <th style="width: 150px">Market ValueCash & Eq.</th>
                                    <th style="width: 150px">% of MV</th>
                                </tr>
                            </thead>
                            <tbody class="scrollbar">
                                <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                           <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">100338
                                    </td>
                                    <td style="width: 150px">Sunil Kumar
                                    </td>
                                     <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>
                                
                            </tbody>
                             <tfoot >
                                <tr>
                                     <td style="width: 100px">Total</td>
                                    <td style="width: 150px"></td>
                                    <td style="width: 150px">2,340,325.21      
                                    </td>
                                    <td style="width: 150px">920,024.35
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">0.00
                                    </td>
                                    <td style="width: 150px">3,260,349.55
                                    </td>
                                    <td style="width: 150px">42,172,755.52
                                    </td>
                                      <td style="width: 150px">7.73
                                    </td>
                                </tr>

                            </tfoot>
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
            $("#todate").datepicker();

        });
    </script>
</asp:Content>
