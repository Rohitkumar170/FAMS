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
    //BindGrid();

    $('#btnBack').click(function () {

        window.location.href = '../master/reportsDashboard.aspx';
    }); 
    
    $('#btnsearch').click(function () {
       
       // alert(FromDate);
        BindGrid();
    });
    $('#btnExport').click(function () {
        GetDataForExcelAndPDF();
    });


    $('#btnYesterday').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();
        const today = new window.Date()
        const yesterday = new window.Date(today)

        yesterday.setDate(yesterday.getDate() - 1)
        var YesttwoDigitMonth = ((yesterday.getMonth().length + 1) === 1) ? (yesterday.getMonth() + 1) : '0' + (yesterday.getMonth() + 1);
        var YesttwoDigitDate = ((yesterday.getDate()) >= 10) ? (yesterday.getDate()) : '0' + (yesterday.getDate());
        var LastDate = YesttwoDigitMonth + "/" + YesttwoDigitDate + "/" + yesterday.getFullYear();
        FromDate = LastDate;
        ToDate = currentDate;
        $('#fromdate').val(FromDate);
        $('#todate').val(ToDate);
        BindGrid();
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
        BindGrid();
    });
    $('#btnLast2Weeks').click(function () {
        var fullDate = new window.Date();
        var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1);
        var twoDigitDate = ((fullDate.getDate()) >= 10) ? (fullDate.getDate()) : '0' + (fullDate.getDate());
        var currentDate = twoDigitMonth + "/" + twoDigitDate + "/" + fullDate.getFullYear();



        const today = new window.Date()
        const yesterday = new window.Date(today)

        yesterday.setDate(yesterday.getDate() - 13)
        var YesttwoDigitMonth = ((yesterday.getMonth().length + 1) === 1) ? (yesterday.getMonth() + 1) : '0' + (yesterday.getMonth() + 1);
        var YesttwoDigitDate = ((yesterday.getDate()) >= 10) ? (yesterday.getDate()) : '0' + (yesterday.getDate());
        var LastDate = YesttwoDigitMonth + "/" + YesttwoDigitDate + "/" + yesterday.getFullYear();
        FromDate = LastDate;
        ToDate = currentDate;
        $('#fromdate').val(FromDate);
        $('#todate').val(ToDate);
        BindGrid();
    });


});


function BindGrid() {

    var TxtFromDate = $('#fromdate').val();
    var TxtToDate = $('#todate').val();
    $('#ContentPlaceHolder1_hdnFromDate').val(TxtFromDate);
    $('#ContentPlaceHolder1_hdnToDate').val(TxtToDate);

    //$('#ContentPlaceHolder1_lblFromDate').text($('#fromdate').val());
    //$('#ContentPlaceHolder1_lblToDate').text($('#fromdate').val());
    var CustomerAccount = "";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/SummaryReport.asmx/GetData",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            $('#OpenMarValTH').text('Market Value as of ' + jsonData.Table[0].FromDate);
            $('#OpenMarValTD').text(jsonData.Table[0].OpeningMarketValue);
            $('#OpenNAVValTH').text('Opening NAV as of ' + jsonData.Table[0].FromDate);
            $('#OpenNAVValTD').text(jsonData.Table[0].OpeningNAV);
            $('#OpenOutValTH').text('Opening Outstanding Units as of ' + jsonData.Table[0].FromDate);
            $('#OpenOutValTD').text(jsonData.Table[0].OpeningOutstandingUnits);
            $('#CapitalTD').text(jsonData.Table[0].CapitalInOut);
            $('#RelaizedTD').text(jsonData.Table[0].RealizedGain);
            $('#UnrelaizedTD').text(jsonData.Table[0].UnrealizedGain);
            $('#GainPriorTD').text(jsonData.Table[0].GainPrior);
            $('#IncomeTD').text(jsonData.Table[0].Income);
            $('#FeesTD').text(jsonData.Table[0].Fees);
            $('#ExpensesTD').text(jsonData.Table[0].Expenses);
            $('#AccuredTD').text(jsonData.Table[0].AccruedIncome);
            $('#CloseMarValTH').text('Market Value as of ' + jsonData.Table[0].ToDate);
            $('#CloseMarValTD').text(jsonData.Table[0].ClosingMarketValue);
            $('#CloseNAVValTH').text('Closing NAV as of ' + jsonData.Table[0].ToDate);
            $('#CloseNAVValTD').text(jsonData.Table[0].ClosingNAV);
            $('#CloseOutValTH').text('Closing Outstanding Units as of ' + jsonData.Table[0].ToDate);
            $('#CloseOutValTD').text(jsonData.Table[0].ClosingOutstanding);
        }
    });



}


function GetDataForExcelAndPDF() {

    var TxtFromDate = $('#fromdate').val();
    var TxtToDate = $('#todate').val();
    var CustomerAccount = "";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/SummaryReport.asmx/GetDataForExcelAndPDF",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);

           
            var csvData = this.ConvertToCSV(JSON.stringify(jsonData.Table[0]));
                var a = document.createElement("a");
                a.setAttribute('style', 'display:none;');
                document.body.appendChild(a);
                var blob = new Blob([csvData], { type: 'text/csv' });
                var url = window.URL.createObjectURL(blob);
                a.href = url;
                a.download = 'User_Results.csv';/* your file name*/
                a.click();
                return 'success';
            
           
        }
    });
}
