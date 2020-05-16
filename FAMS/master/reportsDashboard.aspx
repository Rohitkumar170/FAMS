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
        max-width:100%}
        .sidenav {
        display:none}
        .cardbody {
        width:120%}
         .portalBox{ cursor:pointer; width:23.8%; display:inline-block; text-align: center;
    background: #fbfcfd;
    border: 1px solid #dedbdb;
    border-radius: 4px; margin-bottom:15px; padding:15px 10px 10px; margin-right:5px; margin-left:5px; vertical-align: top; height: 145px;
    overflow: hidden;}
    .portalBox h5{font-size: 16px;
    color: #20343f;
    padding-top: 10px;}
    
    </style>
    <script type="text/javascript">
        //function openModal() {
        //$('#changepasswordpop').modal('show');
        //}
        $(document).ready(function () {
            var IsDefaultPswdChange = jquery_1_11_3_min_p("#ContentPlaceHolder1_lblIsDefaultPswdChange").html();
            if (IsDefaultPswdChange == "False")
            {
                $("#changepasswordpop").modal('show');
            }
        });  
    </script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">

              
     <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                   Reports Dashboard</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    
                    </div>
                </div>
</div>
            </div>

          <div class="row">
                        <div class="col-sm-12 col-md-12 mt-3">
                           <div class=" col-md-12 col-sm-12 col-xs-12" >
             <a id="anchorID"  runat="server" href="../Reports/trialBalanceReport.aspx">
                    <div class=" portalBox" >
                        <img src="../Assets/image/trial_icon.png" />
                        <h5>Trial Balance Report</h5>
                          
                    </div></a>
                     <a href="../Reports/summaryReport.aspx">
                    <div class="portalBox" >
                        <img src="../Assets/image/summary_icon.png" />
                        <h5>Portfolio Performance Summary</h5>
                     
                    </div>
                    </a>
                    <a href="../Reports/holdingReport.aspx">
                    <div class="portalBox" >
                        <img src="../Assets/image/holding_icon.png" />
                        <h5>Portfolio Appraisal</h5>
                          
                    </div></a>
                    <a href="../Reports/transactionStatement.aspx">
                    <div class="portalBox" >
                        <img src="../Assets/image/transaction_icon.png" />
                        <h5>Transaction Statement</h5>
                     
                    </div>
                    </a>
                     <a href="../Reports/cashEquivalent.aspx">
                    <div class="portalBox" >
                        <img src="../Assets/image/cash_icon.png" />
                        <h5>Cash Equivalent</h5>
                     
                    </div>
                    </a>
            </div>
                            
                         
                        </div>
                        
                    </div>
         </div>
       <asp:Label ID="lblIsDefaultPswdChange" runat="server" Style="display: none"></asp:Label>
</asp:Content>
