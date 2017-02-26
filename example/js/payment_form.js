$(function() {
    payment_form = $('form').attr('id');
    addLinkToSetDefaults();
});

function setDefaultsForAll() {
    if (payment_form === "payment_confirmation"){
        setDefaultsForUnsignedDetailsSection();
    } else {
        setDefaultsForPaymentDetailsSection();
    } 
}

function addLinkToSetDefaults() {
    $(".section").prev().each(function (i) {
        legendText = $(this).text();
        $(this).text("");

        var setDefaultMethod = "setDefaultsFor" + capitalize($(this).next().attr("id")) + "()";

        newlink = $(document.createElement("a"));
        newlink.attr({
            id:'link-' + i, name:'link' + i, href:'#'
        });

        newlink.append(document.createTextNode(legendText));
        newlink.bind('click', function () {
            eval(setDefaultMethod);
        });

        $(this).append(newlink);
    });

    newbutton = $(document.createElement("input"));
    newbutton.attr({
        type:'button', id:'defaultAll', value:'Default All', onClick:'setDefaultsForAll()'
    });

    newbutton.bind('click', function() {
        setDefaultsForAll;
    });

    $("#"+payment_form).append(newbutton);
}

function capitalize(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function setDefaultsForPaymentDetailsSection() {
    $("input[name='transaction_type']").val("sale");
    $("input[name='reference_number']").val(new Date().getTime());
    $("input[name='amount']").val("1572.00");
    $("input[name='currency']").val("THB");
    $("input[name='payment_method']").val("card");
    $("input[name='bill_to_forename']").val("Krungsri");
    $("input[name='bill_to_surname']").val("Simple");
    $("input[name='bill_to_email']").val("junlapong@gmail.com");
    $("input[name='bill_to_phone']").val("+662-2962-000");
    $("input[name='bill_to_address_line1']").val("RAMA 3 RD.");
    $("input[name='bill_to_address_city']").val("YAN NAWA");
    $("input[name='bill_to_address_state']").val("BKK");
    $("input[name='bill_to_address_country']").val("TH");
    $("input[name='bill_to_address_postal_code']").val("10120");

}

function setDefaultsForUnsignedDetailsSection(){
    $("input[name='card_type']").val("001");
    $("input[name='card_number']").val("4111111111111111");
    $("input[name='card_expiry_date']").val("07-2022");
}

