function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var kitchenAddress = document.getElementById('kitchen_address');

    if (kitchenAddress) {
      var autocomplete = new google.maps.places.Autocomplete(kitchenAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(kitchenAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
