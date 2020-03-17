<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="Entity.aspx.cs" Inherits="FAMS.master.Adminstator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/Assets/css/custom.css" rel="stylesheet" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/jquery.min.js"></script>

<script>
$(document).ready(function(){
  $("#btnNew").click(function(){
    $("#entitygrid").hide();
  });
  $("#btnNew").click(function(){
    $("#boxgrid").show();
    });
     $("#Btnback").click(function(){
    $("#entitygrid").show();
    });
     $("#Btnback").click(function(){
    $("#boxgrid").hide();
    });


});
</script>


    <style>

        #btnsave{

                background-color: #0a2e40;
    color: #fff;
    padding: 1px 12px 1px 12px;
    position: absolute;
    right: 0px;
        }


       .gridbox {
            background-color: #143c651a;
            height: 100px;
            border-radius: 3px;
            border: 1px solid #dddddd;
        }
        .insidebox {
     margin-top:26px;}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Entity</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target=""><i class="fa fa-plus-square aria-hidden="true"></i> New</button> 

                       <button type="button" class="btn btn-sm btnconinsideBtn" id="Btnback" style='display:inline-block' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button> 
                         <%-- <button type="button" class="btn btn-sm btnconinsideBtn" id="Button1" data-toggle="modal" data-target="#successpop"><i class="fa fa-plus-square" aria-hidden="true"></i> savesucessfully</button> 
                           <button type="button" class="btn btn-sm btnconinsideBtn" id="Button2" data-toggle="modal" data-target="#alertpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Alert </button> --%>
                       
                          </div>         
                    </div>
                </div>
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                       <table class="bankmasterTable" id="entitygrid" >
                                <thead>
                                    <tr>
                                     <th style="width:60px">
                                            Sr No.
                                        </th>
                                        <th style="width:160px">
                                            Company Name
                                        </th>
                                        <th style="width:160px">
                                            Through
                                        </th>
                                        <th style="width:160px">
                                            Status
                                        </th>
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                    </tbody>
                                   <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                                     <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                             <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                             <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                             <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                             <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                             <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                            Under Progress
                                        </td>
                                        <td style="width:160px">
                                            Running
                                        </td>
                                    </tr>
                                </table>

                     <div class="col-md-12 col-sm-12 col-xs-12 gridbox" id="boxgrid" style=" display:none;">

                           <div class="col-md-12 col-sm-12 col-xs-12 insidebox" >
                               <div class="row">
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
<div class="row">
    <label class="col-md-3 col-sm-3 col-xs-3 pl-0">Entity:</label>
    <input type="text" class="col-md-9 col-sm-9 col-xs-9" />



</div>



                         </div>


                     </div>
                               <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
<div class="row">
    <label class="col-md-3 col-sm-3 col-xs-3">Admin:</label>
    <input type="text" class="col-md-9 col-sm-9 col-xs-9" />



</div>



                         </div>


                     </div>
                               <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
<div class="row">
    <label class="col-md-3 col-sm-3 col-xs-3">Master:</label>
    <select class="col-md-9 col-xs-9 col-sm-9 dropdown">
        <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>


    </select>



</div>



                         </div>


                     </div>
                               </div>
                               

                                <button type="button" class="btn btn-sm btnconinsideBtn pull-right" id="btnsave" data-toggle="modal" data-target=""> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 

                               </div>



                     </div>



                     </div>

</div>
            </div>
         </div>
</asp:Content>
