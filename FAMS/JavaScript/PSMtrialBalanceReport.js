var Accounts = "";
var AccountSubLayer = "";
var TotalODebit = 0;
var TotalOCredit = 0;
var TotalTDebit = 0;
var TotalTCredit = 0;
var TotalCDebit = 0;
var TotalCCredit = 0;
$(document).ready(function () {
    $('#ddlAccounts').on('change', function () {
        RemoveClass();
        $('#ddlAccSubLvl').removeClass('validate');
        var Account = $('#ddlAccounts').val();
        if (Account == "") {
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="">Select</option>');           
        }
        if (Account == "1") {
           // $("#tblAssets").css("display", "block");
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="">Select</option>');
            $('#ddlAccSubLvl').append('<option value="2">Current Assets</option>');
            $('#ddlAccSubLvl').append('<option value="5">Investment</option>');
            $('#ddlAccSubLvl').append('<option value="50">All</option>');
        }
        if (Account == "3") {
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="">Select</option>');
            $('#ddlAccSubLvl').append('<option value="1">Dividend</option>');
            $('#ddlAccSubLvl').append('<option value="2">Gain/Loss</option>');
            $('#ddlAccSubLvl').append('<option value="50">All</option>');
        }
        if (Account == "4") {
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="">Select</option>');
            $('#ddlAccSubLvl').append('<option value="1">Capital</option>');
            $('#ddlAccSubLvl').append('<option value="2">Current Liabilities</option>'); 
            $('#ddlAccSubLvl').append('<option value="2">Unrealized Gain\Loss</option>');
            $('#ddlAccSubLvl').append('<option value="50">All</option>');
        }
        if (Account == "50") {
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="50">All</option>');
        }
        if (Account == "2") {
            $('#ddlAccSubLvl').empty();
            $('#ddlAccSubLvl').append('<option value="50">All</option>');
        }
    }); 
    $('#ddlCustomer').on('change', function () {
        RemoveClass();
    });

    $('#ddlAccSubLvl').on('change', function () {
        var AccountSubLayer = $('#ddlAccSubLvl').val();
        RemoveClass();
        //if (AccountSubLayer == '2') {
        //    $("#tblInvestment").css("display", "none");
        //    $("#tblCurrentAssets").css("display", "block");      
        //}
        //if (AccountSubLayer == '5') {
        //    $("#tblCurrentAssets").css("display", "none");
        //    $("#tblInvestment").css("display", "block");
        //}
        //if (AccountSubLayer == '50') {
        //    $("#tblCurrentAssets").css("display", "block");
        //    $("#tblInvestment").css("display", "block");
        //}
    });
    $('#btnBack').click(function () {
        window.location.href = '../master/reportsDashboard.aspx';
    }); 
    $('#txtpreday').click(function () {
        var d = new Date();
        var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
        var strDate1 = (d.getDate()-1) + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
        //alert(strDate1);
        $('#fromdate').val(strDate1);
        $('#todate').val(strDate);
    }); 

    $('#btnseach').click(function () {
        if (Validation()) {
            BindGrid();
            $("#tblAssets").css("display", "none");
            $("#tblCurrentAssets").css("display", "none");
            $("#tblInvestment").css("display", "none");
            $("#tblExpense").css("display", "none");
            $("#tblIncome").css("display", "none");
            $("#tblDividend").css("display", "none");
            $("#tblGain_Loss").css("display", "none");
            $("#tblLiabilities").css("display", "none");
            $("#tblCapital").css("display", "none");
            $("#tblCurrentLiabilities").css("display", "none");
            $("#tblUnrealizedGain_Loss").css("display", "none");
            $("#tblTotal").css("display", "none");


            var Account = $('#ddlAccounts option:selected').html();
            var AccountSubLayer = $('#ddlAccSubLvl option:selected').html();
            if (AccountSubLayer == 'Current Assets' && Account == "Assets") {
                $("#tblLiabilities").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblAssets").css("display", "block");
                $("#tblInvestment").css("display", "none");
                $("#tblCurrentAssets").css("display", "block");
                $("#tblExpense").css("display", "none");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Investment' && Account == "Assets") {
                $("#tblLiabilities").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblAssets").css("display", "block");
                $("#tblCurrentAssets").css("display", "none");
                $("#tblInvestment").css("display", "block");
                $("#tblExpense").css("display", "none");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'All' && Account == "Assets") {
                $("#tblLiabilities").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblCurrentAssets").css("display", "block");
                $("#tblInvestment").css("display", "block");
                $("#tblAssets").css("display", "block");
                $("#tblExpense").css("display", "none");
                $("#tblTotal").css("display", "block");
            }
            if (Account == 'Expense') {
                $("#tblLiabilities").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Dividend' && Account == "Income") {
                $("#tblLiabilities").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblGain_Loss").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "block");
                $("#tblDividend").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Gain/Loss' && Account == "Income") {
                $("#tblLiabilities").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "block");
                $("#tblDividend").css("display", "none");
                $("#tblGain_Loss").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'All' && Account == "Income") {
                $("#tblLiabilities").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "block");
                $("#tblDividend").css("display", "block");
                $("#tblGain_Loss").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Capital' && Account == "Laibilities") {
                $("#tblUnrealizedGain_Loss").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblCurrentLiabilities").css("display", "none");
                $("#tblLiabilities").css("display", "block");
                $("#tblCapital").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Current Liabilities' && Account == "Laibilities") {
                $("#tblUnrealizedGain_Loss").css("display", "none");
                $("#tblCapital").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblLiabilities").css("display", "block");
                $("#tblCurrentLiabilities").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'Unrealized Gain\Loss' && Account == "Laibilities") {
                $("#tblCurrentLiabilities").css("display", "none");
                $("#tblCapital").css("display", "none");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblLiabilities").css("display", "block");
                $("#tblUnrealizedGain_Loss").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'All' && Account == "Laibilities") {
                $("#tblCapital").css("display", "block");
                $("#tblCurrentLiabilities").css("display", "block");
                $("#tblAssets").css("display", "none");
                $("#tblExpense").css("display", "none");
                $("#tblIncome").css("display", "none");
                $("#tblLiabilities").css("display", "block");
                $("#tblUnrealizedGain_Loss").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
            if (AccountSubLayer == 'All' && Account == "All") {
                $("#tblAssets").css("display", "block");
                $("#tblCurrentAssets").css("display", "block");
                $("#tblInvestment").css("display", "block");
                $("#tblExpense").css("display", "block");
                $("#tblIncome").css("display", "block");
                $("#tblDividend").css("display", "block");
                $("#tblGain_Loss").css("display", "block");
                $("#tblLiabilities").css("display", "block");
                $("#tblCapital").css("display", "block");
                $("#tblCurrentLiabilities").css("display", "block");
                $("#tblUnrealizedGain_Loss").css("display", "block");
                $("#tblTotal").css("display", "block");
            }
        }
    });
});

function Validation() {
   var flag = 1;
    if ($('#ddlAccounts option:selected').text() == "Select") {
        $('#ddlAccounts').addClass('validate');
        flag = 0;
    }
    if ($('#ddlCustomer option:selected').text() == "Select") {
        $('#ddlCustomer').addClass('validate');
        flag = 0;
    }
    if ($('#ddlAccSubLvl option:selected').text() == "Select") {
        $('#ddlAccSubLvl').addClass('validate');
        flag = 0;
    }
    //if ($('#TxtToDate').val() == undefined) {
    //    $('#TxtToDate').addClass('validate');
    //    flag = 0;
    //}
    //if ($('#TxtFromDate').val() == undefined) {
    //    $('#TxtFromDate').addClass('validate');
    //    flag = 0;
    //}
    return flag;
}

function RemoveClass() {
    if ($('#ddlAccounts option:selected').text() != "Select") {
        $('#ddlAccounts').removeClass('validate');
    }
    if ($('#ddlCustomer option:selected').text() != "Select") {
        $('#ddlCustomer').removeClass('validate');
    }
    if ($('#ddlAccSubLvl option:selected').text() != "Select") {
        $('#ddlAccSubLvl').removeClass('validate');
    }
    if ($('#TxtToDate').val() != undefined) {
        $('#TxtToDate').removeClass('validate');
    }
    if ($('#TxtFromDate').val() != undefined) {
        $('#TxtFromDate').removeClass('validate');
    }
}

function BindGrid() {
    var TxtFromDate = $('#fromdate').val();
    var TxtToDate = $('#todate').val();
    Accounts = $('#ddlAccounts option:selected').text();
    AccountSubLayer = $('#ddlAccSubLvl option:selected').text();
    var CustomerAccount = $('#ddlCustomer option:selected').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/PSMtrialBalanceReport.asmx/GetData",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "','Accounts':'" + Accounts + "','AccountSubLayer':'" + AccountSubLayer + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            if (Accounts == 'Assets' && AccountSubLayer == "Current Assets") {
                $('#tdCAOBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCAOBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCATransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCATransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCACBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCACBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA1OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA1OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA1TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA1TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA1CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA1CBCredit').html(jsonData.Table[8].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;
                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;
                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;
                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;
                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;
                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Assets' && AccountSubLayer == "Investment") {
                $('#tdCA2OBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCA2OBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCA2TransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCA2TransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCA2CBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCA2CBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA3OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA3OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA3TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA3TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA3CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA3CBCredit').html(jsonData.Table[8].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;
                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;
                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;
                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;
                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;
                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Assets' && AccountSubLayer == "All") {
                $('#tdCAOBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCAOBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCATransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCATransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCACBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCACBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA1OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA1OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA1TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA1TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA1CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA1CBCredit').html(jsonData.Table[8].CBCredit);

                $('#tdCA2OBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCA2OBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCA2TransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCA2TransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCA2CBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCA2CBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA3OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA3OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA3TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA3TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA3CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA3CBCredit').html(jsonData.Table[8].CBCredit);

                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;

                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;
                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;

                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;
                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;

                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;
                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;

                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;
                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;

                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;
                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;

                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;
                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;

                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Expense' && AccountSubLayer == "All") {
                $('#ExpODebit').html(jsonData.Table[11].OBDebit);
                $('#ExpOCredit').html(jsonData.Table[11].OBCredit);
                $('#ExpTDebit').html(jsonData.Table[11].TransDebit);
                $('#ExpTCredit').html(jsonData.Table[11].TransCredit);
                $('#ExpCDebitS').html(jsonData.Table[11].CBDebit);
                $('#ExpCCredit').html(jsonData.Table[11].CBCredit);

                $('#Exp1ODebit').html(jsonData.Table[12].OBDebit);
                $('#Exp1OCredit').html(jsonData.Table[12].OBCredit);
                $('#Exp1TDebit').html(jsonData.Table[12].TransDebit);
                $('#Exp1TCredit').html(jsonData.Table[12].TransCredit);
                $('#Exp1CDebitS').html(jsonData.Table[12].CBDebit);
                $('#Exp1CCredit').html(jsonData.Table[12].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[11].OBDebit;
                TotalODebit += jsonData.Table[12].OBDebit;
                TotalOCredit += jsonData.Table[11].OBCredit;
                TotalOCredit += jsonData.Table[12].OBCredit;
                TotalTDebit += jsonData.Table[11].TransDebit;
                TotalTDebit += jsonData.Table[12].TransDebit;
                TotalTCredit += jsonData.Table[11].TransCredit;
                TotalTCredit += jsonData.Table[12].TransCredit;
                TotalCDebit += jsonData.Table[11].CBDebit;
                TotalCDebit += jsonData.Table[12].CBDebit;
                TotalCCredit   += jsonData.Table[11].CBCredit;
                TotalCCredit += jsonData.Table[12].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Income' && AccountSubLayer == "Dividend") {
                $('#InODebit').html(jsonData.Table[14].OBDebit);
                $('#InOCredit').html(jsonData.Table[14].OBCredit);
                $('#InTDebit').html(jsonData.Table[14].TransDebit);
                $('#InTCredit').html(jsonData.Table[14].TransCredit);
                $('#InCDebit').html(jsonData.Table[14].CBDebit);
                $('#InCCredit').html(jsonData.Table[14].CBCredit);

                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[14].OBDebit;             
                TotalOCredit += jsonData.Table[14].OBCredit;                
                TotalTDebit += jsonData.Table[14].TransDebit;                
                TotalTCredit += jsonData.Table[14].TransCredit;               
                TotalCDebit += jsonData.Table[14].CBDebit;               
                TotalCCredit += jsonData.Table[14].CBCredit;
               
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Income' && AccountSubLayer == "Gain/Loss") {
                $('#In1ODebit').html(jsonData.Table[10].OBDebit);
                $('#In1OCredit').html(jsonData.Table[10].OBCredit);
                $('#In1TDebit').html(jsonData.Table[10].TransDebit);
                $('#In1TCredit').html(jsonData.Table[10].TransCredit);
                $('#In1CDebit').html(jsonData.Table[10].CBDebit);
                $('#In1CCredit').html(jsonData.Table[10].CBCredit);

                $('#In2ODebit').html(jsonData.Table[9].OBDebit);
                $('#In2OCredit').html(jsonData.Table[9].OBCredit);
                $('#In2TDebit').html(jsonData.Table[9].TransDebit);
                $('#In2TCredit').html(jsonData.Table[9].TransCredit);
                $('#In2CDebit').html(jsonData.Table[9].CBDebit);
                $('#In2CCredit').html(jsonData.Table[9].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[10].OBDebit;
                TotalODebit += jsonData.Table[9].OBDebit;
                TotalOCredit += jsonData.Table[10].OBCredit;
                TotalOCredit += jsonData.Table[9].OBCredit;
                TotalTDebit += jsonData.Table[10].TransDebit;
                TotalTDebit += jsonData.Table[9].TransDebit;
                TotalTCredit += jsonData.Table[10].TransCredit;
                TotalTCredit += jsonData.Table[9].TransCredit;
                TotalCDebit += jsonData.Table[10].CBDebit;
                TotalCDebit += jsonData.Table[9].CBDebit;
                TotalOCredit += jsonData.Table[10].CBCredit;
                TotalOCredit += jsonData.Table[9].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalOCredit);
            }

            if (Accounts == 'Income' && AccountSubLayer == "All") {

                $('#InODebit').html(jsonData.Table[14].OBDebit);
                $('#InOCredit').html(jsonData.Table[14].OBCredit);
                $('#InTDebit').html(jsonData.Table[14].TransDebit);
                $('#InTCredit').html(jsonData.Table[14].TransCredit);
                $('#InCDebit').html(jsonData.Table[14].CBDebit);
                $('#InCCredit').html(jsonData.Table[14].CBCredit);

                $('#In1ODebit').html(jsonData.Table[10].OBDebit);
                $('#In1OCredit').html(jsonData.Table[10].OBCredit);
                $('#In1TDebit').html(jsonData.Table[10].TransDebit);
                $('#In1TCredit').html(jsonData.Table[10].TransCredit);
                $('#In1CDebit').html(jsonData.Table[10].CBDebit);
                $('#In1CCredit').html(jsonData.Table[10].CBCredit);

                $('#In2ODebit').html(jsonData.Table[9].OBDebit);
                $('#In2OCredit').html(jsonData.Table[9].OBCredit);
                $('#In2TDebit').html(jsonData.Table[9].TransDebit);
                $('#In2TCredit').html(jsonData.Table[9].TransCredit);
                $('#In2CDebit').html(jsonData.Table[9].CBDebit);
                $('#In2CCredit').html(jsonData.Table[9].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[10].OBDebit;
                TotalODebit += jsonData.Table[9].OBDebit;
                TotalODebit += jsonData.Table[14].OBDebit;
                TotalOCredit += jsonData.Table[10].OBCredit;
                TotalOCredit += jsonData.Table[9].OBCredit;
                TotalOCredit += jsonData.Table[14].OBCredit;
                TotalTDebit += jsonData.Table[10].TransDebit;
                TotalTDebit += jsonData.Table[9].TransDebit;
                TotalTDebit += jsonData.Table[14].TransDebit;
                TotalTCredit += jsonData.Table[10].TransCredit;
                TotalTCredit += jsonData.Table[9].TransCredit;
                TotalTCredit += jsonData.Table[14].TransCredit;
                TotalCDebit += jsonData.Table[10].CBDebit;
                TotalCDebit += jsonData.Table[9].CBDebit;
                TotalCDebit += jsonData.Table[14].CBDebit;
                TotalCCredit += jsonData.Table[10].CBCredit;
                TotalCCredit += jsonData.Table[9].CBCredit;
                TotalCCredit += jsonData.Table[14].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Laibilities' && AccountSubLayer == "Capital") {
                $('#LiaODebit').html(jsonData.Table[15].OBDebit);
                $('#LiaOCredit').html(jsonData.Table[15].OBCredit);
                $('#LiaTDebit').html(jsonData.Table[15].TransDebit);
                $('#LiaTCredit').html(jsonData.Table[15].TransCredit);
                $('#LiaCDebit').html(jsonData.Table[15].CBDebit);
                $('#LiaCCredit').html(jsonData.Table[15].CBCredit);

                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[15].OBDebit;
                TotalOCredit += jsonData.Table[15].OBCredit;
                TotalTDebit += jsonData.Table[15].TransDebit;
                TotalTCredit += jsonData.Table[15].TransCredit;
                TotalCDebit += jsonData.Table[15].CBDebit;
                TotalCCredit += jsonData.Table[15].CBCredit;

                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Laibilities' && AccountSubLayer == "Current Liabilities") {

                $('#Lia1ODebit').html(jsonData.Table[19].OBDebit);
                $('#Lia1OCredit').html(jsonData.Table[19].OBCredit);
                $('#Lia1TDebit').html(jsonData.Table[19].TransDebit);
                $('#Lia1TCredit').html(jsonData.Table[19].TransCredit);
                $('#Lia1CDebit').html(jsonData.Table[19].CBDebit);
                $('#Lia1CCredit').html(jsonData.Table[19].CBCredit);

                $('#Lia2ODebit').html(jsonData.Table[11].OBDebit);
                $('#Lia2OCredit').html(jsonData.Table[11].OBCredit);
                $('#Lia2TDebit').html(jsonData.Table[11].TransDebit);
                $('#Lia2TCredit').html(jsonData.Table[11].TransCredit);
                $('#Lia2CDebit').html(jsonData.Table[11].CBDebit);
                $('#Lia2CCredit').html(jsonData.Table[11].CBCredit);

                $('#Lia3ODebit').html(jsonData.Table[20].OBDebit);
                $('#Lia3OCredit').html(jsonData.Table[20].OBCredit);
                $('#Lia3TDebit').html(jsonData.Table[20].TransDebit);
                $('#Lia3TCredit').html(jsonData.Table[20].TransCredit);
                $('#Lia3CDebit').html(jsonData.Table[20].CBDebit);
                $('#Lia3CCredit').html(jsonData.Table[20].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[19].OBDebit;
                TotalODebit += jsonData.Table[11].OBDebit;
                TotalODebit += jsonData.Table[20].OBDebit;

                TotalOCredit += jsonData.Table[19].OBCredit;
                TotalOCredit += jsonData.Table[11].OBCredit;
                TotalOCredit += jsonData.Table[20].OBCredit;

                TotalTDebit += jsonData.Table[19].TransDebit;
                TotalTDebit += jsonData.Table[11].TransDebit;
                TotalTDebit += jsonData.Table[20].TransDebit;

                TotalTCredit += jsonData.Table[19].TransCredit;
                TotalTCredit += jsonData.Table[11].TransCredit;
                TotalTCredit += jsonData.Table[20].TransCredit;

                TotalCDebit += jsonData.Table[19].CBDebit;
                TotalCDebit += jsonData.Table[11].CBDebit;
                TotalCDebit += jsonData.Table[20].CBDebit;

                TotalCCredit += jsonData.Table[19].CBCredit;
                TotalCCredit += jsonData.Table[11].CBCredit;
                TotalCCredit += jsonData.Table[20].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Laibilities' && AccountSubLayer == "Unrealized Gain\Loss") {
                $('#Lia4ODebit').html(jsonData.Table[22].OBDebit);
                $('#Lia4OCredit').html(jsonData.Table[22].OBCredit);
                $('#Lia4TDebit').html(jsonData.Table[22].TransDebit);
                $('#Lia4TCredit').html(jsonData.Table[22].TransCredit);
                $('#Lia4CDebit').html(jsonData.Table[22].CBDebit);
                $('#Lia4CCredit').html(jsonData.Table[22].CBCredit);

                $('#Lia5ODebit').html(jsonData.Table[21].OBDebit);
                $('#Lia5OCredit').html(jsonData.Table[21].OBCredit);
                $('#Lia5TDebit').html(jsonData.Table[21].TransDebit);
                $('#Lia5TCredit').html(jsonData.Table[21].TransCredit);
                $('#Lia5CDebit').html(jsonData.Table[21].CBDebit);
                $('#Lia5CCredit').html(jsonData.Table[21].CBCredit);
                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[22].OBDebit;
                TotalODebit += jsonData.Table[21].OBDebit;
                TotalOCredit += jsonData.Table[22].OBCredit;
                TotalOCredit += jsonData.Table[21].OBCredit;
                TotalTDebit += jsonData.Table[22].TransDebit;
                TotalTDebit += jsonData.Table[21].TransDebit;
                TotalTCredit += jsonData.Table[22].TransCredit;
                TotalTCredit += jsonData.Table[21].TransCredit;
                TotalCDebit += jsonData.Table[22].CBDebit;
                TotalCDebit += jsonData.Table[21].CBDebit;
                TotalCCredit += jsonData.Table[22].CBCredit;
                TotalCCredit += jsonData.Table[21].CBCredit;
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'Laibilities' && AccountSubLayer == "All") {
                $('#LiaODebit').html(jsonData.Table[15].OBDebit);
                $('#LiaOCredit').html(jsonData.Table[15].OBCredit);
                $('#LiaTDebit').html(jsonData.Table[15].TransDebit);
                $('#LiaTCredit').html(jsonData.Table[15].TransCredit);
                $('#LiaCDebit').html(jsonData.Table[15].CBDebit);
                $('#LiaCCredit').html(jsonData.Table[15].CBCredit);

                $('#Lia1ODebit').html(jsonData.Table[19].OBDebit);
                $('#Lia1OCredit').html(jsonData.Table[19].OBCredit);
                $('#Lia1TDebit').html(jsonData.Table[19].TransDebit);
                $('#Lia1TCredit').html(jsonData.Table[19].TransCredit);
                $('#Lia1CDebit').html(jsonData.Table[19].CBDebit);
                $('#Lia1CCredit').html(jsonData.Table[19].CBCredit);

                $('#Lia2ODebit').html(jsonData.Table[11].OBDebit);
                $('#Lia2OCredit').html(jsonData.Table[11].OBCredit);
                $('#Lia2TDebit').html(jsonData.Table[11].TransDebit);
                $('#Lia2TCredit').html(jsonData.Table[11].TransCredit);
                $('#Lia2CDebit').html(jsonData.Table[11].CBDebit);
                $('#Lia2CCredit').html(jsonData.Table[11].CBCredit);

                $('#Lia3ODebit').html(jsonData.Table[20].OBDebit);
                $('#Lia3OCredit').html(jsonData.Table[20].OBCredit);
                $('#Lia3TDebit').html(jsonData.Table[20].TransDebit);
                $('#Lia3TCredit').html(jsonData.Table[20].TransCredit);
                $('#Lia3CDebit').html(jsonData.Table[20].CBDebit);
                $('#Lia3CCredit').html(jsonData.Table[20].CBCredit);

                $('#Lia4ODebit').html(jsonData.Table[22].OBDebit);
                $('#Lia4OCredit').html(jsonData.Table[22].OBCredit);
                $('#Lia4TDebit').html(jsonData.Table[22].TransDebit);
                $('#Lia4TCredit').html(jsonData.Table[22].TransCredit);
                $('#Lia4CDebit').html(jsonData.Table[22].CBDebit);
                $('#Lia4CCredit').html(jsonData.Table[22].CBCredit);

                $('#Lia5ODebit').html(jsonData.Table[21].OBDebit);
                $('#Lia5OCredit').html(jsonData.Table[21].OBCredit);
                $('#Lia5TDebit').html(jsonData.Table[21].TransDebit);
                $('#Lia5TCredit').html(jsonData.Table[21].TransCredit);
                $('#Lia5CDebit').html(jsonData.Table[21].CBDebit);
                $('#Lia5CCredit').html(jsonData.Table[21].CBCredit);

                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;
                TotalODebit += jsonData.Table[15].OBDebit;
                TotalOCredit += jsonData.Table[15].OBCredit;
                TotalTDebit += jsonData.Table[15].TransDebit;
                TotalTCredit += jsonData.Table[15].TransCredit;
                TotalCDebit += jsonData.Table[15].CBDebit;
                TotalCCredit += jsonData.Table[15].CBCredit;

                TotalODebit += jsonData.Table[19].OBDebit;
                TotalODebit += jsonData.Table[11].OBDebit;
                TotalODebit += jsonData.Table[20].OBDebit;

                TotalOCredit += jsonData.Table[19].OBCredit;
                TotalOCredit += jsonData.Table[11].OBCredit;
                TotalOCredit += jsonData.Table[20].OBCredit;

                TotalTDebit += jsonData.Table[19].TransDebit;
                TotalTDebit += jsonData.Table[11].TransDebit;
                TotalTDebit += jsonData.Table[20].TransDebit;

                TotalTCredit += jsonData.Table[19].TransCredit;
                TotalTCredit += jsonData.Table[11].TransCredit;
                TotalTCredit += jsonData.Table[20].TransCredit;

                TotalCDebit += jsonData.Table[19].CBDebit;
                TotalCDebit += jsonData.Table[11].CBDebit;
                TotalCDebit += jsonData.Table[20].CBDebit;

                TotalCCredit += jsonData.Table[19].CBCredit;
                TotalCCredit += jsonData.Table[11].CBCredit;
                TotalCCredit += jsonData.Table[20].CBCredit;

                TotalODebit += jsonData.Table[22].OBDebit;
                TotalODebit += jsonData.Table[21].OBDebit;
                TotalOCredit += jsonData.Table[22].OBCredit;
                TotalOCredit += jsonData.Table[21].OBCredit;
                TotalTDebit += jsonData.Table[22].TransDebit;
                TotalTDebit += jsonData.Table[21].TransDebit;
                TotalTCredit += jsonData.Table[22].TransCredit;
                TotalTCredit += jsonData.Table[21].TransCredit;
                TotalCDebit += jsonData.Table[22].CBDebit;
                TotalCDebit += jsonData.Table[21].CBDebit;
                TotalCCredit += jsonData.Table[22].CBCredit;
                TotalCCredit += jsonData.Table[21].CBCredit;

                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }

            if (Accounts == 'All' && AccountSubLayer == "All") {
                $('#tdCAOBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCAOBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCATransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCATransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCACBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCACBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA1OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA1OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA1TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA1TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA1CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA1CBCredit').html(jsonData.Table[8].CBCredit);

                $('#tdCA2OBDebit').html(jsonData.Table[7].OBDebit);
                $('#tdCA2OBCredit').html(jsonData.Table[7].OBCredit);
                $('#tdCA2TransDebit').html(jsonData.Table[7].TransDebit);
                $('#tdCA2TransCredit').html(jsonData.Table[7].TransCredit);
                $('#tdCA2CBDebit').html(jsonData.Table[7].CBDebit);
                $('#tdCA2CBCredit').html(jsonData.Table[7].CBCredit);

                $('#tdCA3OBDebit').html(jsonData.Table[8].OBDebit);
                $('#tdCA3OBCredit').html(jsonData.Table[8].OBCredit);
                $('#tdCA3TransDebit').html(jsonData.Table[8].TransDebit);
                $('#tdCA3TransCredit').html(jsonData.Table[8].TransCredit);
                $('#tdCA3CBDebit').html(jsonData.Table[8].CBDebit);
                $('#tdCA3CBCredit').html(jsonData.Table[8].CBCredit);

                $('#ExpODebit').html(jsonData.Table[11].OBDebit);
                $('#ExpOCredit').html(jsonData.Table[11].OBCredit);
                $('#ExpTDebit').html(jsonData.Table[11].TransDebit);
                $('#ExpTCredit').html(jsonData.Table[11].TransCredit);
                $('#ExpCDebitS').html(jsonData.Table[11].CBDebit);
                $('#ExpCCredit').html(jsonData.Table[11].CBCredit);

                $('#Exp1ODebit').html(jsonData.Table[12].OBDebit);
                $('#Exp1OCredit').html(jsonData.Table[12].OBCredit);
                $('#Exp1TDebit').html(jsonData.Table[12].TransDebit);
                $('#Exp1TCredit').html(jsonData.Table[12].TransCredit);
                $('#Exp1CDebitS').html(jsonData.Table[12].CBDebit);
                $('#Exp1CCredit').html(jsonData.Table[12].CBCredit);

                $('#InODebit').html(jsonData.Table[14].OBDebit);
                $('#InOCredit').html(jsonData.Table[14].OBCredit);
                $('#InTDebit').html(jsonData.Table[14].TransDebit);
                $('#InTCredit').html(jsonData.Table[14].TransCredit);
                $('#InCDebit').html(jsonData.Table[14].CBDebit);
                $('#InCCredit').html(jsonData.Table[14].CBCredit);

                $('#In1ODebit').html(jsonData.Table[10].OBDebit);
                $('#In1OCredit').html(jsonData.Table[10].OBCredit);
                $('#In1TDebit').html(jsonData.Table[10].TransDebit);
                $('#In1TCredit').html(jsonData.Table[10].TransCredit);
                $('#In1CDebit').html(jsonData.Table[10].CBDebit);
                $('#In1CCredit').html(jsonData.Table[10].CBCredit);

                $('#In2ODebit').html(jsonData.Table[9].OBDebit);
                $('#In2OCredit').html(jsonData.Table[9].OBCredit);
                $('#In2TDebit').html(jsonData.Table[9].TransDebit);
                $('#In2TCredit').html(jsonData.Table[9].TransCredit);
                $('#In2CDebit').html(jsonData.Table[9].CBDebit);
                $('#In2CCredit').html(jsonData.Table[9].CBCredit);

                $('#LiaODebit').html(jsonData.Table[15].OBDebit);
                $('#LiaOCredit').html(jsonData.Table[15].OBCredit);
                $('#LiaTDebit').html(jsonData.Table[15].TransDebit);
                $('#LiaTCredit').html(jsonData.Table[15].TransCredit);
                $('#LiaCDebit').html(jsonData.Table[15].CBDebit);
                $('#LiaCCredit').html(jsonData.Table[15].CBCredit);

                $('#Lia1ODebit').html(jsonData.Table[19].OBDebit);
                $('#Lia1OCredit').html(jsonData.Table[19].OBCredit);
                $('#Lia1TDebit').html(jsonData.Table[19].TransDebit);
                $('#Lia1TCredit').html(jsonData.Table[19].TransCredit);
                $('#Lia1CDebit').html(jsonData.Table[19].CBDebit);
                $('#Lia1CCredit').html(jsonData.Table[19].CBCredit);

                $('#Lia2ODebit').html(jsonData.Table[11].OBDebit);
                $('#Lia2OCredit').html(jsonData.Table[11].OBCredit);
                $('#Lia2TDebit').html(jsonData.Table[11].TransDebit);
                $('#Lia2TCredit').html(jsonData.Table[11].TransCredit);
                $('#Lia2CDebit').html(jsonData.Table[11].CBDebit);
                $('#Lia2CCredit').html(jsonData.Table[11].CBCredit);

                $('#Lia3ODebit').html(jsonData.Table[20].OBDebit);
                $('#Lia3OCredit').html(jsonData.Table[20].OBCredit);
                $('#Lia3TDebit').html(jsonData.Table[20].TransDebit);
                $('#Lia3TCredit').html(jsonData.Table[20].TransCredit);
                $('#Lia3CDebit').html(jsonData.Table[20].CBDebit);
                $('#Lia3CCredit').html(jsonData.Table[20].CBCredit);

                $('#Lia4ODebit').html(jsonData.Table[22].OBDebit);
                $('#Lia4OCredit').html(jsonData.Table[22].OBCredit);
                $('#Lia4TDebit').html(jsonData.Table[22].TransDebit);
                $('#Lia4TCredit').html(jsonData.Table[22].TransCredit);
                $('#Lia4CDebit').html(jsonData.Table[22].CBDebit);
                $('#Lia4CCredit').html(jsonData.Table[22].CBCredit);

                $('#Lia5ODebit').html(jsonData.Table[21].OBDebit);
                $('#Lia5OCredit').html(jsonData.Table[21].OBCredit);
                $('#Lia5TDebit').html(jsonData.Table[21].TransDebit);
                $('#Lia5TCredit').html(jsonData.Table[21].TransCredit);
                $('#Lia5CDebit').html(jsonData.Table[21].CBDebit);
                $('#Lia5CCredit').html(jsonData.Table[21].CBCredit);


                TotalODebit = 0;
                TotalOCredit = 0;
                TotalTDebit = 0;
                TotalTCredit = 0;
                TotalCDebit = 0;
                TotalCCredit = 0;

                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;
                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;
                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;
                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;
                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;
                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;

                TotalODebit += jsonData.Table[7].OBDebit;
                TotalODebit += jsonData.Table[8].OBDebit;
                TotalOCredit += jsonData.Table[7].OBCredit;
                TotalOCredit += jsonData.Table[8].OBCredit;
                TotalTDebit += jsonData.Table[7].TransDebit;
                TotalTDebit += jsonData.Table[8].TransDebit;
                TotalTCredit += jsonData.Table[7].TransCredit;
                TotalTCredit += jsonData.Table[8].TransCredit;
                TotalCDebit += jsonData.Table[7].CBDebit;
                TotalCDebit += jsonData.Table[8].CBDebit;
                TotalCCredit += jsonData.Table[7].CBCredit;
                TotalCCredit += jsonData.Table[8].CBCredit;

                TotalODebit += jsonData.Table[11].OBDebit;
                TotalODebit += jsonData.Table[12].OBDebit;
                TotalOCredit += jsonData.Table[11].OBCredit;
                TotalOCredit += jsonData.Table[12].OBCredit;
                TotalTDebit += jsonData.Table[11].TransDebit;
                TotalTDebit += jsonData.Table[12].TransDebit;
                TotalTCredit += jsonData.Table[11].TransCredit;
                TotalTCredit += jsonData.Table[12].TransCredit;
                TotalCDebit += jsonData.Table[11].CBDebit;
                TotalCDebit += jsonData.Table[12].CBDebit;
                TotalCCredit += jsonData.Table[11].CBCredit;
                TotalCCredit += jsonData.Table[12].CBCredit;

                TotalODebit += jsonData.Table[10].OBDebit;
                TotalODebit += jsonData.Table[9].OBDebit;
                TotalODebit += jsonData.Table[14].OBDebit;
                TotalOCredit += jsonData.Table[10].OBCredit;
                TotalOCredit += jsonData.Table[9].OBCredit;
                TotalOCredit += jsonData.Table[14].OBCredit;
                TotalTDebit += jsonData.Table[10].TransDebit;
                TotalTDebit += jsonData.Table[9].TransDebit;
                TotalTDebit += jsonData.Table[14].TransDebit;
                TotalTCredit += jsonData.Table[10].TransCredit;
                TotalTCredit += jsonData.Table[9].TransCredit;
                TotalTCredit += jsonData.Table[14].TransCredit;
                TotalCDebit += jsonData.Table[10].CBDebit;
                TotalCDebit += jsonData.Table[9].CBDebit;
                TotalCDebit += jsonData.Table[14].CBDebit;
                TotalCCredit += jsonData.Table[10].CBCredit;
                TotalCCredit += jsonData.Table[9].CBCredit;
                TotalCCredit += jsonData.Table[14].CBCredit;

                TotalODebit += jsonData.Table[15].OBDebit;
                TotalOCredit += jsonData.Table[15].OBCredit;
                TotalTDebit += jsonData.Table[15].TransDebit;
                TotalTCredit += jsonData.Table[15].TransCredit;
                TotalCDebit += jsonData.Table[15].CBDebit;
                TotalCCredit += jsonData.Table[15].CBCredit;

                TotalODebit += jsonData.Table[19].OBDebit;
                TotalODebit += jsonData.Table[11].OBDebit;
                TotalODebit += jsonData.Table[20].OBDebit;

                TotalOCredit += jsonData.Table[19].OBCredit;
                TotalOCredit += jsonData.Table[11].OBCredit;
                TotalOCredit += jsonData.Table[20].OBCredit;

                TotalTDebit += jsonData.Table[19].TransDebit;
                TotalTDebit += jsonData.Table[11].TransDebit;
                TotalTDebit += jsonData.Table[20].TransDebit;

                TotalTCredit += jsonData.Table[19].TransCredit;
                TotalTCredit += jsonData.Table[11].TransCredit;
                TotalTCredit += jsonData.Table[20].TransCredit;

                TotalCDebit += jsonData.Table[19].CBDebit;
                TotalCDebit += jsonData.Table[11].CBDebit;
                TotalCDebit += jsonData.Table[20].CBDebit;

                TotalCCredit += jsonData.Table[19].CBCredit;
                TotalCCredit += jsonData.Table[11].CBCredit;
                TotalCCredit += jsonData.Table[20].CBCredit;

                TotalODebit += jsonData.Table[22].OBDebit;
                TotalODebit += jsonData.Table[21].OBDebit;
                TotalOCredit += jsonData.Table[22].OBCredit;
                TotalOCredit += jsonData.Table[21].OBCredit;
                TotalTDebit += jsonData.Table[22].TransDebit;
                TotalTDebit += jsonData.Table[21].TransDebit;
                TotalTCredit += jsonData.Table[22].TransCredit;
                TotalTCredit += jsonData.Table[21].TransCredit;
                TotalCDebit += jsonData.Table[22].CBDebit;
                TotalCDebit += jsonData.Table[21].CBDebit;
                TotalCCredit += jsonData.Table[22].CBCredit;
                TotalCCredit += jsonData.Table[21].CBCredit;

                $('#totalODebit').html(TotalODebit);
                $('#totalODebit').html(TotalODebit);
                $('#totalOCredit').html(TotalOCredit);
                $('#totalTDebit').html(TotalTDebit);
                $('#totalTCredit').html(TotalTCredit);
                $('#totalCDebit').html(TotalCDebit);
                $('#totalCCredit').html(TotalCCredit);
            }
        }
    });
}
