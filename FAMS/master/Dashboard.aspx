<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FAMS.master.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/Assets/css/custom.css" rel="stylesheet" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


     <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Dashboard</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <%--<div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target=""><i class="fa fa-plus-square aria-hidden="true"></i> New</button> 

                       <button type="button" class="btn btn-sm btnconinsideBtn" id="Btnback" style='display:inline-block' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button> 
                         <button type="button" class="btn btn-sm btnconinsideBtn" id="Button1" data-toggle="modal" data-target="#successpop"><i class="fa fa-plus-square" aria-hidden="true"></i> savesucessfully</button> 
                           <button type="button" class="btn btn-sm btnconinsideBtn" id="Button2" data-toggle="modal" data-target="#alertpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Alert </button>
                       
                          </div> --%>        
                    </div>
                </div>
</div>
            </div>
         </div>
</asp:Content>
