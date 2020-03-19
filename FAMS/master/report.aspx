<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="FAMS.master.report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Assets/css/custom.css" rel="stylesheet" />
    <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
     <script src="../JavaScript/GetReport.js"></script>
       <style>

           .tblegridform{overflow: hidden;
 
    max-width: 100%;}

           .boxinside{
                   border: 1px solid #223642;
    background-color: #c5c5c530;
    padding: 10px 3px 10px 5px;
    border-radius: 4px;
}
           #btnseach{
                   position: absolute;
    right: 30px;
    background-color: #1e2f3a;
    color: #fff;
    font-size: 12px;
           }
</style>
     <link href="../Assets/css/bootstrap.min.css" rel="stylesheet"   type="text/css" />
    <script src="Assets/js/jquery.min.js"></script>
    <script src="JavaScript/GetReport.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">

        <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Report</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" data-toggle="modal" data-target=""><i class="fa fa-plus-square aria-hidden="true"></i> New</button> 

                       <button type="button" class="btn btn-sm btnconinsideBtn" id="Btnback" style='display:inline-block' data-toggle="modal" data-target=""><i class="fa fa-undo" aria-hidden="true"></i> Back</button> 
                         <%-- <button type="button" class="btn btn-sm btnconinsideBtn" id="Button1" data-toggle="modal" data-target="#successpop"><i class="fa fa-plus-square" aria-hidden="true"></i> savesucessfully</button> 
                           <button type="button" class="btn btn-sm btnconinsideBtn" id="Button2" data-toggle="modal" data-target="#alertpop"><i class="fa fa-plus-square" aria-hidden="true"></i> Alert </button> --%>
                       
                          </div>         
                    </div>
                </div>
                        <%--  <div class="row pl-3">

    <div class="col-md-8 pull-left">    
    <div class="pdfexport">
   <button type="button" id="btnExport" class="btn  pdfbtns" title="Export">
                            <i class="fa fa-file-excel-o"></i> </button>
                            <button type="button" id="btnPdf" class="btn  pdfbtns" title="PDF">
                            <i class="fa fa-file-pdf-o"></i> </button>
                          
                          
    </div>
    
    
    </div>
    <div class="col-md-2 pull-left">  
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
    <div class="col-md-2 pull-right ">
    
                           
    <div class="searchbox">
    
                                   <div class="dropdown">
							<div class="dropdown-menu checkboxSearch" id="">
							<div class="columnList" id="DivSearch">
							
                          
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check3" checked="">
										<label for="check3" class="coldata">All</label>
									</span>
								</div>
								<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="check4">
										<label for="check4" class="coldata">Field Name</label>
									</span>
								</div>
                            
                                	<div class="dropdown-item">
									<span class="skin skin-polaris">
										<input type="checkbox" id="Checkbox2">
										<label for="check4" class="coldata">Entity</label>
									</span>
								</div>
                                </div>
                                <div class="dropdownBottom">
                                <label class="pull-left" id="selectall">Select All</label>
                                  <label class="pull-right" id="reset">Reset</label>
                                </div>
							</div>
                            
						</div>
                        <fieldset class=" position-relative" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <input type="text" class="form-control round " placeholder="Search" autocomplete="off" id="searchText">
                            <div class="form-control-position">
                                <i class="fa fa-search"></i>
                            </div>
                            
                        </fieldset></div>
</div>
</div>--%>
                   <div class="cardinside col-md-12 col-sm-12 col-xs-12">

                       <div class="col-md-12 col-sm-12 col-xs-12 boxinside"  style="display:block">
    <form id="form1" runat="server" style="border: 1px solid #cdcdcd;padding: 9px;border-radius: 5px;background-color: #f5f5f5;">
     

         <%--<div style="margin-top: 1%;">--%>
           <%-- <div style="width:33%;display: inline-block;">--%>
                   <div class="row">
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                             <div class="row">
            <label for="cars" class="col-md-5 col-sm-5 col-xs-5">Customer Name:</label>
   
<asp:DropDownList ID="ddlcustomer" runat="server" class="col-md-6 col-sm-6 col-xs-6">
       <asp:ListItem Value="0">Select</asp:ListItem>
       <asp:ListItem Value="1">Milind  Goyal</asp:ListItem>
       <asp:ListItem Value="2">Shyam Roy</asp:ListItem>
       <asp:ListItem Value="3">Mitali Roy</asp:ListItem>
       <asp:ListItem Value="4">Raushan Raj</asp:ListItem>
     
   </asp:DropDownList>
        </div>
                             </div>
                             </div>
                        
                       
              
           <%-- <div style="width:33%;display: inline-block;">--%>

                        
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                             <div class="row">
            <label for="cars" class="col-md-5 col-sm-5 col-xs-5">Accounts:</label>
   
<asp:DropDownList ID="ddlaccounts" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlaccounts_SelectedIndexChanged" class="col-md-6 col-sm-6 col-xs-6">
   
   </asp:DropDownList>
    </div>
                             </div>
                         
               </div>
                            
             <%--<div style="width:33%;display: inline-block;">--%>

            
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                             <div class="row">
            <label for="cars" class="col-md-5 col-sm-5 col-xs-5">Accounts Sub Level:</label>
   
<asp:DropDownList ID="ddlaccountsublevel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlaccountsublevel_SelectedIndexChanged" class="col-md-6 col-sm-6 col-xs-6">
   
   </asp:DropDownList>
    
              </div>
                             </div>
                         </div>
         </div>
           <%--  <div style="width:33%;display: inline-block;margin-top: 1%;">--%>

              <div class="row">
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                              <div class="row">

            <label for="cars"  class="col-md-5 col-sm-5 col-xs-5">Accounts Sub Level:</label>
   
<asp:DropDownList ID="ddlsubcate" runat="server" class="col-md-6 col-sm-6 col-xs-6">
   
   </asp:DropDownList>
    
               </div>
                             </div>
                         </div>
           <%--  <div style="width:33%;display: inline-block;">--%>

                      
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                              <div class="row">

     <label for="fname" class="col-md-5 col-sm-5 col-xs-5">From Date:</label>
  <input type="text" id="fromdate" name="" class="col-md-6 col-sm-6 col-xs-6"/>
        </div>
                             </div>
                         </div>
                 

          <%--  <div style="width:33%;display: inline-block;">--%>
                    
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                              <div class="row">
     <label for="fname" class="col-md-5 col-sm-5 col-xs-5">To Date:</label>
  <input type="text" id="todate" name=""  class="col-md-6 col-sm-6 col-xs-6"/>
        </div>
                             </div>
        </div>
            </div>
             
                
                
        <%--    <div style="width:33%;display: none;">--%>
              <div class="row">
                     <div class="col-md-4 col-sm-4 col-xs-4">
                         <div class="form-group">
                             <div class="row">
            <label for="cars" class="col-md-5 col-sm-5 col-xs-5">Account Type:</label>
   <asp:DropDownList ID="ddlaccounttype" runat="server"  class="col-md-6 col-sm-6 col-xs-6">
       <asp:ListItem Value="0">Select</asp:ListItem>
       <asp:ListItem Value="1">Trial Balance</asp:ListItem>
       <asp:ListItem Value="2">NAV</asp:ListItem>
       <asp:ListItem Value="3">Holding Report</asp:ListItem>
       <asp:ListItem Value="4">Transaction Report</asp:ListItem>
         <asp:ListItem Value="5">Cash Equivalent</asp:ListItem>
   </asp:DropDownList>
    </div>
                             </div>
                         </div>
                    <button type="button" id="btnseach" class="pull-right btn btn-sm btnconinsideBtn">Search</button>
                 
       </div>
             
          
                <%-- <div style="width:33%;display: inline-block;">--%>
               <%-- <asp:Button ID="btnseach" runat="server" OnClick="btnseach_Click" Text="Search" />--%>
   
                 <%--     <button type="button" id="btnExcel">Excel</button>
                     <input type="hidden" name="CustomerJSON"/>
<asp:Button ID = "btnPdf" Text="PDF" runat="server" OnClientClick = "GenratePDF() " OnClick ="btnPdf_Click" />commentby tarun--%>
                     <%-- <button type="button" id="btnPdf" runat="server"  OnClick="btnPdf_Click">PDF</button>--%>
        
            </form>
        </div>

        
<div class="col-md-12 col-sm-12 col-xs-12 tblegridform scrollbar p-0">
                           
     <table class="bankmasterTable" id="entitygrid"  style="margin-top:10px;">
                               <thead>
                                   <tr>
                                       <th style="width:150px ;display:none;"></th>
                                       <th style="width:1000px"></th>
                                     <th style="width:300px"></th>
                                       <th style="width:1000px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>
                                       <th style="width:300px"></th>


                                   </tr>

                               </thead>
                                    <tbody class="scrollbar" >
                                    
                                  </tbody>
                                </table>
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
               $("#fromdate").datepicker();
                   $("#todate").datepicker();

           });
  </script>
    
</asp:Content>
