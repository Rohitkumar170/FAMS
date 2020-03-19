
var AddressCounter = 0; var City = [];
$(document).ready(function () {
    $('#btnaddaddress').click(function () { if (ValidateAddress() == true) { AddAddress(); } });
    BindCustType();
    AddAddress();
    $("btnCross_1").css("display","none");
});

function ValidateAddress() {
    var allow = true;

    var i = 0;
    if ($("#txtAddressLine1_" + AddressCounter).val() == "") {
        jquery_1_11_3_min_p("#txtAddressLine1_" + AddressCounter).addClass('validate');
        allow = false;
    }
    if ($("#txtAddressLine2_" + AddressCounter).val() == "") {
        jquery_1_11_3_min_p("#txtAddressLine2_" + AddressCounter).addClass('validate');
        allow = false;
    }
    if ($("#txtPincode_" + AddressCounter).val() == "") {
        jquery_1_11_3_min_p("#txtPincode_" + AddressCounter).addClass('validate');
        allow = false;
    }
    if (kendo_all_min_js("#ddlstate_" + AddressCounter).val() == 0) {
        kendo_all_min_js("#ddlstate_" + AddressCounter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    if (kendo_all_min_js("#ddlcity_" + AddressCounter).val() == 0) {
        kendo_all_min_js("#ddlcity_" + AddressCounter).data("kendoDropDownList").span.css('background', '#f9e5e5');
        allow = false;
    }
    return allow;

}


function AddAddress() {
    AddressCounter = AddressCounter + 1;
    var markup = "<div class=' col-md-12 col-sm-12 col-xs-12 addaddress mb-2' ><div class='row'><div class='col-md-12 col-xs-12 col-sm-12 ' style='border-bottom: 1px solid #c5c5c5;'><label style='width: 98%; font-size: 14px;'>Address " + AddressCounter + "</label><label id='btnCross_" + AddressCounter+"'>X</label></div></div><div class='row' style=' margin-top: 13px;'><div class='col-md-4 col-sm-4 col-xs-4'> <div class='form-group'><div class='row'><label class='col-md-4 col-sm-4 col-xs-4'>Address Line 1:</label> <input type='text'  id ='txtAddressLine1_" + AddressCounter + "'class='col-md-7 col-sm-7 col-xs-7' /></div> </div></div><div class='col-md-4 col-sm-4 col-xs-4'><div class='form-group'><div class='row'> <label class='col-md-4 col-sm-4 col-xs-4'>Address Line 2:</label> <input type='text' class='col-md-7 col-sm-7 col-xs-7' id='txtAddressLine2_" + AddressCounter + "' /></div > </div ></div > <div class='col-md-4 col-sm-4 col-xs-4'> <div class='form-group'> <div class='row'> <label class='col-md-4 col-sm-4 col-xs-4'>PinCode:</label><input type='text' id='txtPincode_" + AddressCounter + "' class='col-md-7 col-sm-7 col-xs-7' /></div></div ></div > </div > <div class='row' ><div class='col-md-4 col-sm-4 col-xs-4'> <div class='form-group'><div class='row'> <label class='col-md-4 col-sm-4 col-xs-4'>State :</label><div class='col-md-7 col-sm-7 col-xs-7 p-0'> <input type='text' id='ddlstate_" + AddressCounter + "' class=' col-md-12 col-sm-12 col-xs-12 p-0' /> </div></div></div ></div > <div class='col-md-4 col-sm-4 col-xs-4'> <div class='form-group'><div class='row'><label class='col-md-4 col-sm-4 col-xs-4'>City :</label><div class='col-md-7 col-sm-7 col-xs-7 p-0'><input type='text' id='ddlcity_" + AddressCounter + "' class=' col-md-12 col-sm-12 col-xs-12 p-0' /></div></div></div></div></div></div>";
    $("#AddressDiv").append(markup);
    BindState();
   
}

function BindState() {
    if (AddressCounter == 0) { AddressCounter++; }
    var State = [];
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindState",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            State.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                State.push({ value: jsonData.Table[i].StateId, text: jsonData.Table[i].StateName })
                i++;
            });
           
        }
    });
    kendo_all_min_js('#ddlstate_' + AddressCounter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: State,
        change: function () {
            kendo_all_min_js('#ddlstate_' + AddressCounter).data("kendoDropDownList").span.css('background', 'none');
            BindCity(kendo_all_min_js('#ddlstate_' + AddressCounter).data("kendoDropDownList").value())
        }
    });
    City.push({ value: "0", text: "Select" });
    kendo_all_min_js('#ddlcity_' + AddressCounter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: City,
        change: function () {
            kendo_all_min_js('#ddlcity_' + AddressCounter).data("kendoDropDownList").span.css('background', 'none');

        }
    });
}

function BindCity(StateId) {
    if (AddressCounter == 0) { AddressCounter++; }
    City = [];
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindCity",
        data: "{'StateId':'" + StateId+"'}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            City.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                City.push({ value: jsonData.Table[i].CityId, text: jsonData.Table[i].CityName })
                i++;
            });

        }
    });
    kendo_all_min_js('#ddlcity_' + AddressCounter).kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: City,
        change: function () {
            kendo_all_min_js('#ddlcity_' + AddressCounter).data("kendoDropDownList").span.css('background', 'none');

        }
    });
}


function BindCustType() {
    var CustType = [];
    var CustRep = [];
 
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../WebServices/Customer.asmx/BindCustomerType",
        data: "{}",
        dataType: "json",
        async: false,
        success: function (result) {
            jsonData = eval(result.d);
            var i = 0;
            CustType.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table, function (rec) {
                CustType.push({ value: jsonData.Table[i].CustTypeId, text: jsonData.Table[i].CustType })
                i++;
            });
            var i = 0;
            CustRep.push({ value: "0", text: "Select" });
            jQuery.each(jsonData.Table1, function (rec) {
                CustRep.push({ value: jsonData.Table1[i].CustId, text: jsonData.Table1[i].CustomerName })
                i++;
            });
        }
    });
    kendo_all_min_js('#ddlcusttype').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: CustType,
        change: function () {
            kendo_all_min_js('#ddlcusttype').data("kendoDropDownList").span.css('background', 'none');
        }
    });
    kendo_all_min_js('#ddlcustRep').kendoDropDownList({
        filter: "contains",
        dataTextField: "text",
        dataValueField: "value",
        dataSource: CustRep,
        change: function () {
            kendo_all_min_js('#ddlcustRep').data("kendoDropDownList").span.css('background', 'none');
        }
    });
}


