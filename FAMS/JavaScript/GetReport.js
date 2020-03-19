
$(document).ready(function () {

    $('#btnseach').click(function () {
        GetData();
    });

    $('#btnExcel').click(function () {
        ExcelExport();
    });
    $('#btnPdf').click(function () {
        GenratePDF();
    });
   
});

function GetData() {

    var date = new Date($('#fromdate').val());
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
    var fromdate = month + "/" + day + "/" + year;

    var date1 = new Date($('#todate').val());
    var day1 = date1.getDate();
    var month1 = date1.getMonth() + 1;
    var year1 = date1.getFullYear();
    var todate = month1 + "/" + day1 + "/" + year1;

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



function GenratePDF() {
    RequestData = []
    $('#entitygrid tbody').find('tr').each(function () {
        var row = $(this);
        RequestData.push({ Col1: row.find('td:nth-child(2)').text().trim(), Col2: row.find('td:nth-child(3)').text().trim(), Col3: row.find('td:nth-child(4)').text().trim(), Col4: row.find('td:nth-child(5)').text().trim(), Col5: row.find('td:nth-child(6)').text().trim(), Col6: row.find('td:nth-child(7)').text().trim(), Col7: row.find('td:nth-child(8)').text().trim(), Col9: row.find('td:nth-child(10)').text().trim() });
    });
   
    document.getElementsByName("CustomerJSON")[0].value= JSON.stringify(RequestData);
}


function ExcelExport() {
    RequestData = []
    $('#entitygrid tbody').find('tr').each(function () {
        var row = $(this);
        RequestData.push({ Col1: row.find('td:nth-child(2)').text().trim(), Col2: row.find('td:nth-child(3)').text().trim(), Col3: row.find('td:nth-child(4)').text().trim(), Col4: row.find('td:nth-child(5)').text().trim(), Col5: row.find('td:nth-child(6)').text().trim(), Col6: row.find('td:nth-child(7)').text().trim(), Col7: row.find('td:nth-child(8)').text().trim(), Col9: row.find('td:nth-child(10)').text().trim() }); 
    });
    var Jsondata = '';
    Jsondata = JSON.stringify(RequestData);
   
    var myTestXML = new myExcelXML(Jsondata);
    myTestXML.downLoad();
   
}




// start code for download excel

let myExcelXML = (function () {
    let Workbook, WorkbookStart = '<?xml version="1.0"?><ss:Workbook  xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">';
    const WorkbookEnd = '</ss:Workbook>';
    let fs, SheetName = 'SHEET 1',
        styleID = 1, columnWidth = 80,
        fileName = "Employee_List", uri, link;

    class myExcelXML {
        constructor(o) {
            let respArray = JSON.parse(o);
            let finalDataArray = [];

            for (let i = 0; i < respArray.length; i++) {
                finalDataArray.push(flatten(respArray[i]));
            }

            let s = JSON.stringify(finalDataArray);
            fs = s.replace(/&/gi, '&amp;');
        }

        downLoad() {
            const Worksheet = myXMLWorkSheet(SheetName, fs);

            WorkbookStart += myXMLStyles(styleID);

            Workbook = WorkbookStart + Worksheet + WorkbookEnd;

            uri = 'data:text/xls;charset=utf-8,' + encodeURIComponent(Workbook);
            link = document.createElement("a");
            link.href = uri;
            link.style = "visibility:hidden";
            link.download = fileName + ".xls";

            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }

        get fileName() {
            return fileName;
        }

        set fileName(n) {
            fileName = n;
        }

        get SheetName() {
            return SheetName;
        }

        set SheetName(n) {
            SheetName = n;
        }

        get styleID() {
            return styleID;
        }

        set styleID(n) {
            styleID = n;
        }
    }

    const myXMLStyles = function (id) {
        let Styles = '<ss:Styles><ss:Style ss:ID="' + id + '"><ss:Font ss:Bold="1"/></ss:Style></ss:Styles>';

        return Styles;
    }

    const myXMLWorkSheet = function (name, o) {
        const Table = myXMLTable(o);
        let WorksheetStart = '<ss:Worksheet ss:Name="' + name + '">';
        const WorksheetEnd = '</ss:Worksheet>';

        return WorksheetStart + Table + WorksheetEnd;
    }

    const myXMLTable = function (o) {
        let TableStart = '<ss:Table>';
        const TableEnd = '</ss:Table>';

        const tableData = JSON.parse(o);

        if (tableData.length > 0) {
            const columnHeader = Object.keys(tableData[0]);
            let rowData;
            for (let i = 0; i < columnHeader.length; i++) {
                TableStart += myXMLColumn(columnWidth);

            }
            for (let j = 0; j < tableData.length; j++) {
                rowData += myXMLRow(tableData[j], columnHeader);
            }
            TableStart += myXMLHead(1, columnHeader);
            TableStart += rowData;
        }

        return TableStart + TableEnd;
    }

    const myXMLColumn = function (w) {
        return '<ss:Column ss:AutoFitWidth="0" ss:Width="' + w + '"/>';
    }


    const myXMLHead = function (id, h) {
        let HeadStart = '<ss:Row ss:StyleID="' + id + '">';
        const HeadEnd = '</ss:Row>';

        for (let i = 0; i < h.length; i++) {
            const Cell = myXMLCell(h[i].toUpperCase());
            HeadStart += Cell;
        }

        return HeadStart + HeadEnd;
    }

    const myXMLRow = function (r, h) {
        let RowStart = '<ss:Row>';
        const RowEnd = '</ss:Row>';
        for (let i = 0; i < h.length; i++) {
            const Cell = myXMLCell(r[h[i]]);
            RowStart += Cell;
        }

        return RowStart + RowEnd;
    }

    const myXMLCell = function (n) {
        let CellStart = '<ss:Cell>';
        const CellEnd = '</ss:Cell>';

        const Data = myXMLData(n);
        CellStart += Data;

        return CellStart + CellEnd;
    }

    const myXMLData = function (d) {
        let DataStart = '<ss:Data ss:Type="String">';
        const DataEnd = '</ss:Data>';

        return DataStart + d + DataEnd;
    }

    const flatten = function (obj) {
        var obj1 = JSON.parse(JSON.stringify(obj));
        const obj2 = JSON.parse(JSON.stringify(obj));
        if (typeof obj === 'object') {
            for (var k1 in obj2) {
                if (obj2.hasOwnProperty(k1)) {
                    if (typeof obj2[k1] === 'object' && obj2[k1] !== null) {
                        delete obj1[k1]
                        for (var k2 in obj2[k1]) {
                            if (obj2[k1].hasOwnProperty(k2)) {
                                obj1[k1 + '-' + k2] = obj2[k1][k2];
                            }
                        }
                    }
                }
            }
            var hasObject = false;
            for (var key in obj1) {
                if (obj1.hasOwnProperty(key)) {
                    if (typeof obj1[key] === 'object' && obj1[key] !== null) {
                        hasObject = true;
                    }
                }
            }
            if (hasObject) {
                return flatten(obj1);
            } else {
                return obj1;
            }
        } else {
            return obj1;
        }
    }

    return myExcelXML;
})();


// start code for download excel