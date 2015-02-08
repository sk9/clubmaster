var cmcl = {};

cmcl.loadingcycles = 0;

cmcl.ajax = {
    base: apiUrl,
    api_key: 'THIS_IS_A_DEMO_KEY'
};

cmcl.booking = {};
cmcl.dialogWidth = 500;
cmcl.ticker = {};
cmcl.user = {};
cmcl.app = {
  'timeout': 30,
  'refresh_overview': 600,
  'min_height': 20,
  'min_width': 115
}

cmcl.data = {
    location_id: defaultLocation,
    user: null,
    users: null,
    tickers: null,
    fields: {},
    bookings: {},
    bookingdate: new Date(),
    bookinginterval: null,
    intervalObjects: []
};

cmcl.reload = function() {
    location.reload();
};

cmcl.start = function() {
    cmcl.attachListeners();
    cmcl.initJQueryWidgets();

    cmcl.ajax.getTickers();
    cmcl.booking.initialize();

    // Setup page by doing an initial resize.
    cmcl.onresize();

    // user timeout
    $(document).bind("idle.idleTimer", function(){
        cmcl.user.logout();
    });
    $.idleTimer(cmcl.app['timeout']*1000);
    $('ul#ticker01').liScroll();

    // update bookings
    setInterval(function() {
      var active = $.data(document, 'idleTimer');
      if (active == 'idle') {
        cmcl.booking.initialize();
        $("#booking_date_picker").datepicker( "setDate" , new Date());
        cmcl.data.bookingdate = new Date();
      }
    }, cmcl.app['refresh_overview']*1000);

    // update clock
    setInterval(function() {
            var d = new Date();
            $('#clock_widget').html(d.toString('dd/MM/yyyy')+' '+d.toLocaleTimeString());
        }, 1*1000);

    setInterval(function() {
          cmcl.ajax.getTickers();
        }, 1800*1000);

    $(document.body).on("click", ".ui-widget-overlay", function() {  $("#interval_dialog").dialog("close"); } );
    $(document.body).on("click", ".ui-widget-overlay", function() {  $("#booking_dialog").dialog("close"); } );
    $(document.body).on("click", ".ui-widget-overlay", function() {  $("#login_dialog").dialog("close"); } );
    $(document.body).on("click", ".ui-widget-overlay", function() {  $("#user_search_dialog").dialog("close"); } );
};

Date.prototype.toYYYYMMDD = function() {
    return this.toString('yyyy-MM-dd');
};


cmcl.onresize = function() {
  // nothing happens at the time :)
};

cmcl.attachListeners = function() {
    $('#button_login').click(function() {
        $('#login_dialog').dialog('open');
    });

    $('#button_logout').click(function() {
        cmcl.user.logout();
    });

    $('#search_results').click(function() {
        cmcl.booking.updateDialogButton();
    });

    $('#refresh_image').click(function() {
        cmcl.reload();
    });

    window.onresize = cmcl.onresize;
};

cmcl.initJQueryWidgets = function() {
    // Setup virtual keyboard.

    $('input.key').keyboard(
        {
            display: {
                'bksp'   : '\u2190',
                'enter'  : 'return',
                'default': '.?123',
                'meta1'  : 'ABC',
                'meta2'  : '#+=',
                'accept' : '\u21d3'
            },
            layout: 'custom',
            customLayout: {
                'meta1': [
                    'q w e r t y u i o p {bksp}',
                    'a s d f g h j k l {enter}',
                    'z x c v b n m @ .',
                    '{default} {space} _ - {accept}'
                ],
                'default': [
                    '1 2 3 4 5 6 7 8 9 0 {bksp}',
                    '` | { } % ^ * / \' {enter}',
                    '{meta2} $ & ~ # = + . {meta2}',
                    '{meta1} {space} ! ? {accept}'
                ],
                'meta2': [
                    '[ ] { } \u2039 \u203a ^ * " , {bksp}',
                    '\\ | / < > $ \u00a3 \u00a5 \u2022 {enter}',
                    '{default} \u20ac & ~ # = + . {default}',
                    '{meta1} {space} ! ? {accept}'
                ]
            },
            autoAccept: true,
            usePreview: false,
            enterNavigation: true,
            tabNavigation: true,
            initialFocus : true,
            position: {
                of : $('app'),
                my : 'center bottom',
                at : 'center bottom'
            },
            visible: function(e, keyboard, el) {
                if($('#input_search')[0] === el ) {
                    $("#input_search").getkeyboard().$allKeys.click( function() {
                        cmcl.booking.searchMember();
                    });
                }

                $("input").on("change", function() {
                    if ($('#btn-login').is(':focus')) {
                        cmcl.ajax.login( $('#input_username').val(), $('#input_password').val() );
                    }
                });
            }
        }
    );

    $("#input_search").on('keyup', function() {
        cmcl.booking.searchMember();
    });

    $('input:submit, button').button();
    $('#button_logout').hide();
    $('#auth_dialog').hide();

    $("#booking_date_picker").datepicker(
        {
            dateFormat: 'yy-mm-dd',
            minDate: 0,
            onSelect: function(dateString) {
                var date = new Date(dateString);
                cmcl.data.bookingdate = date;
                cmcl.ajax.getFields(cmcl.data.location_id, date);
            }
        }
    );
    $("#booking_date_picker").datepicker( "setDate" , cmcl.data.bookingdate );

    // Setup dialogs.
    $('#login_dialog').dialog(
        {
            width: cmcl.dialogWidth,
            autoOpen: false,
            modal: true,
            position: {
                of : $('app'),
                my : 'center top',
                at : 'center top'
            },
            resizable: false,
            draggable: false,
            buttons: [{
                id: "btn-login",
                text: "Login",
                click: function() {
                    cmcl.ajax.login( $('#input_username').val(), $('#input_password').val() );
                },
            }],
            close: function() {
                $('#input_username').val('');
                $('#input_password').val('');
                $('#login_dialog_error').text('');
            }
        }
    );
    $('#user_search_dialog').dialog(
        {
            width: cmcl.dialogWidth,
            autoOpen: false,
            modal: true,
            position: {
                of : $('app'),
                my : 'center top',
                at : 'center top'
            },
            resizable: false,
            draggable: false,
            buttons: {
                "Book Bane": function() {
                    var date = cmcl.data.bookingdate;
                    var user_id = $('#search_results').val();
                    var interval_id = cmcl.data.bookinginterval.id;

                    cmcl.ajax.bookField(date, interval_id, user_id);
                },
                "Annuller": function() {
                    $('#user_search_dialog').dialog('close');
                }
            },
            open: function() {
                cmcl.booking.updateDialogButton();
            },
            close: function() {
                $('#input_search').val('');
                $('#search_results').children().remove();
                cmcl.booking.updateDialogButton();
            }
        }
    );
    $('#interval_dialog').dialog(
        {
            width: cmcl.dialogWidth,
            autoOpen: false,
            modal: true,
            position: {
                of : $('app'),
                my : 'center top',
                at : 'center top'
            },
            resizable: false,
            draggable: false,
            buttons: {
                "Log ind": function() {
                    $('#login_dialog').dialog('open');
                    $(this).dialog('close');
                },
            },
        }
    );
    $('#booking_dialog').dialog(
        {
            width: cmcl.dialogWidth,
            autoOpen: false,
            modal: true,
            position: {
                of : $('app'),
                my : 'center top',
                at : 'center top'
            },
            resizable: false,
            draggable: false,
            buttons: {
                "Find medlem": function() {
                    $('#user_search_dialog').dialog('open');
                },
                "Book med gæst": function() {
                    var date = cmcl.data.bookingdate;
                    var interval_id = cmcl.data.bookinginterval.id;

                    cmcl.ajax.bookFieldGuest(date, interval_id);
                },
                "Slet": function() {
                    var booking_id = cmcl.data.bookinginterval.booking.id;
                    cmcl.ajax.cancelBooking(booking_id);
                },
            },
        }
    );

    $('#error_dialog').dialog(
        {
            width: cmcl.dialogWidth,
            autoOpen: false,
            modal: true,
            position: {
                of : $('app'),
                my : 'center top',
                at : 'center top'
            },
            resizable: false,
            draggable: false
        }
    );
};
