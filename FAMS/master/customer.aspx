<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="FAMS.master.customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Assets/css/custom.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    

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
        .addressScroll {
        overflow:auto; max-height:300px; margin-top:10px}
        #addaddress {
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
    margin-top: 7px;
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
                        <div class="formclientmaster scrollbar" style="display:block;">
                           
                    <div class="set">
                        <a href="#">Customer Details <i class="fa fa-plus"></i></a>
                        <div class="content" id="firstone">
                            <div class="bussinesscontent ">
                                 <div class=" col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Customer Code:</label>
                                                <input type="text" class="col-md-7 col-xs-7 col-sm-7" />

                                            </div>

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Customer Name:</label>
                                                <input type="text" class="col-md-7 col-xs-7 col-sm-7" />

                                            </div>

                                        </div>
                                    </div>
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Customer Type:</label>
                                                <select class="col-md-7 col-xs-7 col-sm-7 dropdown">
                                                    <option>Customer </option>

                                                </select>

                                            </div>

                                        </div>
                                    </div>


                                </div>

                                         <div class="row">
                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Description:</label>
                                               
                                                <textarea id="" rows="4" cols="50" class="col-md-7 col-xs-7 col-sm-7"></textarea>
                                            </div>

                                        </div>
                                    </div>
                                      
                                       <div class="col-md-4 col-sm-4 col-xs-4">
                                        <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Customer Representative:</label>
                                                <select class="col-md-7 col-xs-7 col-sm-7 dropdown">
                                                    <option>1 </option>

                                                </select>

                                            </div>

                                        </div>
                                    </div>


                                </div>
                                     </div>

                            </div>
                        </div>
                    </div>


                              <div class="set">
                        <a href="#">Location <i class="fa fa-plus"></i></a>
                        <div class="content">
                            <div class="bussinesscontent ">
                              
                                 <div class=" col-md-12 col-sm-12 col-xs-12  ">
                                   
                               <button type="button" class="btn btn-sm btnconinsideBtn" id="addaddress"><i class="fa fa-plus-square" aria-hidden="true"></i> Add Address</button>
  <div class="addressScroll scrollbar">
                                       <div class=" col-md-12 col-sm-12 col-xs-12 addaddress mt-0" >
                                        


                                          

                                <div class="row">
                                    <div class="col-md-12 col-xs-12 col-sm-12 " style="border-bottom: 1px solid #c5c5c5;">
                                    <label style="width: 98%; font-size: 14px;">Address 1</label>
                                        <%--<label>X</label>--%>
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
                                     </div>
                                     
                                       <div class=" col-md-12 col-sm-12 col-xs-12 addaddress">
                                        


                                          

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
                                     </div>
      </div>


                                         <%-- <div class=" col-md-4 col-sm-4 col-xs-4 addresslinebox ">
                                              
                                             

                                            <div class="row" style="border-bottom:1px solid #0a2e40">
<label class="col-md-11 col-sm-11 col-xs-11">Address Line 1</label>
        <label class=" pull-right">X</label>                                      

                                            </div>

                                                    
                                                 <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Country:</label>
        <select class=" col-md-8 col-sm-8 col-xs-8">
            <option>India</option>
        </select>                                      

                                            </div>

                                        </div>
                                               <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Location Name:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                               <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Location Code:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                             <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 1:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                                    <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Address Line 2:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                                    <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">P.O.Box</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                              <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">City:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                              <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Zip Code:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                              <div class="form-group">
                                            <div class="row">
<label class="col-md-4 col-sm-4 col-xs-4">Atoll:</label>
        <input type="text" class=" col-md-8 col-sm-8 col-xs-8"/>                                      

                                            </div>

                                        </div>
                                          
                                          </div>--%>
                                          




                                  
                             

                                        
                                     </div>

                            </div>
                        </div>
                    </div>
                            
                                                <div class="set">
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
                    </div>
                          
</div>



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
