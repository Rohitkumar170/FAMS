<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="FAMS.master.customer" %>

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
    <script src="../JavaScript/Customer.js"></script>
  
       <script>
$(document).ready(function(){
  $("#btnNew").click(function(){
      $(".boxrow").hide();
      $("#gridtable").hide();
        $(".formclientmaster").show();
  });
  $("#Btnback").click(function(){
      $(".boxrow").show();
        $("#gridtable").show();
       $(".formclientmaster").hide();
  });
});
</script>

    <script>
        $(document).ready(function () {

            $(".set > a").on("click", function () {     

                if ($(this).hasClass("active")) {
                    $(this).removeClass("active");
                    $(this)
                        .siblings(".content")
                        .slideUp(200);
                    $(".set > a i")
                        .removeClass("fa-minus")
                        .addClass("fa-plus");
                } else {
                    $(".set > a i")
                        .removeClass("fa-minus")
                        .addClass("fa-plus");
                    $(this)
                        .find("i")
                        .removeClass("fa-plus")
                        .addClass("fa-minus");
                    $(".set > a").removeClass("active");
                    $(this).addClass("active");
                    $(".content").slideUp(500);
                    $(this)
                        .siblings(".content")
                        .slideDown(500);
                }
            });



        });



    </script>
    <style>
        #firstone {
        height:151px;}
        #btnproceed {
            position: absolute;
    top: 100px;
    right:13px;
        }

        .btnprocced {
            position: absolute;
    right: 30px;
    background: #20333f;
    color: #fff;
    font-size: 12px;
        }
        .addressScroll {
        overflow:auto; max-height:300px; margin-top:10px}
        .btnconinsideBtn {
            background-color: #0a2e40;
    color: #fff;
    font-size:12px;
        }


        .addresslinebox {
            background-color: #c5c5c5;
            margin-top: 11px;
                border-radius: 4px;
        }
       .addaddress {
             background: #c5c5c530;
    /*padding: 13px 0px 13px 9px;*/
  
    border-radius: 4px;
    border: 1px solid #c5c5c5;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">

                <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                      Customer
                    </div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                        <div class="btnpannel">
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target=""><i class="fa fa-plus-square" aria-hidden="true"></i> New</button>

                            <button type="button" class="btn btn-sm btnconinsideBtn" id="Btnback" style='display: inline-block' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button>
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
                       <table class="bankmasterTable" id="gridtable" >
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
                                   <tr>
                                        <td style="width:60px">
                                          <input type="checkbox" id="">
                                        </td>
                                        <td style="width:60px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:60px">
                                            Under Progress
                                        </td>
                                        
                                    </tr>
                                   
                                </table>
                   

                        <div class="formclientmaster scrollbar" style="display:none;">
                           
                    <div class="set">
                        <a href="#">Customer Details <i class="fa fa-plus"></i></a>
                        <div class="content" id="firstone">
                            <div class="bussinesscontent ">
                                 <div class=" col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            
<label class="col-md-12 col-sm-4 col-xs-4 p-0">Customer Code:</label> 
                                                <input type="text" class="col-md-12 col-xs-7 col-sm-7" id="txtcustcode" onkeypress="RemoveValidation()" />

                                        

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                          
<label class="col-md-12 col-sm-4 col-xs-4 p-0">Customer Name:</label>
                                                <input type="text" id="txtcustname" onkeypress="RemoveValidation()" class="col-md-12 col-xs-7 col-sm-7" />

                                          

                                        </div>
                                    </div>
                                       <%--<div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Customer Type:</label>
                                               
                                                <div class="col-md-7 col-xs-7 col-sm-7 p-0">
                                                <input type="text"  id ="ddlcusttype" class=" col-md-12 col-sm-12 col-xs-12 p-0"/>
                                                    </div>

                                            </div>

                                        </div>
                                    </div>--%>
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                          
<label class="col-md-12 col-sm-4 col-xs-4 p-0">Description:</label>
                                               
                                                <input type="text" id="txtdesc"  onkeypress="RemoveValidation()" class="col-md-12 col-xs-7 col-sm-7"/>
                                           

                                        </div>
                                    </div>

                                </div>

                                         <div class="row">
                                    
                                      
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                          
<label class="col-md-12 col-sm-4 col-xs-4 p-0">Customer Representative:</label>
                                               <%-- <select class="col-md-7 col-xs-7 col-sm-7 dropdown">
                                                    <option>1 </option>

                                                </select>--%>
                                                  <div class="col-md-12 col-xs-7 col-sm-7 p-0 kendobox">
                                                <input type="text" id="ddlcustRep" class=" col-md-12 col-sm-12 col-xs-12 p-0 kendobox"/>
                                                     
                                            </div>

                                        </div>
                                    </div>


                                </div>


                                    
                                        <button type="button" id="btnproceed" class="btn btn-sm btnconinsideBtn  pull-right btnprocced" id=""> Proceed</button>
                                        
                                     </div>

                            </div>
                        </div>
                    </div>


                              <div class="set">
                        <a href="#">Location <i class="fa fa-plus"></i></a>
                        <div class="content">
                            <div class="bussinesscontent ">
                              
                                 <div class=" col-md-12 col-sm-12 col-xs-12  ">
                                   
                               <button type="button" class="btn btn-sm btnconinsideBtn" id="btnaddaddress"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Address</button>
  <div class="addressScroll scrollbar" id="AddressDiv">
                                    <%--   <div class=" col-md-12 col-sm-12 col-xs-12 addaddress mt-0" >
                                     <div class="row">
                                    <div class="col-md-12 col-xs-12 col-sm-12 " style="border-bottom: 1px solid #c5c5c5;">
                                    <label style="width: 98%; font-size: 14px;">Address 1</label>
                                    </div>
                                    </div>
                                                <div class="row" style=" margin-top: 13px;">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 1:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    
                                            </div>

                                        </div>
                                    </div>
                                      
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 2:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    

                                            </div>

                                        </div>
                                    </div>

                                                 <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">PinCode:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                       <div class="row" >
                                      <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">State :</label>
        <input type="text" id='ddlstate_'class=" col-md-7 col-sm-7 col-xs-7"/>  

                                            </div>

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">City :</label>
        <input type="text" id='ddlcity_'class=" col-md-7 col-sm-7 col-xs-7"/>  

                                            </div>

                                        </div>
                                    </div> </div>
                                     </div>--%>
                                     
      
                                      <%-- <div class=" col-md-12 col-sm-12 col-xs-12 addaddress">
                                        


                                          

                                <div class="row">
                                    <div class="col-md-12 col-xs-12 col-sm-12 " style="border-bottom: 1px solid #c5c5c5;">
                                    <label style="width: 98%; font-size: 14px;">Address 2</label>
                                       <label>X</label>
                                    </div>
                                    </div>
                                           <div class="row" style=" margin-top: 13px;">
                                 
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Country:</label>
        <select class=" col-md-7 col-sm-7 col-xs-7">
            <option>India</option>
        </select>                                      


                                            </div>

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Location Name:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>  

                                            </div>

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Location Code:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>  
                                            </div>

                                        </div>
                                    </div>


                                </div>

                                         <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 1:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    
                                            </div>

                                        </div>
                                    </div>
                                      
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 2:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    

                                            </div>

                                        </div>
                                    </div>

                                                 <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">P.O.Box:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                           
                                         <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">City:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    
                                            </div>

                                        </div>
                                    </div>
                                      
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Zip Code:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    

                                            </div>

                                        </div>
                                    </div>

                                                 <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Atoll:</label>
        <input type="text" class=" col-md-7 col-sm-7 col-xs-7"/>    

                                            </div>

                                        </div>
                                    </div>

                                </div>
                                     </div>--%>
      </div>


                                       


                                  
                             

                                        
                                     </div>

                            </div>
                        </div>
                    </div>
                            
                                             <%--   <div class="set">
                        <a href="#">Legal/Tax <i class="fa fa-plus"></i></a>
                        <div class="content">
                            <div class="bussinesscontent ">
                                 <div class=" col-md-12 col-sm-12 col-xs-12">
               <table class="bankmasterTable" id="entitygrid" >
                                <thead>
                                    <tr>
                                     <th style="width:60px">
                                            All
                                        </th>
                                        <th style="width:160px">
                                            Country
                                        </th>
                                        <th style="width:160px">
                                            Tax
                                        </th>
                                        <th style="width:160px">
                                            Address
                                        </th>
                                          <th style="width:160px">
                                           Input Value
                                        </th>
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                    </tbody>
                                   <tr>
                                        <td style="width:60px">
                                         <input type="checkbox" />
                                        </td>
                                        <td style="width:160px">
                                          <select class="dropdown"><option>GSTIN.No</option></select>
                                        </td>
                                        <td style="width:160px">
                                          <select class="dropdown"><option>GSTIN.No</option></select>
                                        </td>
                                        <td style="width:160px">
                                          <select class="dropdown"><option>GSTIN.No</option></select>
                                        </td>
                                       <td style="width:160px">
                                           <input type="text"  placeholder="mm/dd/yy" id="txtdateinput"/>
                                        </td>
                                    </tr>
                            
                                </table>


                               
                                     </div>

                            </div>
                        </div>
                    </div>--%>
                          
</div>

<label id="lblUserId" runat="server" style="display: none"> </label>

                </div>
            </div>
        </div>
 </div>
   
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/date-pickers.min.js"></script>
    <script src="../Assets/js/jquery-ui.min.js"></script>

       <script>
           $(function () {
               $("#txtdateinput").datepicker();

           });
  </script>
</asp:Content>
