<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="mainDashboard.aspx.cs" Inherits="FAMS.master.mainDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    border-radius: 4px; margin-bottom:10px; padding:15px 10px 10px; margin-right:5px; margin-left:5px; vertical-align: top; height: 145px;
    overflow: hidden;}
    .portalBox h5{font-size: 16px;
    color: #20343f;
    padding-top: 10px;}
    
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


     <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                   Main Dashboard</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    
                    </div>
                </div>
</div>
            </div>

          <div class="row">
                        <div class="col-sm-12 col-md-12 mt-3">
                           <div class=" col-md-12 col-sm-12 col-xs-12" >
             <a href="#">
                    <div class=" portalBox" >
                        <img src="../Assets/image/trial_icon.png" />
                        <h5>Trial Sheet</h5>
                          
                    </div></a>
                     <a href="#">
                    <div class="portalBox" >
                        <img src="../Assets/image/trial_icon.png" />
                        <h5>Balance Sheet</h5>
                     
                    </div>
                    </a>
                    <a href="#">
                    <div class=" portalBox" >
                        <img src="../Assets/image/trial_icon.png" />
                        <h5>Trial Sheet</h5>
                          
                    </div></a>
                     <a href="#">
                    <div class="portalBox" >
                        <img src="../Assets/image/trial_icon.png" />
                        <h5>Balance Sheet</h5>
                     
                    </div>
                    </a>
                    
            </div>
                            
                         
                        </div>
                        
                    </div>
         </div>
       
</asp:Content>
