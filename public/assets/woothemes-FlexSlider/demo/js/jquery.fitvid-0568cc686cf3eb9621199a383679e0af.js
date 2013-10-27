/*! 
* FitVids 1.0
*
* Copyright 2011, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
* Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
* Released under the WTFPL license - http://sam.zoy.org/wtfpl/
*
* Date: Thu Sept 01 18:00:00 2011 -0500
*/
!function(t){t.fn.fitVids=function(e){var i={customSelector:null},n=document.createElement("div"),s=document.getElementsByTagName("base")[0]||document.getElementsByTagName("script")[0];return n.className="fit-vids-style",n.innerHTML="&shy;<style>               .fluid-width-video-wrapper {                 width: 100%;                              position: relative;                       padding: 0;                            }                                                                                   .fluid-width-video-wrapper iframe,        .fluid-width-video-wrapper object,        .fluid-width-video-wrapper embed {           position: absolute;                       top: 0;                                   left: 0;                                  width: 100%;                              height: 100%;                          }                                       </style>",s.parentNode.insertBefore(n,s),e&&t.extend(i,e),this.each(function(){var e=["iframe[src^='http://player.vimeo.com']","iframe[src^='http://www.youtube.com']","iframe[src^='https://www.youtube.com']","iframe[src^='http://www.kickstarter.com']","iframe[src^='http://fast.wistia.com']","object","embed"];i.customSelector&&e.push(i.customSelector);var n=t(this).find(e.join(","));n.each(function(){var e=t(this);if(!("embed"==this.tagName.toLowerCase()&&e.parent("object").length||e.parent(".fluid-width-video-wrapper").length)){var i="object"==this.tagName.toLowerCase()?e.attr("height"):e.height(),n=i/e.width();if(!e.attr("id")){var s="fitvid"+Math.floor(999999*Math.random());e.attr("id",s)}e.wrap('<div class="fluid-width-video-wrapper"></div>').parent(".fluid-width-video-wrapper").css("padding-top",100*n+"%"),e.removeAttr("height").removeAttr("width")}})})}}(jQuery);