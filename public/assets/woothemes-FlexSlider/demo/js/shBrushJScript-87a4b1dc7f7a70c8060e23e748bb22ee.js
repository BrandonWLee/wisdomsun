/**
 * SyntaxHighlighter
 * http://alexgorbatchev.com/SyntaxHighlighter
 *
 * SyntaxHighlighter is donationware. If you are using it, please donate.
 * http://alexgorbatchev.com/SyntaxHighlighter/donate.html
 *
 * @version
 * 3.0.83 (July 02 2010)
 * 
 * @copyright
 * Copyright (C) 2004-2010 Alex Gorbatchev.
 *
 * @license
 * Dual licensed under the MIT and GPL licenses.
 */
!function(){function t(){var t="break case catch continue default delete do else false  for function if in instanceof new null return super switch this throw true try typeof var while with",e=SyntaxHighlighter.regexLib;this.regexList=[{regex:e.multiLineDoubleQuotedString,css:"string"},{regex:e.multiLineSingleQuotedString,css:"string"},{regex:e.singleLineCComments,css:"comments"},{regex:e.multiLineCComments,css:"comments"},{regex:/\s*#.*/gm,css:"preprocessor"},{regex:new RegExp(this.getKeywords(t),"gm"),css:"keyword"}],this.forHtmlScript(e.scriptScriptTags)}"undefined"!=typeof require?SyntaxHighlighter=require("shCore").SyntaxHighlighter:null,t.prototype=new SyntaxHighlighter.Highlighter,t.aliases=["js","jscript","javascript"],SyntaxHighlighter.brushes.JScript=t,"undefined"!=typeof exports?exports.Brush=t:null}();