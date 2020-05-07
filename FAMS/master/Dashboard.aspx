<%@ Page Title="" Language="C#" MasterPageFile="~/famsmaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FAMS.master.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/Assets/css/custom.css" rel="stylesheet" />
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />

    <link href="../Assets/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Assets/js/bootstrap.min.js"></script>
    <script src="../Assets/js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#range1").click(function () {
                $("#dateRange1").toggle();
            });
        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="cardbody">
        <div class="row">
            <div class="allHtmlCode col-md-12 col-sm-12 col-xs-12">


     <div class="row pl-3">
                    <div class="legal col-md-3 col-sm-3 col-xs-12">
                    Dashboard</div>
                    <div class="btncon col-md-9 col-sm-9 col-xs-12">
                    
                    </div>
                </div>
</div>
            </div>

          <div class="row">
                        <div class="col-sm-12 col-md-12 mt-1">
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading registeredMandates">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" href="#collapse0"><i class="fa fa-line-chart pr-1" aria-hidden="true">
                                            </i>Reports: </a>
                                            <%--<label class="qty">Quantity: 100</label>--%>
                                        </h4>
                                        <div class="filterBox">
                                            <label>
                                                Select:</label>
                                            <select class="filterDropdown">
                                                <option value="select">Select</option>
                                                <option value="0">Daily</option>
                                                <option value="1">Weekly</option>
                                                <option value="2">Monthly</option>
                                            </select>
                                             <i class="fa fa-calendar" aria-hidden="true" id="range1"></i>
                                        </div>
                                    </div>
                                    <div id="collapse0" class="panel-collapse in collapse show">
                                        <div class="panel-body">
                                        <div class="col-sm-12 col-md-12" id="dateRange1" style="margin-bottom:3px; display:none">
                                            <div class="row">
                                        <div class="col-sm-12 col-md-4">
                                            <label class="col-md-4 ">From Date:</label>
                                             <input type="text" id="fromdate" class="filterDropdown col-md-7" placeholder="">
                                        </div>
                                      
                                        <div class="col-sm-12 col-md-4">
                                            <label class="col-md-4 ">To Date:</label>
                                             <input type="text" id="todate" class="filterDropdown col-md-7" placeholder="">
                                        </div>
                                           </div>
                                            </div>
                                            <div id="reportGrid">
                       <table class="bankmasterTable" >
                                <thead>
                                    <tr>
                                     
                                       <th style="width:50px">
                                             Sr No.
                                        </th>
                                        <th style="width:150px">
                                             Customer Name
                                        </th>
                                        <th style="width:150px">
                                             Accounts
                                        </th>
                                        <th style="width:150px">
                                            Accounts Sub Level
                                        </th>
                                        <th style="width:150px">
                                             From Date
                                        </th>
                                        <th style="width:150px">
                                             To Date
                                        </th>
                                        <th style="width:200px">
                                            Acount Type
                                        </th>
                                       
                                    </tr>
                                    </thead>
                                    <tbody class="scrollbar" >
                                        <tr>
                                            
                                        <td style="width:50px">
                                            1
                                        </td>
                                        <td style="width:150px">
                                           Customer 1
                                        </td>
                                        <td style="width:150px">
                                            Account 1
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 1
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 1
                                        </td>
                                    </tr>
                                        <tr>
                                          
                                        <td style="width:50px">
                                            2
                                        </td>
                                       <td style="width:150px">
                                           Customer 2
                                        </td>
                                        <td style="width:150px">
                                            Account 2
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 2
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 2
                                        </td>
                                    </tr>
                                        <tr>
                                         
                                        <td style="width:50px">
                                            3
                                        </td>
                                          <td style="width:150px">
                                           Customer 3
                                        </td>
                                        <td style="width:150px">
                                            Account 3
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 3
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 3
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td style="width:50px">
                                            4
                                        </td>
                                         <td style="width:150px">
                                           Customer 4
                                        </td>
                                        <td style="width:150px">
                                            Account 4
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 4
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 4
                                        </td>
                                    </tr>
                                        <tr>
                                          
                                        <td style="width:50px">
                                            5
                                        </td>
                                      <td style="width:150px">
                                           Customer 5
                                        </td>
                                        <td style="width:150px">
                                            Account 5
                                        </td>
                                        <td style="width:150px">
                                            Sub Level 5
                                        </td>
                                            <td style="width:150px">
                                           12/04/2020
                                        </td>
                                            
                                            <td style="width:150px">
                                           13/04/2020
                                        </td>
                                        <td style="width:200px">
                                            Account Type 5
                                        </td>
                                            </tr>

                                    </tbody>
                                </table>

                     </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                         
                        </div>
                        
                    </div>
         </div>


       <script src="../Assets/js/date-pickers.min.js"></script>
    <script src="../Assets/js/jquery-ui.min.js"></script>

       <script>
           $(function () {
               $("#fromdate").datepicker();
                   $("#todate").datepicker();

           });
  </script>
</asp:Content>
