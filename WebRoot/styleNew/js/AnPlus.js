/*
艾恩JavaScript插件
声明:   日历功能代码非本人原创，本人只是修改部分代码实现初始化时日历日期和文本框日期的同步(原代码日历初始化只能绑定当前系统日期);
        望本日历作者能够联系本人
作者    :Anlige
QQ      :1034555083
Email   :zhanghuiguoanlige@126.com
主页    :http://www.ii-home.cn
var settings = {asc: true,url: "",dataType: "text",method: "get",data: "",succeed: function(a,b,c){return true},error: function(a,b,c){return true}}
EndragEx    : function (source,target,offSetX, offSetY)
*/
var _=window._={
        version:"艾恩JavaScript插件1.0",index:100,is_ie:(navigator.appName=='Microsoft Internet Explorer'),
        QString		: function (searchStr){var url=window.location.search;if(url.indexOf("?")>=0){url=url.substr(1);var varis=url.split("&");for(var i in varis){var Ary=varis[i].split("=");if(Ary[0].toLowerCase()==searchStr.toLowerCase()){return Ary[1];}}return "";}else{return "";}},
        extend		: function (a, b){for(var m in b){a[m]=b[m];}return a;},
        h			: function (){var b=null;if (window.ActiveXObject) {b= new ActiveXObject("Microsoft.XMLHTTP");}else if (window.XMLHttpRequest) {b= new XMLHttpRequest(); }return b;},
        r			: function (){return Math.random().toString().substr(2);},
        abs			: function (a){a=this.$(a);var b = { x: a.offsetLeft, y: a.offsetTop};a = a.offsetParent;while (a) {b.x += a.offsetLeft;b.y += a.offsetTop;a = a.offsetParent;}return b;},
        $			: function (a){return typeof a == "string" ? document.getElementById(a) : a;},
        trim		: function (a){return a.replace(/^([ \t\n\r]{0,})([^ ].*[^ ])([ \t\n\r]{0,})$/,"$2");},
        ask			: function (a){return window.confirm(typeof a == "string" ?a:"操作不可恢复,确定要执行本操作吗?");},
        len			: function (a){return (this.is_ie && a.indexOf('\n') != -1) ? a.replace(/\r?\n/g, '_').length : a.length;},
        getFocus	: function (a){if(a.style.zIndex!=this.index){this.index += 2;   var idx = this.index;  a.style.zIndex=idx;  }  },
        addEvent	: function (target, type, func) {if (target.addEventListener){target.addEventListener(type, func, false);}else if (target.attachEvent){target.attachEvent("on" + type, func);}else {target["on" + type] = func;}},
        DU			: function (p){return decodeURI(p);},
        EU			: function (p){return encodeURI(p);},
        DS			: function (p){return unescape(p);},
        ES			: function (p){return escape(p);},
        EC			: function (p){return encodeURIComponent(p);},
        DC			: function (p){return decodeURIComponent(p);},
        plus		: function (str){str=str.replace(/\+/g," ");return (str);},
		size		: function (){var xScroll, yScroll,arrayPageSize;if (window.innerHeight && window.scrollMaxY) {	xScroll = document.body.scrollWidth;yScroll = window.innerHeight + window.scrollMaxY;} else if (document.body.scrollHeight > document.body.offsetHeight){xScroll = document.body.scrollWidth;yScroll = document.body.scrollHeight;} else {xScroll = document.body.offsetWidth;yScroll = document.body.offsetHeight;}var windowWidth, windowHeight;if (self.innerHeight) {windowWidth = self.innerWidth;windowHeight = self.innerHeight;} else if (document.documentElement && document.documentElement.clientHeight) {windowWidth = document.documentElement.clientWidth;windowHeight = document.documentElement.clientHeight;} else if (document.body) {windowWidth = document.body.clientWidth;windowHeight = document.body.clientHeight;}	pageHeight=(yScroll < windowHeight)?windowHeight:yScroll;pageWidth=(xScroll < windowWidth)?windowWidth:xScroll;arrayPageSize = {w:pageWidth,h:pageHeight,w1:windowWidth,h1:windowHeight};return arrayPageSize;},
        Endrag      : {x0:0,y0:0,x1:0,y1:0,moveable:false,NS:(navigator.appName=='Netscape'),offSets:{x:0,y:0},startDrag:function (e){e = e ? e : (window.event ? window.event : null);_.getFocus(this); if(e.button==(_.Endrag.NS)?0 :1)  { if(!_.Endrag.NS){this.setCapture();}_.Endrag.x0 = e.clientX ;  _.Endrag.y0 = e.clientY ;  _.Endrag.x1 = parseInt(_.abs(this).x);  _.Endrag.y1 = parseInt(_.abs(this).y);    _.Endrag.moveable = true;  }  },   drag:function (e){e = e ? e : (window.event ? window.event : null);  if(_.Endrag.moveable){  this.style.left = (_.Endrag.x1 + e.clientX - _.Endrag.x0 - _.Endrag.offSets.x) + "px";  this.style.top  = (_.Endrag.y1 + e.clientY - _.Endrag.y0 - _.Endrag.offSets.y) + "px"; this.style.cursor = "move";  }  },   stopDrag:function (e){  if(_.Endrag.moveable)  {    if(!_.Endrag.NS){this.releaseCapture();} _.Endrag.moveable = false; this.style.cursor = "default"; }  }, offSet:function(setting){this.offSets=setting;},bind:function(obj){var obj=_.$(obj);obj.onmousedown=this.startDrag;obj.onmouseup=this.stopDrag;obj.onmousemove=this.drag;return this;}},
        EndragEx    : function (source,target,offSetX, offSetY){source=typeof(source)=="object" ? source:document.getElementById(source);target=typeof(target)=="object" ? target:document.getElementById(target);var x0=0,y0=0,x1=0,y1=0,moveable=false,NS=(navigator.appName=='Netscape');offSetX=typeof offSetX== "undefined" ? 0:offSetX;offSetY=typeof offSetY== "undefined" ? 0:offSetY;source.onmousedown=function(e){e = e ? e : (window.event ? window.event : null);_.getFocus(target); if(e.button==(NS)?0 :1)  {if(!NS){this.setCapture()}x0 = e.clientX ;  y0 = e.clientY ;  x1 = parseInt(_.abs(target).x);  y1 = parseInt(_.abs(target).y);    moveable = true;  }  };   source.onmousemove=function(e){e = e ? e : (window.event ? window.event : null);  if(moveable){  target.style.left = (x1 + e.clientX - x0 - offSetX) + "px";  target.style.top  = (y1 + e.clientY - y0 - offSetY) + "px";  this.style.cursor = "move";}  };  source.onmouseup=function (e){ if(moveable)  {   if(!NS){this.releaseCapture();}moveable = false;  this.style.cursor = "default";}  };},
        Ajax        : function (options){var settings = {asc: true,url: "",dataType: "text",method: "get",data: "",succeed: function(a,b,c){return true},error: function(a,b,c){return true}};if(options) {this.extend(settings, options);}var s=settings;var a=this.h();var u=s.url;var b=u.indexOf("?") == -1 ? false:true;u= b ? u + "&aienrnd=" + this.r() : u + "?aienrnd=" + this.r();if(s.method.toLowerCase()=="get"){u=s.data=="" ? u : u + "&" + s.data;}var d=null;if(s.method.toLowerCase()=="post"){d=s.data}a.open(s.method,u,s.asc); if(s.method.toLowerCase()=="post"){a.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");}a.onreadystatechange =function(){if(a.readyState==4){if(a.status==200){var t=s.dataType.toLowerCase();if(t=="text"){s.succeed(a.responseText,a,s);}if(t=="xml"){s.succeed(a.responseXML,a,s);}if(t=="json"){try{eval("var j=(" + a.responseText + ")");}catch(ex){j=null;}s.succeed(j,a,s);}}else{s.error(a.status,a,s);}}};a.send(d);if(!_.is_ie){if(a.readyState==4){if(a.status==200){var t=s.dataType.toLowerCase();if(t=="text"){s.succeed(a.responseText,a,s);}if(t=="xml"){s.succeed(a.responseXML,a,s);}if(t=="json"){try{eval("var j=(" + a.responseText + ")");}catch(ex){j=null;}s.succeed(j,a,s);}}else{s.error(a.status,a,s);}}}}
};

;(function(_){
	var cal=window.cal=ESONCalendar={hasFoot:true,weeks:"日一二三四五六",months:"一,二,三,四,五,六,七,八,九,十,十一,十二",start:1900,end:2050,color:{caption:"#A4B9D7",border:"#C0D0E8",tablebg:"#F6F6F6",selectedbg:"#FF9900",foot_co:"#003366",selectedco:"#ffffff"},dateBox:[],splitChar:"-",splitChar2:":",hotInput:null,initli:false,init:function(){return this.addStyle().addUI().hide();},uanv_tool_CE:function(type,id,parent,className,HTML){var obj=document.createElement(type.toUpperCase());id&&(obj.id=id);className&&(obj.className=className);HTML&&(obj.innerHTML=HTML);parent||(parent=document.body);return parent.appendChild(obj);},uanv_tool_getWeek:function(date,i){var tmp=new Date(date);tmp.setDate(i);return tmp.getDay();},uanv_tool_isIn:function(o,parent){while(o!=parent&&o!=document.body){o=o.parentNode};return o!=document.body;},onselect:function(d){this.hotInput&&(this.hotInput.value=d.y+this.splitChar+d.m+this.splitChar+d.d),this.hide()},addStyle:function(){var cssText="#ESONCalendar_Win{background:" + this.color.caption + ";position:absolute;z-index:9999}";cssText+="#ESONCalendar_caption{padding:3px;background:" + this.color.caption + ";overflow:hidden;}";cssText+=".clear{clear:both}";cssText+="#selMonth{margin-right:5px;width:80px}";cssText+="#selYear{margin-right:3px;}";cssText+="#ESONCalendar_table{background:" + this.color.tablebg + ";border-collapse:collapse;border:1px solid " + this.color.border + "}";cssText+="#ESONCalendar_table th{border:1px " + this.color.border + " solid}";cssText+="#ESONCalendar_week{background:" + this.color.border + "}";cssText+="#ESONCalendar_week th{font-size:12px;width:18px;height:18px;}";cssText+="#dateBox{font:normal 12px /120% 'arial';}";cssText+="#dateBox th{font-weight:normal}";cssText+="#dateBox .unselected{cursor:pointer;background:" + this.color.tablebg + ";}";cssText+="#dateBox .sunday{cursor:pointer;background:" + this.color.tablebg + ";color:red}";cssText+="#dateBox .current,#dateBox .selected{cursor:pointer;background:" + this.color.selectedbg + ";color:" + this.color.selectedco + "}";cssText+="#ESONCalendar_foot{padding:2px 0 2px 0;line-height:130%;text-align:center;font-size:11px;color:" + this.color.foot_co + ";background:" + this.color.border + "}";cssText+="#ESONCalendar_Win iframe{position:absolute;z-index:-1;top:0;left:0}";var STYLE=document.createElement('style');STYLE.setAttribute("type","text/css");STYLE.styleSheet&&(STYLE.styleSheet.cssText=cssText)||STYLE.appendChild(document.createTextNode(cssText));document.getElementsByTagName('head')[0].appendChild(STYLE);return this;},addUI:function(){if(this.initli){return;}this.Win=this.uanv_tool_CE("DIV","ESONCalendar_Win");KillSelectIframe=this.uanv_tool_CE("IFRAME",false,this.Win);var _caption=this.uanv_tool_CE("DIV","ESONCalendar_caption",this.Win);var selMonth=this.uanv_tool_CE("SELECT","selMonth",_caption);var selYear=this.uanv_tool_CE("SELECT","selYear",_caption);this.selMonth=selMonth;this.selYear=selYear;selMonth.onchange=selYear.onchange=function(){ESONCalendar.dateUp(new Date(selYear.value,selMonth.value,ESONCalendar.d))};for(var i=0;i<12;i++){var tmp=new Option(this.months.split(",")[i]+"月",i);selMonth.options.add(tmp); 			};for(var i=this.start;i<this.end;i++){var tmp=new Option(i,i);selYear.options.add(tmp);};this.uanv_tool_CE("DIV",false,_caption,"clear");var table=this.uanv_tool_CE("TABLE","ESONCalendar_table",this.Win);var tbody=this.uanv_tool_CE("TBODY",false,table);var tr=this.uanv_tool_CE("TR","ESONCalendar_week",tbody);for(var i=0;i<7;i++){var th=this.uanv_tool_CE("TH",false,tr,false,new String(this.weeks).charAt(i));}tbody=this.uanv_tool_CE("TBODY","dateBox",table);for(var i=0;i<6;i++){tr=this.uanv_tool_CE("TR",false,tbody);for(var j=0;j<7;j++){var thisBox=this.uanv_tool_CE("TH",false,tr,false,"&nbsp;");this.dateBox[i*7 + j]=thisBox;}};if(this.hasFoot){this.foot=this.uanv_tool_CE("DIV","ESONCalendar_foot",this.Win,false,this.footText);this.foot.innerHTML="UANV_日历 版权作者所有";}KillSelectIframe.frameBorder=0;KillSelectIframe.width=this.Win.offsetWidth;KillSelectIframe.height=this.Win.offsetHeight;document.onclick=document.body.onclick=function(e){e||(e=window.event);var src=e.target||e.srcElement;var tmp=src.nodeName.toUpperCase();if(tmp=="HTML"||tmp=="BODY"){return ESONCalendar.hide();}if(src==ESONCalendar.hotInput||ESONCalendar.uanv_tool_isIn(src,ESONCalendar.Win)){return;}ESONCalendar.hide();};this.initli=true;return this;},dateUp:function(date,first){var space=this.uanv_tool_getWeek(date,1);var m2d=31,index=1;this.y=date.getFullYear(),this.m=date.getMonth()+1,this.d=date.getDate();this.h=date.getHours();this.mi=date.getMinutes();this.s=date.getSeconds();this.selMonth.options[this.m-1].selected="selected";this.selYear.options[this.y-this.start].selected="selected";var isRN=(this.y%4==0&&this.y%4!=100||this.y%100==0&&this.y%400==0);if(/-4|-6|-9|-11/.test("-"+this.m)){m2d=30};if(this.m==2){m2d=isRN?29:28};for(var i=0;i<42;i++){var _this=this.dateBox[i];_this.isSunday=_this.className=_this.isInMonth=_this.onmouseover=_this.onmouseout=_this.onclick=null;if(i<space||i>(m2d+space-1)){_this.uanv_tool_isInMonth=false;_this.innerHTML="&nbsp;";continue};_this.innerHTML=index++;_this.className="unselected";_this.isInMonth=true;var week=this.uanv_tool_getWeek(date,_this.innerHTML);if(week==0||week==6){_this.className="sunday";_this.isSunday=true;}if(first&&(index-1)==this.d){_this.className="selected";}_this.onmouseover=function(){if(this.className!="selected")this.className="current"};_this.onmouseout=function(){if(this.className!="selected")this.className=this.isSunday?"sunday":"unselected"};_this.onclick=function(){var allD=ESONCalendar.dateBox;for(var i=0;i<allD.length;i++){var _for=allD[i];_for.className="";if(_for.isInMonth){_for.className="unselected";}if(_for.isSunday){_for.className="sunday";}};this.className="selected";ESONCalendar.d=this.innerHTML;ESONCalendar.onselect({y:ESONCalendar.y,m:ESONCalendar.m,d:this.innerHTML,h:ESONCalendar.h,mi:ESONCalendar.mi,s:ESONCalendar.s});};};return this;},showTo:function(obj){var oldObj=obj;for(var pos={x:0,y:0};obj;obj=obj.offsetParent){pos.x+=obj.offsetLeft;pos.y+=obj.offsetTop};this.Win.style.left=pos.x+"px";this.Win.style.top=(pos.y+2+oldObj.offsetHeight)+"px";this.Win.style.display="";return this;},bind:function(input){if(!this.initli){this.init();}"string"==typeof(input)&&(input=document.getElementById(input));if(!input.type||input.type.toUpperCase()!="TEXT"){return this;}input.onfocus=function(){var dates=this.value.split(ESONCalendar.splitChar);var bindD=this.value.length>0 ? new Date(dates[0],dates[1]-1,dates[2]) : new Date();ESONCalendar.dateUp(bindD,true);ESONCalendar.showTo(ESONCalendar.hotInput=this);};return this;},hide:function(){this.Win.style.display="none";return this},setInfo:function(v){this.foot.innerHTML=v;return this}}
})(_);

;(function(_){
var Ai=window.Ai=window.$A=function(obj){
	obj=_.$(obj);
	return {
		load:function(fn){
			_.addEvent(obj,"load",fn);
		},
		click:function(fn){
			_.addEvent(obj,"click",fn);
		},
		focus:function(fn){
			_.addEvent(obj,"focus",fn);
		},
		blur:function(fn){
			_.addEvent(obj,"blur",fn);
		},
		mouseover:function(fn){
			_.addEvent(obj,"mouseover",fn);
		},
		mouseout:function(fn){
			_.addEvent(obj,"mouseout",fn);
		},
		hover:function(fn,fn1){
			_.addEvent(obj,"mouseover",fn);
			_.addEvent(obj,"mouseout",fn1);
		},
		html:function(){
			if(arguments.length==1){
				obj.innerHTML=arguments[0];
				return $A(obj);
			}else{
				return obj.innerHTML;
			}
		},
		text:function(){
			if(arguments.length==1){
				if(!_.is_ie){
					obj.textContent=arguments[0];
				}else{
					obj.innerText=arguments[0];
				}
				return $A(obj);
			}else{
				return _.is_ie ? obj.innerText : obj.textContent;
			}
		},
		attr:function(){
			if(arguments.length==2){
				if(arguments[0]=="className" && !_.is_ie){
					obj.setAttribute("class",arguments[1]);
				}else{
					obj.setAttribute(arguments[0],arguments[1]);
				}
				return $A(obj);
			}else if(arguments.length==1){
				if(arguments[0]=="className" && !_.is_ie){
					return obj.getAttribute("class");
				}else{
					return obj.getAttribute(arguments[0]);
				}
				
			}
		},
		val:function(){
			if(arguments.length==1){
				obj.value=arguments[0];
				return $A(obj);
			}else{
				return obj.value;
			}
		},
		hide:function(){
			obj.style.display="none";
			return $A(obj);
		},
		show:function(){
			obj.style.display="block";
			return $A(obj);
		}
	};
};})(_);