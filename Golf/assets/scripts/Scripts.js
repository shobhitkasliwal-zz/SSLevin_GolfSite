/**
 * jQuery.ScrollTo - Easy element scrolling using jQuery.
 * Copyright (c) 2007-2009 Ariel Flesler - aflesler(at)gmail(dot)com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * Date: 5/25/2009
 * @author Ariel Flesler
 * @version 1.4.2
 *
 * http://flesler.blogspot.com/2007/10/jqueryscrollto.html
 */
;(function(d){var k=d.scrollTo=function(a,i,e){d(window).scrollTo(a,i,e)};k.defaults={axis:'xy',duration:parseFloat(d.fn.jquery)>=1.3?0:1};k.window=function(a){return d(window)._scrollable()};d.fn._scrollable=function(){return this.map(function(){var a=this,i=!a.nodeName||d.inArray(a.nodeName.toLowerCase(),['iframe','#document','html','body'])!=-1;if(!i)return a;var e=(a.contentWindow||a).document||a.ownerDocument||a;return d.browser.safari||e.compatMode=='BackCompat'?e.body:e.documentElement})};d.fn.scrollTo=function(n,j,b){if(typeof j=='object'){b=j;j=0}if(typeof b=='function')b={onAfter:b};if(n=='max')n=9e9;b=d.extend({},k.defaults,b);j=j||b.speed||b.duration;b.queue=b.queue&&b.axis.length>1;if(b.queue)j/=2;b.offset=p(b.offset);b.over=p(b.over);return this._scrollable().each(function(){var q=this,r=d(q),f=n,s,g={},u=r.is('html,body');switch(typeof f){case'number':case'string':if(/^([+-]=)?\d+(\.\d+)?(px|%)?$/.test(f)){f=p(f);break}f=d(f,this);case'object':if(f.is||f.style)s=(f=d(f)).offset()}d.each(b.axis.split(''),function(a,i){var e=i=='x'?'Left':'Top',h=e.toLowerCase(),c='scroll'+e,l=q[c],m=k.max(q,i);if(s){g[c]=s[h]+(u?0:l-r.offset()[h]);if(b.margin){g[c]-=parseInt(f.css('margin'+e))||0;g[c]-=parseInt(f.css('border'+e+'Width'))||0}g[c]+=b.offset[h]||0;if(b.over[h])g[c]+=f[i=='x'?'width':'height']()*b.over[h]}else{var o=f[h];g[c]=o.slice&&o.slice(-1)=='%'?parseFloat(o)/100*m:o}if(/^\d+$/.test(g[c]))g[c]=g[c]<=0?0:Math.min(g[c],m);if(!a&&b.queue){if(l!=g[c])t(b.onAfterFirst);delete g[c]}});t(b.onAfter);function t(a){r.animate(g,j,b.easing,a&&function(){a.call(this,n,b)})}}).end()};k.max=function(a,i){var e=i=='x'?'Width':'Height',h='scroll'+e;if(!d(a).is('html,body'))return a[h]-d(a)[e.toLowerCase()]();var c='client'+e,l=a.ownerDocument.documentElement,m=a.ownerDocument.body;return Math.max(l[h],m[h])-Math.min(l[c],m[c])};function p(a){return typeof a=='object'?a:{top:a,left:a}}})(jQuery);

/*
jQuery Waypoints - v1.1.4
Copyright (c) 2011-2012 Caleb Troughton
Dual licensed under the MIT license and GPL license.
https://github.com/imakewebthings/jquery-waypoints/blob/master/MIT-license.txt
https://github.com/imakewebthings/jquery-waypoints/blob/master/GPL-license.txt
*/
(function($,k,m,i,d){var e=$(i),g="waypoint.reached",b=function(o,n){o.element.trigger(g,n);if(o.options.triggerOnce){o.element[k]("destroy")}},h=function(p,o){var n=o.waypoints.length-1;while(n>=0&&o.waypoints[n].element[0]!==p[0]){n-=1}return n},f=[],l=function(n){$.extend(this,{element:$(n),oldScroll:0,waypoints:[],didScroll:false,didResize:false,doScroll:$.proxy(function(){var q=this.element.scrollTop(),p=q>this.oldScroll,s=this,r=$.grep(this.waypoints,function(u,t){return p?(u.offset>s.oldScroll&&u.offset<=q):(u.offset<=s.oldScroll&&u.offset>q)}),o=r.length;if(!this.oldScroll||!q){$[m]("refresh")}this.oldScroll=q;if(!o){return}if(!p){r.reverse()}$.each(r,function(u,t){if(t.options.continuous||u===o-1){b(t,[p?"down":"up"])}})},this)});$(n).scroll($.proxy(function(){if(!this.didScroll){this.didScroll=true;i.setTimeout($.proxy(function(){this.doScroll();this.didScroll=false},this),$[m].settings.scrollThrottle)}},this)).resize($.proxy(function(){if(!this.didResize){this.didResize=true;i.setTimeout($.proxy(function(){$[m]("refresh");this.didResize=false},this),$[m].settings.resizeThrottle)}},this));e.load($.proxy(function(){this.doScroll()},this))},j=function(n){var o=null;$.each(f,function(p,q){if(q.element[0]===n){o=q;return false}});return o},c={init:function(o,n){this.each(function(){var u=$.fn[k].defaults.context,q,t=$(this);if(n&&n.context){u=n.context}if(!$.isWindow(u)){u=t.closest(u)[0]}q=j(u);if(!q){q=new l(u);f.push(q)}var p=h(t,q),s=p<0?$.fn[k].defaults:q.waypoints[p].options,r=$.extend({},s,n);r.offset=r.offset==="bottom-in-view"?function(){var v=$.isWindow(u)?$[m]("viewportHeight"):$(u).height();return v-$(this).outerHeight()}:r.offset;if(p<0){q.waypoints.push({element:t,offset:null,options:r})}else{q.waypoints[p].options=r}if(o){t.bind(g,o)}if(n&&n.handler){t.bind(g,n.handler)}});$[m]("refresh");return this},remove:function(){return this.each(function(o,p){var n=$(p);$.each(f,function(r,s){var q=h(n,s);if(q>=0){s.waypoints.splice(q,1)}})})},destroy:function(){return this.unbind(g)[k]("remove")}},a={refresh:function(){$.each(f,function(r,s){var q=$.isWindow(s.element[0]),n=q?0:s.element.offset().top,p=q?$[m]("viewportHeight"):s.element.height(),o=q?0:s.element.scrollTop();$.each(s.waypoints,function(u,x){if(!x){return}var t=x.options.offset,w=x.offset;if(typeof x.options.offset==="function"){t=x.options.offset.apply(x.element)}else{if(typeof x.options.offset==="string"){var v=parseFloat(x.options.offset);t=x.options.offset.indexOf("%")?Math.ceil(p*(v/100)):v}}x.offset=x.element.offset().top-n+o-t;if(x.options.onlyOnScroll){return}if(w!==null&&s.oldScroll>w&&s.oldScroll<=x.offset){b(x,["up"])}else{if(w!==null&&s.oldScroll<w&&s.oldScroll>=x.offset){b(x,["down"])}else{if(!w&&o>x.offset){b(x,["down"])}}}});s.waypoints.sort(function(u,t){return u.offset-t.offset})})},viewportHeight:function(){return(i.innerHeight?i.innerHeight:e.height())},aggregate:function(){var n=$();$.each(f,function(o,p){$.each(p.waypoints,function(q,r){n=n.add(r.element)})});return n}};$.fn[k]=function(n){if(c[n]){return c[n].apply(this,Array.prototype.slice.call(arguments,1))}else{if(typeof n==="function"||!n){return c.init.apply(this,arguments)}else{if(typeof n==="object"){return c.init.apply(this,[null,n])}else{$.error("Method "+n+" does not exist on jQuery "+k)}}}};$.fn[k].defaults={continuous:true,offset:0,triggerOnce:false,context:i};$[m]=function(n){if(a[n]){return a[n].apply(this)}else{return a.aggregate()}};$[m].settings={resizeThrottle:200,scrollThrottle:100};e.load(function(){$[m]("refresh")})})(jQuery,"waypoint","waypoints",this);



$(function() {

	// Do our DOM lookups beforehand
	var nav_container = $(".nav-container");
	var nav = $("nav");
	
	var top_spacing = 15;
	var waypoint_offset = 50;

	nav_container.waypoint({
		handler: function(event, direction) {
			
			if (direction == 'down') {
			
				nav_container.css({ 'height':nav.outerHeight() });		
				nav.stop().addClass("sticky").css("top",-nav.outerHeight()).animate({"top":top_spacing});
				
			} else {
			
				nav_container.css({ 'height':'auto' });
				nav.stop().removeClass("sticky").css("top",nav.outerHeight()+waypoint_offset).animate({"top":""});
				
			}
			
		},
		offset: function() {
			return -nav.outerHeight()-waypoint_offset;
		}
	});
	
	var sections = $("section");
	var navigation_links = $("nav a");
	
	sections.waypoint({
		handler: function(event, direction) {
		
			var active_section;
			active_section = $(this);
			if (direction === "up") active_section = active_section.prev();

			var active_link = $('nav a[href="#' + active_section.attr("id") + '"]');
			navigation_links.removeClass("selected");
			active_link.addClass("selected");

		},
		offset: '25%'
	})
	
	
	navigation_links.click( function(event) {

		$.scrollTo(
			$(this).attr("href"),
			{
				duration: 400,
				offset: { 'left':0, 'top':-0.08*$(window).height() }
			}
		);
	});


});


/*  * $ showLoading plugin v1.0  *  * Copyright (c) 2009 Jim Keller  * Context - http://www.contextllc.com  *  * Dual licensed under the MIT and GPL licenses.  *  */
$.fn.showLoading = function (options) { var indicatorID; var settings = { 'addClass': '', 'beforeShow': '', 'afterShow': '', 'hPos': 'center', 'vPos': 'center', 'indicatorZIndex': 5001, 'overlayZIndex': 5000, 'parent': '', 'marginTop': 0, 'marginLeft': 0, 'overlayWidth': null, 'overlayHeight': null }; $.extend(settings, options); var loadingDiv = $('<div></div>'); var overlayDiv = $('<div></div>'); if (settings.indicatorID) { indicatorID = settings.indicatorID; } else { indicatorID = $(this).attr('id'); } $(loadingDiv).attr('id', 'loading-indicator-' + indicatorID); $(loadingDiv).addClass('loading-indicator'); if (settings.addClass) { $(loadingDiv).addClass(settings.addClass); } $(overlayDiv).css('display', 'none'); $(document.body).append(overlayDiv); $(overlayDiv).attr('id', 'loading-indicator-' + indicatorID + '-overlay'); $(overlayDiv).addClass('loading-indicator-overlay'); if (settings.addClass) { $(overlayDiv).addClass(settings.addClass + '-overlay'); } var overlay_width; var overlay_height; var border_top_width = $(this).css('border-top-width'); var border_left_width = $(this).css('border-left-width'); border_top_width = isNaN(parseInt(border_top_width)) ? 0 : border_top_width; border_left_width = isNaN(parseInt(border_left_width)) ? 0 : border_left_width; var overlay_left_pos = $(this).offset().left + parseInt(border_left_width); var overlay_top_pos = $(this).offset().top + parseInt(border_top_width); if (settings.overlayWidth !== null) { overlay_width = settings.overlayWidth; } else { overlay_width = parseInt($(this).width()) + parseInt($(this).css('padding-right')) + parseInt($(this).css('padding-left')); } if (settings.overlayHeight !== null) { overlay_height = settings.overlayWidth; } else { overlay_height = parseInt($(this).height()) + parseInt($(this).css('padding-top')) + parseInt($(this).css('padding-bottom')); } $(overlayDiv).css('width', overlay_width.toString() + 'px'); $(overlayDiv).css('height', overlay_height.toString() + 'px'); $(overlayDiv).css('left', overlay_left_pos.toString() + 'px'); $(overlayDiv).css('position', 'absolute'); $(overlayDiv).css('top', overlay_top_pos.toString() + 'px'); $(overlayDiv).css('z-index', settings.overlayZIndex); if (settings.overlayCSS) { $(overlayDiv).css(settings.overlayCSS); } $(loadingDiv).css('display', 'none'); $(document.body).append(loadingDiv); $(loadingDiv).css('position', 'absolute'); $(loadingDiv).css('z-index', settings.indicatorZIndex); var indicatorTop = overlay_top_pos; if (settings.marginTop) { indicatorTop += parseInt(settings.marginTop); } var indicatorLeft = overlay_left_pos; if (settings.marginLeft) { indicatorLeft += parseInt(settings.marginTop); } if (settings.hPos.toString().toLowerCase() == 'center') { $(loadingDiv).css('left', (indicatorLeft + (($(overlayDiv).width() - parseInt($(loadingDiv).width())) / 2)).toString() + 'px'); } else if (settings.hPos.toString().toLowerCase() == 'left') { $(loadingDiv).css('left', (indicatorLeft + parseInt($(overlayDiv).css('margin-left'))).toString() + 'px'); } else if (settings.hPos.toString().toLowerCase() == 'right') { $(loadingDiv).css('left', (indicatorLeft + ($(overlayDiv).width() - parseInt($(loadingDiv).width()))).toString() + 'px'); } else { $(loadingDiv).css('left', (indicatorLeft + parseInt(settings.hPos)).toString() + 'px'); } if (settings.vPos.toString().toLowerCase() == 'center') { $(loadingDiv).css('top', (indicatorTop + (($(overlayDiv).height() - parseInt($(loadingDiv).height())) / 2)).toString() + 'px'); } else if (settings.vPos.toString().toLowerCase() == 'top') { $(loadingDiv).css('top', indicatorTop.toString() + 'px'); } else if (settings.vPos.toString().toLowerCase() == 'bottom') { $(loadingDiv).css('top', (indicatorTop + ($(overlayDiv).height() - parseInt($(loadingDiv).height()))).toString() + 'px'); } else { $(loadingDiv).css('top', (indicatorTop + parseInt(settings.vPos)).toString() + 'px'); } if (settings.css) { $(loadingDiv).css(settings.css); } var callback_options = { 'overlay': overlayDiv, 'indicator': loadingDiv, 'element': this }; if (typeof (settings.beforeShow) == 'function') { settings.beforeShow(callback_options); } $(overlayDiv).show(); $(loadingDiv).show(); if (typeof (settings.afterShow) == 'function') { settings.afterShow(callback_options); } return this; }; $.fn.hideLoading = function (options) { var settings = {}; $.extend(settings, options); if (settings.indicatorID) { indicatorID = settings.indicatorID; } else { indicatorID = $(this).attr('id'); } $(document.body).find('#loading-indicator-' + indicatorID).remove(); $(document.body).find('#loading-indicator-' + indicatorID + '-overlay').remove(); return this; };

jQuery.cookie = function (e, t, n) { if (arguments.length > 1 && String(t) !== "[object Object]") { n = jQuery.extend({}, n); if (t === null || t === undefined) { n.expires = -1 } if (typeof n.expires === "number") { var r = n.expires, i = n.expires = new Date; i.setDate(i.getDate() + r) } t = String(t); return document.cookie = [encodeURIComponent(e), "=", n.raw ? t : encodeURIComponent(t), n.expires ? "; expires=" + n.expires.toUTCString() : "", n.path ? "; path=" + n.path : "", n.domain ? "; domain=" + n.domain : "", n.secure ? "; secure" : ""].join("") } n = t || {}; var s, o = n.raw ? function (e) { return e } : decodeURIComponent; return (s = (new RegExp("(?:^|; )" + encodeURIComponent(e) + "=([^;]*)")).exec(document.cookie)) ? o(s[1]) : null }

$(function () { function i() { var t = false; for (var n = 1; n < e; ++n) { var r = s(n); if (r == -1) t = true } $("#formElem").data("errors", t) } function s(t) { if (t == e) return; var n = 1; var r = false; $("#formElem").children(":nth-child(" + parseInt(t) + ")").find(":input:not(button)").each(function () { var e = $(this); var t = jQuery.trim(e.val()).length; if (t == "") { r = true; e.css("background-color", "#FFEDEF") } else e.css("background-color", "#FFFFFF") }); var i = $("#navigation li:nth-child(" + parseInt(t) + ") a"); i.parent().find(".error,.checked").remove(); var s = "checked"; if (r) { n = -1; s = "error" } $('<span class="' + s + '"></span>').insertAfter(i); return n } var e = $("#formElem").children().length; var t = 1; var n = 0; var r = new Array; $("#steps .step").each(function (e) { var t = $(this); r[e] = n; n += t.width() }); $("#steps").width(n); $("#formElem").children(":first").find(":input:first").focus(); $("#navigation").show(); $("#navigation a").bind("click", function (n) { var o = $(this); var u = t; o.closest("ul").find("li").removeClass("selected"); o.parent().addClass("selected"); t = o.parent().index() + 1; $("#steps").stop().animate({ marginLeft: "-" + r[t - 1] + "px" }, 500, function () { if (t == e) i(); else s(u); $("#formElem").children(":nth-child(" + parseInt(t) + ")").find(":input:first").focus() }); n.preventDefault() }); $("#formElem > fieldset").each(function () { var e = $(this); e.children(":last").find(":input").keydown(function (e) { if (e.which == 9) { $("#navigation li:nth-child(" + (parseInt(t) + 1) + ") a").click(); $(this).blur(); e.preventDefault() } }) }); $("#registerButton").bind("click", function () { if ($("#formElem").data("errors")) { alert("Please correct the errors in the Form"); return false } }) })