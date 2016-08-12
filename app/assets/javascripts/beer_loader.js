$beerSRM = $('.js-srm');
$beerColor = $('.beer-color');
$kegLevelInput = $('.js-kegLevelInput');
$kegLevelOutput = $('.js-kegLevelOutput');
$srmDisplay = $('.js-srmDisplay');
$kegLevelDisplay = $('.js-kegLevelDisplay');
$toggle = $('.js-toggle');
$values = $('.js-values');

var srm = [ '#FDE69D', '#FCD87F', '#FCCA63', '#FBC050', '#F5B238', '#F3A728', '#EC9D26', '#E48F23', '#E18822', '#D87E1F', '#D1741D', '#C96C1B', '#C4641A', '#BD5C18', '#B45315', '#AE4F14', '#AA4713', '#A04011', '#9A390F', '#94350E', '#8F2F0D', '#8A2D0D', '#82260B', '#7D200A', '#761D09', '#711C07', '#6B1607', '#661006', '#611006', '#5A0E05', '#540D05', '#5C0B06', '#4E0B0B', '#490708', '#430808', '#410909', '#3B0A0A', '#380809', '#38080C', '#34090B'
];

var assignColor = function(value) {
    $beerColor.attr('style', 'fill:' + srm[(value)]);
}

var displaySRMValue = function(value) {
    $srmDisplay.html(value);
}

var assignLevel = function(value) {
    $kegLevelOutput.css({
        "webkitTransform":"translateY(" + value + "px)",
        "MozTransform":"translateY(" + value + "px)",
        "msTransform":"translateY(" + value + "px)",
        "OTransform":"translateY(" + value + "px)",
        "transform":"translateY(" + value + "px)"
    });
}

var displayKegValue = function(value) {
    $kegLevelDisplay.html(value);
}

$beerSRM.on("input change", function() {
    var value = $beerSRM.val();
    assignColor(value);
    displaySRMValue(value);
});

$kegLevelInput.on("input change", function() {
    var maxLevel = 150;
    var value = $kegLevelInput.val();
    var reduceBy = 100 - value;
    var percent = reduceBy / 100;
    
    assignLevel(maxLevel * percent);
    displayKegValue(value);
});

$toggle.on("click", function(){
   $values.toggleClass('values_isOpen'); 
});



