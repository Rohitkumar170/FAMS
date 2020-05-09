var FromDate = '';
var ToDate = '';

$(document).ready(function () {

    var fullDate = new window.Date();
    var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
    var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
    var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();
    FromDate = currentDate;
    ToDate = currentDate;
    $('#fromdate').val(FromDate);
    $('#todate').val(ToDate);
    BindGrid();

    $('#btnsearch').click(function () {
        
        BindGrid();
    });
    $('#btnYesterday').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();
        FromDate = currentDate;
        ToDate = currentDate;
        BindGrid();
    });
    $('#btnLastWeek').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();
        FromDate = currentDate;
        ToDate = currentDate;
        BindGrid();
    });
    $('#btnLast2Weeks').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();
        FromDate = currentDate;
        ToDate = currentDate;
        BindGrid();
    });

    //$('#btnExcel').click(function () {
    //    ExcelExport();
    //});
    //$('#btnPdf').click(function () {
    //    GenratePDF();
    //});

});

function BindGrid() {

    var TxtFromDate = $('#fromdate').val();
    var TxtToDate = $('#todate').val();
    var CustomerAccount = "";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/TransactionStatement.asmx/GetData",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            $("#transStatementTable  tbody").empty();
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr><td style ='width: 150px'> " + jsonData.Table[i].TransDescription + "</td> <td style ='width: 150px'>" + jsonData.Table[i].TransDate + "</td><td style ='width: 150px'>" + jsonData.Table[i].SettlementDate + "</td><td style ='width: 250px'>" + jsonData.Table[i].Security + "</td><td style ='width: 150px'>" + jsonData.Table[i].Exchange + "</td><td style ='width: 150px'>" + jsonData.Table[i].Quantity + "</td><td style ='width: 150px'>" + jsonData.Table[i].UnitPrice + "</td><td style ='width: 150px'>" + jsonData.Table[i].BrKg + "</td><td style ='width: 150px'>" + jsonData.Table[i].STT + "</td><td style ='width: 150px'>" + jsonData.Table[i].SettlementAmount + "</td> </tr >";
                $("#transStatementTable  tbody").append(markup);
                i++;
            });
        }
    });



}
