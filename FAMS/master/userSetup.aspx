<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="userSetup.aspx.cs" Inherits="FAMS.master.userSetup" %>
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


            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>





     <script>
         $(document).ready(function () {
             $('select').selectpicker();

    $("#btnNew").click(function () {
 $("#formpart").show();
        $(".boxrow").hide();
         $("#entitygrid").hide();
        
  });
  $("#Btnback").click(function(){
      $(".boxgrid").show();
      $("#formpart").hide();
       
  });
         });








          $(document).ready(function () {
            

              $(".User").click(function () {
                 $('.customerdropdown').css("display", "none");
                  $('.formfield').css("display", "block");
                  $('.accessright').css("display", "block");
                   $('.userdropdown').css("display", "block");
  });
  $(".Administrator").click(function(){
      $('.userdropdown').css("display", "none");
      $('.customerdropdown').css("display", "none");
      $('.formfield').css("display", "block");
      $('.accessright').css("display", "none");
              });
              $(".Customer").click(function () {
                  $('.formfield').css("display", "block");
                  $('.userdropdown').css("display", "none");
                  $('.accessright').css("display", "none");
         $('.customerdropdown').css("display", "block");
  });
});
</script>


    <style>
        .reportdropdown .dropdown-toggle {
    margin-left: 4% !important;
}


        .reportdropdown .dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
  margin-left: -12% !important;
    padding: 5px 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

        .dropdown-menu ul {
                margin-left: 0% !important;
        }
        .dropdown-toggle {margin-left: -12% !important
        }

        .dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
  margin-left: -12% !important;
    padding: 5px 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}
      

        .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    width: 52% !important;
}

        .btn:active, .btn.active {
    background-image: none;
    outline: 0;
    -webkit-box-shadow: inset 0 3px 5px rgba(0,0,0,.125) !important;
    box-shadow: inset 0 3px 5px rgba(255, 255, 255, 0.125) !important;
}

        .btn-group.open .dropdown-toggle {
    -webkit-box-shadow: inset 0 3px 5px rgba(0,0,0,.125) !important;
    box-shadow: inset 0 3px 5px rgba(255, 255, 255, 0.125) !important;
}

        .dropdown-menu {position: relative !important;}
        input[type=checkbox] {
    margin: -2px 0 0;
   
}
        .btn-default:hover {
    background-color: #f5f7f7 !important;
}
        .btn-default {
    background-color: #f5f7f7 !important;
    color: #616161 !important;
    padding: 1px 8px 3px 8px !important;
    font-size: 12px !important;
    border: none;
    border-bottom: 1px solid #9e9e9e;
}
        .allbtn:hover, .allbtn:focus {
    color: #fff !important;
    text-decoration: none;
}
        .btn {
    
    border-radius: 0px !important;
}




        .dropdown-toggle::after {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: .255em;
    vertical-align: .255em;
    content: "";
    border-top: .3em solid;
    border-right: 0em solid transparent;
    border-bottom: 0;
    border-left: 0em solid transparent;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    User Setup</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn allbtn" id="btnNew" data-toggle="modal" data-target=""><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 

                       <button type="button" class="btn btn-sm btnconinsideBtn allbtn" id="Btnback" style='display:none' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button> 
                          <button type="button" class="btn btn-sm btnconinsideBtn allbtn" id="Button1" style='display:inline-block' data-toggle="modal" data-target="#successpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Save</button> 
                           <%--<button type="button" class="btn btn-sm btnconinsideBtn" id="Button2" data-toggle="modal" data-target="#alertpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Alert </button> --%>
                       
                          </div>         
                    </div>
                </div>

               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                      <div class="row boxrow">

    <div class="col-md-10 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2" style="display:none;">  
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
                                         <th style="width:60px">Sr No.</th>
                                     <th >
                                         User Name
                                        </th>
                                        <th>
                                             Email Address
                                        </th>
                                        <th>
                                            Contact No.
                                        </th>
                                        <th>
                                            Type
                                        </th>
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                          <tr>
                                        <td style="width:60px">
                                            1
                                        </td>
                                        <td >
                                           Vipul
                                        </td>
                                        <td>
                                            Vipul@gmail.com
                                        </td>
                                        <td >
                                           9990750725
                                        </td>
                                              <td>
                                         type
                                        </td>
                                    </tr>
                                    </tbody>
                                
                            
                                </table>
                     <div id="formpart" style=" display:none;">



                           <div class="col-md-12 col-sm-12 col-xs-12 insidebox p-0" >
                               <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                             
      
                  <div class="col-md-7 col-xs-12 col-sm-7 p-0"  style="display: inline-block;">
                   <label class="lblradiobtnss col-md-1 col-sm-4 col-xs-6 p-0 User">
                                                    <input name="Type" value="u" type="radio"/>
                                                    <span>User</span>
                                                </label>
                                                <label class="lblradiobtnss col-md-2 col-sm-6 col-xs-6 p-0 Administrator">
                                                    <input name="Type" value="a" type="radio"/>
                                                    <span>Administrator</span>
                                                </label>
                      <label class="lblradiobtnss col-md-2 col-sm-4 col-xs-6 p-0 Customer">
                                                    <input name="Type" value="u" type="radio"/>
                                                    <span>Customer</span>
                                                </label>
                                               
                      </div>
        
                           <div class="form-group">
                              <div class="col-md-12 col-xs-12 col-sm-4 p-0 mt-3 formfield">
                               <div class="row">
                                  
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">User ID:</label>
  <input type="text"  class="col-md-7 col-xs-12 col-sm-7"  />
               
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Email:</label>
  
              <input type="text" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4">
          <label class="col-md-4 col-xs-12 col-sm-4 p-0">Contact No.:</label>
  
              <input type="text" class="col-md-7 col-xs-12 col-sm-7" />

       </div>
                                       </div>
        </div>
                             
                               <div class="row mt-2 userdropdown">
              <div class="col-md-12 col-xs-12 col-sm-4 pr-0 mt-4">
        <label class="col-md-2 col-xs-12 col-sm-4 p-0">Company Selection:</label>
  
            <select class="selectpicker" multiple data-live-search="true" >
  <option>Company 1</option>
  <option>Company 2</option>
  <option>Company 3</option>
</select>   
        </div>
              
        </div>

                                 <div class="row mt-2 customerdropdown" style="display:none;">
              <div class="col-md-12 col-xs-12 col-sm-4 pr-0 mt-4">
        <label class="col-md-2 col-xs-12 col-sm-4 p-0">Customer Selection:</label>
  <select class="selectpicker" multiple data-live-search="true">
  <option>Customer 1</option>
  <option>Customer 2</option>
  <option>Customer 3</option>
</select>   
               
        </div>
              
        </div>
         </div>  
                         
          
                          </div>
                              
        </div>


                         <div class="row pl-3 accessright">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Access Right</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                         
                    </div>
                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12 insidebox p-0 accessright" >
                               <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              
                           <div class="form-group">
                               <div class="row">
              <div class="col-md-12 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-1 col-xs-12 col-sm-4 p-0">Master:</label>
                  <div class="col-md-10 col-xs-12 col-sm-7"  style="display: inline-block;">
                   <label class="lblradiobtnss col-md-2 col-sm-4 col-xs-6">
                                                    <input name="Type" value="u" type="checkbox"/>
                                                    <span>Create</span>
                                                </label>
                                                <label class="lblradiobtnss col-md-2 col-sm-6 col-xs-6">
                                                    <input name="Type" value="a" type="checkbox"/>
                                                    <span>Edit</span>
                                                </label>
                      <label class="lblradiobtnss col-md-2 col-sm-4 col-xs-6">
                                                    <input name="Type" value="u" type="checkbox"/>
                                                    <span>View</span>
                                                </label>
                                                <label class="lblradiobtnss col-md-2 col-sm-6 col-xs-6">
                                                    <input name="Type" value="a" type="checkbox"/>
                                                    <span>Delete</span>
                                                </label>
                      </div>
        </div>
           
        </div>
                               <div class="row mt-2">
              <div class="col-md-12 col-xs-12 col-sm-4 pr-0 reportdropdown">
        <label class="col-md-1 col-xs-12 col-sm-4 p-0">Reports:</label>
  <select class="selectpicker" multiple data-live-search="true">
  <option>Report 1</option>
  <option>Report 2</option>
  <option>Report 3</option>
</select>   
               
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
