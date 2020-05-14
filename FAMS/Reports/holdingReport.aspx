﻿<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="holdingReport.aspx.cs" Inherits="FAMS.Reports.holdingReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../JavaScript/HoldingReport.js"></script>

    <style>
        .bodypartnav {
            max-width: 100%
        }

        .sidenav {
            display: none
        }
         strong {
            color: #0a2e40;
            font-size: 12px;
        }

        #holdingreportGrid .bankmasterTable tbody {
            max-height: 52vh !important;
        }
        #holdingreportGrid { overflow:hidden; overflow-x: scroll; border-right:1px solid #ddd; border-left:1px solid #ddd  
        }

            #holdingreportGrid table {
                width: 100%
            }
        table tbody tr td table tbody {
        overflow:hidden}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                        Portfolio Appraisal
                    </div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                        <div class="btnpannel">
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack"><i class="fa fa fa-home" aria-hidden="true"></i> Home</button>

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
                                <button type="button" class="btn btn-sm btnconinsideBtn" id="btnYesterday">Yesterday</button>
                                <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLastWeek">Last Week</button>
                                <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLast2Weeks">Last 2 Weeks</button>
                            </div>

                        </div>
                    </div>
                    <div id="holdingreportGrid">
                         <table class="bankmasterTable" id="holdingreportGridTable">
                            <thead>

                                <tr>

                                    <th style="width: 320px">Security</th>
                                    <th style="width: 100px">Quantity</th>
                                    <th style="width: 150px" class="price">Unit Cost</th>
                                    <th style="width: 150px" class="price">Cost</th>
                                    <th style="width: 150px" class="price">Price</th>
                                    <th style="width: 150px" class="price">Market Value </th>
                                    <th style="width: 100px">Gain / Loss (+/-)</th>
                                    <th style="width: 100px">% G/L</th>
                                    <th style="width: 100px">% Assets</th>
                                </tr>
                            </thead>
                            <tbody class="scrollbar">
                                <tr>
                                    <td colspan="9"><strong>Equity
                                    </strong>
                                        <table  id="tblholdingreport">
                                            <tbody>
                                              <%--  <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="loss">-2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="loss">-78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="loss">-2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="loss">-78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="loss">-2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="loss">-78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">SOLAR INDUSTRIES INDIA LTD
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>--%>
                                            </tbody>
                                        <tfoot>
                                          <%--  <tr>
                                                <td style="width: 320px">Total</td>
                                                <td style="width: 100px"></td>
                                                <td style="width: 150px" class="price"></td>
                                                <td style="width: 150px" class="price">28,968,151.508</td>
                                                <td style="width: 150px" class="price"></td>
                                                <td style="width: 150px" class="price">47,267,111.90</td>
                                                <td style="width: 100px" class="profit">18,298,960</td>
                                                <td style="width: 100px" class="profit">63.17%</td>
                                                <td style="width: 100px">94.39%</td>

                                            </tr>--%>

                                        </tfoot>
                        </table>
                        </td>
                                   
                                </tr>
                           
                                <tr>
                                    <td colspan="9"><strong>Cash and Equivalent
                                    </strong>
                                        <table id="tblCash">
                                            <tbody>
                                               <%-- <tr>
                                                    <td style="width: 320px">Cash
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 320px">Birla SL Cash Plus -G
                                                    </td>
                                                    <td style="width: 100px">1,804
                                                    </td>
                                                    <td style="width: 150px" class="price">1,484.93      
                                                    </td>
                                                    <td style="width: 150px" class="price">2,678,809.966
                                                    </td>
                                                    <td style="width: 150px" class="price">2,657.15
                                                    </td>
                                                    <td style="width: 150px" class="price">4,793,498.60
                                                    </td>
                                                    <td style="width: 100px" class="profit">2,114,689
                                                    </td>
                                                    <td style="width: 100px" class="profit">78.94%
                                                    </td>
                                                    <td style="width: 100px">9.57%
                                                    </td>
                                                </tr>--%>
                                           
                                            </tbody>
                                        <tfoot>
                                            <%--<tr>
                                                <td style="width: 320px">Total</td>
                                                <td style="width: 100px"></td>
                                                <td style="width: 150px" class="price"></td>
                                                <td style="width: 150px" class="price">28,968,151.508</td>
                                                <td style="width: 150px" class="price"></td>
                                                <td style="width: 150px" class="price">47,267,111.90</td>
                                                <td style="width: 100px" class="profit">18,298,960</td>
                                                <td style="width: 100px" class="profit">63.17%</td>
                                                <td style="width: 100px">94.39%</td>

                                            </tr>--%>

                                        </tfoot>
                        </table>
                        </td>
                                   
                                </tr>
                                
                            </tbody>
                             <tfoot id="MaintblTfoot">
                               <%--  <tr>
                                     <td style="width: 410px">Total</td>
                                     <td style="width: 100px"></td>
                                     <td style="width: 150px" class="price"></td>
                                     <td style="width: 150px" class="price">28,968,151.508</td>
                                     <td style="width: 180px" class="price"></td>
                                     <td style="width: 150px" class="price">47,267,111.90</td>
                                     <td style="width: 100px" class="profit">18,298,960</td>
                                     <td style="width: 100px" class="profit">63.17%</td>
                                     <td style="width: 100px">94.39%</td>

                                 </tr>--%>

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
