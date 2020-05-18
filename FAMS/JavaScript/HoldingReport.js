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
    $('#todate').val(ToDate); tblholdingreport
    //BindGrid();

    $('#btnBack').click(function () {

        window.location.href = '../master/reportsDashboard.aspx';
    }); 

    $('#btnsearch').click(function () {

        BindGrid();
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

        yesterday.setDate(yesterday.getDate() - 29)
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
    var CustomerAccount = $('#SPAccountNo').text();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/HoldingReport.asmx/GetData",
        data: "{'fromdate':'" + TxtFromDate + "','Todate':'" + TxtToDate + "','CustomerAccount':'" + CustomerAccount + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var TotalCost = 0, TotalMarketValue = 0, TotalGainLoss = 0, TotalGLPerc = 0, TotalAssets = 0
            var CashTotalCost = 0, CashTotalMarketValue = 0, CashTotalGainLoss = 0, CashTotalGLPerc = 0, CashTotalAssets = 0

            $("#tblholdingreport  tbody").empty();
            $("#tblholdingreport  tfoot").empty();
            $("#tblCash  tbody").empty();
            $("#tblCash  tfoot").empty();
            $('#holdingreportGridTable tfoot').empty();
            var i = 0;
            jQuery.each(jsonData.Table, function (rec) {
                if (jsonData.Table[i].Security != 'Cash' && jsonData.Table[i].Security != 'Birla SL Cash Plus -G') {
                    var markup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";
                    TotalCost = parseFloat(TotalCost) + parseFloat(jsonData.Table[i].Cost);
                    TotalMarketValue = parseFloat(TotalMarketValue) + parseFloat(jsonData.Table[i].MarketValue);
                    TotalGainLoss = parseFloat(TotalGainLoss) + parseFloat(jsonData.Table[i].GainLoss);
                    TotalGLPerc = parseFloat(TotalGLPerc) + parseFloat(jsonData.Table[i].GainLossPer);
                    TotalAssets = parseFloat(TotalAssets) + parseFloat(jsonData.Table[i].Assets);
                    $("#tblholdingreport  tbody").append(markup);

                }
                else {
                    var CashMarkup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";
                    CashTotalCost = parseFloat(CashTotalCost) + parseFloat(jsonData.Table[i].Cost);
                    CashTotalMarketValue = parseFloat(CashTotalMarketValue) + parseFloat(jsonData.Table[i].MarketValue);
                    CashTotalGainLoss = parseFloat(CashTotalGainLoss) + parseFloat(jsonData.Table[i].GainLoss);
                    CashTotalGLPerc = parseFloat(CashTotalGLPerc) + parseFloat(jsonData.Table[i].GainLossPer);
                    CashTotalAssets = parseFloat(CashTotalAssets) + parseFloat(jsonData.Table[i].Assets);
                    $("#tblCash  tbody").append(CashMarkup);

                }
                i++;
            });
            var FootMarkup = "<tr><td style='width: 275px'>Total</td> <td style='width: 78px' ></td><td style='width: 170px' class='price'></td><td style='width: 135px'class='price'>" + TotalCost + "</td><td style='width: 145px' class='price'></td><td style='width: 140px' class='price'>" + TotalMarketValue + "</td><td style='width: 92px' class='profit'>" + TotalGainLoss + "</td><td style='width: 93px' class='profit'>" + TotalGLPerc + "%</td><td style='width: 94px'>" + TotalAssets + "%</td> </tr >";
            $("#tblholdingreport  tfoot").append(FootMarkup);
            var FootCashMarkup = "<tr><td style='width: 257px'>Total</td> <td style='width: 78px' ></td><td style='width: 194px' class='price'></td><td style='width: 135px'class='price'>" + CashTotalCost + "</td><td style='width: 145px' class='price'></td><td style='width: 140px' class='price'>" + CashTotalMarketValue + "</td><td style='width: 92px' class='profit'>" + CashTotalGainLoss + "</td><td style='width: 93px' class='profit'>" + CashTotalGLPerc + "%</td><td style='width: 94px'>" + CashTotalAssets + "%</td> </tr >";
            $("#tblCash  tfoot").append(FootCashMarkup);
            $('#holdingreportGridTable #MaintblTfoot').append("<tr><td style='width: 320px'>Total</td> <td style='width: 100px' ></td><td style='width: 163px' class='price'></td><td style='width: 100px'class='price'>" + (TotalCost + CashTotalCost) + "</td><td style='width: 150px' class='price'></td><td style='width: 195px' class='price'>" + (TotalMarketValue + CashTotalMarketValue) + "</td><td style='width: 60px' class='profit'>" + (TotalGainLoss + CashTotalGainLoss) + "</td><td style='width: 93px;text-align: right;' class='profit'>" + (TotalGLPerc + CashTotalGLPerc) + "%</td><td style='width: 100px'>" + (TotalAssets+CashTotalAssets) + "%</td> </tr >")
            $('#Equity').css("display", "block")
            $('#Cash').css("display", "block")

        }
    });



}