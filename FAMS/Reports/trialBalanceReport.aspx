<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="trialBalanceReport.aspx.cs" Inherits="FAMS.Reports.trialBalanceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <style>
        .bodypartnav {
            max-width: 100%
        }

        .sidenav {
            display: none
        }

        .cardbody {
            width: 108%;
        }
        #trialBalanceGrid .bankmasterTable tbody {
            max-height: 43vh !important;
        }
        #trialBalanceGrid thead th {text-align:center
        }
         #trialBalanceGrid { overflow:hidden; border-right:1px solid #ddd; border-left:1px solid #ddd  
        }
        strong {
            color: #0a2e40;
            font-size: 12px;
        }
        .bankmasterTable tr td table tr:nth-child(even) {
            background-color:transparent;
        }
        .bankmasterTable thead tr:first-child th:first-child {
        padding-left:0px}
        .bankmasterTable thead tr:first-child th {
        padding-left:10%}
        .bankmasterTable tr td table tr td:first-child {
        text-align:left !important}
        .bankmasterTable tr td table tr td {
        text-align:right !important}
            .bankmasterTable tbody tr td table tbody {
            overflow:hidden !important}

        @media screen and (max-width:1024px) {
            .cardbody {
            width: 100%;
        }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                        Trial Balance
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
                        <div class="btncon col-md-4 col-sm-4 col-xs-12 pt-2">
                            <div class="pull-right">
                             <button type="button" class="btn btn-sm btnconinsideBtn"> Yesterday</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn"> Last Week</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn"> Last 2 Weeks</button>
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
                        </div>
                        <div class="col-md-2 pull-right mt-2 ">


                            <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">



                                <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                                <div class="faiconsarch">
                                    <i class="fa fa-search"></i>
                                </div>

                            </div>
                        </div>--%>
                    </div>
                    <div id="trialBalanceGrid">
                        <table class="bankmasterTable">
                            <thead>
                                <tr>

                                    <th style="width: 300px">Account</th>
                                    <th style="width: 300px" colspan="2">Opening Balance</th>
                                    <th style="width: 300px" colspan="2">Transaction During Period</th>
                                    <th style="width: 300px" colspan="2">Closing Balance</th>

                                </tr>
                                <tr>

                                    <th style="width: 300px"></th>
                                    <th class="text-right" style="width: 150px">Debit</th>
                                    <th class="text-right" style="width: 150px">Credit</th>
                                    <th class="text-right" style="width: 150px">Debit</th>
                                    <th class="text-right" style="width: 150px">Credit</th>
                                    <th class="text-right" style="width: 150px">Debit</th>
                                    <th class="text-right" style="width: 150px; padding-right:10px">Credit</th>

                                </tr>
                            </thead>
                            <tbody class="scrollbar">
                                <tr>

                                    <td colspan="7"><strong>Assets</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                     <td colspan="7"><strong>Current Assets</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Receivable-KOTAK-Shares-Listed</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Bank balance-DUMMY-100345</td>
                                    <td class="text-center" style="width: 150px">333,372.14</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,359,850.62</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,693,222.76</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                 <tr>
                                     <td colspan="7"><strong>Investment</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Receivable-KOTAK-Shares-Listed</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Bank balance-DUMMY-100345</td>
                                    <td class="text-center" style="width: 150px">333,372.14</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,359,850.62</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,693,222.76</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                             
                                            </tbody>
                                        </table>


                                    </td>
                                   
                                </tr>
                         <tr>

                                    <td colspan="7"><strong>Expense</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                     <td colspan="7">
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Management Fees</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                                <tr>
                                    <td width="300px">STT</td>
                                    <td class="text-center" style="width: 150px">333,372.14</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,359,850.62</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,693,222.76</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                
                                            </tbody>
                                        </table>


                                    </td>
                                   
                                </tr>

                                <tr>

                                    <td colspan="7"><strong>Income</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                     <td colspan="7"><strong>Dividend</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Dividend-Shares Listed</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                              
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                 <tr>
                                     <td colspan="7"><strong>Gain/Loss</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Shares-Listed</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">8,365,964.22</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Mutual Funds-Liquid Fund</td>
                                    <td class="text-center" style="width: 150px">333,372.14</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,359,850.62</td>
                                    <td class="text-center" style="width: 150px">0.00</td>
                                    <td class="text-center" style="width: 150px">1,693,222.76</td>
                                    <td class="text-center" style="width: 150px">0.00</td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                             
                                            </tbody>
                                        </table>


                                    </td>
                                   
                                </tr>
                           
                            </tbody>
                            <tfoot >
                                <tr>
                                     <td style="width: 300px">Total</td>
                                    <td class="text-right" style="width: 150px"></td>
                                    <td class="text-right" style="width: 150px"></td>
                                     <td class="text-right" style="width: 150px">28,968,151.508</td>
                                    <td class="text-right" style="width: 150px"></td>
                                    <td class="text-right" style="width: 150px">47,267,111.90</td>
                                    <td class="text-right" style="width: 150px">18,298,960</td>
                                    <td class="text-right" style="width: 150px">63.17%</td>

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
