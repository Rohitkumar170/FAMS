<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="notesMaster.aspx.cs" Inherits="FAMS.master.notesMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assets/css/custom.css" rel="stylesheet" />
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Assets/css/style.css" rel="stylesheet" />
    <link href="../Assets/css/fontfamily.css" rel="stylesheet" />
    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script>
$(document).ready(function(){
  $("#btnNew").click(function(){
      $(".boxshow").hide();
      $("#btnNew").hide();
      $("#btnback").show();
  });
  $("#btnNew").click(function(){
    $(".formatbox").show();
    });
     $("#btnback").click(function(){
         $(".boxshow").show();
         $("#btnNew").show();
     
  });
  $("#btnback").click(function(){
      $(".formatbox").hide();
       $("#btnback").hide();
  });
});
</script>
      <style>
     input[type=checkbox], input[type=radio] {
    margin: 6px 0 0;
}
          
          .btnconinsideBtn {
              background-color: #0a2e40;
              color: #fff;
              border: none;
              border-radius: 2px;
              font-size: 11px;
              cursor: pointer;
              font-weight: bold;
              border-radius: 2px !important;
          }
        #preloader_1
        {
            position: relative;
            margin: 14% 0 0 48%;
        }
        #preloader_1 label
        {
            clear: both;
            margin-bottom: 30%;
            font-weight: bold;
        }
        #overlay
        {
            background: #fff;
            clear: both;
            overflow: hidden;
            display: block;
            width: 84%;
            height: 74%;
            z-index: 999;
            position: fixed;
            transition: opacity 500ms;
            visibility: hidden;
        }
        .umrnpopupclose
        {
            position: absolute;
            top: 1px;
            right: 1px;
            background-color: #ffffff !important;
            padding: 2px 5px 2px 5px;
            border: 4px solid #203c61;
            color: #203c61;
            border-radius: 6px;
        }
        
        
        .boxhead
        {
            background-color: #f1f2f3;
            padding: 9px 5px 5px 5px;
            border-radius: 5px;
            border: 2px solid #e6edf3;
        }
        
        
        #grdEachUMRNHistory .k-grid-content
        {
            margin-bottom: 2%;
            border:1px solid #cdcdcd;
        }
        
        .boldspan
        {
           padding-left: 6px;
    font-size: 14px;
    font-weight: bold;
            }
            
             .boldlabel
        {
                border: 1px solid;
     width: 23px;
    height: 24px;
        border-radius: 3px;
        background-color: #1f497d;
    color: #ffff;
            }
 .underspan
        {
           border-bottom: 1px solid #fff;
    margin-left: 6px;
    font-size: 14px;
    font-weight: normal;
            }
            
             .underlabel
        {
                border: 1px solid;
        width: 23px;
    height: 24px;
    margin-left: 4px;
        border-radius: 3px;
        background-color: #1f497d;
    color: #ffff;
            }
            
            
            
             .italicspan
        {
            padding-left: 6px;
    font-size: 14px;
    font-weight: normal;
            }
            
             .italiclabel
        {
                border: 1px solid;
        width: 23px;
    height: 24px;
    margin-left: 4px;
        border-radius: 3px;
        background-color: #1f497d;
    color: #ffff;
            }
            
            
         textarea {
    height: 375px !important;
}
            
            
            
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


    <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Important Notes</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    <div class="btnpannel">
                       <button type="button" class="btn btn-sm btnconinsideBtn" id="btnNew" ><i class="fa fa-plus-square aria-hidden="true"></i> New</button> 
                      <button type="button" class="btn btn-sm btnconinsideBtn" id="btnEdit"><i class="fa fa-pencil" aria-hidden="true"></i> Edit</button> 
                         <button type="button" class="btn btn-sm btnconinsideBtn" id="btnback"><i class="fa fa-reply" aria-hidden="true"></i> Back</button>
                   
                    </div>         
                    </div>
                </div>

               
                 <div class="cardinside col-md-12 col-sm-12 col-xs-12">
                     <div class="col-sm-12 col-xs-12 p-0 boxshow" style="display:block">
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
                                             Subject
                                        </th>
                                        <th style="width:250px">
                                            Notes
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
                                           Trial Report
                                        </td>
                                        <td style="width:250px">
                                            Trial Balance Report
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
                                           Summary Report
                                        </td>
                                        <td style="width:250px">
                                            Portfolio Performance Summary Report
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
                                           Holding Report
                                        </td>
                                        <td style="width:250px">
                                            Portfolio Appraisal Report
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
                                           Transaction Report
                                        </td>
                                        <td style="width:250px">
                                           Transaction Statement Report
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
                                           Cash Report
                                        </td>
                                        <td style="width:250px">
                                            Cash Equivalent Report
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                     </div>
                            <div class=" col-sm-12 col-xs-12 col-md-12 p-0 formatbox " style="display:none;margin-top: 1%;"
">
                <div class=" col-sm-12 col-xs-12 col-md-12 boxhead">
                    <div class="row pl-3">
                <div class="col-sm-12 col-xs-12 col-md-2 pl-0">
                          <label class="boldlabel">
                        <b class="boldspan">B</b>
                        </label>
                          <label class="underlabel">
                        <span class="underspan">U</span>
                        </label>
                          <label class="italiclabel">
                        <i class="italicspan">I</i>
                        </label>
                        </div>
                    <div class="col-md-2 col-sm-3 col-xs-12" style="margin-left: -7%;">
                        <div class="form-group">
                            <div class="row">
                            <label class="col-sm-5 col-md-4 col-xs-5 control-label p-0">
                               Font Size:</label>
                            <div class="col-sm-7 col-md-8 col-xs-7 no-padding">
                                <input type="text" id="" class="col-sm-12 col-md-12 col-xs-12" style="border:1px solid #9ea5a9 !important"/>
                            </div>
                                </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-sm-3 col-xs-12 no-padding-right">
                        <div class="form-group">
                             <div class="row">
                            <label class="col-sm-5 col-md-3 col-xs-5 control-label no-padding">
                               Subject:</label>
                            <div class="col-sm-7 col-md-9 col-xs-7 no-padding">
                                <input type="text" id="Text1" class="col-sm-12 col-md-12 col-xs-12"style="border:1px solid #9ea5a9 !important" />
                            </div>
                                 </div>
                        </div>
                    </div>
                     
                 </div>

                    <div class="col-md-12 col-sm-12 col-xs-12 p-0">
                    <textarea rows="500" cols="149">

</textarea>
                    
                    </div>
                    <div class="row">
                 
                         <div class="col-md-12 col-sm-12 col-xs-12">
                      <div class="btnlink">
                            <button type="button" class="btn btn-sm btnconinsideBtn" id="" ><i class="fa fa-paperclip"></i> Attachment </button>
                          <input type="file"  id="attachment"/>
                          <button type="button" class="btn btn-sm btnconinsideBtn pull-right" id=""> Cancel</button> 
                       <button type="button" class="btn btn-sm btnconinsideBtn pull-right mr-2" id="" > Save </button> 
                      
                   
                    </div>
                             </div>
                        </div>
                      
                                   

                </div>
            </div>
                     

                    

                     </div>

</div>
            </div>
         </div>


    <div class="modal fade" id="createCountry" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
         <h4 class="modal-title">Create Notes</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         
        </div>
        <div class="modal-body">
        
  
   <div class="form-group">
    <div class="row">
   <div class="col-md-3 col-xs-12 col-sm-3">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Subject:</label>
        </div>
        <div class="col-md-9 col-xs-12 col-sm-9">
        <input type="text" class="col-md-12 col-xs-12 col-sm-12" />
        </div>
        </div>
        </div>
   <div class="form-group">
          <div class="row">
        <div class="col-md-3 col-xs-12 col-sm-3">
        <label class="col-md-12 col-xs-12 col-sm-12 p-0">Notes:</label>
        </div>
        <div class="col-md-9 col-xs-12 col-sm-9">
        <textarea class="col-md-12 col-xs-12 col-sm-12"></textarea>
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
