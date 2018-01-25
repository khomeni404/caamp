/**
 * Created by Khomeni on 20-Aug-17.
 */

/**
 * Added by: Khomeni
 * Added On: 28/09/2017
 * This function can be used to execute events on-ready the page
 * Example:
 *      CAAMPReady(function(){
 *          // Your on-ready Script goes here.
 *          alert('DOM Ready!');
 *      });
 * */
function CAAMPReady(f) {
    /in/.test(document.readyState) ? setTimeout('CAAMPReady(' + f + ')', 9) : f()
}

/**
 * Test 
 */
CAAMPReady(function () {
    console.log("DOM is Ready.");
});

jQuery(function ($) {
    $(".chosen-select").chosen();

    /*$( ".select2-single, .select2-multiple" ).select2( {
     placeholder: placeholder,
     width: null,
     containerCssClass: ':all:'
     });*/

    $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        })
        //show datepicker when clicking on the icon
        .next().on(ace.click_event, function () {
        $(this).prev().focus();
    });


    /**
     * @author Khomeni
     * All String field of FormBean has been validate to reject unsafe text.
     * And this message will be shown if user don't understand the error.
     * This is just an Explanation shown to the user on click on help link.
     */
    $('.unsafe-string-help-gritter').on(ace.click_event, function () {
        $.gritter.add({
            title: 'Look at your input text.',
            text: 'You can only use Alphabet and Number in text with only dot(.) and comma(,).',
            class_name: 'gritter-info gritter-center gritter-light',
            // image: 'assets/avatars/avatar1.png',
            sticky: false,
            time: '10000' // millisecond

        });
        return false;
    });

    $('.invalid-address-help-gritter').on(ace.click_event, function () {
        $.gritter.add({
            title: 'Attention !',
            text: 'In Address line you can use only Alphabate, Numbers, Dot, Hash, Comma, Underscore and Dash',
            class_name: 'gritter-info gritter-center gritter-light',
            // image: 'assets/avatars/avatar1.png',
            sticky: false,
            time: '10000' // millisecond

        });
        return false;
    });


    /**
     * @author Khomeni
     * This is implemented to get help by clicking help icon/text
     *      <span class="help-span" text="This is a help text">Help</span>
     *      <span class="help-span" text="This is a help text"><i class="fa fa-question bigger-150"></i></span>
     */
    $('.help-span').on(ace.click_event, function () {
        var text = $(this).attr('text');
        $.gritter.add({
            title: 'Help ?',
            text: text,
            class_name: 'gritter-info gritter-center gritter-light',
            // image: 'assets/avatars/avatar1.png',
            sticky: false,
            time: '5000' // millisecond
        });
        return false;
    });
});


$('.se-input-file').ace_file_input({
    no_file: 'No File ...',
    btn_choose: 'Choose',
    btn_change: 'Change',
    droppable: false,
    onchange: null,
    thumbnail: false
});


