$(document).ready(function () {
  closeFlash();

  var $openings = $('.opening');

  $('#opening_filter_country').on('change', function () {
    var currentCountry = this.value.toLowerCase();
    $openings.filter(function (index, opening) {
      $opening = $(opening);
      if ($opening.data('country') === currentCountry) {
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
