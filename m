Return-Path: <KWLIU@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420VMP3pS2zF13F
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 12:44:31 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w7T2EOmQ031443
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 05:14:24 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML02.nuvoton.com
 (10.190.1.47) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Wed, 29 Aug
 2018 05:44:22 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Wed, 29 Aug
 2018 10:44:20 +0800
Received: from NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8]) by
 NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8%13]) with mapi id
 15.00.1130.005; Wed, 29 Aug 2018 10:44:20 +0800
From: <KWLIU@nuvoton.com>
To: <1450335857@qq.com>, <eajames@linux.vnet.ibm.com>, <ed.tanous@intel.com>, 
 <openbmc@lists.ozlabs.org>
Subject: RE: Re:RE: KVM Support?
Thread-Topic: Re:RE: KVM Support?
Thread-Index: AQHUPr3mS7WanYNBSEaR175bkHTQlaTWAR3A
Date: Wed, 29 Aug 2018 02:44:20 +0000
Message-ID: <fb3de0e28c5b4e558513b58489c7685a@NTHCML01A.nuvoton.com>
References: <tencent_761BDA1B135050F033DFE337@qq.com>
In-Reply-To: <tencent_761BDA1B135050F033DFE337@qq.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [27.242.103.51]
Content-Type: multipart/alternative;
 boundary="_000_fb3de0e28c5b4e558513b58489c7685aNTHCML01Anuvotoncom_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 02:44:37 -0000

--_000_fb3de0e28c5b4e558513b58489c7685aNTHCML01Anuvotoncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Xiuzhi:

I think we are using different bases of the openbmc, this patch is really w=
orking on my side
Sorry for I cannot find the exact error in your message.

Thanks,
Joseph
From: xiuzhi [mailto:1450335857@qq.com]
Sent: Tuesday, August 28, 2018 6:57 PM
To: Eddie James; Tanous, Ed; CS20 KWLiu; openbmc
Subject: Re:RE: KVM Support?

Hi Joseph, Ed,
   There was an error when I  updated the patches https://github.com/Nuvoto=
n-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364290cce669=
609088ac<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_=
Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8=
f0364290cce669609088ac&d=3DDwMGAw&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1=
k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk=
7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0=
&e=3D>

Would you like to give me some suggestions to debug it?
 When I logged in https://<bmc_ip>/#/kvm<https://%3cbmc_ip%3e/#/kvm>, The e=
rrors read:
"
WebSocket on-close event  app.89eaa0b6e5e9417cb602.js:38:675915
Failed when connecting: Connection closed (code: 1005)  app.89eaa0b6e5e9417=
cb602.js:38:685584
        RFB.prototype._fail https://192.168.120.132/app.89eaa0b6e5e9417cb60=
2.js:38:685584
        RFB/< https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:676138
        Websock.prototype.open/this._websocket.onclose< https://192.168.120=
.132/app.89eaa0b6e5e9417cb602.js:38:778159
New state 'disconnecting', was 'connecting'.  app.89eaa0b6e5e9417cb602.js:3=
8:684301
>> RFB.disconnect  app.89eaa0b6e5e9417cb602.js:38:680495
>> Keyboard.allKeysUp  app.89eaa0b6e5e9417cb602.js:38:739659
<< Keyboard.allKeysUp  app.89eaa0b6e5e9417cb602.js:38:739828
"
The line 38 of app.89eaa0b6e5e9417cb602.js is :
void 0!=3D=3Dmodule&&void 0!=3D=3Dexports&&module.exports=3D=3D=3Dexports&&=
(module.exports=3D"ui.router"),function(window,angular,undefined){"use stri=
ct";var $$UMFP,isDefined=3Dangular.isDefined,isFunction=3Dangular.isFunctio=
n,isString=3Dangular.isString,isObject=3Dangular.isObject,isArray=3Dangular=
.isArray,forEach=3Dangular.forEach,extend=3Dangular.extend,copy=3Dangular.c=
opy,toJson=3Dangular.toJson;function inherit(parent,extra){return extend(ne=
w(extend(function(){},{prototype:parent})),extra)}function merge(dst){retur=
n forEach(arguments,function(obj){obj!=3D=3Ddst&&forEach(obj,function(value=
,key){dst.hasOwnProperty(key)||(dst[key]=3Dvalue)})}),dst}function objectKe=
ys(object){if(Object.keys)return Object.keys(object);var result=3D[];return=
 forEach(object,function(val,key){result.push(key)}),result}function indexO=
f(array,value){if(Array.prototype.indexOf)return array.indexOf(value,Number=
(arguments[2])||0);var len=3Darray.length>>>0,from=3DNumber(arguments[2])||=
0;for((from=3Dfrom<0?Math.ceil(from):Math.floor(from))<0&&(from+=3Dlen);fro=
m<len;from++)if(from in array&&array[from]=3D=3D=3Dvalue)return from;return=
-1}function inheritParams(currentParams,newParams,$current,$to) ... ...

Best,
Xiuzhi
>Hi Eddie & Ed:



>Do you have any plan to support non-jpeg video stream in obmc-iKVM?

>It is possible some platforms don't have hardware JPEG engine, instead hav=
e the RGB video stream.

>If possible to support RGB video stream, I think it would be better if you=
 can add the video frame differentiation in obmc-iKVM because we don't need=
 to send the full screen >to VNC client on every request, it can reduce the=
 buffer size at least. (libvncserver already has the video frame differenti=
ation)



>Also, I have implemented a KVM application for our platform(nuvoton evb-np=
cm750) which has hardware video frame differentiation and hardware hextile =
engine.

https://github.com/Nuvoton-Israel/obmc-ikvm<https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_obmc-2Dikvm&d=3DDwMGAw&=
c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQX=
PxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D92=
D29zgWEhIBYgHR9Q7lkZzREnMSwnqyhl1nEMyqXFM&e=3D>

https://github.com/Nuvoton-Israel/linux/commit/7e90f572323e56e9425b85aafe86=
dfa5a35c4e7d<https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.=
com_Nuvoton-2DIsrael_linux_commit_7e90f572323e56e9425b85aafe86dfa5a35c4e7d&=
d=3DDwMGAw&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3=
CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2Zy=
vXXY&s=3D1JBlTPOERz49VFrLgiw014ZnBqab0r8xdRIe6Fee1JA&e=3D>



>I also enabled ED's KVM webui and added kvmws proxy in python web server.

https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b=
7e898dd5ca8f0364290cce669609088ac<https://urldefense.proofpoint.com/v2/url?=
u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_=
commit_140771b7e898dd5ca8f0364290cce669609088ac&d=3DDwMGAw&c=3Due8mO8zgC4VZ=
4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW=
4v8Q&m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&s=3D8SWpZ_B0Z9GOpECKSp=
pJKXXbMTo-hNO0HuXocMRt5n0&e=3D>



>If you can spare a few minutes to review my implementation is my pleasure.



>Currently, my video driver is not v4l2, so I am going to redesign it to fi=
t v4l2 and your obmc-iKVM, then I will try to add the RGB format support in=
 your obmc-ikvm.



>Regarding the larger binary size, I think we need to review all configurat=
ions of libvncserver and check which functions should be disabled.



>Thanks,

>Joseph Liu.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_fb3de0e28c5b4e558513b58489c7685aNTHCML01Anuvotoncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black">Hi Xiuzhi:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black">I think we are using differen=
t bases of the openbmc, this patch is really working on my side<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black">Sorry for I cannot find the e=
xact error in your message.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:black">Joseph<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span =
lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&qu=
ot;sans-serif&quot;"> xiuzhi [mailto:1450335857@qq.com]
<br>
<b>Sent:</b> Tuesday, August 28, 2018 6:57 PM<br>
<b>To:</b> Eddie James; Tanous, Ed; CS20 KWLiu; openbmc<br>
<b>Subject:</b> Re:RE: KVM Support?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Joseph, Ed,<br>
&nbsp;&nbsp; There was an error when I&nbsp; updated the patches <a href=3D=
"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_Nuvoton-=
2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Daddon_commit_140771b7e898dd5ca8f0364290=
cce669609088ac&amp;d=3DDwMGAw&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1=
k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7x=
IZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp;s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO=
0HuXocMRt5n0&amp;e=3D">
https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b=
7e898dd5ca8f0364290cce669609088ac</a><o:p></o:p></span></p>
<pre><span lang=3D"EN-US">Would you like to give me some suggestions to deb=
ug it?<br>&nbsp;When I logged in <a href=3D"https://%3cbmc_ip%3e/#/kvm">htt=
ps://&lt;bmc_ip&gt;/#/kvm</a>, The errors read:<br>&quot;<br>WebSocket on-c=
lose event&nbsp; app.89eaa0b6e5e9417cb602.js:38:675915<br>Failed when conne=
cting: Connection closed (code: 1005)&nbsp; app.89eaa0b6e5e9417cb602.js:38:=
685584<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RFB.prototype._fail <a=
 href=3D"https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:685584">htt=
ps://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:685584</a><br>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RFB/&lt; <a href=3D"https://192.168.120.1=
32/app.89eaa0b6e5e9417cb602.js:38:676138">https://192.168.120.132/app.89eaa=
0b6e5e9417cb602.js:38:676138</a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Websock.prototype.open/this._websocket.onclose&lt; <a href=3D"https://1=
92.168.120.132/app.89eaa0b6e5e9417cb602.js:38:778159">https://192.168.120.1=
32/app.89eaa0b6e5e9417cb602.js:38:778159</a><br>New state 'disconnecting', =
was 'connecting'.&nbsp; app.89eaa0b6e5e9417cb602.js:38:684301<br>&gt;&gt; R=
FB.disconnect&nbsp; app.89eaa0b6e5e9417cb602.js:38:680495<br>&gt;&gt; Keybo=
ard.allKeysUp&nbsp; app.89eaa0b6e5e9417cb602.js:38:739659<br>&lt;&lt; Keybo=
ard.allKeysUp&nbsp; app.89eaa0b6e5e9417cb602.js:38:739828<br>&quot;<br>The =
line 38 of app.89eaa0b6e5e9417cb602.js is :<br>void 0!=3D=3Dmodule&amp;&amp=
;void 0!=3D=3Dexports&amp;&amp;module.exports=3D=3D=3Dexports&amp;&amp;(mod=
ule.exports=3D&quot;ui.router&quot;),function(window,angular,undefined){&qu=
ot;use strict&quot;;var $$UMFP,isDefined=3Dangular.isDefined,isFunction=3Da=
ngular.isFunction,isString=3Dangular.isString,isObject=3Dangular.isObject,i=
sArray=3Dangular.isArray,forEach=3Dangular.forEach,extend=3Dangular.extend,=
copy=3Dangular.copy,toJson=3Dangular.toJson;function inherit(parent,extra){=
return extend(new(extend(function(){},{prototype:parent})),extra)}function =
merge(dst){return forEach(arguments,function(obj){obj!=3D=3Ddst&amp;&amp;fo=
rEach(obj,function(value,key){dst.hasOwnProperty(key)||(dst[key]=3Dvalue)})=
}),dst}function objectKeys(object){if(Object.keys)return Object.keys(object=
);var result=3D[];return forEach(object,function(val,key){result.push(key)}=
),result}function indexOf(array,value){if(Array.prototype.indexOf)return ar=
ray.indexOf(value,Number(arguments[2])||0);var len=3Darray.length&gt;&gt;&g=
t;0,from=3DNumber(arguments[2])||0;for((from=3Dfrom&lt;0?Math.ceil(from):Ma=
th.floor(from))&lt;0&amp;&amp;(from&#43;=3Dlen);from&lt;len;from&#43;&#43;)=
if(from in array&amp;&amp;array[from]=3D=3D=3Dvalue)return from;return-1}fu=
nction inheritParams(currentParams,newParams,$current,$to) ... ...<br><br>B=
est,<br>Xiuzhi<br>&gt;Hi Eddie &amp; Ed:<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Do you have any plan to support non-jpeg vide=
o stream in obmc-iKVM?<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;It is possible some platforms don't have hard=
ware JPEG engine, instead have the RGB video stream.<o:p></o:p></span></pre=
>
<pre><span lang=3D"EN-US">&gt;If possible to support RGB video stream, I th=
ink it would be better if you can add the video frame differentiation in ob=
mc-iKVM because we don't need to send the full screen &gt;to VNC client on =
every request, it can reduce the buffer size at least. (libvncserver alread=
y has the video frame differentiation)<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Also, I have implemented a KVM application fo=
r our platform(nuvoton evb-npcm750) which has hardware video frame differen=
tiation and hardware hextile engine.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_obmc-2Dikvm&amp;d=3DDwMGAw&amp=
;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1yS=
naWQXPxPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvX=
XY&amp;s=3D92D29zgWEhIBYgHR9Q7lkZzREnMSwnqyhl1nEMyqXFM&amp;e=3D">https://gi=
thub.com/Nuvoton-Israel/obmc-ikvm</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_linux_commit_7e90f572323e56e94=
25b85aafe86dfa5a35c4e7d&amp;d=3DDwMGAw&amp;c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01U=
FDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&amp;m=
=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp;s=3D1JBlTPOERz49VFrLgiw0=
14ZnBqab0r8xdRIe6Fee1JA&amp;e=3D">https://github.com/Nuvoton-Israel/linux/c=
ommit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;I also enabled ED's KVM webui and added kvmws=
 proxy in python web server.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><a href=3D"https://urldefense.proofpoint.com/v2/u=
rl?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_meta-2Dopenbmc-2Dnuvoton-2Dadd=
on_commit_140771b7e898dd5ca8f0364290cce669609088ac&amp;d=3DDwMGAw&amp;c=3Du=
e8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3D7g2D1XDc1ET3CnY1ySnaWQXP=
xPxfpLww1MiDbLW4v8Q&amp;m=3DZir4Lw7xIZbwLjRk7ILcjDyeLfFVQzWjscAv2ZyvXXY&amp=
;s=3D8SWpZ_B0Z9GOpECKSppJKXXbMTo-hNO0HuXocMRt5n0&amp;e=3D">https://github.c=
om/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364=
290cce669609088ac</a><o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;If you can spare a few minutes to review my i=
mplementation is my pleasure.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Currently, my video driver is not v4l2, so I =
am going to redesign it to fit v4l2 and your obmc-iKVM, then I will try to =
add the RGB format support in your obmc-ikvm.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Regarding the larger binary size, I think we =
need to review all configurations of libvncserver and check which functions=
 should be disabled.<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Thanks,<o:p></o:p></span></pre>
<pre><span lang=3D"EN-US">&gt;Joseph Liu.<o:p></o:p></span></pre>
</div>
<br>
<font face=3D"Arial" color=3D"Black" size=3D"3"><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from your computer and network server immediatel=
y. Your cooperation is highly appreciated. It is advised that any unauthori=
zed use of confidential information
 of Nuvoton is strictly prohibited; and any information in this email irrel=
evant to the official business of Nuvoton shall be deemed as neither given =
nor endorsed by Nuvoton.<br>
</font>
</body>
</html>

--_000_fb3de0e28c5b4e558513b58489c7685aNTHCML01Anuvotoncom_--
