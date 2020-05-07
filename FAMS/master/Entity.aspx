<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="Entity.aspx.cs" Inherits="FAMS.master.Adminstator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>     var jquery_1_11_3_min_p = jQuery.noConflict();</script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script>        var bootstrap_min_js = jQuery.noConflict();</script>
      <link href="../Telerix/Style/kendo.default.mobile.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.common.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.rtl.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.default.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.min.css" rel="stylesheet" type="text/css" />
    <link href="../Telerix/Style/kendo.dataviz.default.min.css" rel="stylesheet" type="text/css" />
      <script src="../Telerix/js/jquery.min.js"></script>
    <script src="../Telerix/js/kendo.all.min.js"></script>
    <script src="../Telerix/js/angular.min.js"></script>
    <script src="../Telerix/js/kendo.all.min.js"></script>
    <script>        var kendo_all_min_js = jQuery.noConflict();</script>
    <script src="../Telerix/js/jquery.min.js"></script>
    <script src="../Telerix/js/jszip.min.js" type="text/javascript"></script>
    <script src="../JavaScript/Entity.js"></script>
    <script>
$(document).ready(function(){
  $("#btnNew").click(function(){
    $(".boxrow").hide();
  });
  $("#Btnback").click(function(){
    $(".boxrow").show();
  });
});
</script>

    <style>
       
        .faiconsarch {    position: absolute;
    top: 4px;
    right: 6px;
    font-size: 12px;
    color: #21343f;

        }
        .round {border-radius: 10px;
    padding: 12px;
    font-size:12px;
        }

         .gridbox {
          
            height: 150px;
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

                       <button type="button" class="btn btn-sm btnconinsideBtn" id="Btnback" style='display:none' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button> 
                         <%-- <button type="button" class="btn btn-sm btnconinsideBtn" id="Button1" data-toggle="modal" data-target="#successpop"><i class="fa fa-plus-square" aria-hidden="true"></i> savesucessfully</button> 
                           <button type="button" class="btn btn-sm btnconinsideBtn" id="Button2" data-toggle="modal" data-target="#alertpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Alert </button> --%>
                       
                          </div>         
                    </div>
                </div>

               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                      <div class="row boxrow">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2">  
        <div class="searchDropdown">
         <div class="row">
            <label class=" col-md-8 showLebel">  Show Records :</label>
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
					
     </div>  </div>
    <div class="col-md-2 pull-right mt-2 ">
    
                           
    <div class="searchbox col-md-12 col-sm-12 col-xs-12 p-0">
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round  " placeholder="Search" autocomplete="off" id="searchText">
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                       <table class="bankmasterTable" id="entitygrid" >
                                <thead>
                                    <tr>
                                         <th style="display:none"></th>
                                     <th style="width:60px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                        <th style="width:60px">
                                             Name
                                        </th>
                                        <th style="width:60px">
                                            Account Number
                                        </th>
                                      <%--  <th style="width:160px">
                                            Customer Account number
                                        </th>--%>
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                    </tbody>
                                  <%-- <tr>
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
                                    </tr>--%>
                                </table>

                     <div id="boxgrid" style=" display:none;">



                           <div class="col-md-12 col-sm-12 col-xs-12 insidebox p-0" >
                               <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              
                           <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Name:</label>
  <input type="text" id="txtname" class="col-md-7 col-xs-12 col-sm-7" onkeypress="RemoveValidation()"  />
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Account No.:</label>
  
              <input type="text" id="txtaccountno" class="col-md-7 col-xs-12 col-sm-7" onkeypress="RemoveValidation()"/>
        </div>
             
       <div class="col-md-4 col-xs-12 col-sm-4">
            <button type="button" class="btn btn-sm btnconinsideBtn pull-right" id="btnsave"> <i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 

       </div>
        </div>
         </div>  
                         
          
                          </div>
                              
        </div>



                     </div>

                     <label id="lblUserId" runat="server" style="display: none"> </label>

                     </div>

</div>
            </div>
         </div>
</asp:Content>
