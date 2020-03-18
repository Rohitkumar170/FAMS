
$(document).ready(function () {

    $('#btnseach').click(function () {
        GetData();
});
});
function GetData() {

    var date = new Date($('#fromdate').val());
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var fromdate = month + "/" + day + "/" + year
    //var fromdate = $("#fromdate").val();
    //var todate = $("#todate").val();
    //var fromdate ="03/12/2020"
    var date1 = new Date($('#todate').val());
    var day1 = date1.getDate();
    var month1 = date1.getMonth() + 1;
    var year1 = date1.getFullYear();
    var todate = month1 + "/" + day1 + "/" + year1

    //var todate = "03/15/2020"
    var secondlevel = 0;  var thirdlevel = 0
    if ($("#ddlaccountsublevel option:selected").val() == -1) {
       secondlevel = 0;
    }
    else {
        secondlevel = $("#ddlaccountsublevel option:selected").val();
    }

    if ($("#ddlsubcate option:selected").val() == -1) {
        thirdlevel = 0;
    }
    else {
        thirdlevel = $("#ddlsubcate option:selected").val();
    }
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/GetReport.asmx/GetData",
        data: "{'fromdate':'" + fromdate + "','Todate':'" + todate + "','customerid':'" + $("#ddlcustomer option:selected").val() + "','Firstlevel':'" + $("#ddlaccounts option:selected").text() + "','Secondlevel':'" + $("#ddlaccountsublevel option:selected").text() + "','Thirdlevel':'" + $("#ddlsubcate option:selected").text() + "','Firstlevelid':'" + $("#ddlaccounts option:selected").val() + "','Secondlevelid':'" + secondlevel + "','Thirdlevelid':'" + thirdlevel  + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            $("#entitygrid  tbody").empty();
            jQuery.each(jsonData.Table, function (rec) {
                var markup = "<tr><td style ='display:none'> " + jsonData.Table[i].TBID + "</td> <td >" + jsonData.Table[i].AccontName + "</td><td >" + jsonData.Table[i].AccontSubName + "</td><td>" + jsonData.Table[i].AccontSubCat + "</td><td>" + jsonData.Table[i].OpeningbalDR + "</td><td>" + jsonData.Table[i].OpeningbalCR + "</td><td>" + jsonData.Table[i].TransduringDR + "</td><td>" + jsonData.Table[i].TransduringCR + "</td><td>" + jsonData.Table[i].ClosingbalDR + "</td><td>" + jsonData.Table[i].ClosingbalCR  + "</td> </tr >";
                $("#entitygrid  tbody").append(markup);
                i++;
            });
        }
    });
}