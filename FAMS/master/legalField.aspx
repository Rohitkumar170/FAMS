<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="legalField.aspx.cs" Inherits="FAMS.legalField" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/Assets/css/custom.css" rel="stylesheet" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/jquery.min.js"></script>

    <script>
$(document).ready(function(){
  $("#btnNew").click(function(){
    $(".onebox").hide();
  });
  $("#btnNew").click(function(){
    $(".secondbox").show();
    });
     $("#Btnback").click(function(){
    $(".onebox").show();
    });
     $("#Btnback").click(function(){
    $(".secondbox").hide();
    });


});
</script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">

  <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                   Legal Fields</div>
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
               <div class="onebox">
                      <div class="row ">

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
                                     <th style="width:60px">
                                         All
                                        </th>
                                        <th style="width:160px">
                                           Entity Name
                                        </th>
                                        <th style="width:160px">
                                          Country Name
                                        </th>
                                        <th style="width:160px">
                                            Field Count
                                        </th>
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                    </tbody>
                                   <tr>
                                        <td style="width:60px">
                                          <input  type="checkbox" />
                                        </td>
                                        <td style="width:160px">
                                           Yoeki Softech Pvt.ltd
                                        </td>
                                        <td style="width:160px">
                                          India
                                        </td>
                                        <td style="width:160px">
                                            2
                                        </td>
                                    </tr>
                                   
                                </table>
                   </div>


                 <div class="secondbox" style="display:none">
                      <div class="row ">

    <div class="col-md-6 pull-left">    
    <div class="pdfexport">
         <button type="button" id="" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-plus"></i> </button>
         <button type="button" id="" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-trash"></i> </button>

   <button type="button" id="" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-3 pull-left mt-2">  
        <div class="searchDropdown">
         <div class="row">
            <label class=" col-md-4 showLebel">  Entity :</label>
			<select id="" class=" col-md-7  showrecords pull-right">
												<option>Select </option>
                                                <option> FAMS</option>
                                                <option>FAMS </option>
												<option>FAMS </option>
												<option>FAMS</option>
                                                <option>FAMS</option>
                                                 <option>FAMS</option>
                                                </select>
    </div>
					
     </div>  </div>
   <div class="col-md-3 pull-left mt-2">  
        <div class="searchDropdown">
         <div class="row">
            <label class=" col-md-4 showLebel">  Country :</label>
			<select id="" class=" col-md-7  showrecords pull-right">
												<option>Select </option>
                                                <option> India</option>
                                                <option>India </option>
												<option>India </option>
												<option>India</option>
                                                <option>India</option>
                                                 <option>India</option>
                                                </select>
    </div>
					
     </div>  </div>
</div>
                       <table class="bankmasterTable" id="gridsecond" >
                                <thead>
                                    <tr>
                                     <th style="width:60px">
                                         All
                                        </th>
                                        <th style="width:160px">
                                          Field Name
                                        </th>
                                        <th style="width:160px">
                                     	Priority
                                        </th>
                                      
                                     
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                    </tbody>
                                   <tr>
                                        <td style="width:60px">
                                          <input  type="checkbox" />
                                        </td>
                                        <td style="width:160px">
                                        <input type="text" />
                                        </td>
                                        <td style="width:160px">
                                             <input type="text" />
                                        </td>
                                       
                                    </tr>
                                   
                                </table>

            </div>



               </div>
               
             </div>
             </div>
    </div>

</asp:Content>
