$(document).ready(function () {

  var $openings = $('.opening');

  //DataFiltering = {
  //  currentCountry: nil,
  //  currentSector: nil,
  //  filter: function() {
  //
  //  }
  //}
  //
  //window.data_filtering = new DataFiltering;


  $('#opening_filter_country').on('change', function () {
    var currentCountry = this.value.toLowerCase();
    var currentSector = $('#opening_filter_sector').val();
    $openings.filter(function (index, opening) {
      $opening = $(opening);
      if ($opening.data('country') === currentCountry && $opening.data('sector') === currentSector) {
        $opening.show();
      } else {
        $opening.hide();
      }
    });
  });


  $('#opening_filter_sector').on('change', function () {
    var currentSector = this.value;
    $openings.filter(function (index, opening) {
      $opening = $(opening);
      if ($opening.data('sector') === currentSector) {
        $opening.show();
      } else {
        $opening.hide();
      }
    });
  });

});
