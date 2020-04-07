<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="custodian.aspx.cs" Inherits="FAMS.master.custodian" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(function () {
        $("table tr").dblclick(function () {
            $("#custodianDetail").modal("show");
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
                    Custodian</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target="#createCustodian"><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 
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
                                             Country
                                        </th>
                                        <th style="width:100px">
                                             Custodian Code
                                        </th>
                                        <th style="width:250px">
                                            Custodian Name
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
                                           IND
                                        </td>
                                        <td style="width:100px">
                                            CUS1
                                        </td>
                                        <td style="width:250px">
                                            Custodian 1
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
                                           IND
                                        </td>
                                        <td style="width:100px">
                                            CUS2
                                        </td>
                                        <td style="width:250px">
                                             Custodian 2
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
                                           IND
                                        </td>
                                        <td style="width:100px">
                                            CUS3
                                        </td>
                                        <td style="width:250px">
                                             Custodian 3
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
                                           IND
                                        </td>
                                       <td style="width:100px">
                                           CUS4
                                        </td>
                                        <td style="width:250px">
                                             Custodian 4
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
                                           IND
                                        </td>
                                        <td style="width:100px">
                                            CUS5
                                        </td>
                                        <td style="width:250px">
                                             Custodian 5
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>


                     </div>

</div>
            </div>
         </div>


    <div class="modal fade" id="createCustodian" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Create Custodian</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   <div class="form-group">
    <div class="row">
   <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Country:</label>
        </div>
        <div class="col-md-8 col-xs-12 col-sm-8">
            <select class="dropdown">
                <option>Select Country</option>
                <option>IND</option>
                <option>AUS</option>
                <option>PAK</option>
                <option>USA</option>
                <option>AFG</option>
            </select>
        <%--<input type="text" class="col-md-12 col-xs-12 col-sm-12" />--%>
        </div>
        </div>
        </div>
   <div class="form-group">
    <div class="row">
   <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian Code:</label>
        </div>
        <div class="col-md-8 col-xs-12 col-sm-8">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
        </div>
   <div class="form-group">
          <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian Name:</label>
        </div>
        <div class="col-md-8 col-xs-12 col-sm-8">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
         </div>  

         <div class="pull-right mt-1">
    <button type="button" class="btn btn-default mr-1" >Create</button>
            <button type="button" class="btn btn-default">Cancel</button>
        </div>
   
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div> 



    <div class="modal fade" id="custodianDetail" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Custodian Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   <div class="form-group">
    <div class="row">
   <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Country:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
            <label class="col-md-12 col-xs-12 col-sm-12 p-0">IND</label>
        </div>
        </div>
        </div>
   <div class="form-group">
    <div class="row">
   <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian Code:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">CUS1</label>
        </div>
        </div>
        </div>
   <div class="form-group">
          <div class="row">
        <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Custodian 1</label>
        </div>
        </div>
         </div>  
<div class="form-group">
    <div class="row">
   <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS Code:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
            <select class="dropdown">
                <option>PMS1</option>
                <option>PMS2</option>
                <option>PMS3</option>
                <option>PMS4</option>
                <option>PMS5</option>
                <option>PMS6</option>
            </select>
       
        </div>
        </div>
        </div>
   <div class="form-group">
    <div class="row">
   <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS 1</label>
        </div>
        </div>
        </div>
   <div class="form-group">
          <div class="row">
        <div class="col-md-5 col-xs-12 col-sm-5">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS Account No.:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
         </div>  

         <div class="pull-right mt-1">
    <button type="button" class="btn btn-default mr-1">Save</button>
          
        </div>
   
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div> 
</asp:Content>
