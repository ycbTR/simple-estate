
/*
 * YCB
 * Depends:
 *   jquery.ui.core.js
 *   google map places library
 */


$(function () {

//    if (!!$.prototype.addresspicker) {
//
//        var addresspickerMap = $("#search-field").addresspicker({
//            regionBias: "tr",
//            elements: {
//                lat: "#lat",
//                lng: "#lng",
//                country: '#country_iso',
//                type: '#type'
//            }
//        });
//
//    }
});

var selected = false;
var autSelectInterval = "";
function fill_fields(result) {
    var lat = result.geometry.location.lat(),
        lng = result.geometry.location.lng()

//    $(".pac-container .pac-item:first").addClass("pac-selected");
    $(".pac-container").css("display", "none");

    $("#lat").val(lat);
    $("#lng").val(lng);
//                For country search
    if (result.address_components.length == 1) {
        var component = result.address_components[0];
        if (component.types.indexOf("country") != -1) {
            $("#country_iso").val(component.short_name);
        }
    }
    if (window.address_map) {
        window.address_map.setCenter(result.geometry.location)
    }
    ;
}

$(function () {

    $("#search-field").on("focusin", function () {

        selected = false;
    });
    $("#search-field").on("keypress", function (event) {
        if (event.which == 13 && event.keyCode == 13) {
            event.preventDefault();
            autoSelectInterval = setInterval("autoSelect();", 200)
        }
    });

    $("#search-field").on("focusout", function () {
        if ($(this).val() == "") {
            selected = false;
            $("#lat").val("");
            $("#lng").val("");
            $("#country_iso").val("");
        }
        else {
            autoSelectInterval = setInterval("autoSelect();", 200)
        }
    });
});

function autoSelect() {
    clearInterval(autoSelectInterval);
    if (!selected) {
        var firstResult = $(".pac-container .pac-item:first").text();
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({"address": firstResult }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {

                fill_fields(results[0]);
                $("#search-field").val(firstResult);
            }
        });
    }
}


function initialize() {
    var input = document.getElementById('search-field');
    if (input) {
        var autocomplete = new google.maps.places.Autocomplete(input);

        google.maps.event.addListener(autocomplete, 'place_changed', function () {
            input.className = '';
            var place = autocomplete.getPlace();
            if (!place.geometry) {
                // Inform the user that the place was not found and return.
                input.className = 'notfound';
                return;
            }
            if (selected = true) {
                fill_fields(place);
            }
        });
    }
}

google.maps.event.addDomListener(window, 'load', initialize);
