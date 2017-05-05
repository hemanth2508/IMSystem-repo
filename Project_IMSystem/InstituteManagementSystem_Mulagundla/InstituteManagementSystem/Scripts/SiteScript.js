/// <reference path="jquery-3.1.0.js" />
/// <reference path="jquery-ui-1.12.0.js" />


$(document).ready(function () {

    $('#RegisterUser').dialog({
        closeText: '',
        autoOpen: false,
        title: 'Register User',
        modal: true,
        show: "blind",
        hide: "blind",
        resizable: false,
        closeOnEscape:true,
        draggable: false,
        //open: function (event, ui) {
        //    $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        //},
        buttons: [{
            text: "Create",
            id: "my-button-1",
            click: function () {
               
               // alert($('#txtFName').val());
                var txtFName = $('input:text[name=txtFName]').val(); //txtFName.value;
                var txtLName = $('input:text[name=txtLName]').val(); //txtLName.value;
                var txtEmailId = $('input[name=txtEmailId]').val(); //txtEmailId.value;
               
                var txtpassword = $('input[name=txtPassword]').val(); 
                var txtConfirmpassword = $('input[name=txtConfirmPassword]').val(); //txtPassword.value;
                var txtQualification = $('input:text[name=txtQualification]').val(); //txtQualification.value;
                var chkIsFaculty = $("input:checkbox[id='chkIsFaculty']").val(); //chkIsFaculty.value;
                var checkbox = document.querySelector('input[type="checkbox"]');
                chkIsFaculty = checkbox.checked;
                if (txtFName.trim() == "" || txtLName.trim() == "" || txtEmailId.trim() == "" || txtpassword.trim() == ""
                    || txtConfirmpassword.trim() == "") {
                    alert("Provide Mandatory fields");
                    return;
                }
                else if (txtpassword != txtConfirmpassword) {
                    alert("Missmatch of Password and Confirm Password");
                    return;
                }
                var jsondata = {
                    Fname: txtFName,
                    LName:txtLName,
                    EmailId: txtEmailId,
                    Password:txtpassword ,
                    Qualification: txtQualification,
                    IsFaculty:chkIsFaculty
                }
                jsondata = JSON.stringify(jsondata);
                $.ajax({
                    type: "POST",
                    url: "LoginPage.aspx/CreateUser",
                    data: jsondata,//'{Fname: "' + txtFName + '",LName: "' + txtLName + '",EmailId: "' + txtEmailId + '",Password: "' + txtpassword + '",Qualification: "' + txtQualification + '",IsFaculty: "' + chkIsFaculty + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                        $('#RegisterUser').dialog('close');
                    },
                    failure: function (response) {
                        alert(response.d);
                       // $('#RegisterUser').dialog('close');
                    }
                });
               
            }
        }]
        
    });
    $('#register').click(function () {
        $('#RegisterUser').dialog('open');
                          return false;
    });
});

$(function () {
    $('ul.tabs li:first').addClass('active');
    $('.block article').hide();
    $('.block article:first').show();
    $('ul.tabs li').on('click', function () {
        $('ul.tabs li').removeClass('active');
        $(this).addClass('active')
        $('.block article').hide();
        var activeTab = $(this).find('a').attr('href');
        $(activeTab).show();
        return false;
    });
})
//Initial bind
$(document).ready(function () {
    BindControlEvents();
});


function BindControlEvents() {

    $(function () {
        $("[id$=txtStartDate]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'Images/calendar.bmp',
            dateFormat: 'MM-dd-yy'
        });
    });
    $(function () {
        $("[id$=txtEndDate]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'Images/calendar.bmp',
            dateFormat: 'MM-dd-yy'
        });
    });
    $(function () {
        $("[id$=txtUpdateStartDate]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'Images/calendar.bmp',
            dateFormat: 'MM-dd-yy'
        });
    });
    $(function () {
        $("[id$=txtUpdateEndDate]").datepicker({
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: 'Images/calendar.bmp',
            dateFormat: 'MM-dd-yy'
        });
    });
    $(function () {
        $("[id$=txtStartTime]").timepicker({
            timeFormat: 'HH:mm',
            interval: 60,
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

    });
    $(function () {
        $("[id$=txtEndTime]").timepicker({
            timeFormat: 'HH:mm',
            interval: 60,
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
    });
    $(function () {
        $("[id$=txtUpdateStartTime]").timepicker({
            timeFormat: 'HH:mm',
            interval: 60,
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });

    });
    $(function () {
        $("[id$=txtUpdateEndTime]").timepicker({
            timeFormat: 'HH:mm',
            interval: 60,
            dynamic: false,
            dropdown: true,
            scrollbar: true
        });
    });
}



