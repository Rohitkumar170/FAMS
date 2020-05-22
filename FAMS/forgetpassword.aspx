<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword.aspx.cs" Inherits="FAMS.forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>FAMS(Fund Account Managment System)</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery-1.11.3.min.js"></script>
    <%--<script src="../js/jquery_ui_1.12.1.js" type="text/javascript"></script>
    <script>        var jquery_1_12_1 = jQuery.noConflict();</script>--%>
    <link href="../Assets/css/bootstrap.min.css" rel="stylesheet" />
      <script src="../Assets/js/jquery.min.js"></script>
    <script src="../Assets/js/bootstrap.min.js"></script>
    <link href="../Assets/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="../assets/css/custom.css" rel="stylesheet" />
        <style>
        body
        {
            font-family: sans-serif !important;
            background-image: url(../Assets/image/bgimage.png); /*background-position: center;*/
            background-size: cover;
            background-repeat: no-repeat;
        }
        .loginCon
        {
            width: 400px;
            margin: 0 auto;
        }
        .form-control
        {
            font-size: 12px;
        }
        .loginContent
        {
            color: #fff;
            font-size: 12px;
            padding: 20px 0;
        }






            .

.form-control {

    font-size: 12px !important;

}
.form-control{display: block!important ;
    width: 100%!important;
    padding: .375rem .75rem !important;
    font-size: 1rem !important;
    line-height: 1.5 !important;
    color: #495057 !important;
    background-color: #fff !important;
    background-clip: padding-box !important;
    border: 1px solid #ced4da !important;
    border-radius: .25rem !important;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out !important;
        transition-property: border-color, box-shadow !important;
        transition-duration: 0.15s, 0.15s !important;
        transition-timing-function: ease-in-out, ease-in-out !important;
        transition-delay: 0s, 0s !important;
}
        .login-container
        {
            padding-top: 8%;
            padding-bottom: 8%;
        }
         .modal-header {
    background-color: #fff;
    color: #fff;
    border: 1px solid #fff;
    height: 41px;
}

         .modal-header .close {
        font-size: 22px !important;
        color: #fff !important;
        opacity: 1 !important;
        background-color: #0a2e40 !important;
        height: 31px;
        padding: 3px 9px 3px 9px !important;
        position: absolute !important;
        right: 9px !important;
        top: 8px !important;
        border-radius: 50%;
        padding-top: 0px !important;
        padding-left: 6px !important;
        padding-bottom: 5px !important;
        width: 26px;
        height: 26px;
        box-shadow: 1px 0px 0px 1px #a3b2b9;
    }

.modal-dialog {
    max-width: 390px;
    margin: 8.75rem auto;
}

.modal-header {
    background: #16222A; /* fallback for old browsers */
    background: linear-gradient(to right, #223c4a, #2b4857); /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #223c4a, #2b4857); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    color: #fff;
    border: 1px solid #fff;
    height: 41px;
}


    .modal-header .close {
        color: #051720 !important;
        background-color: #fff !important;
        font-size: 22px !important;
        opacity: 1 !important;
        height: 31px;
        padding: 2px 9px 3px 9px !important;
        position: absolute !important;
        right: 9px !important;
        top: 8px !important;
        border-radius: 50%;
        padding-top: 0px !important;
        padding-left: 6px !important;
        width: 26px;
        height: 26px;
        box-shadow: 1px 0px 0px 1px #a3b2b9;
    }




.modal-body {
}

.modal-footer {
    background-color: #051720;
    width: 100%;
    height: 41px;
    border: 1px solid #fff;
}

    .modal-footer .btn-default {
        border: none;
        background: transparent;
        color: #fff;
    }

.modal-title {
    margin-top: -9px;
    font-size: 15px;
}
    .modal-header .close {
        font-size: 22px !important;
        color: #fff !important;
        opacity: 1 !important;
        background-color: #0a2e40 !important;
        height: 31px;
        padding: 3px 9px 3px 9px !important;
        position: absolute !important;
        right: 9px !important;
        top: 8px !important;
        border-radius: 50%;
        padding-top: 0px !important;
        padding-left: 6px !important;
        padding-bottom: 5px !important;
        width: 26px;
        height: 26px;
        box-shadow: 1px 0px 0px 1px #a3b2b9;
    }

.modal-dialog {
    max-width: 390px;
    margin: 8.75rem auto;
}
        .login-form-1
        {
            padding: 3% 5% 5%;
            background: #0e616c;
            border-radius: 6px;
            background-image: linear-gradient(to right, #233B59, #282d33) !important;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }
        .login-form-1 h3
        {
            text-align: center;
            color: #fff;
            margin-bottom: 16px;
            font-size: 1.5rem;
        }
        .login-form-2
        {
            padding: 5%;
            border-radius: 10px 0 0 10px;
            background: #0e616c;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
        }
        .login-form-2 h3
        {
            text-align: center;
            color: #fff;
        }
        .login-container form
        {
            padding: 10%;
        }
        .btnSubmit
        {
            width: 50%;
            border-radius: 1rem;
            padding: 1.5%;
            border: none;
            cursor: pointer;
        }
        .login-form-1 .btnSubmit
        {
            font-weight: 600;
            color: #233b59;
            height: 35px;
            background-color: #fff !important;
        }
        
        .login-form-2 .ForgetPwd
        {
            color: #003974 !important;
            font-weight: 600;
            text-decoration: none;
        }
        .login-form-1 .ForgetPwd
        {
            color: #ffffff !important;
            font-weight: 600;
            text-decoration: underline;
            font-size: 13px;
        }
        .login-form-1 .btnSubmit:hover
        {
            background-color: #a0ebf5 !important;
            transition: .8s;
            color: #333;
            border: 1px solid #0e616c;
        }
        .login-form-1 .ForgetPwd:hover
        {
            color: #eae4e4 !important;
            transition: .8s;
        }
        .mainlogidiv
        {
            width: 75%;
            padding-top: 30px;
            margin: 0 auto;
        }
        .mainlogidiv h4
        {
            color: #fff;
        }
            .txtfams {
                       font-size: 23px;
    font-weight: bold;
    color: #fff;
}
            }
        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px)
        {
            .login-form-2, .login-form-1
            {
                margin: 0 2%;
            }
        }
    </style>
      <script type="text/javascript" language="javascript">
          $(document).ready(function () {
            var industries = $("#HdnIndustries").val();
            if (industries == "Y") {
                Showpop();
                $("#HdnIndustries").val('');
            }
        });
        function Showpop() {
            $('#mailsentpop').modal('show');
        }
         
        function Emailvalidation() {
            var re = /\S+@\S+\.\S+/;
            if (jquery_1_11_3_min("#txtRecoverEmail").val() == '') {
                alert('Please enter your email address');

                jquery_1_11_3_min("#txtRecoverEmail").focus();
                return false;
            }
            else if (!re.test(jquery_1_11_3_min("#txtRecoverEmail").val())) {
                alert('Please enter valid email address');
                jquery_1_11_3_min("#txtRecoverEmail").val('');
                return false;
            }
            else {
                //   alert('Mail send successfully');
                //   document.getElementById("txtEmail").value = '';
                return true;
            }
        }

          
        function SetDefaultValue() {
            //  sessionStorage.setItem('CheckStatus', -1);
            // alert(sessionStorage.getItem('CheckStatus'));    
        }
    </script>


</head>
<body>
    <form id="form1" runat="server">
        <input type='hidden' runat="server" id='HdnIndustries' />
        <div class="container login-container">
        <div class="row mainlogidiv">
            <div class="loginCon">
                <div class="text-center mb-2">
                <span class="txtfams">Fund Accounting Managment System</span>
               </div>
                <div class="login-form-1">
                    <h3>
                    Password Reset
                    </h3>
                    
                    <div class="form-group">
                   <%-- <input name="txtUsername" type="text" runat="server" id="txtEmail" class="form-control" placeholder="Your Email *">--%>
             <asp:TextBox ID="txtRecoverEmail" runat="server" class="form-control" placeholder="Email" onkeypress="Removemsg(); " style="height:36px;"></asp:TextBox>
                       
                    </div>
                 <%--   <div class="form-group">
                    <input name="txtpassword" type="password" id="txtpassword" class="form-control" placeholder="Password">
                       
                             
                  
                    </div>--%>
                    <div class="form-group mt-2">
                      <%--<input type="submit" name="btnLogin" value="Submit"  id="btnLogin" class="btnSubmit">--%>
     <asp:Button id="btnAgree" runat="server" Text="Agree" OnClientClick="Emailvalidation();" OnClick="btnAgree_Click"/>
                        
                    </div>
                    <div class="form-group">
                    </div>
                    <div class="form-group mt-1">
                        <a href="login.aspx" class="ForgetPwd">Back To Login</a>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>





         <div class="modal fade" id="mailsentpop" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="height: 53px;">
                  <%--  <h4 class="modal-title">Customer Create</h4>--%>
                    <div class="col-md-12" style="text-align:center">
                    <img src="../Assets/image/success-icon.png" style="width: 12%;text-align: center;margin-top: -9px;" />
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="text" style="text-align:center">
                    <label style="font-size: 13px;">Mail Sent Successfully</label>
                   </div></div>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                  <button type="button" class="col-md-3 btn btn-default closexbtn mt-1" data-dismiss="modal" id="btnUpdatePassword">OK</button>
           </div>
                </div>




            </div>

        </div>



    </div>

    </form>
</body>
</html>
