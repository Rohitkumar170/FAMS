<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="summaryReport.aspx.cs" Inherits="FAMS.Reports.summaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../JavaScript/SummaryReport.js"></script>
    <style>
        .bodypartnav {
            max-width: 100%
        }

        .sidenav {
            display: none
        }

        .cardbody {
            width: 120%
        }

        #reportGrid .bankmasterTable tbody {
            max-height: 55vh !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                                       <input type="hidden" id="CustAcc" runat="server" />

    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                        Portfolio Performance Summary
                    </div>
                   <%-- <div class="btncon col-md-9 col-sm-9 col-xs-12">
                        <div class="btnpannel">
                             <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack"><i class="fa fa fa-home" aria-hidden="true"></i> Home</button>
                        </div>
                    </div>--%>
                </div>




                <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-12 col-sm-12 col-xs-12 detailBox">

                        <div class="form-group">
                            <div class="row">
                                   <div class="col-md-3 col-xs-12 col-sm-4 pr-0" id="divDropdown" runat="server">

                                    <label class="col-md-4 col-xs-12 col-sm-3 p-0">Customer Name:</label>

                                   <select class="dropdown col-sm-12 col-md-7 col-xs-12" id="ddlCustomer">
                                                                        <option>Select</option>
                <option value="Cust_000001">Customer 1</option>
                <option value="Cust_000002">Customer 2</option>
                                                                    </select>

                                </div>
                                <div class="col-md-3 col-xs-12 col-sm-4 pr-0">
                                    <label class="col-md-3 col-xs-12 col-sm-3 p-0">From Date:</label>

                                    <input type="text" id="fromdate" name="" class="col-md-7 col-xs-12 col-sm-7" placeholder=" " />
                                    <input type="hidden" id="hdnFromDate" runat="server" />
    <input type="hidden" id="hdnToDate" runat="server" />
                                </div>
                                <div class="col-md-3 col-xs-12 col-sm-4">
                                    <label class="col-md-3 col-xs-12 col-sm-3 p-0">To Date:</label>

                                    <input type="text" id="todate" class="col-md-7 col-xs-12 col-sm-7" placeholder=" " />
                                </div>
                                <div class="col-md-3 col-xs-12 col-sm-4 pr-0">
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
                            <%--<div class="pdfexport">
                                <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                                    <i class="fa fa-file-excel-o"></i>
                                </button>
                                 <form runat="server">
                                 <asp:Button ID = "Button1" Text="Download Excel" class="btn  pdfbtns fa fa-file-pdf-o" title="Excel" runat="server" OnClick ="btnDowloadExcel_Click" autopostback="false" />


                               
                                 <asp:Button ID = "btnPd" Text="PDF" class="btn  pdfbtns fa fa-file-pdf-o" title="PDF" runat="server" OnClick ="btnPdf_Click" />
                                </form>
                                
                                <button type="button" id="btnPdf"  runat="server" class="btn  pdfbtns" title="PDF" OnClick ="btnPdf_Click">
                                   <i class="fa fa-file-pdf-o"></i>
                                </button>


                            </div>--%>
                              <div class="pdfexport">
                               <a href="../ExcelReports/Summary_Report.csv"> <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                                    <i class="fa fa-file-excel-o"></i>
                                </button></a>
                                 <a href="../ExcelReports/Summary_Report.pdf"><button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                                    <i class="fa fa-file-pdf-o"></i>
                                </button></a>


                            </div>

                        </div>

                       <%-- <div class="col-md-2 pull-left mt-2">
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
                       <%-- <div class="col-md-2 pull-right mt-2 ">


                            <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">



                                <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                                <div class="faiconsarch">
                                    <i class="fa fa-search"></i>
                                </div>

                            </div>
                        </div>--%>
                        <div class="btncon col-md-4 col-sm-4 col-xs-12 pt-2">
                            <div class="pull-right">
                             <button type="button" class="btn btn-sm btnconinsideBtn" id="btnYesterday">Previous Day</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLastWeek"> Last One Week</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLast2Weeks">Last One Month</button>
                                </div>
                        
                    </div>
                    </div>
                    <div id="reportGrid">
                        <table class="bankmasterTable" >
                            <thead>
                                <tr>

                                    <th style="width: 300px"></th>
                                    <th style="width: 500px"></th>

                                </tr>
                            </thead>
                            <tbody class="scrollbar" id="reportTable" style="display:none">
                                <tr>


                                    <td style="width: 300px" id="OpenMarValTH">Market Value as of 01/04/2014
                                    </td>
                                    <td style="width: 500px" id="OpenMarValTD">32,604,127.40
                                    </td>
                                </tr>
                                <tr>


                                    <td style="width: 300px" id="OpenNAVValTH">Opening NAV as of 01/04/2014
                                    </td>
                                    <td style="width: 500px" id="OpenNAVValTD">14.1757
                                    </td>
                                </tr>
                                <tr>


                                    <td style="width: 300px" id="OpenOutValTH">Opening Outstanding Units as of 01/04/2014
                                    </td>
                                    <td style="width: 500px" id="OpenOutValTD">2,300,000.000
                                    </td>
                                </tr>

                                <tr>


                                    <td style="width: 300px">Capital In(+)/Out(-)
                                    </td>
                                    <td style="width: 500px" id="CapitalTD">0.00
                                    </td>
                                </tr>


                                <tr>


                                    <td style="width: 300px">Realized Gain
                                    </td>
                                    <td style="width: 500px" id="RelaizedTD">58,242.77
                                    </td>
                                </tr>
                                <tr>


                                    <td style="width: 300px">Unrealized Gain
                                    </td>
                                    <td style="width: 500px" id="UnrelaizedTD">7,392,785.99
                                    </td>
                                </tr>

                                <tr>


                                    <td style="width: 300px">Gain Prior to Take-over
                                    </td>
                                    <td style="width: 500px" id="GainPriorTD">0.00
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 300px">Income
                                    </td>
                                    <td style="width: 500px" id="IncomeTD">144,572.90
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 300px">Fees
                                    </td>
                                    <td style="width: 500px" id="FeesTD">126,904.25
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 300px">Expenses
                                    </td>
                                    <td style="width: 500px" id="ExpensesTD">0.00
                                    </td>
                                </tr>
                                   <tr>
                                    <td style="width: 300px">Accrued Income
                                    </td>
                                    <td style="width: 500px" id="AccuredTD">0.00
                                    </td>
                                </tr>
                                   <tr>
                                    <td style="width: 300px" id="CloseMarValTH">Market Value as of 30/06/2014
                                    </td>
                                    <td style="width: 500px" id="CloseMarValTD">40,072,824.81
                                    </td>
                                </tr>
                                   <tr>
                                    <td style="width: 300px" id="CloseNAVValTH">Closing NAV as of 30/06/2014
                                    </td>
                                    <td style="width: 500px" id="CloseNAVValTD">17.4230
                                    </td>
                                </tr>
                                   <tr>
                                    <td style="width: 300px" id="CloseOutValTH">Closing Outstanding Units as of 30/06/2014
                                    </td>
                                    <td style="width: 500px" id="CloseOutValTD">2,300,000.000
                                    </td>
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
            $("#todate").datepicker();

        });
    </script>
</asp:Content>
