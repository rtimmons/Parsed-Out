/**
 * Toggle elts with ID=a or ID=b.  Must be run after the elts are in the DOM.
 *
 * @requires jQuery.toggle()
 */
var toggleboth = function(a,b)
{
    $(document.getElementById(a)).toggle();
    $(document.getElementById(b)).toggle();
};


/**
 * Set the document's title (<title>) to the contents of the first <h1> tag
 * found on the page if the title is not set or is set to an empty
 * (all white-space) value.
 *
 * Must be run after the first <h1> has been loaded.
 *
 * @requires jQuery.text()
 */
var set_title_to_first_h1 = function()
{
    if ( !document.title || document.title.match(/^\s*$/) )
        document.title = $('h1:first').text(); 
};


/**
 * Adds "Show/Hide X" links to document elements.
 *
 * Say you have bunch of <div>s on the page like
 *
 *     <div class="showhide" title="Solution">
 *         <p>The solution</p>
 *     </div>
 *
 * and you want to hide them all when the user first loads the page but then
 * provide links to show/hide the elements in their place. The text of the
 * link should include the <div>'s title attribute. So the above <div> should
 * be "replaced" by a link "Show Solution" that shows the <div> and
 * simultaneously changes the link's text to "Hide Solution".
 * 
 * @requires jQuery.each(), jQuery.attr(), jQuery.before(),
 *           jQuery.prepend(), jQuery.toggle(), jQuery.click()
 * @requires toggleboth()
 */
var attach_showhides = function()
{
    // hopefully get a unique id:
    var prefix = 'sol'+(new Date()).getTime();
    
    // ensure uniquness:
    while ( $('#'+prefix).length )
        prefix += 'd';
    
    var lastid = 0; // the suffix to the prefix of the last-inserted DOM elt
    
    $('.showhide').each(function(){
        var divid      = prefix + lastid++,
            showlinkid = prefix + lastid++,
            hidelinkid = prefix + lastid++,
            linktitle  = $(this).attr('title');
        
        if ( linktitle.match(/^\s*$/) )
            linktitle = 'Solution';
        
        $(this)
            .attr('id',divid)
            .before('<p><a href="javascript:;" id="'
                        + showlinkid
                        + '" class="showhide"><big>+</big> Show '
                        + linktitle + '</a></p>')
            .prepend('<p><a href="javascript:;" id="'
                        + hidelinkid
                        + '" class="showhide"><big>-</big> Hide '
                        + linktitle + '</a></p>')
            .toggle()
            ;
        
        $('#'+showlinkid).click(function(){
            toggleboth(showlinkid,divid);
        });
        
        $('#'+hidelinkid).click(function(){
            toggleboth(showlinkid,divid);
        });
    });
};

//
// Add 'class="last_changed_svn"' to a DOM element and this will
// replace the '$LastChangeDate: ' to 'Last Updated: ' and will
// remove the trailing $.
//
var update_svn_last_changed = function()
{
    $('.last_changed_svn').each(function(){
        var h = $(this).html();
        h = h.replace(/\$LastChangedDate: (.*)\$$/g,'Last Updated: $1');
        $(this).html(h);
    });
};


/**
 * Matches all links that are external (their href attributes start
 * with "http" and have a "://" in them) and that don't already have
 * a target attribute and sets their target attributes to _blank.
 */
var external_links_blank_href = function()
{
    $('a:not(a[target])[href^="http"][href*="://"]').attr('target','_blank');
};


//////////////////////////
//    LOAD THINGS UP    //
//////////////////////////

$(function(){
    set_title_to_first_h1();
    update_svn_last_changed();
    attach_showhides();
    external_links_blank_href();
});
