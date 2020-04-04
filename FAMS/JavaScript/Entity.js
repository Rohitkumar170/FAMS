var dblid = '0'; var Custid = '0';
$(document).ready(function () {
    BindGrid();
    $("#btnNew").click(function () {
        $("#entitygrid").hide();
        $("#boxgrid").show();
        $("#btnNew").hide();
        $("#Btnback").show();
       
    });
    $("#Btnback").click(function () {
        $("#entitygrid").show();
        $("#boxgrid").hide();
        Reset();
        $("#btnNew").show();
        $("#Btnback").hide();
    });
    $("#btnsave").click(function () {
        if (Validation() == true) {
            if (dblid == 0) {
                SaveEntity();
            }
            else {
                UpdateEntity();
            }
        }
    });

    $(document).on("dblclick", "#entitygrid tbody tr", function () {
        var row = jquery_1_11_3_min_p(this);
        $("#entitygrid").hide();
        $("#boxgrid").show();
        $("#btnNew").hide();
        $("#Btnback").show();
        $('#txtname').val(row.find('td:nth-child(3)').text().trim()); $('#txtaccountno').val(row.find('td:nth-child(4)').text().trim())
        dblid = 1; Custid = row.find('td:nth-child(1)').text().trim();

    });
});

function Reset() { $('#txtname').val(''); $('#txtaccountno').val(''); }
function Validation() {
    var allow = true;
    if ($('#txtname').val() == '') { $('#txtname').addClass('validate'); allow= false; }
    if ($('#txtaccountno').val() == '') { $('#txtaccountno').addClass('validate'); allow = false; }
    return allow;
}
function RemoveValidation() {
    if ($('#txtname').val() != '') { $('#txtname').removeClass('validate'); }
    if ($('#txtaccountno').val() != '') { $('#txtaccountno').removeClass('validate'); }
}
function SaveEntity() {

    var CustomerJson = []; var CustJson = '';
    CustomerJson.push({ CustName: $('#txtname').val(), CustAccount: $('#txtaccountno').val(), CreatedBy: $('#lblUserId').text() });
    CustJson = JSON.stringify(CustomerJson);
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/SaveEntity",
        data: "{'json':'" + CustJson + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
           var jsonData = eval(result.d);
            if (jsonData.Table[0].Res == "1") {
                BindGrid();
              //  swal("Saved Successfully", "Customer details saved successfully!", "success")
            }
        }
    });

}
function UpdateEntity() {

    var CustomerJson = []; var CustJson = '';
    CustomerJson.push({ CustName: $('#txtname').val(), CustAccount: $('#txtaccountno').val(), CreatedBy: $('#ContentPlaceHolder1_lblUserId').text(), Custid: Custid });
    CustJson = JSON.stringify(CustomerJson);
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/UpdateEntity",
        data: "{'json':'" + CustJson + "'}",
        dataType: "json",
        async: false,
        success: function (result) {
            var jsonData = eval(result.d);
            if (jsonData.Table[0].Res == "1") {
                BindGrid();
                //  swal("Saved Successfully", "Customer details saved successfully!", "success")
            }
        }
    });

}
function BindGrid() {
    var Bankcust = [];
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindBankCust",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            var jsonData = eval(result.d);
            jquery_1_11_3_min_p("#entitygrid tbody").empty();
            var i = 0;
            jQuery.each(jsonData.Table, function (rec) {
              //  Bankcust.push({ value: jsonData.Table[i].StateId, text: jsonData.Table[i].StateName })
                var markup = "<tr> <td style='display:none'> " + jsonData.Table[i].CustId + "</td> <td> <input id='chkbox' type='checkbox' class='checkAll'  /></td><td>" + jsonData.Table[i].CustomerName + "</td> <td >" + jsonData.Table[i].BankAccountNo + "</td></tr>";
                jquery_1_11_3_min_p("#entitygrid tbody").append(markup);
                i++;
            });
        }
    });
}