function genr(len, charSet) {
    charSet = charSet || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var rs = '';
    for (var i = 0; i < len; i++) {
        var randomPoz = Math.floor(Math.random() * charSet.length);
        rs += charSet.substring(randomPoz, randomPoz + 1);
    }
    return rs;
}
(function($) { 

var style = document.createElement('div').style;
var moz = style['MozBorderRadius'] !== undefined;
var webkit = style['WebkitBorderRadius'] !== undefined;
var radius = style['borderRadius'] !== undefined || style['BorderRadius'] !== undefined;
var mode = document.documentMode || 0;
var noBottomFold = $.browser.msie && (($.browser.version < 8 && !mode) || mode < 8);

var expr = $.browser.msie && (function() {
    var div = document.createElement('div');
    try { div.style.setExpression('width','0+0'); div.style.removeExpression('width'); }
    catch(e) { return false; }
    return true;
//})();
});
    
function sz(el, p) { 
    return parseInt($.css(el,p))||0; 
};
function hex2(s) {
    var s = parseInt(s).toString(16);
    return ( s.length < 2 ) ? '0'+s : s;
};
function gpc(node) {
    while(node) {
        var v = $.css(node,'backgroundColor');
        if (v && v != 'transparent' && v != 'rgba(0, 0, 0, 0)') {
	        if (v.indexOf('rgb') >= 0) { 
	            var rgb = v.match(/\d+/g); 
	            return '#'+ hex2(rgb[0]) + hex2(rgb[1]) + hex2(rgb[2]);
	        }
            return v;
		}
		node = node.parentNode; // keep walking if transparent
    }
    return '#ffffff';
};

function getWidth(fx, i, width) {
    switch(fx) {
    case 'round':  return Math.round(width*(1-Math.cos(Math.asin(i/width))));
    case 'cool':   return Math.round(width*(1+Math.cos(Math.asin(i/width))));
    case 'sharp':  return Math.round(width*(1-Math.cos(Math.acos(i/width))));
    case 'bite':   return Math.round(width*(Math.cos(Math.asin((width-i-1)/width))));
    case 'slide':  return Math.round(width*(Math.atan2(i,width/i)));
    case 'jut':    return Math.round(width*(Math.atan2(width,(width-i-1))));
    case 'curl':   return Math.round(width*(Math.atan(i)));
    case 'tear':   return Math.round(width*(Math.cos(i)));
    case 'wicked': return Math.round(width*(Math.tan(i)));
    case 'long':   return Math.round(width*(Math.sqrt(i)));
    case 'sculpt': return Math.round(width*(Math.log((width-i-1),width)));
	case 'dogfold':
    case 'dog':    return (i&1) ? (i+1) : width;
    case 'dog2':   return (i&2) ? (i+1) : width;
    case 'dog3':   return (i&3) ? (i+1) : width;
    case 'fray':   return (i%2)*width;
    case 'notch':  return width; 
	case 'bevelfold':
    case 'bevel':  return i+1;
    }
};

$.fn.corner = function(options) {
    // in 1.3+ we can fix mistakes with the ready state
	if (this.length == 0) {
        if (!$.isReady && this.selector) {
            var s = this.selector, c = this.context;
            $(function() {
                $(s,c).corner(options);
            });
        }
        return this;
	}

    return this.each(function(index){
		var $this = $(this);
		// meta values override options
		var o = [$this.attr($.fn.corner.defaults.metaAttr) || '', options || ''].join(' ').toLowerCase();
		var keep = /keep/.test(o);                       // keep borders?
		var cc = ((o.match(/cc:(#[0-9a-f]+)/)||[])[1]);  // corner color
		var sc = ((o.match(/sc:(#[0-9a-f]+)/)||[])[1]);  // strip color
		var width = parseInt((o.match(/(\d+)px/)||[])[1]) || 10; // corner width
		var re = /round|bevelfold|bevel|notch|bite|cool|sharp|slide|jut|curl|tear|fray|wicked|sculpt|long|dog3|dog2|dogfold|dog/;
		var fx = ((o.match(re)||['round'])[0]);
		var fold = /dogfold|bevelfold/.test(o);
		var edges = { T:0, B:1 };
		var opts = {
			TL:  /top|tl|left/.test(o),       TR:  /top|tr|right/.test(o),
			BL:  /bottom|bl|left/.test(o),    BR:  /bottom|br|right/.test(o)
		};
		if ( !opts.TL && !opts.TR && !opts.BL && !opts.BR )
			opts = { TL:1, TR:1, BL:1, BR:1 };
			
		// support native rounding
		if ($.fn.corner.defaults.useNative && fx == 'round' && (radius || moz || webkit) && !cc && !sc) {
			if (opts.TL)
				$this.css(radius ? 'border-top-left-radius' : moz ? '-moz-border-radius-topleft' : '-webkit-border-top-left-radius', width + 'px');
			if (opts.TR)
				$this.css(radius ? 'border-top-right-radius' : moz ? '-moz-border-radius-topright' : '-webkit-border-top-right-radius', width + 'px');
			if (opts.BL)
				$this.css(radius ? 'border-bottom-left-radius' : moz ? '-moz-border-radius-bottomleft' : '-webkit-border-bottom-left-radius', width + 'px');
			if (opts.BR)
				$this.css(radius ? 'border-bottom-right-radius' : moz ? '-moz-border-radius-bottomright' : '-webkit-border-bottom-right-radius', width + 'px');
			return;
		}
			
		var strip = document.createElement('div');
		$(strip).css({
			overflow: 'hidden',
			height: '1px',
			minHeight: '1px',
			fontSize: '1px',
			backgroundColor: sc || 'transparent',
			borderStyle: 'solid'
		});
	
        var pad = {
            T: parseInt($.css(this,'paddingTop'))||0,     R: parseInt($.css(this,'paddingRight'))||0,
            B: parseInt($.css(this,'paddingBottom'))||0,  L: parseInt($.css(this,'paddingLeft'))||0
        };

        if (typeof this.style.zoom != undefined) this.style.zoom = 1; // force 'hasLayout' in IE
        if (!keep) this.style.border = 'none';
        strip.style.borderColor = cc || gpc(this.parentNode);
        var cssHeight = $(this).outerHeight();

        for (var j in edges) {
            var bot = edges[j];
            // only add stips if needed
            if ((bot && (opts.BL || opts.BR)) || (!bot && (opts.TL || opts.TR))) {
                strip.style.borderStyle = 'none '+(opts[j+'R']?'solid':'none')+' none '+(opts[j+'L']?'solid':'none');
                var d = document.createElement('div');
                $(d).addClass('jquery-corner');
                var ds = d.style;

                bot ? this.appendChild(d) : this.insertBefore(d, this.firstChild);

                if (bot && cssHeight != 'auto') {
                    if ($.css(this,'position') == 'static')
                        this.style.position = 'relative';
                    ds.position = 'absolute';
                    ds.bottom = ds.left = ds.padding = ds.margin = '0';
                    if (expr)
                        ds.setExpression('width', 'this.parentNode.offsetWidth');
                    else
                        ds.width = '100%';
                }
                else if (!bot && $.browser.msie) {
                    if ($.css(this,'position') == 'static')
                        this.style.position = 'relative';
                    ds.position = 'absolute';
                    ds.top = ds.left = ds.right = ds.padding = ds.margin = '0';
                    
                    // fix ie6 problem when blocked element has a border width
                    if (expr) {
                        var bw = sz(this,'borderLeftWidth') + sz(this,'borderRightWidth');
                        ds.setExpression('width', 'this.parentNode.offsetWidth - '+bw+'+ "px"');
                    }
                    else
                        ds.width = '100%';
                }
                else {
                	ds.position = 'relative';
                    ds.margin = !bot ? '-'+pad.T+'px -'+pad.R+'px '+(pad.T-width)+'px -'+pad.L+'px' : 
                                        (pad.B-width)+'px -'+pad.R+'px -'+pad.B+'px -'+pad.L+'px';                
                }

                for (var i=0; i < width; i++) {
                    var w = Math.max(0,getWidth(fx,i, width));
                    var e = strip.cloneNode(false);
                    e.style.borderWidth = '0 '+(opts[j+'R']?w:0)+'px 0 '+(opts[j+'L']?w:0)+'px';
                    bot ? d.appendChild(e) : d.insertBefore(e, d.firstChild);
                }
				
				if (fold && $.support.boxModel) {
					if (bot && noBottomFold) continue;
					for (var c in opts) {
						if (!opts[c]) continue;
						if (bot && (c == 'TL' || c == 'TR')) continue;
						if (!bot && (c == 'BL' || c == 'BR')) continue;
						
						var common = { position: 'absolute', border: 'none', margin: 0, padding: 0, overflow: 'hidden', backgroundColor: strip.style.borderColor };
						var $horz = $('<div/>').css(common).css({ width: width + 'px', height: '1px' });
						switch(c) {
						case 'TL': $horz.css({ bottom: 0, left: 0 }); break;
						case 'TR': $horz.css({ bottom: 0, right: 0 }); break;
						case 'BL': $horz.css({ top: 0, left: 0 }); break;
						case 'BR': $horz.css({ top: 0, right: 0 }); break;
						}
						d.appendChild($horz[0]);
						
						var $vert = $('<div/>').css(common).css({ top: 0, bottom: 0, width: '1px', height: width + 'px' });
						switch(c) {
						case 'TL': $vert.css({ left: width }); break;
						case 'TR': $vert.css({ right: width }); break;
						case 'BL': $vert.css({ left: width }); break;
						case 'BR': $vert.css({ right: width }); break;
						}
						d.appendChild($vert[0]);
					}
				}
            }
        }
    });
};

$.fn.uncorner = function() { 
	if (radius || moz || webkit)
		this.css(radius ? 'border-radius' : moz ? '-moz-border-radius' : '-webkit-border-radius', 0);
	$('div.jquery-corner', this).remove();
	return this;
};

// expose options
$.fn.corner.defaults = {
	useNative: true, // true if plugin should attempt to use native browser support for border radius rounding
	metaAttr:  'data-corner' // name of meta attribute to use for options
};
    
})(jQuery);
//Popup
var popupStatus = 0;

//loading popup with jQuery magic!
function loadPopup(){
	//loads popup only if it is disabled
	if(popupStatus==0){
		$("#backgroundPopup").css({
			"opacity": "0.5",
			"height":"900px"
		});
		$("#backgroundPopup").fadeIn("slow");
		$("#popupImg").fadeIn("slow");
		popupStatus = 1;
	}
}
//centering popup
function centerPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupImg").height();
	var popupWidth = $("#popupImg").width();
	//centering
	$("#popupImg").css({
		"position":"fixed",
		"top": windowHeight/2-popupHeight/2+"px",
		"left": windowWidth/2-popupWidth/2+"px",
        "height":(popupHeight-20)+"px"
	});
	//only need force for IE6
	$("#popupImg").corner();
	$("#popupImg").css({
		"height": windowHeight
	});	
}
function show_popup() {
	//centering with css
	centerPopup();
	//load popup  
	loadPopup();   
}
(function($) {
    // Default configuration properties.
    var defaults = {
        vertical: false,
        rtl: false,
        start: 1,
        offset: 1,
        size: null,
        scroll: 3,
        visible: null,
        animation: 'normal',
        easing: 'swing',
        auto: 0,
        wrap: null,
        initCallback: null,
        reloadCallback: null,
        itemLoadCallback: null,
        itemFirstInCallback: null,
        itemFirstOutCallback: null,
        itemLastInCallback: null,
        itemLastOutCallback: null,
        itemVisibleInCallback: null,
        itemVisibleOutCallback: null,
        buttonNextHTML: '<a><div></div></a>',
        buttonPrevHTML: '<span><div></div></span>',
        buttonNextEvent: 'click',
        buttonPrevEvent: 'click',
        buttonNextCallback: null,
        buttonPrevCallback: null,
        itemFallbackDimension: null
    }, windowLoaded = false;

    $(window).bind('load.jcarousel', function() { windowLoaded = true; });

    /**
     * The jCarousel object.
     *
     * @constructor
     * @class jcarousel
     * @param e {HTMLElement} The element to create the carousel for.
     * @param o {Object} A set of key/value pairs to set as configuration properties.
     * @cat Plugins/jCarousel
     */
    $.jcarousel = function(e, o) {
        this.options    = $.extend({}, defaults, o || {});

        this.locked          = false;
        this.autoStopped     = false;

        this.container       = null;
        this.clip            = null;
        this.list            = null;
        this.buttonNext      = null;
        this.buttonPrev      = null;
        this.buttonNextState = null;
        this.buttonPrevState = null;

        // Only set if not explicitly passed as option
        if (!o || o.rtl === undefined) {
            this.options.rtl = ($(e).attr('dir') || $('html').attr('dir') || '').toLowerCase() == 'rtl';
        }

        this.wh = !this.options.vertical ? 'width' : 'height';
        this.lt = !this.options.vertical ? (this.options.rtl ? 'right' : 'left') : 'top';

        // Extract skin class
        var skin = '', split = e.className.split(' ');

        for (var i = 0; i < split.length; i++) {
            if (split[i].indexOf('jcarousel-skin') != -1) {
                $(e).removeClass(split[i]);
                skin = split[i];
                break;
            }
        }

        if (e.nodeName.toUpperCase() == 'UL' || e.nodeName.toUpperCase() == 'OL') {
            this.list = $(e);
            this.container = this.list.parent();

            if (this.container.hasClass('jcarousel-clip')) {
                if (!this.container.parent().hasClass('jcarousel-container')) {
                    this.container = this.container.wrap('<div></div>');
                }

                this.container = this.container.parent();
            } else if (!this.container.hasClass('jcarousel-container')) {
                this.container = this.list.wrap('<div></div>').parent();
            }
        } else {
            this.container = $(e);
            this.list = this.container.find('ul,ol').eq(0);
        }

        if (skin !== '' && this.container.parent()[0].className.indexOf('jcarousel-skin') == -1) {
            this.container.wrap('<div class=" '+ skin + '"></div>');
        }

        this.clip = this.list.parent();

        if (!this.clip.length || !this.clip.hasClass('jcarousel-clip')) {
            this.clip = this.list.wrap('<div></div>').parent();
        }

        this.buttonNext = $('.jcarousel-next', this.container);

        if (this.buttonNext.size() === 0 && this.options.buttonNextHTML !== null) {
            this.buttonNext = this.clip.after(this.options.buttonNextHTML).next();
        }

        this.buttonNext.addClass(this.className('jcarousel-next'));

        this.buttonPrev = $('.jcarousel-prev', this.container);

        if (this.buttonPrev.size() === 0 && this.options.buttonPrevHTML !== null) {
            this.buttonPrev = this.clip.after(this.options.buttonPrevHTML).next();
        }

        this.buttonPrev.addClass(this.className('jcarousel-prev'));

        this.clip.addClass(this.className('jcarousel-clip')).css({
            overflow: 'hidden',
            position: 'relative'
        });

        this.list.addClass(this.className('jcarousel-list')).css({
            overflow: 'hidden',
            position: 'relative',
            top: 0,
            margin: 0,
            padding: 0
        }).css((this.options.rtl ? 'right' : 'left'), 0);

        this.container.addClass(this.className('jcarousel-container')).css({
            position: 'relative'
        });

        if (!this.options.vertical && this.options.rtl) {
            this.container.addClass('jcarousel-direction-rtl').attr('dir', 'rtl');
        }

        var di = this.options.visible !== null ? Math.ceil(this.clipping() / this.options.visible) : null;
        var li = this.list.children('li');

        var self = this;

        if (li.size() > 0) {
            var wh = 0, j = this.options.offset;
            li.each(function() {
                self.format(this, j++);
                wh += self.dimension(this, di);
            });

            this.list.css(this.wh, (wh + 100) + 'px');

            // Only set if not explicitly passed as option
            if (!o || o.size === undefined) {
                this.options.size = li.size();
            }
        }

        // For whatever reason, .show() does not work in Safari...
        this.container.css('display', 'block');
        this.buttonNext.css('display', 'block');
        this.buttonPrev.css('display', 'block');

        this.funcNext   = function() { self.next(); };
        this.funcPrev   = function() { self.prev(); };
        this.funcResize = function() { self.reload(); };

        if (this.options.initCallback !== null) {
            this.options.initCallback(this, 'init');
        }

        if (!windowLoaded && $.browser.safari) {
            this.buttons(false, false);
            $(window).bind('load.jcarousel', function() { self.setup(); });
        } else {
            this.setup();
        }
    };

    // Create shortcut for internal use
    var $jc = $.jcarousel;

    $jc.fn = $jc.prototype = {
        jcarousel: '0.2.7'
    };

    $jc.fn.extend = $jc.extend = $.extend;

    $jc.fn.extend({
        /**
         * Setups the carousel.
         *
         * @method setup
         * @return undefined
         */
        setup: function() {
            this.first     = null;
            this.last      = null;
            this.prevFirst = null;
            this.prevLast  = null;
            this.animating = false;
            this.timer     = null;
            this.tail      = null;
            this.inTail    = false;

            if (this.locked) {
                return;
            }

            this.list.css(this.lt, this.pos(this.options.offset) + 'px');
            var p = this.pos(this.options.start, true);
            this.prevFirst = this.prevLast = null;
            this.animate(p, false);

            $(window).unbind('resize.jcarousel', this.funcResize).bind('resize.jcarousel', this.funcResize);
        },

        /**
         * Clears the list and resets the carousel.
         *
         * @method reset
         * @return undefined
         */
        reset: function() {
            this.list.empty();

            this.list.css(this.lt, '0px');
            this.list.css(this.wh, '10px');

            if (this.options.initCallback !== null) {
                this.options.initCallback(this, 'reset');
            }

            this.setup();
        },

        /**
         * Reloads the carousel and adjusts positions.
         *
         * @method reload
         * @return undefined
         */
        reload: function() {
            if (this.tail !== null && this.inTail) {
                this.list.css(this.lt, $jc.intval(this.list.css(this.lt)) + this.tail);
            }

            this.tail   = null;
            this.inTail = false;

            if (this.options.reloadCallback !== null) {
                this.options.reloadCallback(this);
            }

            if (this.options.visible !== null) {
                var self = this;
                var di = Math.ceil(this.clipping() / this.options.visible), wh = 0, lt = 0;
                this.list.children('li').each(function(i) {
                    wh += self.dimension(this, di);
                    if (i + 1 < self.first) {
                        lt = wh;
                    }
                });

                this.list.css(this.wh, wh + 'px');
                this.list.css(this.lt, -lt + 'px');
            }

            this.scroll(this.first, false);
        },

        /**
         * Locks the carousel.
         *
         * @method lock
         * @return undefined
         */
        lock: function() {
            this.locked = true;
            this.buttons();
        },

        /**
         * Unlocks the carousel.
         *
         * @method unlock
         * @return undefined
         */
        unlock: function() {
            this.locked = false;
            this.buttons();
        },

        /**
         * Sets the size of the carousel.
         *
         * @method size
         * @return undefined
         * @param s {Number} The size of the carousel.
         */
        size: function(s) {
            if (s !== undefined) {
                this.options.size = s;
                if (!this.locked) {
                    this.buttons();
                }
            }

            return this.options.size;
        },

        /**
         * Checks whether a list element exists for the given index (or index range).
         *
         * @method get
         * @return bool
         * @param i {Number} The index of the (first) element.
         * @param i2 {Number} The index of the last element.
         */
        has: function(i, i2) {
            if (i2 === undefined || !i2) {
                i2 = i;
            }

            if (this.options.size !== null && i2 > this.options.size) {
                i2 = this.options.size;
            }

            for (var j = i; j <= i2; j++) {
                var e = this.get(j);
                if (!e.length || e.hasClass('jcarousel-item-placeholder')) {
                    return false;
                }
            }

            return true;
        },

        /**
         * Returns a jQuery object with list element for the given index.
         *
         * @method get
         * @return jQuery
         * @param i {Number} The index of the element.
         */
        get: function(i) {
            return $('.jcarousel-item-' + i, this.list);
        },

        /**
         * Adds an element for the given index to the list.
         * If the element already exists, it updates the inner html.
         * Returns the created element as jQuery object.
         *
         * @method add
         * @return jQuery
         * @param i {Number} The index of the element.
         * @param s {String} The innerHTML of the element.
         */
        add: function(i, s) {
            var e = this.get(i), old = 0, n = $(s);

            if (e.length === 0) {
                var c, j = $jc.intval(i);
                e = this.create(i);
                while (true) {
                    c = this.get(--j);
                    if (j <= 0 || c.length) {
                        if (j <= 0) {
                            this.list.prepend(e);
                        } else {
                            c.after(e);
                        }
                        break;
                    }
                }
            } else {
                old = this.dimension(e);
            }

            if (n.get(0).nodeName.toUpperCase() == 'LI') {
                e.replaceWith(n);
                e = n;
            } else {
                e.empty().append(s);
            }

            this.format(e.removeClass(this.className('jcarousel-item-placeholder')), i);

            var di = this.options.visible !== null ? Math.ceil(this.clipping() / this.options.visible) : null;
            var wh = this.dimension(e, di) - old;

            if (i > 0 && i < this.first) {
                this.list.css(this.lt, $jc.intval(this.list.css(this.lt)) - wh + 'px');
            }

            this.list.css(this.wh, $jc.intval(this.list.css(this.wh)) + wh + 'px');

            return e;
        },

        /**
         * Removes an element for the given index from the list.
         *
         * @method remove
         * @return undefined
         * @param i {Number} The index of the element.
         */
        remove: function(i) {
            var e = this.get(i);

            // Check if item exists and is not currently visible
            if (!e.length || (i >= this.first && i <= this.last)) {
                return;
            }

            var d = this.dimension(e);

            if (i < this.first) {
                this.list.css(this.lt, $jc.intval(this.list.css(this.lt)) + d + 'px');
            }

            e.remove();

            this.list.css(this.wh, $jc.intval(this.list.css(this.wh)) - d + 'px');
        },

        /**
         * Moves the carousel forwards.
         *
         * @method next
         * @return undefined
         */
        next: function() {
            if (this.tail !== null && !this.inTail) {
                this.scrollTail(false);
            } else {
                this.scroll(((this.options.wrap == 'both' || this.options.wrap == 'last') && this.options.size !== null && this.last == this.options.size) ? 1 : this.first + this.options.scroll);
            }
        },

        /**
         * Moves the carousel backwards.
         *
         * @method prev
         * @return undefined
         */
        prev: function() {
            if (this.tail !== null && this.inTail) {
                this.scrollTail(true);
            } else {
                this.scroll(((this.options.wrap == 'both' || this.options.wrap == 'first') && this.options.size !== null && this.first == 1) ? this.options.size : this.first - this.options.scroll);
            }
        },

        /**
         * Scrolls the tail of the carousel.
         *
         * @method scrollTail
         * @return undefined
         * @param b {Boolean} Whether scroll the tail back or forward.
         */
        scrollTail: function(b) {
            if (this.locked || this.animating || !this.tail) {
                return;
            }

            this.pauseAuto();

            var pos  = $jc.intval(this.list.css(this.lt));

            pos = !b ? pos - this.tail : pos + this.tail;
            this.inTail = !b;

            // Save for callbacks
            this.prevFirst = this.first;
            this.prevLast  = this.last;

            this.animate(pos);
        },

        /**
         * Scrolls the carousel to a certain position.
         *
         * @method scroll
         * @return undefined
         * @param i {Number} The index of the element to scoll to.
         * @param a {Boolean} Flag indicating whether to perform animation.
         */
        scroll: function(i, a) {
            if (this.locked || this.animating) {
                return;
            }

            this.pauseAuto();
            this.animate(this.pos(i), a);
        },

        /**
         * Prepares the carousel and return the position for a certian index.
         *
         * @method pos
         * @return {Number}
         * @param i {Number} The index of the element to scoll to.
         * @param fv {Boolean} Whether to force last item to be visible.
         */
        pos: function(i, fv) {
            var pos  = $jc.intval(this.list.css(this.lt));

            if (this.locked || this.animating) {
                return pos;
            }

            if (this.options.wrap != 'circular') {
                i = i < 1 ? 1 : (this.options.size && i > this.options.size ? this.options.size : i);
            }

            var back = this.first > i;

            // Create placeholders, new list width/height
            // and new list position
            var f = this.options.wrap != 'circular' && this.first <= 1 ? 1 : this.first;
            var c = back ? this.get(f) : this.get(this.last);
            var j = back ? f : f - 1;
            var e = null, l = 0, p = false, d = 0, g;

            while (back ? --j >= i : ++j < i) {
                e = this.get(j);
                p = !e.length;
                if (e.length === 0) {
                    e = this.create(j).addClass(this.className('jcarousel-item-placeholder'));
                    c[back ? 'before' : 'after' ](e);

                    if (this.first !== null && this.options.wrap == 'circular' && this.options.size !== null && (j <= 0 || j > this.options.size)) {
                        g = this.get(this.index(j));
                        if (g.length) {
                            e = this.add(j, g.clone(true));
                        }
                    }
                }

                c = e;
                d = this.dimension(e);

                if (p) {
                    l += d;
                }

                if (this.first !== null && (this.options.wrap == 'circular' || (j >= 1 && (this.options.size === null || j <= this.options.size)))) {
                    pos = back ? pos + d : pos - d;
                }
            }

            // Calculate visible items
            var clipping = this.clipping(), cache = [], visible = 0, v = 0;
            c = this.get(i - 1);
            j = i;

            while (++visible) {
                e = this.get(j);
                p = !e.length;
                if (e.length === 0) {
                    e = this.create(j).addClass(this.className('jcarousel-item-placeholder'));
                    // This should only happen on a next scroll
                    if (c.length === 0) {
                        this.list.prepend(e);
                    } else {
                        c[back ? 'before' : 'after' ](e);
                    }

                    if (this.first !== null && this.options.wrap == 'circular' && this.options.size !== null && (j <= 0 || j > this.options.size)) {
                        g = this.get(this.index(j));
                        if (g.length) {
                            e = this.add(j, g.clone(true));
                        }
                    }
                }

                c = e;
                d = this.dimension(e);
                if (d === 0) {
                    throw new Error('jCarousel: No width/height set for items. This will cause an infinite loop. Aborting...');
                }

                if (this.options.wrap != 'circular' && this.options.size !== null && j > this.options.size) {
                    cache.push(e);
                } else if (p) {
                    l += d;
                }

                v += d;

                if (v >= clipping) {
                    break;
                }

                j++;
            }

             // Remove out-of-range placeholders
            for (var x = 0; x < cache.length; x++) {
                cache[x].remove();
            }

            // Resize list
            if (l > 0) {
                this.list.css(this.wh, this.dimension(this.list) + l + 'px');

                if (back) {
                    pos -= l;
                    this.list.css(this.lt, $jc.intval(this.list.css(this.lt)) - l + 'px');
                }
            }

            // Calculate first and last item
            var last = i + visible - 1;
            if (this.options.wrap != 'circular' && this.options.size && last > this.options.size) {
                last = this.options.size;
            }

            if (j > last) {
                visible = 0;
                j = last;
                v = 0;
                while (++visible) {
                    e = this.get(j--);
                    if (!e.length) {
                        break;
                    }
                    v += this.dimension(e);
                    if (v >= clipping) {
                        break;
                    }
                }
            }

            var first = last - visible + 1;
            if (this.options.wrap != 'circular' && first < 1) {
                first = 1;
            }

            if (this.inTail && back) {
                pos += this.tail;
                this.inTail = false;
            }

            this.tail = null;
            if (this.options.wrap != 'circular' && last == this.options.size && (last - visible + 1) >= 1) {
                var m = $jc.margin(this.get(last), !this.options.vertical ? 'marginRight' : 'marginBottom');
                if ((v - m) > clipping) {
                    this.tail = v - clipping - m;
                }
            }

            if (fv && i === this.options.size && this.tail) {
                pos -= this.tail;
                this.inTail = true;
            }

            // Adjust position
            while (i-- > first) {
                pos += this.dimension(this.get(i));
            }

            // Save visible item range
            this.prevFirst = this.first;
            this.prevLast  = this.last;
            this.first     = first;
            this.last      = last;

            return pos;
        },

        /**
         * Animates the carousel to a certain position.
         *
         * @method animate
         * @return undefined
         * @param p {Number} Position to scroll to.
         * @param a {Boolean} Flag indicating whether to perform animation.
         */
        animate: function(p, a) {
            if (this.locked || this.animating) {
                return;
            }

            this.animating = true;

            var self = this;
            var scrolled = function() {
                self.animating = false;

                if (p === 0) {
                    self.list.css(self.lt,  0);
                }

                if (!self.autoStopped && (self.options.wrap == 'circular' || self.options.wrap == 'both' || self.options.wrap == 'last' || self.options.size === null || self.last < self.options.size || (self.last == self.options.size && self.tail !== null && !self.inTail))) {
                    self.startAuto();
                }

                self.buttons();
                self.notify('onAfterAnimation');

                // This function removes items which are appended automatically for circulation.
                // This prevents the list from growing infinitely.
                if (self.options.wrap == 'circular' && self.options.size !== null) {
                    for (var i = self.prevFirst; i <= self.prevLast; i++) {
                        if (i !== null && !(i >= self.first && i <= self.last) && (i < 1 || i > self.options.size)) {
                            self.remove(i);
                        }
                    }
                }
            };

            this.notify('onBeforeAnimation');

            // Animate
            if (!this.options.animation || a === false) {
                this.list.css(this.lt, p + 'px');
                scrolled();
            } else {
                var o = !this.options.vertical ? (this.options.rtl ? {'right': p} : {'left': p}) : {'top': p};
                this.list.animate(o, this.options.animation, this.options.easing, scrolled);
            }
        },

        /**
         * Starts autoscrolling.
         *
         * @method auto
         * @return undefined
         * @param s {Number} Seconds to periodically autoscroll the content.
         */
        startAuto: function(s) {
            if (s !== undefined) {
                this.options.auto = s;
            }

            if (this.options.auto === 0) {
                return this.stopAuto();
            }

            if (this.timer !== null) {
                return;
            }

            this.autoStopped = false;

            var self = this;
            this.timer = window.setTimeout(function() { self.next(); }, this.options.auto * 1000);
        },

        /**
         * Stops autoscrolling.
         *
         * @method stopAuto
         * @return undefined
         */
        stopAuto: function() {
            this.pauseAuto();
            this.autoStopped = true;
        },

        /**
         * Pauses autoscrolling.
         *
         * @method pauseAuto
         * @return undefined
         */
        pauseAuto: function() {
            if (this.timer === null) {
                return;
            }

            window.clearTimeout(this.timer);
            this.timer = null;
        },

        /**
         * Sets the states of the prev/next buttons.
         *
         * @method buttons
         * @return undefined
         */
        buttons: function(n, p) {
            if (n == null) {
                n = !this.locked && this.options.size !== 0 && ((this.options.wrap && this.options.wrap != 'first') || this.options.size === null || this.last < this.options.size);
                if (!this.locked && (!this.options.wrap || this.options.wrap == 'first') && this.options.size !== null && this.last >= this.options.size) {
                    n = this.tail !== null && !this.inTail;
                }
            }

            if (p == null) {
                p = !this.locked && this.options.size !== 0 && ((this.options.wrap && this.options.wrap != 'last') || this.first > 1);
                if (!this.locked && (!this.options.wrap || this.options.wrap == 'last') && this.options.size !== null && this.first == 1) {
                    p = this.tail !== null && this.inTail;
                }
            }

            var self = this;

            if (this.buttonNext.size() > 0) {
                this.buttonNext.unbind(this.options.buttonNextEvent + '.jcarousel', this.funcNext);

                if (n) {
                    this.buttonNext.bind(this.options.buttonNextEvent + '.jcarousel', this.funcNext);
                }

                this.buttonNext[n ? 'removeClass' : 'addClass'](this.className('jcarousel-next-disabled')).attr('disabled', n ? false : true);

                if (this.options.buttonNextCallback !== null && this.buttonNext.data('jcarouselstate') != n) {
                    this.buttonNext.each(function() { self.options.buttonNextCallback(self, this, n); }).data('jcarouselstate', n);
                }
            } else {
                if (this.options.buttonNextCallback !== null && this.buttonNextState != n) {
                    this.options.buttonNextCallback(self, null, n);
                }
            }

            if (this.buttonPrev.size() > 0) {
                this.buttonPrev.unbind(this.options.buttonPrevEvent + '.jcarousel', this.funcPrev);

                if (p) {
                    this.buttonPrev.bind(this.options.buttonPrevEvent + '.jcarousel', this.funcPrev);
                }

                this.buttonPrev[p ? 'removeClass' : 'addClass'](this.className('jcarousel-prev-disabled')).attr('disabled', p ? false : true);

                if (this.options.buttonPrevCallback !== null && this.buttonPrev.data('jcarouselstate') != p) {
                    this.buttonPrev.each(function() { self.options.buttonPrevCallback(self, this, p); }).data('jcarouselstate', p);
                }
            } else {
                if (this.options.buttonPrevCallback !== null && this.buttonPrevState != p) {
                    this.options.buttonPrevCallback(self, null, p);
                }
            }

            this.buttonNextState = n;
            this.buttonPrevState = p;
        },

        /**
         * Notify callback of a specified event.
         *
         * @method notify
         * @return undefined
         * @param evt {String} The event name
         */
        notify: function(evt) {
            var state = this.prevFirst === null ? 'init' : (this.prevFirst < this.first ? 'next' : 'prev');

            // Load items
            this.callback('itemLoadCallback', evt, state);

            if (this.prevFirst !== this.first) {
                this.callback('itemFirstInCallback', evt, state, this.first);
                this.callback('itemFirstOutCallback', evt, state, this.prevFirst);
            }

            if (this.prevLast !== this.last) {
                this.callback('itemLastInCallback', evt, state, this.last);
                this.callback('itemLastOutCallback', evt, state, this.prevLast);
            }

            this.callback('itemVisibleInCallback', evt, state, this.first, this.last, this.prevFirst, this.prevLast);
            this.callback('itemVisibleOutCallback', evt, state, this.prevFirst, this.prevLast, this.first, this.last);
        },

        callback: function(cb, evt, state, i1, i2, i3, i4) {
            if (this.options[cb] == null || (typeof this.options[cb] != 'object' && evt != 'onAfterAnimation')) {
                return;
            }

            var callback = typeof this.options[cb] == 'object' ? this.options[cb][evt] : this.options[cb];

            if (!$.isFunction(callback)) {
                return;
            }

            var self = this;

            if (i1 === undefined) {
                callback(self, state, evt);
            } else if (i2 === undefined) {
                this.get(i1).each(function() { callback(self, this, i1, state, evt); });
            } else {
                var call = function(i) {
                    self.get(i).each(function() { callback(self, this, i, state, evt); });
                };
                for (var i = i1; i <= i2; i++) {
                    if (i !== null && !(i >= i3 && i <= i4)) {
                        call(i);
                    }
                }
            }
        },

        create: function(i) {
            return this.format('<li></li>', i);
        },

        format: function(e, i) {
            e = $(e);
            var split = e.get(0).className.split(' ');
            for (var j = 0; j < split.length; j++) {
                if (split[j].indexOf('jcarousel-') != -1) {
                    e.removeClass(split[j]);
                }
            }
            e.addClass(this.className('jcarousel-item')).addClass(this.className('jcarousel-item-' + i)).css({
                'float': (this.options.rtl ? 'right' : 'left'),
                'list-style': 'none'
            }).attr('jcarouselindex', i);
            return e;
        },

        className: function(c) {
            return c + ' ' + c + (!this.options.vertical ? '-horizontal' : '-vertical');
        },

        dimension: function(e, d) {
            var el = e.jquery !== undefined ? e[0] : e;

            var old = !this.options.vertical ?
                (el.offsetWidth || $jc.intval(this.options.itemFallbackDimension)) + $jc.margin(el, 'marginLeft') + $jc.margin(el, 'marginRight') :
                (el.offsetHeight || $jc.intval(this.options.itemFallbackDimension)) + $jc.margin(el, 'marginTop') + $jc.margin(el, 'marginBottom');

            if (d == null || old == d) {
                return old;
            }

            var w = !this.options.vertical ?
                d - $jc.margin(el, 'marginLeft') - $jc.margin(el, 'marginRight') :
                d - $jc.margin(el, 'marginTop') - $jc.margin(el, 'marginBottom');

            $(el).css(this.wh, w + 'px');

            return this.dimension(el);
        },

        clipping: function() {
            return !this.options.vertical ?
                this.clip[0].offsetWidth - $jc.intval(this.clip.css('borderLeftWidth')) - $jc.intval(this.clip.css('borderRightWidth')) :
                this.clip[0].offsetHeight - $jc.intval(this.clip.css('borderTopWidth')) - $jc.intval(this.clip.css('borderBottomWidth'));
        },

        index: function(i, s) {
            if (s == null) {
                s = this.options.size;
            }

            return Math.round((((i-1) / s) - Math.floor((i-1) / s)) * s) + 1;
        }
    });

    $jc.extend({
        /**
         * Gets/Sets the global default configuration properties.
         *
         * @method defaults
         * @return {Object}
         * @param d {Object} A set of key/value pairs to set as configuration properties.
         */
        defaults: function(d) {
            return $.extend(defaults, d || {});
        },

        margin: function(e, p) {
            if (!e) {
                return 0;
            }

            var el = e.jquery !== undefined ? e[0] : e;

            if (p == 'marginRight' && $.browser.safari) {
                var old = {'display': 'block', 'float': 'none', 'width': 'auto'}, oWidth, oWidth2;

                $.swap(el, old, function() { oWidth = el.offsetWidth; });

                old.marginRight = 0;
                $.swap(el, old, function() { oWidth2 = el.offsetWidth; });

                return oWidth2 - oWidth;
            }

            return $jc.intval($.css(el, p));
        },

        intval: function(v) {
            v = parseInt(v, 10);
            return isNaN(v) ? 0 : v;
        }
    });

    /**
     * Creates a carousel for all matched elements.
     *
     * @example $("#mycarousel").jcarousel();
     * @before <ul id="mycarousel" class="jcarousel-skin-name"><li>First item</li><li>Second item</li></ul>
     * @result
     *
     * <div class="jcarousel-skin-name">
     *   <div class="jcarousel-container">
     *     <div class="jcarousel-clip">
     *       <ul class="jcarousel-list">
     *         <li class="jcarousel-item-1">First item</li>
     *         <li class="jcarousel-item-2">Second item</li>
     *       </ul>
     *     </div>
     *     <div disabled="disabled" class="jcarousel-prev jcarousel-prev-disabled"></div>
     *     <div class="jcarousel-next"></div>
     *   </div>
     * </div>
     *
     * @method jcarousel
     * @return jQuery
     * @param o {Hash|String} A set of key/value pairs to set as configuration properties or a method name to call on a formerly created instance.
     */
    $.fn.jcarousel = function(o) {
        if (typeof o == 'string') {
            var instance = $(this).data('jcarousel'), args = Array.prototype.slice.call(arguments, 1);
            return instance[o].apply(instance, args);
        } else {
            return this.each(function() {
                $(this).data('jcarousel', new $jc(this, o));
            });
        }
    };

})(jQuery);
