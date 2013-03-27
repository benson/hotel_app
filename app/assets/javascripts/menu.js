$(document).ready(alignMenuItems);

function alignMenuItems(){
    var totEltWidth = 0;
    var menuWidth = $('#menu')[0].offsetWidth-2;    // -2 for the border
    var availableWidth = 0;
    var space = 0;
    
    var elts = $('#menu li');
    elts.each(function(inx, elt) {
        // reset paddding to 0 to get correct offsetwidth
        $(elt).css('margin-left', '0px');
        $(elt).css('margin-right', '0px');
        
        totEltWidth += elt.offsetWidth;
    });
    
    availableWidth = menuWidth - totEltWidth;
    
    space = availableWidth/(elts.length);
    
    
    elts.each(function(inx, elt) {
        $(elt).css('margin-left', (space/2) + 'px');
        $(elt).css('margin-right', (space/2) + 'px');
    });

    // elts[0].style.paddingLeft = (space/2)-10 + 'px';
    // elts[0].style.marginLeft = '10px';

    // elts[elts.length-1].style.paddingRight = (space/2)-10 + 'px';
    // elts[elts.length-1].style.marginRight = '10px';
}

