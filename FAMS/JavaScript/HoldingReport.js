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
    var CustomerAccount = '';
    //$('#ContentPlaceHolder1_lblFromDate').text($('#fromdate').val());
    //$('#ContentPlaceHolder1_lblToDate').text($('#fromdate').val());
    if ($('#ContentPlaceHolder1_CustAcc').val() == 'Cust_000134') {
        CustomerAccount = $('#ddlCustomer option:selected').val();
    }
    else {
        CustomerAccount = $('#SPAccountNo').text();
    }
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
                    var markup=''
                    if (parseFloat(jsonData.Table[i].GainLoss) >= 0) {
                        markup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'class='profit'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'class='profit'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";
                    }
                    else {
                        markup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'class='loss'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'class='loss'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";

                    }
                    TotalCost = parseFloat(TotalCost) + parseFloat(jsonData.Table[i].Cost);
                    TotalMarketValue = parseFloat(TotalMarketValue) + parseFloat(jsonData.Table[i].MarketValue);
                    TotalGainLoss = parseFloat(TotalGainLoss) + parseFloat(jsonData.Table[i].GainLoss);
                    TotalGLPerc = parseFloat(TotalGLPerc) + parseFloat(jsonData.Table[i].GainLossPer);
                    TotalAssets = parseFloat(TotalAssets) + parseFloat(jsonData.Table[i].Assets);
                    $("#tblholdingreport  tbody").append(markup);

                }
                else {
                    var CashMarkup=''
                    if (parseFloat(jsonData.Table[i].GainLoss) >= 0) {
                        CashMarkup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'class='profit'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'class='profit'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";
                    }
                    else {
                        CashMarkup = "<tr><td style='width: 320px'> " + jsonData.Table[i].Security + "</td> <td style='width: 100px'>" + jsonData.Table[i].Quantity + "</td><td style='width: 150px'>" + jsonData.Table[i].UnitCost + "</td><td style='width: 150px'>" + jsonData.Table[i].Cost + "</td><td style='width: 150px'>" + jsonData.Table[i].Price + "</td><td style='width: 150px'>" + jsonData.Table[i].MarketValue + "</td><td style='width: 100px'class='loss'>" + jsonData.Table[i].GainLoss + "</td><td style='width: 100px'class='loss'>" + jsonData.Table[i].GainLossPer + "</td><td style='width: 100px'>" + jsonData.Table[i].Assets + "</td> </tr >";
                    }
                    CashTotalCost = parseFloat(CashTotalCost) + parseFloat(jsonData.Table[i].Cost);
                    CashTotalMarketValue = parseFloat(CashTotalMarketValue) + parseFloat(jsonData.Table[i].MarketValue);
                    CashTotalGainLoss = parseFloat(CashTotalGainLoss) + parseFloat(jsonData.Table[i].GainLoss);
                    CashTotalGLPerc = parseFloat(CashTotalGLPerc) + parseFloat(jsonData.Table[i].GainLossPer);
                    CashTotalAssets = parseFloat(CashTotalAssets) + parseFloat(jsonData.Table[i].Assets);
                    $("#tblCash  tbody").append(CashMarkup);

                }
                i++;
            });
            var FootMarkup = ''
            if (parseFloat(TotalGainLoss) >= 0) {
                FootMarkup = "<tr><td style='width: 275px'>Total</td> <td style='width: 78px' ></td><td style='width: 170px' class='price'></td><td style='width: 135px'class='price'>" + TotalCost.toFixed(2) + "</td><td style='width: 145px' class='price'></td><td style='width: 150px' class='price'>" + TotalMarketValue.toFixed(2) + "</td><td style='width: 92px' class='profit'>" + TotalGainLoss.toFixed(2) + "</td><td style='width: 93px' class='profit'>" + TotalGLPerc.toFixed(2) + "%</td><td style='width: 94px'>" + TotalAssets.toFixed(2) + "%</td> </tr >";
            }
            else {
                FootMarkup = "<tr><td style='width: 275px'>Total</td> <td style='width: 78px' ></td><td style='width: 170px' class='price'></td><td style='width: 135px'class='price'>" + TotalCost.toFixed(2) + "</td><td style='width: 145px' class='price'></td><td style='width: 10px' class='price'>" + TotalMarketValue.toFixed(2) + "</td><td style='width: 92px' class='loss'>" + TotalGainLoss.toFixed(2) + "</td><td style='width: 93px' class='loss'>" + TotalGLPerc.toFixed(2) + "%</td><td style='width: 94px'>" + TotalAssets.toFixed(2) + "%</td> </tr >";
            }
            $("#tblholdingreport  tfoot").append(FootMarkup);
            var FootCashMarkup = ''
            if (CashTotalGainLoss >= 0) {
                FootCashMarkup = "<tr><td style='width: 257px'>Total</td> <td style='width: 78px' ></td><td style='width: 194px' class='price'></td><td style='width: 135px'class='price'>" + CashTotalCost.toFixed(2) + "</td><td style='width: 145px' class='price'></td><td style='width: 140px' class='price'>" + CashTotalMarketValue.toFixed(2) + "</td><td style='width: 92px' class='profit'>" + CashTotalGainLoss.toFixed(2) + "</td><td style='width: 93px' class='profit'>" + CashTotalGLPerc.toFixed(2) + "%</td><td style='width: 94px'>" + CashTotalAssets.toFixed(2) + "%</td> </tr >";
            }
            else {
                FootCashMarkup = "<tr><td style='width: 257px'>Total</td> <td style='width: 78px' ></td><td style='width: 194px' class='price'></td><td style='width: 135px'class='price'>" + CashTotalCost.toFixed(2) + "</td><td style='width: 145px' class='price'></td><td style='width: 140px' class='price'>" + CashTotalMarketValue.toFixed(2) + "</td><td style='width: 92px' class='loss'>" + CashTotalGainLoss.toFixed(2) + "</td><td style='width: 93px' class='loss'>" + CashTotalGLPerc.toFixed(2) + "%</td><td style='width: 94px'>" + CashTotalAssets.toFixed(2) + "%</td> </tr >";
            }
            $("#tblCash  tfoot").append(FootCashMarkup);
            $('#holdingreportGridTable #MaintblTfoot').append("<tr><td style='width: 320px'>Total</td> <td style='width: 100px' ></td><td style='width: 253px' class='price'></td><td style='width: 100px'class='price'>" + (TotalCost + CashTotalCost).toFixed(2) + "</td><td style='width: 242px' class='price'></td><td style='width: 130px' class='price'>" + (TotalMarketValue + CashTotalMarketValue).toFixed(2) + "</td><td style='width: 141px;text-align: center;' class='profit'>" + (TotalGainLoss + CashTotalGainLoss).toFixed(2) + "</td><td style='width: 110px;' class='profit'>" + (TotalGLPerc + CashTotalGLPerc).toFixed(2) + "%</td><td style='width: 94px;'>" + (TotalAssets + CashTotalAssets).toFixed(2) + "%</td> </tr >")
            $('#Equity').css("display", "block")
            $('#Cash').css("display", "block")

        }
    });



}