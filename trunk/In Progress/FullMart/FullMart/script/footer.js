$(window).load(function () {
    $('#slider').nivoSlider();
});
$(".salef").each(function () {
    if ($(this).text() == '' || $(this).text() == '\n ') {
        $(this).hide();
    }
});
function isNumber(x) 
{ 
  return ( (typeof x === typeof 1) && (null !== x) && isFinite(x) );
}
$("li.item-taskbar").click(function () {
	$("li.item-taskbar a.notice-panel, .login").removeClass('active');
	$("li.item-taskbar ul.sub-taskbar, .drop-menu .quick-login").hide();
	$(this).children("ul.sub-taskbar").show();
	$(this).children("a.notice-panel").addClass('active');
	 return false; 
});
$(document).ready(function () {
    $('.main-pathway').breadcrumbs();
    $("#mP ul li ul").hide();
    $('#very').text(genr(4));
    $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
    $('.comment:even p').css('background-color', '#ddfcd8');
    $('#msinfo').hide();
    $('#very').focus(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#very').select(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#very').click(function () {
        $('#msvery').focus();
        $('#msvery').select();
    });
    $('#msvery').focus(function () { $('#msvery').select(); });
    $('#mscontent').val('Hãy cùng bình luận nào...!');
    $('#mscontent').focus(function () {
        if ($('#mscontent').val() == '' || $('#mscontent').val() == 'Hãy cùng bình luận nào...!') {
            $('#mstext').animate({ width: '70%' }, 200, function () {
                $('#msinfo').css('width', '28%');
                $('#msinfo').fadeIn(200);
                $('#mscontent').val('');
            });
        }
    });
    $('#mscontent').blur(function () {
        if ($('#mscontent').val() == '' || $('#mscontent').val() == 'Hãy cùng bình luận nào...!') {
            $('#msinfo').fadeOut(200, function () {
                $('#msinfo').width(0);
                $('#mstext').animate({ width: '100%' }, 200, function () {
                    $('#mscontent').val('Hãy cùng bình luận nào...!');
                });
            });
        }
    });
    $('#mspost').click(function () {
        if ($('#very').text() != $('#msvery').val()) {
            alert('Hãy nhập chính xác mã xác nhận !');
            $('#very').text(genr(4));
            $('#very').css('background-position', 'left ' + Math.random() * 500 + 'px');
            $('#msvery').focus();
            $('#msvery').select();
            return false;
        } else {
            $('#commentlist').prepend("<div class='comment'><span>Nick name</span><p>" + $('#mscontent').val() + "</p></div>");
            $('#very').text(genr(4));
            $('#mscontent').val('Hãy cùng bình luận nào...!');
            $('#msvery').val('');
            $('.comment:even p').css('background-color', '#ddfcd8');
            $('.comment:odd p').css('background-color', '#fff');
        }
    });
});
var wip = 1;
$(".salecontent .product").each(function () {
    wip = wip + $(this).width() + 42;
});
$(".salecontent").css("width", wip);

$("a.login").click(function(){
	$("li.item-taskbar ul.sub-taskbar").hide(); 
	$(".quick-login").slideDown();
	$(".login").addClass('active'); 
	return false; 
});
$(document).click(function() { //Click anywhere and...
   $("li.item-taskbar ul.sub-taskbar, .quick-login").hide(); //hide subpanel
   $("li.item-taskbar a.notice-panel, .login").removeClass('active'); //remove active class on subpanel trigger  
   $("#divSupport").hide();
   if ($("#keywordItem").val() == "Nhập từ khóa tìm kiếm...") {
           $("#divBanner form div").slideUp();
   }

});

$('ul.sub-taskbar, .quick-login').click(function(e) {
	e.stopPropagation(); //Prevents the subpanel ul from closing on click
});


$(".icon-close").click(function()
{
	$(".quick-login").hide();
	$(".login").removeClass('active');
});

//----------------------------------------------
function getUrl(){
	var a = document.location.href;
	var _params = {};
	var paramsRaw = (a.split("?", 2)[1] || "").split('#')[0].split("&") || [];
	for(var i = 0; i < paramsRaw.length; i++){
		var param = paramsRaw[i].split("=");
		if(param[0])
			_params[param[0]] = param[1];
	}
	return _params;
}


//------------------------------------------
//get catalog
var delay;
$("#mP ul li").hover(
	        function () {
	            var el = $(this);
	            clearTimeout(delay);
	            delay = setTimeout(function () {
	                el.children("ul").slideDown("normal");
	            }, 200);

	        },
	        function () {
	            clearTimeout(delay);
	            $(this).children("ul").hide();
	        }
        );
var delay;
$("#item-link li.browse").hover(
	function(){
		 var el = $(this);
		 clearTimeout(delay);
		 delay = setTimeout(function(){
			 el.children(".sub-support").slideDown(); 
		 }, 200);
		 
	},
	function(){
		 clearTimeout(delay);
		 $(this).children(".sub-support").hide();
	}   
)

function getKeywordById(id_textbox)
{
	var keyword =  $("#"+id_textbox).val(); 
	keyword = keyword.replace(/([\?*#<>!\$%^&\(\)\/\\]+)/g,"");
	keyword = keyword.replace(/([ ]+)/g," ");
	keyword = keyword.replace(/\"/g, '');
	return keyword;
}

function processFocusById(id_textbox)
{       
	$("#"+id_textbox).val('');    
}
function processBlueById(id_textbox)
{    
	var keyword =  getKeywordById(id_textbox);    
	if(keyword == ''){ 
		$("#"+id_textbox).val("Nhập từ khóa tìm kiếm");
	}   
}
$('#icon_guaranteed').hover(function(){
    $('#show_icon_guaranteed').css('display','block');
}, function() {
    $('#show_icon_guaranteed').css('display','none'); 
});    
$('#icon_shop').hover(function(){
    $('#show_icon_shop').css('display','block');
}, function() {
    $('#show_icon_shop').css('display','none'); 
});  
(function($) {

$.extend($.fn, {
	livequery: function(type, fn, fn2) {
		var self = this, q;

		// Handle different call patterns
		if ($.isFunction(type))
			fn2 = fn, fn = type, type = undefined;

		// See if Live Query already exists
		$.each( $.livequery.queries, function(i, query) {
			if ( self.selector == query.selector && self.context == query.context &&
				type == query.type && (!fn || fn.$lqguid == query.fn.$lqguid) && (!fn2 || fn2.$lqguid == query.fn2.$lqguid) )
					// Found the query, exit the each loop
					return (q = query) && false;
		});

		// Create new Live Query if it wasn't found
		q = q || new $.livequery(this.selector, this.context, type, fn, fn2);

		// Make sure it is running
		q.stopped = false;

		// Run it immediately for the first time
		q.run();

		// Contnue the chain
		return this;
	},

	expire: function(type, fn, fn2) {
		var self = this;

		// Handle different call patterns
		if ($.isFunction(type))
			fn2 = fn, fn = type, type = undefined;

		// Find the Live Query based on arguments and stop it
		$.each( $.livequery.queries, function(i, query) {
			if ( self.selector == query.selector && self.context == query.context &&
				(!type || type == query.type) && (!fn || fn.$lqguid == query.fn.$lqguid) && (!fn2 || fn2.$lqguid == query.fn2.$lqguid) && !this.stopped )
					$.livequery.stop(query.id);
		});

		// Continue the chain
		return this;
	}
});

$.livequery = function(selector, context, type, fn, fn2) {
	this.selector = selector;
	this.context  = context;
	this.type     = type;
	this.fn       = fn;
	this.fn2      = fn2;
	this.elements = [];
	this.stopped  = false;

	// The id is the index of the Live Query in $.livequery.queries
	this.id = $.livequery.queries.push(this)-1;

	// Mark the functions for matching later on
	fn.$lqguid = fn.$lqguid || $.livequery.guid++;
	if (fn2) fn2.$lqguid = fn2.$lqguid || $.livequery.guid++;

	// Return the Live Query
	return this;
};

$.livequery.prototype = {
	stop: function() {
		var query = this;

		if ( this.type )
			// Unbind all bound events
			this.elements.unbind(this.type, this.fn);
		else if (this.fn2)
			// Call the second function for all matched elements
			this.elements.each(function(i, el) {
				query.fn2.apply(el);
			});

		// Clear out matched elements
		this.elements = [];

		// Stop the Live Query from running until restarted
		this.stopped = true;
	},

	run: function() {
		// Short-circuit if stopped
		if ( this.stopped ) return;
		var query = this;

		var oEls = this.elements,
			els  = $(this.selector, this.context),
			nEls = els.not(oEls);

		// Set elements to the latest set of matched elements
		this.elements = els;

		if (this.type) {
			// Bind events to newly matched elements
			nEls.bind(this.type, this.fn);

			// Unbind events to elements no longer matched
			if (oEls.length > 0)
				$.each(oEls, function(i, el) {
					if ( $.inArray(el, els) < 0 )
						$.event.remove(el, query.type, query.fn);
				});
		}
		else {
			// Call the first function for newly matched elements
			nEls.each(function() {
				query.fn.apply(this);
			});

			// Call the second function for elements no longer matched
			if ( this.fn2 && oEls.length > 0 )
				$.each(oEls, function(i, el) {
					if ( $.inArray(el, els) < 0 )
						query.fn2.apply(el);
				});
		}
	}
};

$.extend($.livequery, {
	guid: 0,
	queries: [],
	queue: [],
	running: false,
	timeout: null,

	checkQueue: function() {
		if ( $.livequery.running && $.livequery.queue.length ) {
			var length = $.livequery.queue.length;
			// Run each Live Query currently in the queue
			while ( length-- )
				$.livequery.queries[ $.livequery.queue.shift() ].run();
		}
	},

	pause: function() {
		// Don't run anymore Live Queries until restarted
		$.livequery.running = false;
	},

	play: function() {
		// Restart Live Queries
		$.livequery.running = true;
		// Request a run of the Live Queries
		$.livequery.run();
	},

	registerPlugin: function() {
		$.each( arguments, function(i,n) {
			// Short-circuit if the method doesn't exist
			if (!$.fn[n]) return;

			// Save a reference to the original method
			var old = $.fn[n];

			// Create a new method
			$.fn[n] = function() {
				// Call the original method
				var r = old.apply(this, arguments);

				// Request a run of the Live Queries
				$.livequery.run();

				// Return the original methods result
				return r;
			}
		});
	},

	run: function(id) {
		if (id != undefined) {
			// Put the particular Live Query in the queue if it doesn't already exist
			if ( $.inArray(id, $.livequery.queue) < 0 )
				$.livequery.queue.push( id );
		}
		else
			// Put each Live Query in the queue if it doesn't already exist
			$.each( $.livequery.queries, function(id) {
				if ( $.inArray(id, $.livequery.queue) < 0 )
					$.livequery.queue.push( id );
			});

		// Clear timeout if it already exists
		if ($.livequery.timeout) clearTimeout($.livequery.timeout);
		// Create a timeout to check the queue and actually run the Live Queries
		$.livequery.timeout = setTimeout($.livequery.checkQueue, 20);
	},

	stop: function(id) {
		if (id != undefined)
			// Stop are particular Live Query
			$.livequery.queries[ id ].stop();
		else
			// Stop all Live Queries
			$.each( $.livequery.queries, function(id) {
				$.livequery.queries[ id ].stop();
			});
	}
});

// Register core DOM manipulation methods
$.livequery.registerPlugin('append', 'prepend', 'after', 'before', 'wrap', 'attr', 'removeAttr', 'addClass', 'removeClass', 'toggleClass', 'empty', 'remove', 'html');

// Run Live Queries when the Document is ready
$(function() { $.livequery.play(); });

})(jQuery);(function($){
	
	$.extend({
			 
		anchors : function(speed, easing,urlCustom,redirect){
				
			var scrollElement = 'html, body';
			$('html, body').each(function () {
				var initScrollTop = $(this).attr('scrollTop');
				$(this).attr('scrollTop', initScrollTop + 1);
				if ($(this).attr('scrollTop') == initScrollTop + 1) {
					scrollElement = this.nodeName.toLowerCase();
					$(this).attr('scrollTop', initScrollTop);
					return false;
				}    
			});
				
			speed = speed || "fast";
			easing = easing || null;
			redirect = (redirect === true) ? true : false;
			//alert(redirect);
			
			$("a.anchor").each(function(i){
                url = urlCustom || $(this).attr("rel"); 
				if(url){
					if(url.indexOf("#") != -1 && url.indexOf("#") == 0){
		
						var aParts = url.split("#",2);
						var anchor = $("#"+aParts[1]);
						
						if(anchor){
																					
							$(this).click(function(){
												   
								if($(document).height()-anchor.offset().top >= $(window).height()
								 || anchor.offset().top > $(window).height()
								 || $(document).width()-anchor.offset().left >= $(window).width()
								 || anchor.offset().left > $(window).width()){
												   
									$(scrollElement).animate({
										scrollTop: (anchor.offset().top - 35),
										scrollLeft: anchor.offset().left
									}, speed, easing, function(){
										if(redirect){ 
											window.location = url 
										}
									});
								
								}
								
								return false;
																
							});
						}
					
					}
					
				}
				
			});
			
		}
	
	});
	
})(jQuery);
$.anchors(); 
(function(e){e.fn.raty=function(l){options=e.extend({},e.fn.raty.defaults,l);if(this.attr("id")===undefined){c("Invalid selector!");return;}$this=e(this);if(options.number>20){options.number=20;}if(options.path.substring(options.path.length-1,options.path.length)!="/"){options.path+="";}var q=$this.attr("id"),x=options.path,v=options.cancelOff,t=options.cancelOn,r=options.showHalf,o=options.starHalf,h=options.starOff,n=options.starOn,s=options.onClick,g=0,m="";if(!isNaN(options.start)&&options.start>0){g=(options.start>options.number)?options.number:options.start;}for(var p=1;p<=options.number;p++){m=(options.number<=options.hintList.length&&options.hintList[p-1]!==null)?options.hintList[p-1]:p;starFile=(g>=p)?n:h;$this.append('<img id="'+q+"-"+p+'" src="'+x+starFile+'" alt="'+p+'" title="'+m+'" class="'+q+'"/>').append((p<options.number)?"&nbsp;":"");}$this.append('<input id="'+q+'-score" type="hidden" name="'+options.scoreName+'"/>');e("#"+q+"-score").val(g);if(r){var k=e("input#"+q+"-score").val(),j=Math.ceil(k),u=(j-k).toFixed(1);if(u>=0.3&&u<=0.7){j=j-0.5;e("img#"+q+"-"+Math.ceil(j)).attr("src",x+o);}else{if(u>=0.8){j--;}else{e("img#"+q+"-"+j).attr("src",x+n);}}}if(!options.readOnly){if(options.showCancel){var w='<img src="'+x+options.cancelOff+'" alt="x" title="'+options.cancelHint+'" class="button-cancel"/>';if(options.cancelPlace=="left"){$this.prepend(w+"&nbsp;");}else{$this.append("&nbsp;").append(w);}$this.css("width",options.number*20+20);e("#"+q+" img.button-cancel").live("mouseenter",function(){e(this).attr("src",x+t);e("img."+q).attr("src",x+h);}).live("mouseleave",function(){e(this).attr("src",x+v);e("img."+q).trigger("mouseout");}).live("click",function(){e("input#"+q+"-score").val(0);if(s){s(0);}});}else{$this.css("width",options.number*20);}e("img."+q).live("mouseenter",function(){var y=e("img."+q).length;for(var z=1;z<=y;z++){if(z<=this.alt){e("img#"+q+"-"+z).attr("src",x+n);}else{e("img#"+q+"-"+z).attr("src",x+h);}}}).live("click",function(){e("input#"+q+"-score").val(this.alt);if(s){s(this.alt);}});$this.live("mouseleave",function(){var D=e(this).attr("id"),z=e("img."+D).length,C=e("input#"+D+"-score").val();for(var A=1;A<=z;A++){if(A<=C){e("img#"+D+"-"+A).attr("src",x+n);}else{e("img#"+D+"-"+A).attr("src",x+h);}}if(r){var C=e("input#"+D+"-score").val(),y=Math.ceil(C),B=(y-C).toFixed(1);if(B>=0.3&&B<=0.7){y=y-0.5;e("img#"+D+"-"+Math.ceil(y)).attr("src",x+o);}else{if(B>=0.8){y--;}else{e("img#"+D+"-"+y).attr("src",x+n);}}}}).css("cursor","pointer");}else{$this.css("cursor","default");}return $this;};e.fn.raty.defaults={cancelHint:"cancel this rating!",cancelOff:"cancel-off.png",cancelOn:"cancel-on.png",cancelPlace:"left",hintList:["Xấu","Nghèo nàn","Bình thường","Tốt","Rất đẹp"],number:5,path:"img/",readOnly:false,scoreName:"score",showCancel:false,showHalf:false,starHalf:"star-half.png",start:0,starOff:"star-off.png",starOn:"star-on.png"};e.fn.raty.readOnly=function(g){if(g){e("img."+$this.attr("id")).die();$this.css("cursor","default").die();}else{d();f();b();$this.css("cursor","pointer");}return e.fn.raty;};e.fn.raty.start=function(g){a(g);return e.fn.raty;};e.fn.raty.click=function(h){var g=(h>=options.number)?options.number:h;a(g);if(options.onClick){options.onClick(g);}else{c('You should add the "onClick: function() {}" option.');}return e.fn.raty;};function d(){var g=$this.attr("id");e("img."+g).live("mouseenter",function(){var h=e("img."+g).length;for(var j=1;j<=h;j++){if(j<=this.alt){e("img#"+g+"-"+j).attr("src",options.path+options.starOn);}else{e("img#"+g+"-"+j).attr("src",options.path+options.starOff);}}});}function f(){$this.live("mouseleave",function(){var k=e(this).attr("id");var g=e("img."+k).length;var j=e("input#"+k+"-score").val();for(var h=1;h<=g;h++){if(h<=j){e("img#"+k+"-"+h).attr("src",options.path+options.starOn);}else{e("img#"+k+"-"+h).attr("src",options.path+options.starOff);}}});}function b(){var g=$this.attr("id");e("img."+g).live("click",function(){e("input#"+g+"-score").val(this.alt);});}function a(k){var j=$this.attr("id"),g=e("img."+j).length;e("input#"+j+"-score").val(k);for(var h=1;h<=g;h++){if(h<=k){e("img#"+j+"-"+h).attr("src",options.path+options.starOn);}else{e("img#"+j+"-"+h).attr("src",options.path+options.starOff);}}}function c(g){if(window.console&&window.console.log){window.console.log(g);}}})(jQuery);
if (typeof(bsn) == "undefined")
	_b = bsn = {};


if (typeof(_b.Autosuggest) == "undefined")
	_b.Autosuggest = {};
else
	alert("Autosuggest is already set!");


_b.AutoSuggest = function (id, param)
{
	// no DOM - give up!
	//
	if (!document.getElementById)
		return 0;
	
	
	
	
	// get field via DOM
	//
	this.fld = _b.DOM.gE(id);

	if (!this.fld)
		return 0;
	
	
	
	
	// init variables
	//
	this.sInp 	= "";
	this.nInpC 	= 0;
	this.aSug 	= [];
	this.iHigh 	= 0;
	
	
	
	
	// parameters object
	//
	this.oP = param ? param : {};
	
	// defaults	
	//
	var k, def = {minchars:1, meth:"get", varname:"input", className:"autosuggest", timeout:10000, delay:300, offsety:-5, shownoresults: true, noresults: "Không có từ khóa liên quan!", maxheight: 250, cache: true, maxentries: 25};
	for (k in def)
	{
		if (typeof(this.oP[k]) != typeof(def[k]))
			this.oP[k] = def[k];
	}
	
	
	// set keyup handler for field
	// and prevent autocomplete from client
	//
	var p = this;
	
	// NOTE: not using addEventListener because UpArrow fired twice in Safari
	//_b.DOM.addEvent( this.fld, 'keyup', function(ev){ return pointer.onKeyPress(ev); } );
	
	this.fld.onkeypress 	= function(ev){ return p.onKeyPress(ev); };
	this.fld.onkeyup 		= function(ev){ return p.onKeyUp(ev); };
	
	this.fld.setAttribute("autocomplete","off");
};
















_b.AutoSuggest.prototype.onKeyPress = function(ev)
{
	var key = (window.event) ? window.event.keyCode : ev.keyCode;



	// set responses to keydown events in the field
	// this allows the user to use the arrow keys to scroll through the results
	// ESCAPE clears the list
	// TAB sets the current highlighted value
	//
	var RETURN = 13;
	var TAB = 9;
	var ESC = 27;
	
	var bubble = 1;

	switch(key)
	{
		case RETURN:
			this.setHighlightedValue();
			bubble = 0;
			break;

		case ESC:
			this.clearSuggestions();
			break;
		default:
			this.getSuggestions(this.fld.value);	
	}

	return bubble;
};



_b.AutoSuggest.prototype.onKeyUp = function(ev)
{
	var key = (window.event) ? window.event.keyCode : ev.keyCode;
	


	// set responses to keydown events in the field
	// this allows the user to use the arrow keys to scroll through the results
	// ESCAPE clears the list
	// TAB sets the current highlighted value
	//

	var ARRUP = 38;
	var ARRDN = 40;
	
	var bubble = 1;

	switch(key)
	{


		case ARRUP:
			this.changeHighlight(key);
			bubble = 0;
			break;


		case ARRDN:
			this.changeHighlight(key);
			bubble = 0;
			break;
		
		
		default:
			this.getSuggestions(this.fld.value);
	}

	return bubble;
	

};








_b.AutoSuggest.prototype.getSuggestions = function (val)
{
	
	// if input stays the same, do nothing
	//
	if (val == this.sInp)
		return 0;
	
	
	// kill list
	//
	_b.DOM.remE(this.idAs);
	
	
	this.sInp = val;
	
	
	// input length is less than the min required to trigger a request
	// do nothing
	//
	if (val.length < this.oP.minchars)
	{
		this.aSug = [];
		this.nInpC = val.length;
		return 0;
	}
	
	
	
	
	var ol = this.nInpC; // old length
	this.nInpC = val.length ? val.length : 0;
	
	
	
	// if caching enabled, and user is typing (ie. length of input is increasing)
	// filter results out of aSuggestions from last request
	//
	var l = this.aSug.length;
	if (this.nInpC > ol && l && l<this.oP.maxentries && this.oP.cache)
	{
		var arr = [];
		for (var i=0;i<l;i++)
		{
			if (this.aSug[i].value.substr(0,val.length).toLowerCase() == val.toLowerCase())
				arr.push( this.aSug[i] );
		}
		this.aSug = arr;
		
		this.createList(this.aSug);
		
		
		
		return false;
	}
	else
	// do new request
	//
	{
		var pointer = this;
		var input = this.sInp;
		clearTimeout(this.ajID);
		if(input.length == 1){
			 pointer.doAjaxRequest(input)
		}
		else
			this.ajID = setTimeout( function() { pointer.doAjaxRequest(input) }, this.oP.delay );
		
	}

	return false;
};





_b.AutoSuggest.prototype.doAjaxRequest = function (input)
{
	// check that saved input is still the value of the field
	//
	
	if (input != this.fld.value)
		return false;

	var pointer = this;
	
	
	// create ajax request
	//
	if (typeof(this.oP.script) == "function")
		var url = this.oP.script(encodeURIComponent(this.sInp));
	else
		var url = this.oP.script+this.oP.varname+"="+encodeURIComponent(this.sInp);
	
	if (!url)
		return false;
	
	var meth = this.oP.meth;
	var input = this.sInp;
	
	var onSuccessFunc = function (req) { pointer.setSuggestions(req, input) };
	var onErrorFunc = function (status) { return false;};//alert("AJAX error: "+status); };

	var myAjax = new _b.Ajax();
	myAjax.makeRequest( url, meth, onSuccessFunc, onErrorFunc );
};





_b.AutoSuggest.prototype.setSuggestions = function (req, input)
{
	// if field input no longer matches what was passed to the request
	// don't show the suggestions
	//
	if (input != this.fld.value)
		return false;
	
	
	this.aSug = [];
	
	
	if (this.oP.json)
	{
		var jsondata = eval('(' + req.responseText + ')');
		
		for (var i=0;i<jsondata.results.length;i++)
		{
			this.aSug.push(  { 'id':jsondata.results[i].id, 'value':jsondata.results[i].value, 'info':jsondata.results[i].info }  );
		}
	}
	else
	{

		var xml = req.responseXML;
	
		// traverse xml
		//
		var results = xml.getElementsByTagName('results')[0].childNodes;

		for (var i=0;i<results.length;i++)
		{
			if (results[i].hasChildNodes())
				this.aSug.push(  { 'id':results[i].getAttribute('id'), 'value':results[i].childNodes[0].nodeValue, 'info':results[i].getAttribute('info') }  );
		}
	
	}
	
	this.idAs = "as_"+this.fld.id;
	

	this.createList(this.aSug);

};














_b.AutoSuggest.prototype.createList = function(arr)
{
	var pointer = this;
	
	
	
	
	// get rid of old list
	// and clear the list removal timeout
	//
	_b.DOM.remE(this.idAs);
	this.killTimeout();
	
	
	// if no results, and shownoresults is false, do nothing
	//
	if (arr.length == 0 && !this.oP.shownoresults)
		return false;
	
	
	// create holding div
	//
	var div = _b.DOM.cE("div", {id:this.idAs, className:this.oP.className});	
	
	var hcorner = _b.DOM.cE("div", {className:"as_corner"});
	var hbar = _b.DOM.cE("div", {className:"as_bar"});
	var header = _b.DOM.cE("div", {className:"as_header"});
	header.appendChild(hcorner);
	header.appendChild(hbar);
	div.appendChild(header);
	
	
	
	
	// create and populate ul
	//
	var ul = _b.DOM.cE("ul", {id:"as_ul"});
	
	
	
	
	// loop throught arr of suggestions
	// creating an LI element for each suggestion
	//
	for (var i=0;i<arr.length;i++)
	{
		// format output with the input enclosed in a EM element
		// (as HTML, not DOM)
		//
		var val = arr[i].value;
		var st = val.toLowerCase().indexOf( this.sInp.toLowerCase() );
		var output = val.substring(0,st) + "<em>" + val.substring(st, st+this.sInp.length) + "</em>" + val.substring(st+this.sInp.length);
		
		
		var span 		= _b.DOM.cE("span", {}, output, true);
		if (arr[i].info != "")
		{
			/*var br			= _b.DOM.cE("br", {});
			span.appendChild(br);*/ 
			var small		= _b.DOM.cE("small", {}, arr[i].info);
			span.appendChild(small);
		}
		
		var a 			= _b.DOM.cE("a", { href:"#" });
		
		var tl 		= _b.DOM.cE("span", {className:"tl"}, " ");
		var tr 		= _b.DOM.cE("span", {className:"tr"}, " ");
		a.appendChild(tl);
		a.appendChild(tr);  
		
		a.appendChild(span);
		
		a.name = i+1;
		a.onclick = function () { pointer.setHighlightedValue(); return false; };
		a.onmouseover = function () { pointer.setHighlight(this.name); };
		
		var li = _b.DOM.cE(  "li", {}, a  );
		
		ul.appendChild( li );
	}
	
	
	// no results
	//
	if (arr.length == 0 && this.oP.shownoresults)
	{
		var li = _b.DOM.cE(  "li", {className:"as_warning"}, this.oP.noresults  );
		ul.appendChild( li );
	}
	
	
	div.appendChild( ul );
	
	
	var fcorner = _b.DOM.cE("div", {className:"as_corner"});
	var fbar = _b.DOM.cE("div", {className:"as_bar"});
	var footer = _b.DOM.cE("div", {className:"as_footer"});
	footer.appendChild(fcorner);
	footer.appendChild(fbar);
	div.appendChild(footer);
	
	
	
	// get position of target textfield
	// position holding div below it
	// set width of holding div to width of field
	//
	var pos = _b.DOM.getPos(this.fld);
	
	div.style.left 		= pos.x + "px";
	div.style.top 		= ( pos.y + this.fld.offsetHeight + this.oP.offsety + 5) + "px";
	div.style.width 	= this.fld.offsetWidth + 143 + "px";
	
	
	
	// set mouseover functions for div
	// when mouse pointer leaves div, set a timeout to remove the list after an interval
	// when mouse enters div, kill the timeout so the list won't be removed
	//
	div.onmouseover 	= function(){ pointer.killTimeout() };
	div.onmouseout 		= function(){ pointer.resetTimeout() };


	// add DIV to document
	//
	document.getElementsByTagName("body")[0].appendChild(div);
	
	
	
	// currently no item is highlighted
	//
	this.iHigh = 0;
	
	
	
	
	
	
	// remove list after an interval
	//
	var pointer = this;
	this.toID = setTimeout(function () { pointer.clearSuggestions() }, this.oP.timeout);
};















_b.AutoSuggest.prototype.changeHighlight = function(key)
{	
	var list = _b.DOM.gE("as_ul");
	if (!list)
		return false;
	
	var n;

	if (key == 40)
		n = this.iHigh + 1;
	else if (key == 38)
		n = this.iHigh - 1;
	
	
	if (n > list.childNodes.length)
		n = list.childNodes.length;
	if (n < 1)
		n = 1;
	
	
	this.setHighlight(n);
};



_b.AutoSuggest.prototype.setHighlight = function(n)
{
	var list = _b.DOM.gE("as_ul");
	if (!list)
		return false;
	
	if (this.iHigh > 0)
		this.clearHighlight();
	
	this.iHigh = Number(n);
	
	list.childNodes[this.iHigh-1].className = "as_highlight";


	this.killTimeout();
};


_b.AutoSuggest.prototype.clearHighlight = function()
{
	var list = _b.DOM.gE("as_ul");
	if (!list)
		return false;
	
	if (this.iHigh > 0)
	{
		list.childNodes[this.iHigh-1].className = "";
		this.iHigh = 0;
	}
};


_b.AutoSuggest.prototype.setHighlightedValue = function ()
{
	if (this.iHigh)
	{
		this.sInp = this.fld.value = this.aSug[ this.iHigh-1 ].value;
		
		// move cursor to end of input (safari)
		//
		this.fld.focus();
		if (this.fld.selectionStart)
			this.fld.setSelectionRange(this.sInp.length, this.sInp.length);
		

		this.clearSuggestions();
		
		// pass selected object to callback function, if exists
		//
		if (typeof(this.oP.callback) == "function")
			this.oP.callback( this.aSug[this.iHigh-1] );
	}
};













_b.AutoSuggest.prototype.killTimeout = function()
{
	clearTimeout(this.toID);
};

_b.AutoSuggest.prototype.resetTimeout = function()
{
	clearTimeout(this.toID);
	var pointer = this;
	this.toID = setTimeout(function () { pointer.clearSuggestions() }, 1000);
};







_b.AutoSuggest.prototype.clearSuggestions = function ()
{
	
	this.killTimeout();
	
	var ele = _b.DOM.gE(this.idAs);
	var pointer = this;
	if (ele)
	{
		var fade = new _b.Fader(ele,1,0,250,function () { _b.DOM.remE(pointer.idAs) });
	}
};










// AJAX PROTOTYPE _____________________________________________


if (typeof(_b.Ajax) == "undefined")
	_b.Ajax = {};



_b.Ajax = function ()
{
	this.req = {};
	this.isIE = false;
};



_b.Ajax.prototype.makeRequest = function (url, meth, onComp, onErr)
{
	
	if (meth != "POST")
		meth = "GET";
	
	this.onComplete = onComp;
	this.onError = onErr;
	
	var pointer = this;
	
	// branch for native XMLHttpRequest object
	if (window.XMLHttpRequest)
	{
		this.req = new XMLHttpRequest();
		this.req.onreadystatechange = function () { pointer.processReqChange() };
		this.req.open("GET", url, true); //
		this.req.send(null);
	// branch for IE/Windows ActiveX version
	}
	else if (window.ActiveXObject)
	{
		this.req = new ActiveXObject("Microsoft.XMLHTTP");
		if (this.req)
		{
			this.req.onreadystatechange = function () { pointer.processReqChange() };
			this.req.open(meth, url, true);
			this.req.send();
		}
	}
};


_b.Ajax.prototype.processReqChange = function()
{
	
	// only if req shows "loaded"
	if (this.req.readyState == 4) {
		// only if "OK"
		if (this.req.status == 200)
		{
			this.onComplete( this.req );
		} else {
			this.onError( this.req.status );
		}
	}
};










// DOM PROTOTYPE _____________________________________________


if (typeof(_b.DOM) == "undefined")
	_b.DOM = {};



/* create element */
_b.DOM.cE = function ( type, attr, cont, html )
{
	var ne = document.createElement( type );
	if (!ne)
		return 0;
		
	for (var a in attr)
		ne[a] = attr[a];
	
	var t = typeof(cont);
	
	if (t == "string" && !html)
		ne.appendChild( document.createTextNode(cont) );
	else if (t == "string" && html)
		ne.innerHTML = cont;
	else if (t == "object")
		ne.appendChild( cont );

	return ne;
};



/* get element */
_b.DOM.gE = function ( e )
{
	var t=typeof(e);
	if (t == "undefined")
		return 0;
	else if (t == "string")
	{
		var re = document.getElementById( e );
		if (!re)
			return 0;
		else if (typeof(re.appendChild) != "undefined" )
			return re;
		else
			return 0;
	}
	else if (typeof(e.appendChild) != "undefined")
		return e;
	else
		return 0;
};



/* remove element */
_b.DOM.remE = function ( ele )
{
	var e = this.gE(ele);
	
	if (!e)
		return 0;
	else if (e.parentNode.removeChild(e))
		return true;
	else
		return 0;
};



/* get position */
_b.DOM.getPos = function ( e )
{
	var e = this.gE(e);

	var obj = e;

	var curleft = 0;
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curleft += obj.offsetLeft;
			obj = obj.offsetParent;
		}
	}
	else if (obj.x)
		curleft += obj.x;
	
	var obj = e;
	
	var curtop = 0;
	if (obj.offsetParent)
	{
		while (obj.offsetParent)
		{
			curtop += obj.offsetTop;
			obj = obj.offsetParent;
		}
	}
	else if (obj.y)
		curtop += obj.y;

	return {x:curleft, y:curtop};
};










// FADER PROTOTYPE _____________________________________________



if (typeof(_b.Fader) == "undefined")
	_b.Fader = {};





_b.Fader = function (ele, from, to, fadetime, callback)
{	
	if (!ele)
		return 0;
	
	this.e = ele;
	
	this.from = from;
	this.to = to;
	
	this.cb = callback;
	
	this.nDur = fadetime;
		
	this.nInt = 50;
	this.nTime = 0;
	
	var p = this;
	this.nID = setInterval(function() { p._fade() }, this.nInt);
};




_b.Fader.prototype._fade = function()
{
	this.nTime += this.nInt;
	
	var ieop = Math.round( this._tween(this.nTime, this.from, this.to, this.nDur) * 100 );
	var op = ieop / 100;
	
	if (this.e.filters) // internet explorer
	{
		try
		{
			this.e.filters.item("DXImageTransform.Microsoft.Alpha").opacity = ieop;
		} catch (e) { 
			// If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
			this.e.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity='+ieop+')';
		}
	}
	else // other browsers
	{
		this.e.style.opacity = op;
	}
	
	
	if (this.nTime == this.nDur)
	{
		clearInterval( this.nID );
		if (this.cb != undefined)
			this.cb();
	}
};



_b.Fader.prototype._tween = function(t,b,c,d)
{
	return b + ( (c-b) * (t/d) );
};/*
 *
 * Copyright (c) 2006/2007 Sam Collett (http://www.texotela.co.uk)
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Version 2.0
 * Demo: http://www.texotela.co.uk/code/jquery/newsticker/
 *
 * $LastChangedDate: 2007-05-29 11:31:36 +0100 (Tue, 29 May 2007) $
 * $Rev: 2005 $
 *
 */
 
(function($) {
/*
 * A basic news ticker.
 *
 * @name     newsticker (or newsTicker)
 * @param    delay      Delay (in milliseconds) between iterations. Default 4 seconds (4000ms)
 * @author   Sam Collett (http://www.texotela.co.uk)
 * @example  $("#news").newsticker(); // or $("#news").newsTicker(5000);
 *
 */
$.fn.newsTicker = $.fn.newsticker = function(delay)
{
	delay = delay || 5000;
	initTicker = function(el)
	{
		stopTicker(el);
		el.items = $("li", el);
		// hide all items (except first one)
		el.items.not(":eq(0)").hide().end();
		// current item
		el.currentitem = 0;
		startTicker(el);
	};
	startTicker = function(el)
	{
		el.tickfn = setInterval(function() { doTick(el) }, delay)
	};
	stopTicker = function(el)
	{
		clearInterval(el.tickfn);
	};
	pauseTicker = function(el)
	{
		el.pause = true;
	};
	resumeTicker = function(el)
	{
		el.pause = false;
	};
	doTick = function(el)
	{
		// don't run if paused
		if(el.pause) return;
		// pause until animation has finished
		el.pause = true;
		// hide current item
		$(el.items[el.currentitem]).fadeOut("slow",
			function()
			{
				$(this).hide();
				// move to next item and show
				el.currentitem = ++el.currentitem % (el.items.size());
				$(el.items[el.currentitem]).fadeIn("slow",
					function()
					{
						el.pause = false;
					}
				);
			}
		);
	};
	this.each(
		function()
		{
			if(this.nodeName.toLowerCase()!= "ul") return;
			initTicker(this);
		}
	)
	.addClass("newsticker")
	.hover(
		function()
		{
			// pause if hovered over
			pauseTicker(this);
		},
		function()
		{
			// resume when not hovered over
			resumeTicker(this);
		}
	);
	return this;
};

})(jQuery);var typeTab = 1;
var str_default = 'Nhập từ khóa tìm kiếm...';

$("#categoryId").change(function(){
    var categoryName = "";
    categoryName = $("#categoryId option:selected").text();
    $("#category_name").val(categoryName);
});

function Search(){
    if($("#txt_search").val()==str_default && $("#cmb_category").val()==0){
        return false;
    }
    var keyword, url;
    if(typeTab == 1)
    {
        keyword = getKeyword('txt_search');
        var categoryId = $("#cmb_category").val();
        var test = testKeyword(keyword);
        if(test == 0)
        {
            if(categoryId <= 0){
                alert('Bạn phải nhập từ khóa hoặc chọn danh mục để tìm kiếm!');
            }
            else{
                window.location.href = "?portal=ebay&page=category_detail&category_id="+categoryId;    
            }
            return false;
        }
        
        //Nếu test = 1=>keyword là một số thì trỏ thẳng tới trang chi tiết sản phẩm
        if(test==1){
            window.location.href = "?portal=ebay&page=item&item_id="+keyword;
            return false;
        }
        url='?portal=ebay&page=browse';
        if(keyword!='')
        {
            url+='&keyword='+keyword;
        }
        if(parseInt(categoryId)>0) url += '&category_id='+categoryId;
    }
    else
    {
        keyword = getKeyword('txt_search');
        if(keyword=='')
        {
            alert('Bạn phải nhập từ khóa!');
            return false;
        }
        else if(typeTab == 2){
            window.location.href = "?portal=raovat&page=browse&keyword_raovat="+keyword;
            return false;
        }else if(typeTab == 3){
            window.location.href = "?portal=channel&page=search&keyword="+keyword;
            return false;
        }
    }
    window.location=url;
    return false;
}

function getKeyword(id){
    var keyword = $("#"+id).val();
    keyword = keyword.replace(/([\?*#<>!\$%^&\(\)\/\\]+)/g,"");
    keyword = keyword.replace(/([ ]+)/g," ");
    keyword = keyword.replace(/\"/g, '');
    return keyword;
}

function testKeyword(keyword){
    if(keyword == '' || keyword == str_default) return 0;
    if(keyword.length>=5 && keyword == parseInt(keyword)){
        return 1;
    }
    return 2;    
}

function SetTab(index){
    typeTab = index;
    if(index==1){
        str_default = "Nhập ID sản phẩm hoặc từ khóa tìm kiếm...";
        $("#txt_search").val(str_default);
        $("#tab_menu li").removeClass("active");
        $("#product").addClass("active");
        $("#cmb_category").css('display','block');
        $("#txt_search").css('width','59.3%');
    }else if(index == 2){
        str_default = "Nhập từ khóa để tìm rao vặt...";
        $("#txt_search").val(str_default);
        $("#tab_menu li").removeClass("active");
        $("#classifield").addClass("active");
        $("#cmb_category").css('display','none');
        $("#txt_search").css('width',' 97%');
    }else if(index == 3){
        str_default = "Nhập từ khóa để tìm tin tức...";
        $("#txt_search").val(str_default);
        $("#tab_menu li").removeClass("active");
        $("#news").addClass("active");
        $("#cmb_category").css('display','none');
        $("#txt_search").css('width',' 97%');
    }
    else if(index == 4){
        str_default = "Nhập từ khóa, tìm gì cũng thấy...";
        $("#txt_search").val(str_default);
        $("#tab_menu li").removeClass("active");
        $("#product_cdt").addClass("active");
        $("#cmb_category").css('display','none');
        $("#txt_search").css('width',' 97%');
    }
}

function enterKey(e) 
{ 
    var key;
    if(window.event)
        key = window.event.keyCode;     //IE
    else
        key = e.which;     //firefox

    if(key == 13) {
        Search();
        return false;
    }
    else
        return true;
} 
$(function(){
    $("#keywordItem").blur(function(){
        if($("#keywordItem").val()==""){
            $("#keywordItem").val(str_default);          
        } 
    });
    
    $("#keywordItem").focus(function(){
        if($("#keywordItem").val()==str_default){
            $("#keywordItem").val('');          
        } 
    });
    
    $("#keywordItem").keypress(function(evt){
        if(evt.keyCode == '13') {
            Search();
            return false;
        }
        else
            return true;
    });
    
    $("#tab_menu li a").click(function(){
        var type = $(this).attr("rel");
        SetTab(type);
    });
    var input = $("#keywordItem").val();
    var options_xml = {
		script: function (input) {if(input.length >=3) {return "ajax.php?path=top_search&fnc=sugg_search_keyword&input="+input+"&testid=20";} else return false; },
		varname:"input"
	};
	var as_xml = new bsn.AutoSuggest('keywordItem', options_xml);
});

(function($) {
    $.jHelp = {
		setKey : function (key,options) {
			if( key != null && key !=""){
                alert($(options.helpID).attr('rel'));
			    $(options.helpID).attr('rel',key);
			}
		},
		
		loadHelp : function (key,options) {
            if(key != null && key != "" && key !="close"){
			    $.ajax({
                  url: options.loadURL ,
                  data : {key_help:key},
                  type: 'POST',
                  success: function(html){
                      if($(options.helpContent).css('display') == 'none'){
                         $(options.helpContent).html(html).slideDown(); 
                      }else{
                         $(options.helpContent).html(html); 
                      };
                  }
                });
            }else{
                  if($(options.helpContent).css('display') == 'none'){
                     $(options.helpContent).slideDown();
                  }else{
                     $(options.helpContent).slideUp(); 
                  };
                   
            }
		}
    };
	// Shortuct functions
	jSetKey = function(key,options) {
        var defaults = {
            helpID : '#help_user'                // vertical offset of the dialog from center screen, in pixels
        };
        var options = $.extend(defaults, options); 
		$.jHelp.setKey(key,options);
	};
	
	jLoadHelp = function(key,options) {
        var defaults = {
            helpContent: '#content_help_user',                // horizontal offset of the dialog from center screen, in pixels/
            loadURL :"ajax.php?path=user_help&fnc=LoadHelp"
        }
        var options = $.extend(defaults, options);
		$.jHelp.loadHelp(key,options);
	};
		    
})(jQuery);
(function($){
	/*  Variables  */
	$.fn.breadcrumbs = function(settings){
		var element = $(this);
		var 
		
		settings = $.extend({}, $.fn.breadcrumbs.defaults, settings);

		function _build(){
			if(settings.collapsible){
				var sz = element.children('LI').length;
				element.children('LI').children('A').css('white-space', 'nowrap').css('float', 'left');
				element.children('LI').children('A').each(function(i, el){
					if(i != sz - 1){
						$(this).css('overflow', 'hidden');
						$(this).attr('init-width', $(this).width());
						$(this).width(settings.collapsedWidth);
					}
				});
			}
			
            element.children('LI').mouseenter(function(){
                if($(this).hasClass('hover')){ return; }
                
            	_hideAllSubLevels();
            	if(!_subLevelExists($(this))){ return; }

            	// Show sub-level
            	var subLevel = $(this).children('UL');
            	_showHideSubLevel(subLevel, true);
            	
            	if(settings.collapsible && !$(this).hasClass('current')){
            		var initWidth = $(this).children('A').attr('init-width');
            		$(this).children('A').animate({width: initWidth}, 'normal');
            	}
            });
            
            element.children('LI').mouseleave(function(){
                var subLevel = $(this).children('UL');
                _showHideSubLevel(subLevel, false);
                
                if(settings.collapsible && !$(this).hasClass('current')){
                	$(this).children('A').animate({width: settings.collapsedWidth}, 'fast');
                }
            });
		};
		
		function _hideAllSubLevels(){
			element.children('LI').children('UL').each(function(){
                $(this).hide();
                $(this).parent().removeClass('hover');
			});
		};
		
		function _showHideSubLevel(subLevel, isShow){
			if(isShow){
                subLevel.parent().addClass('hover');
                if($.browser.msie){
                	var pos = subLevel.parent().position();
                	subLevel.css('left', parseInt(pos['left']));
                }
				if(settings.showSpeed != ''){ subLevel.fadeIn( settings.showSpeed ); } 
				else { subLevel.show(); }
			} else {
                subLevel.parent().removeClass('hover');
                if(settings.hideSpeed != ''){ subLevel.fadeOut( settings.hideSpeed ); } 
                else { subLevel.hide(); }
			}
		};
		
		function _subLevelExists(obj){
			return obj.children('UL').length > 0;
		};
		
		//    Entry point
		_build();
	};
	
	/*  Default Settings  */
	$.fn.breadcrumbs.defaults = {
		showSpeed:        'fast',
		hideSpeed:        '',
		collapsible:      false,
		collapsedWidth:   10
	};
})(jQuery);
$(function(){
    $(".mod-border li a").click(function(){
       var href = $(this).attr('href');
       if(href != 'javascript:;') 
            show_popup();
       return true;
    });
});$(function() {
    	$.featureList(
		$("#heartbanner-tabs li a"),
		$("#heartbanner-output li"), {
			start_item	:	1
		}
	);
    
    $("#preview a").click(function(){
        $(".jcarousel-skin-tango div span.jcarousel-prev").click();
        if($(this).attr('class') == 'active'){
            $(this).removeClass('active');
            $("#nextview a").addClass('active');        
        }
    });
    
    $("#nextview a").click(function(){
        $(".jcarousel-skin-tango div a.jcarousel-next").click();
        if($(this).attr('class') == 'active'){
            $(this).removeClass('active');
            $("#preview a").addClass('active');        
        }
    });

});/*
 * FeatureList - simple and easy creation of an interactive "Featured Items" widget
 * Examples and documentation at: http://jqueryglobe.com/article/feature_list/
 * Version: 1.0.0 (01/09/2009)
 * Copyright (c) 2009 jQueryGlobe
 * Licensed under the MIT License: http://en.wikipedia.org/wiki/MIT_License
 * Requires: jQuery v1.3+
*/
;(function($) {
	$.fn.featureList = function(options) {
		var tabs	= $(this);
		var output	= $(options.output);

		new jQuery.featureList(tabs, output, options);

		return this;	
	};

	$.featureList = function(tabs, output, options) {
		function slide(nr) {
			if (typeof nr == "undefined") {
				nr = visible_item + 1;
				nr = nr >= total_items ? 0 : nr;
			}
			tabs.removeClass('active').filter(":eq(" + nr + ")").addClass('active');

			output.filter(":visible").stop(true, true).fadeOut();
			output.filter(":eq(" + nr + ")").fadeIn(function() {
				visible_item = nr;	
			});
		}
		var options			= options || {};
		var total_items		= tabs.length;
		var visible_item	= options.start_item || 0;
		options.pause_on_hover		= options.pause_on_hover		|| true;
		options.transition_interval	= options.transition_interval	|| 2500;
        
		output.hide().eq( visible_item ).show();
		tabs.eq( visible_item ).addClass('active');

		tabs.click(function() {
			if ($(this).hasClass('active')) {
				return false;	
			}

			slide( tabs.index( this) );
		});
        
        tabs.hover(function() {
			if ($(this).hasClass('active')) {
				return false;	
			}

			slide( tabs.index( this) );
		});  
                
//
		if (options.transition_interval > 0) {
			var timer = setInterval(function () {
				slide();
			}, options.transition_interval);

			if (options.pause_on_hover) {
                tabs.mouseenter(function(){
                    clearInterval(timer);
                }).mouseleave(function(){
                    clearInterval(timer);
                    timer = setInterval(function (){
                       slide(); 
                    }, options.transition_interval);
                });
				output.mouseenter(function() {
					clearInterval( timer );
				}).mouseleave(function() {
					clearInterval( timer );
					timer = setInterval(function () {
						slide();
					}, options.transition_interval);
				});
			}
		}
	};
})(jQuery);//----------------------------------------------------------------------
function doSearchCat()
{
	var title       = $("#title").val();
    var parent_id   = $("#parent_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent&cmd=list";
	url 			+= "&title="    + title;
    url 			+= "&parent_id="+ parent_id;
	url 			+= "&status="   + status;
	url 			+= "&position=" + position;
    
	window.location.href = url;
	return false;
}
function AddCat()
{
    if(!check()) return false;
	var title       = $("#title").val();
    var parent_id   = $("#parent_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent&cmd=add";
	url 			+= "&title="    + title;
    url 			+= "&parent_id="+ parent_id;
	url 			+= "&status="   + status;
	url 			+= "&position=" + position;
    
	window.location.href = url;
}

function UpdateCat(id)
{
    if(!check()) return false;
	var title       = $("#title").val();
    var parent_id   = $("#parentId").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
    var level       = $("#level").val();
    if(level == 1) parent_id = 0;
    	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent&cmd=edit&action=1";
	url 			+= "&title="    + title;
    url 			+= "&parent_id="+ parent_id;
	url 			+= "&status="   + status;
	url 			+= "&position=" + position;
    url 			+= "&id="       + id;

	window.location.href = url;
}

function check(){
    if($("#title").val()==''){
        alert('Không để trống các ô nhập');
        return false;
    }
    return true;
}

function DeleteCat(id){
    var r=confirm("Bạn chắc chắn xóa nó chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_tabcontent&cmd=del&id='+id;
    }
    else return;
}
function DeleteAllCat(){
    var check=document.getElementsByName('check[]');
    var i=0,list_id='';
    for(i=0;i<check.length;i++){
        var check_item = check.item(i);
        if(check_item.checked){
            list_id += ','+check_item.value;
        }
    }
    if(list_id == '') return false;
    var r=confirm("Bạn chắc chắn xóa chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_tabcontent&cmd=delall&list_id='+list_id.substring(1);
    }
}
/*********************************************/
function doSearchItem()
{
	var title       = $("#title").val();
	var href        = $("#href").val();
    var cat_id      = $("#category_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent_item&cmd=list";
	url 			+= "&title="     + title;
    url 			+= "&href="      + href;
    url 			+= "&cat_id="    + cat_id;
	url 			+= "&status="    + status;
	url 			+= "&position="  + position;
    
	window.location.href = url;
	return false;
}
function AddItem()
{
    var photo = document.getElementById("image_url");
    // the file is the first element in the files property
    var file  = photo.files[0];
    //alert(file.);
    alert($("#image_url").val());return false;
    if(!check()) return false;
    var title       = $("#title").val();
    var image_url   = $("#image_url").val();
	var href        = $("#href").val();
    var cat_id      = $("#cat_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent_item&cmd=add";
	url 			+= "&title="      + title;
    url 			+= "&image_url="  + image_url;
    url 			+= "&href="       + href;
    url 			+= "&category_id="+ cat_id;
	url 			+= "&status="     + status;
	url 			+= "&position="   + position;
    
	window.location.href = url;
}

function UpdateItem(id)
{
    if(!check()) return false;
	var title       = $("#title").val();
    var price       = $("#price").val();
    var image       = $("#image_url").val();
    var href        = $("#href").val();
    var cat_id      = $("#cat_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_tabcontent_item&cmd=edit&action=1";
	url 			+= "&title="      + title;
    url 			+= "&price="      + price;
    url 			+= "&image="      + image;
    url 			+= "&href="       + href;
    url 			+= "&category_id="+ cat_id;
	url 			+= "&status="     + status;
	url 			+= "&position="   + position;
    url 			+= "&id="         + id;
	window.location.href = url;
}

function checkItem(){
    if($("#title").val()==''){
        alert('Không để trống nhãn hiển thị');
        return false;
    }
    var price = $("#price").val().replace(',','.');
    if(price - 0 != price){
        alert('Nhập giá không chính xác');
        return false;
    }
    return true;
}

function DeleteItem(id){
    var r=confirm("Bạn chắc chắn xóa nó chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_tabcontent_item&cmd=del&id='+id;
    }
}

function DeleteAllItem(){
    var check=document.getElementsByName('check[]');
    var i=0,list_id='';
    for(i=0;i<check.length;i++){
        var check_item = check.item(i);
        if(check_item.checked){
            list_id += ','+check_item.value;
        }
    }
    if(list_id == '') return false;
    var r=confirm("Bạn chắc chắn xóa chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_tabcontent_item&cmd=delall&list_id='+list_id.substring(1);
    }
}

function showParent(){
    var index = $("#level").val();
    if(index == 1){
        $("#parentid").css("display","none");
        $("#link_level2").css("display","none");
    }
    else{
        $("#parentid").removeAttr('style');
        $("#link_level2").removeAttr('style');
    }
}
//readmore
function loadTabContent(index,id){
    var i;
    if(index<3) i=0;
    else if(index<6) i=3;
    else if(index<9) i=6;

    if($("#tab"+index).html().indexOf("<li>")>-1)
    {
        for(j=i;j<=i+2;j++){
            if(j==index){
                $("#tab"+j).removeAttr("style");
                $("#readmore"+j).removeAttr("style");
                $("#CAT"+j+" a").addClass("active");         
            }
            else{
                $("#tab"+j).hide();
                $("#readmore"+j).hide();
                $("#CAT"+j+" a").removeClass("active");
            }
        }
    }
    for(j=i;j<=i+2;j++){
        if(j==index){
            $("#tab"+j).removeAttr("style");
            $("#readmore"+j).removeAttr("style");
            $("#CAT"+j+" a").addClass("active");         
        }
        else{
            $("#tab"+j).hide();
            $("#readmore"+j).hide();
            $("#CAT"+j+" a").removeClass("active");
        }
    }
    $.ajax({
            url: 'ajax.php', 
            type: 'GET',
            data: {
                'path' : 'ebay',
                'fnc' : 'home',
                'todo':'tabcontent',
                'id':id
            },
            dataType: 'html', 
            beforeSend: function(){
                
            },
            success: function(data){
                $("#tab"+index).html(data);
            }
     });     
}

$(function(){
    $(".mod-hot-tab-list ul li a").click(function(){
        var rel = $(this).attr("rel");
        rel = rel.split('^');
        loadTabContent(rel[0],rel[1]);
    });
    
    $(".row-160 a").livequery("click", function(e){
        var url = $(this).attr('href');
        if(url.indexOf('chodientu.vn') < 0){
            //vị trí của dấu "//"
            var index1 = url.indexOf('//')+2;
            var index2 = url.length-1;
            for(i=index1;i<url.length;i++){
                if(url[i]=='/') {
                    index2 = i;
                    break;   
                }
            }
            
            var domain = url.substr(index1,index2-index1+1);
            
            var w = screen.availWidth;
            var h = screen.availHeight;
            window.open('?portal=ebay&page=search_buy_iframe1&domain='+domain,'mywin1','left=0,top=0,width=330,height='+h+',toolbar=yes,resizable=yes,scrollbars=yes');
            window.open(url,'mywin2','left=348,top=0,width='+(w-348)+',height='+h+',toolbar=1,resizable=1,scrollbars=yes');
            return false;
        }
    });
    
    $(".tab-Title a").livequery("click", function(e){
        var url = $(this).attr('href');
        if(url.indexOf('timmua24h.vn') < 0){
            //vị trí của dấu "//"
            var index1 = url.indexOf('//')+2;
            var index2 = url.length-1;
            for(i=index1;i<url.length;i++){
                if(url[i]=='/') {
                    index2 = i;
                    break;   
                }
            }
            
            var domain = url.substr(index1,index2-index1+1);
            
            var w = screen.availWidth;
            var h = screen.availHeight;
            window.open('?portal=ebay&page=search_buy_iframe1&domain='+domain,'mywin1','left=0,top=0,width=330,height='+h+',toolbar=yes,resizable=yes,scrollbars=yes');
            window.open(url,'mywin2','left=348,top=0,width='+(w-348)+',height='+h+',toolbar=1,resizable=1,scrollbars=yes');
            return false;
        }
    });
});


function doSearch()
{
	var title       = $("#title").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping&cmd=list";
	url 			+= "&title="    + title;
	url 			+= "&status="   + status;
	url 			+= "&position=" + position;
    
	window.location.href = url;
	return false;
}
function Add()
{
    if(!check()) return;
	var title       = $("#title").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping&cmd=add";
	url 			+= "&title="     + title;
	url 			+= "&status="    + status;
	url 			+= "&position="  + position;
    
	window.location.href = url;
	return false;
}

function Update(id)
{
    if(!check()) return;
	var title       = $("#title").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping&cmd=edit&action=1";
	url 			+= "&title="     + title;
	url 			+= "&status="    + status;
	url 			+= "&position="  + position;
    url 			+= "&id="        + id;
	window.location.href = url;
	return false;
}

function check(){
    if($("#title").val()==''){
        alert('Không để trống các ô nhập');
        return false;
    }
    return true;
}

function Delete(id){
    var r=confirm("Bạn chắc chắn xóa nó chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_trend_shopping&cmd=del&id='+id;
    }
    else return;
}
function DeleteAll(id){
    var check=document.getElementsByName('check[]');
    var i=0,list_id='';
    for(i=0;i<check.length;i++){
        var check_item = check.item(i);
        if(check_item.checked){
            list_id += ','+check_item.value;
        }
    }
    if(list_id == '') return;
    var r=confirm("Bạn chắc chắn xóa chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_trend_shopping&cmd=delall&id='+list_id.substring(1);
    }
    else return;
}
/*********************************************/
function doSearchKey()
{
	var title       = $("#title").val();
	var href        = $("#href").val();
    var cat_id      = $("#category_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping_keyword&cmd=list";
	url 			+= "&title="        + title;
    url 			+= "&href="         + href;
    url 			+= "&category_id="  + cat_id;
	url 			+= "&status="       + status;
	url 			+= "&position="     + position;
    
	window.location.href = url;
	return false;
}
function AddKey()
{
    if(!check()) return;
    var title       = $("#title").val();
	var href        = $("#href").val();
    var cat_id      = $("#category_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping_keyword&cmd=add";
	url 			+= "&title="        + title;
    url 			+= "&href="         + href;
    url 			+= "&category_id="  + cat_id;
	url 			+= "&status="       + status;
	url 			+= "&position="     + position;
    
	window.location.href = url;
	return false;
}

function UpdateKey(id)
{
    if(!check()) return;
	var title       = $("#title").val();
    var href        = $("#href").val();
    var cat_id      = $("#category_id").val();
	var status 	    = $("#status").val();
    var position    = $("#position").val();
	
	var url			= "?portal=ebay&page=backend_ebay_trend_shopping_keyword&cmd=edit&action=1";
	url 			+= "&title="        + title;
    url 			+= "&href="         + href;
    url 			+= "&category_id="  + cat_id;
	url 			+= "&status="       + status;
	url 			+= "&position="     + position;
    url 			+= "&id="           + id;

	window.location.href = url;
	return false;
}

function checkKey(){
    if($("#title").val()==''){
        alert('Không để trống nhãn hiển thị');
        return false;
    }
    return true;
}

function DeleteKey(id){
    var r=confirm("Bạn chắc chắn xóa nó chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_trend_shopping_keyword&cmd=del&id='+id;
    }
    else return;
}
function DeleteAllKey(){
    var check=document.getElementsByName('check[]');
    var i=0,list_id='';
    for(i=0;i<check.length;i++){ 
        var check_item = check.item(i);
        if(check_item.checked){
            list_id += ','+check_item.value;
        }
    }
    if(list_id == '') return;
    
    var r=confirm("Bạn chắc chắn xóa chứ");
    if(r==true){
        window.location.href = '?portal=ebay&page=backend_ebay_trend_shopping_keyword&cmd=delall&list_id='+list_id.substring(1);
    }
    else return;
}