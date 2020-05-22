<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="reportsDashboard.aspx.cs" Inherits="FAMS.master.mainDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/css/custom.css" rel="stylesheet" />
    <link href="../Assets/css/fontfamily.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script>        var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <script src="../js/jquery_ui_1.12.1.js" type="text/javascript"></script>
    <script>        var jquery_1_12_1 = jQuery.noConflict();</script>
    <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
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

        .portalBox {
            cursor: pointer;
            width: 18.6%;
            display: inline-block;
            text-align: center;
            border-right: 1px solid #eae6e6;
            border-bottom: 1px solid #eae6e6;
            margin-bottom: 15px;
            padding: 15px 10px 10px;
            margin-right: 5px;
            margin-left: 5px;
            vertical-align: top;
            height: 68px;
            overflow: hidden;
        }
            .portalBox:hover {
            background: #f2f2f3;
    box-shadow: 1px 1px 2px 1px #dfdfdf;
            }
            .portalBox img {
                width: 13%;
                display: inline-block;
                float:left
            }

            .portalBox h5 {
                font-size: 16px;
    color: #20343f;
    padding-top: 0px;
    display: inline-block;
    float: left;
    width: 87%;
            }
        .portalBox a{color:#fff}
        .noteBox {
                background: #fbfcfd;
    border-top: 1px solid #dedbdb;
    border-radius: 0px;
    margin-top: 15px;
    padding: 15px 10px 10px;
    box-shadow: 0px 1px 2px 1px #ddd;
    font-family: Roboto,"Helvetica Neue",Arial,sans-serif,"Segoe UI Symbol" !important;
    max-height: 386px;
    overflow: auto;
    min-height: 386px;
        }

            .noteBox h5 {
                color: #0a2e40;
                font-size: 18px;
            }

            .noteBox ul {
                list-style: none;
                padding-left: 18px;
                margin-bottom: 6px;
            }

                .noteBox ul li {
                    font-size: 13px;
                }

        .attachmentBtn {
            position: absolute;
            right: 13px;
            top: 10px;
            font-size: 13px;
            font-weight: 600;
            color: #33789e;
            cursor: pointer;
        }

            .attachmentBtn:hover {
                text-decoration: underline;
                color: #294856;
            }

            .attachmentBtn i {
                font-size: 15px;
                font-weight: 600;
                padding-right: 4px;
            }
    </style>
    <script type="text/javascript">
        //function openModal() {
        //$('#changepasswordpop').modal('show');
        //}
        $(document).ready(function () {
            var IsDefaultPswdChange = jquery_1_11_3_min_p("#ContentPlaceHolder1_lblIsDefaultPswdChange").html();
            if (IsDefaultPswdChange == "False") {
                $("#changepasswordpop").modal('show');
            }
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  <asp:Label ID="lblIsDefaultPswdChange" runat="server" style="display:none"></asp:Label>--%>
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                        Reports Dashboard
                    </div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-12 mt-3">
                <div class=" col-md-12 col-sm-12 col-xs-12">

                    <div class=" portalBox">
                        <a id="anchorID" runat="server" href="../Reports/trialBalanceReport.aspx">
                            <img src="../Assets/image/trial_icon.png" />
                            <h5>Trial Balance Report</h5>
                        </a>
                    </div>


                    <div class="portalBox">
                        <a href="../Reports/summaryReport.aspx">
                            <img src="../Assets/image/summary_icon.png" />
                            <h5>Portfolio Performance Summary</h5>
                        </a>
                    </div>


                    <div class="portalBox">
                        <a href="../Reports/holdingReport.aspx">
                            <img src="../Assets/image/holding_icon.png" />
                            <h5>Holding Report</h5>
                        </a>
                    </div>


                    <div class="portalBox">
                        <a href="../Reports/transactionStatement.aspx">
                            <img src="../Assets/image/transaction_icon.png" />
                            <h5>Transaction Statement</h5>
                        </a>
                    </div>


                    <div class="portalBox">
                        <a href="../Reports/cashEquivalent.aspx">
                            <img src="../Assets/image/cash_icon.png" />
                            <h5>Cash Equivalent</h5>
                        </a>
                    </div>

                </div>


            </div>

        </div>
        <div class="col-sm-12 col-md-12">
            <div class=" col-md-12 col-sm-12 col-xs-12 noteBox">
                <h5>Important Notes:</h5>
                <span class="attachmentBtn"><i class="fa fa-paperclip" aria-hidden="true"></i>Download Attachment</span>
                <ul>
                    <li>1. Trial Balance Report</li>
                    <li>2. Portfolio Performance Summary Report</li>
                    <li>3. Portfolio Appraisal Report</li>
                    <li>4. Transaction Statement Report</li>
                    <li>5. Cash Equivalent Report</li>

                </ul>
            </div>
        </div>
    </div>





    <asp:Label ID="lblIsDefaultPswdChange" runat="server" Style="display: none"></asp:Label>
</asp:Content>
