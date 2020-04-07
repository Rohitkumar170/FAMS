<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="designationMaster.aspx.cs" Inherits="FAMS.master.designationMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Designations</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target="#createDesignation"><i class="fa fa-plus-square aria-hidden="true"></i> New</button> 
                      <button type="button" class="btn btn-sm btnconinsideBtn" id="btnEdit"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button> 
                   
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
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" id="searchText">
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                       <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                        
                                     <th style="width:30px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                       <th style="width:30px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             Designation Code
                                        </th>
                                        <th style="width:250px">
                                            Designation Name
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                         <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            1
                                        </td>
                                        <td style="width:100px">
                                           MD
                                        </td>
                                        <td style="width:250px">
                                            Managing Director
                                        </td>
                                        
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            2
                                        </td>
                                        <td style="width:100px">
                                           CEO
                                        </td>
                                        <td style="width:250px">
                                            Chief Executive Officer
                                        </td>
                                        
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            3
                                        </td>
                                        <td style="width:100px">
                                           CFO
                                        </td>
                                        <td style="width:250px">
                                            Chief Financial Officer
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            4
                                        </td>
                                        <td style="width:100px">
                                           SE
                                        </td>
                                        <td style="width:250px">
                                            Software Engineer
                                        </td>
                                        
                                    </tr>
                                        <tr>
                                            <td style="width:30px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:30px">
                                            5
                                        </td>
                                        <td style="width:100px">
                                           AE
                                        </td>
                                        <td style="width:250px">
                                            Assistant Engineer
                                        </td>
                                        
                                    </tr>

                                    </tbody>
                                </table>

                     

                    

                     </div>

</div>
            </div>
         </div>


    <div class="modal fade" id="createDesignation" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Create Designation</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
  
   <div class="form-group">
    <div class="row">
   <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Designation Code:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
        </div>
   <div class="form-group">
          <div class="row">
        <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Designation Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
         </div>  

         <div class="pull-right mt-1">
    <button type="button" class="btn btn-default mr-1" >Create</button>
            <button type="button" class="btn btn-default " >Cancel</button>
        </div>
   
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div> 
</asp:Content>
