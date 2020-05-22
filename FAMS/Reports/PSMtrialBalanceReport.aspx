<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="PSMtrialBalanceReport.aspx.cs" Inherits="FAMS.Reports.PSMtrialBalanceReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <script src="../JavaScript/PSMtrialBalanceReport.js"></script>
    <style>
        .bodypartnav {
            max-width: 100%
        }

        .sidenav {
            display: none
        }

        .cardbody {
            width: 109.5%;
        }
        #trialBalanceGrid .bankmasterTable tbody {
            max-height: 41vh !important;
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
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack"><i class="fa fa fa-home" aria-hidden="true"></i> Home</button>
                        </div>
                    </div>
                </div>



                <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Customer Name:</label>
  <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
            <select class="dropdown col-md-12 col-xs-12 col-sm-12" id="ddlCustomer">
                <option>Select</option>
                <option value="Cust_000001">Customer 1</option>
                <option value="Cust_000002">Customer 2</option>
              <%--  <option value="3">Mitali Roy</option>
                <option value="4">Raushan Raj</option>--%>
            </select>
      </div>
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Accounts:</label>
  <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
            <select class="dropdown col-md-12 col-xs-12 col-sm-12" id="ddlAccounts">
                <option>Select</option>
                <option value="1">Assets</option>
                <option value="2">Expense</option>
                <option value="3">Income</option>
                <option value="4">Laibilities</option>
                <option value="50">All</option>
            </select>
      </div>
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Accounts Sub Level:</label>
  <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
            <select class="dropdown col-md-12 col-xs-12 col-sm-12" id="ddlAccSubLvl">
                <option>Select</option>
                <%--<option>Current Assets</option>
                <option>Investment</option>
                <option>All</option>--%>
            </select>
      </div>
        </div>
       
        </div>
         </div>  
                           <div class="form-group">
          <div class="row">
          <%--         <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
             <label class="col-md-4 col-xs-12 col-sm-4 p-0">Account Type:</label>
      <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
                <select class="dropdown col-md-12 col-xs-12 col-sm-12">
                    <option>Select</option>
                </select>
          </div>
            </div>--%>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">From Date:</label>
    <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
            <input type="text" id="fromdate" name="" class="col-md-12 col-xs-12 col-sm-12" placeholder=" " />
              </div> 
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">To Date:</label>
  <div class="col-md-7 col-xs-12 col-sm-7 p-0 d-inline-block">
            <input type="text" id="todate" name="" class="col-md-12 col-xs-12 col-sm-12" placeholder=" " />
              </div> 
        </div>
             
       
        </div>
         </div>  
                            <button type="button" id="btnseach" class="pull-right btn btn-sm btnconinsideBtn">Search</button>
                          </div>
                    
                    <div class="row boxrow">
                       <%-- <div class="col-md-12 col-sm-12 col-xs-12">
                            <label>Account: <span>100345 Milind Goyal</span></label>

                        </div>--%>
                        <div class="col-md-8 pull-left">
                            <div class="pdfexport">
                               <a href="../ExcelReports/TB_File.csv">   <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                                    <i class="fa fa-file-excel-o"></i>
                                </button></a>
                               <a href="../ExcelReports/TB_File.pdf">   <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                                    <i class="fa fa-file-pdf-o"></i>
                                </button></a>


                            </div>


                        </div>
                        <div class="btncon col-md-4 col-sm-4 col-xs-12 pt-2">
                            <div class="pull-right">
                             <button type="button" class="btn btn-sm btnconinsideBtn" id="txtpreday"> Previous day</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLastWeek"> Last one week</button>
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnLast2Weeks"> One month</button>
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

                                    <td colspan="7" id="tblAssets" style="display:none"><strong>Assets</strong>
                                        <table>
                                            <tbody id="tblAssetsChild">
                                            <tr>
                                     <td colspan="7" style="display:none" id="tblCurrentAssets" ><strong>Current Assets</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Receivable-KOTAK-Shares-Listed</td>
                                    <td class="text-center" style="width: 150px" id="tdCAOBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCAOBCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCATransDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCATransCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCACBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCACBCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Bank balance-DUMMY-100345</td>
                                    <td class="text-center" style="width: 150px" id="tdCA1OBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA1OBCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA1TransDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA1TransCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA1CBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA1CBCredit"></td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                 <tr>
                                     <td colspan="7" id="tblInvestment" style="display:none"><strong>Investment</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Receivable-KOTAK-Shares-Listed</td>
                                    <td class="text-center" style="width: 150px" id="tdCA2OBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA2OBCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA2TransDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA2TransCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA2CBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA2CBCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Bank balance-DUMMY-100345</td>
                                    <td class="text-center" style="width: 150px" id="tdCA3OBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA3OBCredit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA3TransDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA3TransCredit"></td>
                                    <td class="text-center" style="width: 150px"  id="tdCA3CBDebit"></td>
                                    <td class="text-center" style="width: 150px" id="tdCA3CBCredit"></td>

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

                                    <td colspan="7" id="tblExpense" style="display:none"><strong>Expense</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                     <td colspan="7">
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Management Fees</td>
                                    <td class="text-center" style="width: 150px" id="ExpODebit"></td>
                                    <td class="text-center" style="width: 150px" id="ExpOCredit"></td>
                                    <td class="text-center" style="width: 150px" id="ExpTDebit"></td>
                                    <td class="text-center" style="width: 150px" id="ExpTCredit"></td>
                                    <td class="text-center" style="width: 150px" id="ExpCDebitS"></td>
                                    <td class="text-center" style="width: 150px" id="ExpCCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">STT</td>
                                    <td class="text-center" style="width: 150px" id="Exp1ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Exp1OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Exp1TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Exp1TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Exp1CDebitS"></td>
                                    <td class="text-center" style="width: 150px" id="Exp1CCredit"></td>

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

                                    <td colspan="7" id="tblIncome" style="display:none"><strong>Income</strong>
                                        <table>
                                            <tbody>
                                            <tr id="tblDividend" style="display:none">
                                     <td colspan="7" ><strong>Dividend</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Dividend-Shares Listed</td>
                                    <td class="text-center" style="width: 150px" id="InODebit"></td>
                                    <td class="text-center" style="width: 150px" id="InOCredit"></td>
                                    <td class="text-center" style="width: 150px" id="InTDebit"></td>
                                    <td class="text-center" style="width: 150px" id="InTCredit"></td>
                                    <td class="text-center" style="width: 150px" id="InCDebit"></td>
                                    <td class="text-center" style="width: 150px" id="InCCredit"></td>

                                            </tr>
                                              
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                 <tr>
                                     <td colspan="7" id="tblGain_Loss"  style="display:none"><strong>Gain/Loss</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Shares-Listed</td>
                                    <td class="text-center" style="width: 150px" id="In1ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="In1OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="In1TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="In1TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="In1CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="In1CCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Mutual Funds-Liquid Fund</td>
                                    <td class="text-center" style="width: 150px" id="In2ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="In2OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="In2TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="In2TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="In2CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="In2CCredit"></td>

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

                                    <td colspan="7" id="tblLiabilities" style="display:none"><strong>Liabilities</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                     <td colspan="7" id="tblCapital" style="display:none"><strong>Capital</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Corpus</td>
                                    <td class="text-center" style="width: 150px" id="LiaODebit"></td>
                                    <td class="text-center" style="width: 150px" id="LiaOCredit"></td>
                                    <td class="text-center" style="width: 150px" id="LiaTDebit"></td>
                                    <td class="text-center" style="width: 150px" id="LiaTCredit"></td>
                                    <td class="text-center" style="width: 150px" id="LiaCDebit"></td>
                                    <td class="text-center" style="width: 150px" id="LiaCCredit"></td>

                                            </tr>
                                              
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                 <tr>
                                     <td colspan="7" id="tblCurrentLiabilities" style="display:none"><strong>Current Liabilities</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Payable-KOTAK-Shares-Listed</td>
                                    <td class="text-center" style="width: 150px" id="Lia1ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia1OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia1TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia1TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia1CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia1CCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Management Fees</td>
                                    <td class="text-center" style="width: 150px" id="Lia2ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia2OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia2TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia2TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia2CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia2CCredit"></td>

                                            </tr>
                                                 <tr>
                                    <td width="300px">Sec. Tran. Tax</td>
                                    <td class="text-center" style="width: 150px" id="Lia3ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia3OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia3TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia3TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia3CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia3CCredit"></td>

                                            </tr>
                                            </tbody>
                                        </table>


                                    </td>

                                            </tr>
                                                <tr>
                                     <td colspan="7" id="tblUnrealizedGain_Loss" style="display:none"><strong>Unrealized Gain\Loss</strong>
                                        <table>
                                            <tbody>
                                            <tr>
                                    <td width="300px">Shares-Listed</td>
                                    <td class="text-center" style="width: 150px" id="Lia4ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia4OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia4TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia4TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia4CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia4CCredit"></td>

                                            </tr>
                                                <tr>
                                    <td width="300px">Mutual Funds-Liquid Fund</td>
                                    <td class="text-center" style="width: 150px" id="Lia5ODebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia5OCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia5TDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia5TCredit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia5CDebit"></td>
                                    <td class="text-center" style="width: 150px" id="Lia5CCredit"></td>

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
                            <tfoot id="tblTotal" style="display:none">
                               
                                <tr>

                                     <td colspan="7"><strong></strong>
                                        <table>
                                            <tbody>
                                           
                                                <tr style="border:0px">
                                    <td width="300px">Total</td>
                                    <td class="text-center" style="width: 150px" id="totalODebit"></td>
                                    <td class="text-center" style="width: 150px" id="totalOCredit"></td>
                                    <td class="text-center" style="width: 150px" id="totalTDebit"></td>
                                    <td class="text-center" style="width: 150px" id="totalTCredit"></td>
                                    <td class="text-center" style="width: 150px" id="totalCDebit"></td>
                                    <td class="text-center" style="width: 150px" id="totalCCredit"></td>

                                            </tr>
                                            </tbody>
                                        </table>


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
