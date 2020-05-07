<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="PMSEmployees.aspx.cs" Inherits="FAMS.master.PMSEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
     <script type="text/javascript">
    $(function () {
        $("table tr").dblclick(function () {
            $("#pmsEmployeesDetail").modal("show");
        }); 
        $("#PMSDetailTable tr").dblclick(function () {
             window.location = '../master/allCustomers.aspx';
   
            
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
                    PMS Employees</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target="#pmsEmployeesDetail"><i class="fa fa-plus-square" aria-hidden="true"></i> New</button> 
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
    
                                
                       
                            <input type="text" class="col-md-12 col-sm-12 col-xs-12 round" placeholder="Search" autocomplete="off" />
                            <div class="faiconsarch">
                                <i class="fa fa-search"></i>
                            </div>
                            
                       </div>
</div>
</div>
                       <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                        
                                     <th style="width:50px">
                                         <input type="checkbox" id="chkAll"> All
                                        </th>
                                       <th style="width:50px">
                                             Sr No.
                                        </th>
                                        <th style="width:150px">
                                             Employee Code
                                        </th>
                                        <th style="width:150px">
                                             Employee Name
                                        </th>
                                        <th style="width:100px">
                                            Gender
                                        </th>
                                        <th style="width:150px">
                                             Qualification
                                        </th>
                                        <th style="width:200px">
                                            About
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                        <td style="width:150px">
                                           EMP01
                                        </td>
                                        <td style="width:150px">
                                            Employee 1
                                        </td>
                                        <td style="width:100px">
                                            Male
                                        </td>
                                            <td style="width:150px">
                                           Graduation
                                        </td>
                                        <td style="width:200px">
                                            5yrs experienced
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            2
                                        </td>
                                       <td style="width:150px">
                                           EMP02
                                        </td>
                                        <td style="width:150px">
                                            Employee 2
                                        </td>
                                        <td style="width:100px">
                                            Male
                                        </td>
                                            <td style="width:150px">
                                           Graduation
                                        </td>
                                        <td style="width:200px">
                                            5yrs experienced
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            3
                                        </td>
                                          <td style="width:150px">
                                           EMP03
                                        </td>
                                        <td style="width:150px">
                                            Employee 3
                                        </td>
                                        <td style="width:100px">
                                            Female
                                        </td>
                                            <td style="width:150px">
                                           Graduation
                                        </td>
                                        <td style="width:200px">
                                            5yrs experienced
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            4
                                        </td>
                                          <td style="width:150px">
                                           EMP04
                                        </td>
                                        <td style="width:150px">
                                            Employee 4
                                        </td>
                                        <td style="width:100px">
                                            Male
                                        </td>
                                            <td style="width:150px">
                                           Graduation
                                        </td>
                                        <td style="width:200px">
                                            5yrs experienced
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            5
                                        </td>
                                         <td style="width:150px">
                                           EMP05
                                        </td>
                                        <td style="width:150px">
                                            Employee 5
                                        </td>
                                        <td style="width:100px">
                                            Male
                                        </td>
                                            <td style="width:150px">
                                           Graduation
                                        </td>
                                        <td style="width:200px">
                                            5yrs experienced
                                        </td>
                                            </tr>

                                    </tbody>
                                </table>


                     </div>

</div>
            </div>
         </div>




    <div class="modal fade" id="pmsEmployeesDetail" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">PMS Employees Details</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
   

<div class="boxrow">
     <div class="col-md-12 col-sm-12 col-xs-12 ">
    <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
       
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Employee Code:</label>
             <input type="text" class="col-md-7 col-xs-12 col-sm-7 /">
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Employee Name:</label>
             <input type="text" class="col-md-7 col-xs-12 col-sm-7 /">
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Gender:</label>
  
            <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                 <option>Select Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>
       
        </div>
         </div>
         <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
       
         <label class="col-md-4 col-xs-12 col-sm-4 p-0">Qualification:</label>
             <input type="text" class="col-md-7 col-xs-12 col-sm-7 /">
               
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">About:</label>
             <input type="text" class="col-md-7 col-xs-12 col-sm-7 /">
        </div>
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
          </div>
       
        </div>
         </div>
         </div>
                          <div class="col-md-12 col-sm-12 col-xs-12 detailBox">
                                
                              <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Customer Code:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7">
           
               
        </div>
       
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Customer Name:</label>
            <input type="text" class="col-md-7 col-xs-12 col-sm-7">
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Custodian:</label>
              <select class="dropdown col-md-7 col-xs-12 col-sm-7">
                <option>CUS1</option>
                <option>CUS2</option>
                <option>CUS3</option>
                <option>CUS4</option>
                <option>CUS5</option>
            </select>
        </div>
        </div>
         </div>  
                            <div class="form-group">
          <div class="row">
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
        <label class="col-md-4 col-xs-12 col-sm-4 p-0">Inception Date:</label>
            <input type="text" id="txtdate1" class="col-md-7 col-xs-12 col-sm-7" />
           
               
        </div>
       
              <div class="col-md-4 col-xs-12 col-sm-4 pr-0">
                <label class="col-md-4 col-xs-12 col-sm-4 p-0">Emp Linking Date:</label>
              <input type="text" id="txtdate2" class="col-md-7 col-xs-12 col-sm-7" />
        </div>
        <div class="col-md-4 col-xs-12 col-sm-4">
        
        </div>
        </div>
         </div>  
                          </div>
    <button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnRemove"><i class="fa fa-trash" aria-hidden="true"></i> Remove</button> 
               <button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="btnSave"><i class="fa fa-floppy-o" aria-hidden="true"></i> Save</button> 
   
<div class="clearfix"></div>
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
         
            <div class="clearfix"></div>
      
   <table class="bankmasterTable mt-1" id="PMSDetailTable">
                                <thead>
                                    <tr>
                                        
                                     <th style="width:50px">
                                         <input type="checkbox"> All
                                        </th>
                                       <th style="width:50px">
                                             Sr No.
                                        </th>
                                        <th style="width:150px">
                                             Customer Code
                                        </th>
                                        <th style="width:150px">
                                             Customer Name
                                        </th>
                                        <th style="width:150px">
                                            Custodian
                                        </th>
                                       <th style="width:150px">
                                             Inception Date
                                        </th>
                                        <th style="width:200px">
                                            Employee Linking Date
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                        <td style="width:50px">
                                            1
                                        </td>
                                        <td style="width:150px">
                                           1001
                                        </td>
                                        <td style="width:150px">
                                            Amit
                                        </td>
                                        <td style="width:150px">
                                            CUS1
                                        </td>
                                            <td style="width:150px">
                                            09/04/2020
                                        </td>
                                            <td style="width:200px">
                                            10/04/2020
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                            <td style="width:50px">
                                            2
                                        </td>
                                        <td style="width:150px">
                                           1002
                                        </td>
                                        <td style="width:150px">
                                            Amit
                                        </td>
                                        <td style="width:150px">
                                            CUS2
                                        </td>
                                            <td style="width:150px">
                                            09/04/2020
                                        </td>
                                            <td style="width:200px">
                                            10/04/2020
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                            <td style="width:50px">
                                            3
                                        </td>
                                        <td style="width:150px">
                                           1003
                                        </td>
                                        <td style="width:150px">
                                            Amit
                                        </td>
                                        <td style="width:150px">
                                            CUS3
                                        </td>
                                            <td style="width:150px">
                                            09/04/2020
                                        </td>
                                            <td style="width:200px">
                                            10/04/2020
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                            <td style="width:50px">
                                            4
                                        </td>
                                        <td style="width:150px">
                                           1004
                                        </td>
                                        <td style="width:150px">
                                            Amit
                                        </td>
                                        <td style="width:150px">
                                            CUS4
                                        </td>
                                            <td style="width:150px">
                                            09/04/2020
                                        </td>
                                            <td style="width:200px">
                                            10/04/2020
                                        </td>
                                    </tr>
                                        <tr>
                                            <td style="width:50px">
                                         <input type="checkbox"> 
                                        </td>
                                            <td style="width:50px">
                                            5
                                        </td>
                                        <td style="width:150px">
                                           1005
                                        </td>
                                        <td style="width:150px">
                                            Amit
                                        </td>
                                        <td style="width:150px">
                                            CUS5
                                        </td>
                                            <td style="width:150px">
                                            09/04/2020
                                        </td>
                                            <td style="width:200px">
                                            10/04/2020
                                       
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
      </div> 
        
       
      </div>
      
    </div>
  
       
       
       </div> 
          <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/date-pickers.min.js"></script>
    <script src="../Assets/js/jquery-ui.min.js"></script>
     <script>
           $(function () {
               $("#txtdate1").datepicker();
                   $("#txtdate2").datepicker();

           });
  </script>
    
</asp:Content>