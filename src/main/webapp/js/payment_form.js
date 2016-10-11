$(document).ready(function () {
    addLinkToSetDefaults();
});

function setDefaultsForAll() {
    setDefaultsForPaymentDetailsSection();
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

    /*newbutton = $(document.createElement("input"));
    newbutton.attr({
        id:'defaultAll', value:'Default All', type:'button', onClick:'setDefaultsForAll()'
    });
    newbutton.bind('click', function() {
        setDefaultsForAll();
    });
    $("#payment_form").append(newbutton);*/
}

function capitalize(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function setDefaultsForPaymentDetailsSection() {
    $("input[name='transaction_type']").val("authorization");
    $("input[name='reference_number']").val(new Date().getTime());
    $("input[name='amount']").val("100.00");
    $("input[name='currency']").val("USD");
}
