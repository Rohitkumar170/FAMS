var TotalODebit = 0;
var TotalOCredit = 0;
var TotalTDebit = 0;
var TotalTCredit = 0;
var TotalCDebit = 0;
var TotalCCredit = 0;

$(document).ready(function () {
    $('#btnseach').click(function () {
        BindGrid();
    });

    $('#btnBack').click(function () {
        window.location.href = '../master/reportsDashboard.aspx';
    });
    $('#btnYesterday').click(function () {
        var d = new Date();
        var strDate = d.getDate() + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
        var strDate1 = (d.getDate() - 1) + "/" + (d.getMonth() + 1) + "/" + d.getFullYear();
        //alert(strDate1);
        $('#fromdate').val(strDate1);
        $('#todate').val(strDate);
    });

    $('#btnLastWeek').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();

        const today = new window.Date()
        const yesterday = new window.Date(today)

        yesterday.setDate(yesterday.getDate() - 6)
        var YesttwoDigitMonth = ((yesterday.getMonth().length + 1) === 1) ? (yesterday.getMonth() + 1) : '0' + (yesterday.getMonth() + 1);
        var YesttwoDigitDate = ((yesterday.getDate()) >= 10) ? (yesterday.getDate()) : '0' + (yesterday.getDate());
        var LastDate = YesttwoDigitMonth + "/" + YesttwoDigitDate + "/" + yesterday.getFullYear();
        FromDate = LastDate;
        ToDate = currentDate;
        $('#fromdate').val(FromDate);
        $('#todate').val(ToDate);
        //BindGrid();
    });
    $('#btnLast2Weeks').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();



        const today = new window.Date()
        const yesterday = new window.Date(today)

        yesterday.setDate(yesterday.getDate() - 29)
        var YesttwoDigitMonth = ((yesterday.getMonth().length + 1) === 1) ? (yesterday.getMonth() + 1) : '0' + (yesterday.getMonth() + 1);
        var YesttwoDigitDate = ((yesterday.getDate()) >= 10) ? (yesterday.getDate()) : '0' + (yesterday.getDate());
        var LastDate = YesttwoDigitMonth + "/" + YesttwoDigitDate + "/" + yesterday.getFullYear();
        FromDate = LastDate;
        ToDate = currentDate;
        $('#fromdate').val(FromDate);
        $('#todate').val(ToDate);
        //BindGrid();
    });




});

function BindGrid() {
    var TxtFromDate = $('#fromdate').val();
    var TxtToDate = $('#todate').val();
    var CustomerAccount = $('#SPAccountNo').text();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/PSMtrialBalanceReport.asmx/GetData",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "','Accounts':'All','AccountSubLayer':'All'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            
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

    });
}