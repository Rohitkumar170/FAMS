<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="PMSProvider.aspx.cs" Inherits="FAMS.master.PMSProvider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
    $(function () {
        $("#pmsProviderHeader table tr").dblclick(function () {
            $("#pmsProviderHeader").css('display', 'none');
            $("#pmsProviderDetail").css('display', 'block'); 
            $("#btnBack").css('display', 'block');
            $("#btnNew").css('display', 'none');
             $("#btnEdit").css('display','none');
        });

         $("#btnBack").click(function () {
            $("#pmsProviderHeader").css('display', 'block');
            $("#pmsProviderDetail").css('display', 'none'); 
            $("#btnBack").css('display', 'none');
            $("#btnNew").css('display', 'inline-block');
             $("#btnEdit").css('display','inline-block');
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
                    PMS Provider</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target="#createPMSProvider"><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 
                      <button type="button" class="btn btn-sm btnconinsideBtn" id="btnEdit"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button> 
                    <button type="button" class="btn btn-sm btnconinsideBtn" id="btnBack" style="display:none"><i class="fa fa fa-undo" aria-hidden="true" style="padding-right:2px"></i>Back</button> 
                   
                    </div>         
                    </div>
                </div>

               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12" id="pmsProviderHeader">
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
                     <div class="tableScroll">
                      <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                      <th style="width:60px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                       <th style="width:60px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             Country
                                        </th>
                                         <th style="width:100px">
                                             PMS Code
                                        </th>
                                        <th style="width:100px">
                                            Name
                                        </th>
                                        <th style="width:200px">
                                            Address
                                        </th>
                                        <th style="width:100px">
                                            GSTN
                                        </th>
                                        <th style="width:200px">
                                             Primary Contact Name
                                        </th>
                                         <th style="width:200px">
                                             Primary Contact Designation
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Email
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Phone
                                        </th>
                                        <th style="width:200px">
                                            Primary Contact Mobile
                                        </th>
                                        <th style="width:200px">
                                             Billing Contact Name
                                        </th>
                                         <th style="width:200px">
                                             Billing Contact Designation
                                        </th>
                                        <th style="width:200px">
                                           Billing Contact Email
                                        </th>
                                        <th style="width:200px">
                                            Billing Contact Phone
                                        </th>
                                        <th style="width:200px">
                                            Billing Contact Mobile
                                        </th>
                                        <th style="width:200px">
                                             System Admin Name
                                        </th>
                                         <th style="width:200px">
                                             System Admin Designation
                                        </th>
                                        <th style="width:200px">
                                           System Admin Email
                                        </th>
                                        <th style="width:200px">
                                            System Admin Phone
                                        </th>
                                        <th style="width:200px">
                                            System Admin Mobile
                                        </th>
                                       <th style="width:100px">
                                           Logo
                                        </th>
                                        <th style="width:100px">
                                            Active
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                     

                                    </tbody>
                                </table>

                    </div>

                     </div>


                 <div class="cardinside col-md-12 col-sm-12 col-xs-12" id="pmsProviderDetail" style="display:none" >
                      <div class="boxrow">
                          <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                              <div class="form-group">
          <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">TB Head Code:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">TB Head Name:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
       <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Parent:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>Select Parent</option>
                <option>Parent 1</option>
                <option>Parent 2</option>
                <option>Parent 3</option>
              
            </select>
               
        </div>
        </div>
         </div>  
<button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnSave"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 
                     

                          </div>
    <div class="col-md-8 pull-left pl-0">    
    <div class="pdfexport">
   <button type="button" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left mt-2">  
        </div>
    <div class="col-md-2 pull-right mt-2 pr-0">
    
                           
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
                                         <input type="checkbox" > All
                                        </th>
                                       <th style="width:30px">
                                             Sr No.
                                        </th>
                                        <th style="width:100px">
                                             TB Head Code
                                        </th>
                                         <th style="width:100px">
                                             TB Head Name
                                        </th>
                                        <th style="width:100px">
                                             Parent
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
                                           TB01
                                        </td>
                                        <td style="width:100px">
                                            TB Head 1
                                        </td>
                                            <td style="width:100px">
                                            Parent 5
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
                                           TB02
                                        </td>
                                        <td style="width:100px">
                                            TB Head 2
                                        </td>
                                            <td style="width:100px">
                                            Parent 4
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
                                           TB03
                                        </td>
                                        <td style="width:100px">
                                            TB Head 3
                                        </td>
                                            <td style="width:100px">
                                            Parent 3
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
                                           TB04
                                        </td>
                                        <td style="width:100px">
                                            TB Head 4
                                        </td>
                                            <td style="width:100px">
                                            Parent 1
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
                                           TB05
                                        </td>
                                        <td style="width:100px">
                                            TB Head 5
                                        </td>
                                            <td style="width:100px">
                                            Parent 2
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>

                    

                     </div>

</div>
            </div>
         </div>


    <div class="modal fade" id="createPMSProvider" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Create PMS Provider</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Country:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Country</option>
                <option>IND</option>
                <option>AUS</option>
                <option>PAK</option>
                <option>USA</option>
                <option>AFG</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">PMS Code:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Address:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">GSTN:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            

        <div class="detailsBox">

            <h6>Primary Contact Details</h6>
           <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0"> Designation:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Designation</option>
                <option>MD</option>
                <option>CEO</option>
                <option>CFO</option>
                <option>SE</option>
                <option>AE</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Phone:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>
        </div>

             <div class="detailsBox">

            <h6>Billing Contact Details</h6>
            <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0"> Designation:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Designation</option>
                <option>MD</option>
                <option>CEO</option>
                <option>CFO</option>
                <option>SE</option>
                <option>AE</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Phone:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>
        </div>

             <div class="detailsBox">

            <h6>System Admin Details</h6>
            <div class="form-group">
    <div class="row">
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Name:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0"> Designation:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
            <select class="dropdown">
                <option>Select Designation</option>
                <option>MD</option>
                <option>CEO</option>
                <option>CFO</option>
                <option>SE</option>
                <option>AE</option>
            </select>
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Email:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

            <div class="form-group">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Phone:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Mobile:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
    
        </div>
            </div>
        </div>
        </div>

        </div>


            <div class="form-group mt-2">
    <div class="row">
       
        <div class="col-md-4 col-xs-12 col-sm-4 ">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Logo:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
              <input type="file" />
    
        </div>
            </div>
        <%-- <div class="col-md-4 col-xs-12 col-sm-4">
             <div class="logoImg"></div>
             </div>--%>
        <div class="col-md-4 col-xs-12 col-sm-4">
   <div class="col-md-4 col-xs-12 col-sm-4 d-inline-block">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Active:</label>
        </div>
        <div class="col-md-7 col-xs-12 col-sm-7 d-inline-block p-0">
               <input type="checkbox" />
    
        </div>
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
