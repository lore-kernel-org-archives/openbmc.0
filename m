Return-Path: <jrey@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mnPp5ymCzF37K
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 03:21:18 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA2GDnn8134960
 for <openbmc@lists.ozlabs.org>; Fri, 2 Nov 2018 12:21:15 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ngrnjbsmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 12:21:15 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <jrey@us.ibm.com>;
 Fri, 2 Nov 2018 16:21:15 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 2 Nov 2018 16:21:12 -0000
Received: from us1a3-mail269.a3.dal06.isc4sb.com ([10.146.127.27])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2018110216211180-737037 ;
 Fri, 2 Nov 2018 16:21:11 +0000 
Subject: Re: KVM Support - blocked by Content Security Policy
In-Reply-To: <mailman.74.1541128515.668.openbmc@lists.ozlabs.org>
From: "Joseph Reynolds" <jrey@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 2 Nov 2018 16:21:12 +0000
Sensitivity: 
References: <mailman.74.1541128515.668.openbmc@lists.ozlabs.org>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 16616-1491 | IBM Domino Build
 SCN1812108_20180501T0841_FP7 September 27, 2018 at 13:56
X-LLNOutbound: False
X-Disclaimed: 10215
X-TNEFEvaluated: 1
x-cbid: 18110216-6059-0000-0000-00000BE9FA74
X-IBM-SpamModules-Scores: BY=0.256912; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.405233; ST=0; TS=0; UL=0; ISC=; MB=0.210526
X-IBM-SpamModules-Versions: BY=3.00009972; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01111644; UDB=6.00576103; IPR=6.00891736; 
 BA=6.00006137; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00024007; XFM=3.00000015;
 UTC=2018-11-02 16:21:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-11-02 13:19:21 - 6.00009169
x-cbparentid: 18110216-6060-0000-0000-000022F212CD
Message-Id: <OF544CEE71.9C43484A-ON00258339.0058B832-00258339.0059D50B@notes.na.collabserv.com>
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-02_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Nov 2018 16:21:19 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><blockquote data-history-content-mo=
dified=3D"1" data-history-expanded=3D"1" dir=3D"ltr" style=3D"border-left:s=
olid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-=
right:0px" >&nbsp;
<div><br><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,mon=
ospace" >Message: 2<br>Date: Fri, 2 Nov 2018 11:14:51 +0800<br>From: "=3D?I=
SO-8859-1?B?eGl1emhp?=3D" &lt;1450335857@qq.com&gt;<br>To: "=3D?ISO-8859-1?=
B?QXZpLkZpc2htYW4=3D?=3D" &lt;Avi.Fishman@nuvoton.com&gt;,<br>"=3D?ISO-8859=
-1?B?S1dMSVU=3D?=3D" &lt;KWLIU@nuvoton.com&gt;,<br>"=3D?ISO-8859-1?B?RWRkaW=
UgSmFtZXM=3D?=3D" &lt;eajames@linux.vnet.ibm.com&gt;,<br>"=3D?ISO-8859-1?B?=
VGFub3VzLCBFZA=3D=3D?=3D" &lt;ed.tanous@intel.com&gt;,<br>"=3D?ISO-8859-1?B=
?b3BlbmJtYw=3D=3D?=3D" &lt;openbmc@lists.ozlabs.org&gt;<br>Subject: Re:RE: =
Re:RE: KVM Support?<br>Message-ID: &lt;tencent_62DED47F42BD431C4F605928@qq.=
com&gt;<br>Content-Type: text/plain; charset=3D"iso-8859-1"<br><br>Hi Avi ,=
Joseph,<br>&nbsp;&nbsp; I can't get the host screen after &nbsp;updating &n=
bsp;openbmc source to &nbsp;to latest version (Oct 31 commit 7baabe48d8a2a3=
0857994f222925505750728e39).<br>The &nbsp;error of opening the webpage http=
s//xxxx/#kvm &nbsp; is :<br>Refused to load the image 'data:image/png;base6=
4,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAHCAYAAAA1WQxeAAAAOklEQVQYV2P8////fwYoYGRkZ=
AQxUcRAHJA4SB2yArgYTAdMAMRH1gA2ElkRlA03DW4nThMIuoGQLwCKQ0b4DNy9fwAAAABJRU5E=
rkJggg=3D=3D' because it violates the following Content Security Policy dir=
ective: "default-src 'self' wss: 'unsafe-eval' 'unsafe-inline'". Note that =
'img-src' was not explicitly set, so 'default-src' is used as a fallback<br=
>&nbsp;&nbsp;<br>&nbsp;&nbsp;Can you give me &nbsp;advice on how to modify =
the 0001-Implement-KVM-in-webui.patch ?<br>Best,<br>xiuzhi</font><br><br>&n=
bsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We are reviewing a proposed fix to change the Content-Sec=
urity-Policy directive to: script-src 'self' 'unsafe-eval' 'unsafe-inline';=
 object-src 'self'</div>
<div dir=3D"ltr" >See: <a href=3D"https://gerrit.openbmc-project.xyz/#/c/op=
enbmc/meta-ibm/+/14800/1/recipes-httpd/nginx/files/nginx.conf">https://gerr=
it.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/14800/1/recipes-httpd/nginx/f=
iles/nginx.conf</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>For a quick workaround, remove the Content-Security-=
Policy directive from your nginx config file (on the BMC, typically /etc/ng=
inx/nginx.conf) or change it to the setting mentioned above, restart the ng=
inx service: systemctl restart nginx, and then you may need to clear your w=
eb browser's cache (for example, Firefox - Preferences - advanced - clear c=
ache).</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >FYA: There are now two different people named "Joseph" on=
 this email chain.</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote class=3D"history-quote-1541174930740" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" dir=3D"ltr" style=3D"border-left:sol=
id #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-ri=
ght:0px" ><div>&nbsp;</div>
<div><br><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,mon=
ospace" >Hi Avi ,Joseph,<br>&nbsp;&nbsp; I checked the patches for bmc side=
, the rest_dbus.py on bmc was not patched sucessfully.<br>The files on bmc =
are:<br>/run/initramfs/ro/usr/lib/python2.7 /site-packages/obmc/wsgi/apps/r=
est_dbus.py<br>/usr/lib/python2.7/site-packages/obmc/wsgi/apps/rest_dbus.py=
<br><br>I patched the file on phosphor-gevent .<br>Now I patched &nbsp;the =
&nbsp; rest_dbus.py on phosphor-rest again,the file of bmc side has updated=
.<br>&nbsp;<br>Now it works.<br><br><br><br>Thanks,<br>Xiuzhi<br>----------=
-------- Original ------------------<br>From: &nbsp;"Avi.Fishman";&lt;Avi.F=
ishman@nuvoton.com&gt;;<br>Date: &nbsp;Aug 29, 2018<br>To: &nbsp;"KWLIU"&lt=
;KWLIU@nuvoton.com&gt;; "xiuzhi"&lt;1450335857@qq.com&gt;; "eajames"&lt;eaj=
ames@linux.vnet.ibm.com&gt;; "ed.tanous"&lt;ed.tanous@intel.com&gt;; "openb=
mc"&lt;openbmc@lists.ozlabs.org&gt;;<br><br>Subject: &nbsp;RE: Re:RE: KVM S=
upport?<br><br><br><br>&nbsp;&nbsp;<br>Hi Xiuzhi,<br>&nbsp;<br>&nbsp;<br>&n=
bsp;<br>Can you take the patches and merge them to your environment?<br>&nb=
sp;<br>&nbsp;<br>&nbsp;<br>Josef,<br>&nbsp;<br>Maybe you need to give the c=
ommit or tag you are that above it you use your patches?<br>&nbsp;<br>&nbsp=
;<br>&nbsp;&nbsp;<br>Thanks,<br>&nbsp;<br>Avi<br>&nbsp;<br>&nbsp;<br>&nbsp;=
<br>&nbsp;&nbsp;<br>From: openbmc &lt;openbmc-bounces+avifishman70=3Dgmail.=
com@lists.ozlabs.org&gt; On Behalf Of CS20 KWLiu<br>&nbsp;Sent: Wednesday, =
August 29, 2018 5:44 AM<br>&nbsp;To: 1450335857@qq.com; eajames@linux.vnet.=
ibm.com; ed.tanous@intel.com; openbmc@lists.ozlabs.org<br>&nbsp;Subject: RE=
: Re:RE: KVM Support?<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>=
Hi Xiuzhi:<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>I think we are using different =
bases of the openbmc, this patch is really working on my side<br>&nbsp;<br>=
Sorry for I cannot find the exact error in your message.<br>&nbsp;<br>&nbsp=
;<br>&nbsp;<br>Thanks,<br>&nbsp;<br>Joseph<br>&nbsp;<br>From: xiuzhi [<a hr=
ef=3D"mailto:1450335857@qq.com" target=3D"_blank">mailto:1450335857@qq.com<=
/a>]<br>&nbsp;Sent: Tuesday, August 28, 2018 6:57 PM<br>&nbsp;To: Eddie Jam=
es; Tanous, Ed; CS20 KWLiu; openbmc<br>&nbsp;Subject: Re:RE: KVM Support?<b=
r>&nbsp;<br>&nbsp;<br>&nbsp;<br>Hi Joseph, Ed,<br>&nbsp;&nbsp; &nbsp;There =
was an error when I &nbsp;updated the patches &nbsp;<a href=3D"https://gith=
ub.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f=
0364290cce669609088ac" target=3D"_blank">https://github.com/Nuvoton-Israel/=
meta-openbmc-nuvoton-addon/commit/140771b7e898dd5ca8f0364290cce669609088ac<=
/a><br>&nbsp;Would you like to give me some suggestions to debug it?<br>&nb=
sp;When I logged in https://&lt;bmc_ip&gt;/#/kvm, The errors read:<br>"<br>=
WebSocket on-close event &nbsp;app.89eaa0b6e5e9417cb602.js:38:675915<br>Fai=
led when connecting: Connection closed (code: 1005) &nbsp;app.89eaa0b6e5e94=
17cb602.js:38:685584<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;RFB.prototype._fai=
l <a href=3D"https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:685584"=
 target=3D"_blank">https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:6=
85584</a><br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;RFB/&lt; <a href=3D"https://1=
92.168.120.132/app.89eaa0b6e5e9417cb602.js:38:676138" target=3D"_blank">htt=
ps://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:676138</a><br>&nbsp;&nb=
sp; &nbsp; &nbsp; &nbsp;Websock.prototype.open/this._websocket.onclose&lt; =
<a href=3D"https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:778159" t=
arget=3D"_blank">https://192.168.120.132/app.89eaa0b6e5e9417cb602.js:38:778=
159</a><br>New state 'disconnecting', was 'connecting'. &nbsp;app.89eaa0b6e=
5e9417cb602.js:38:684301<br>&gt;&gt; RFB.disconnect &nbsp;app.89eaa0b6e5e94=
17cb602.js:38:680495<br>&gt;&gt; Keyboard.allKeysUp &nbsp;app.89eaa0b6e5e94=
17cb602.js:38:739659<br>&lt;&lt; Keyboard.allKeysUp &nbsp;app.89eaa0b6e5e94=
17cb602.js:38:739828<br>"<br>The line 38 of app.89eaa0b6e5e9417cb602.js is =
:<br>void 0!=3D=3Dmodule&amp;&amp;void 0!=3D=3Dexports&amp;&amp;module.expo=
rts=3D=3D=3Dexports&amp;&amp;(module.exports=3D"ui.router"),function(window=
,angular,undefined){"use strict";var $$UMFP,isDefined=3Dangular.isDefined,i=
sFunction=3Dangular.isFunction,isString=3Dangular.isString,isObject=3Dangul=
ar.isObject,isArray=3Dangular.isArray,forEach=3Dangular.forEach,extend=3Dan=
gular.extend,copy=3Dangular.copy,toJson=3Dangular.toJson;function inherit(p=
arent,extra){return extend(new(extend(function(){},{prototype:parent})),ext=
ra)}function merge(dst){return forEach(arguments,function(obj){obj!=3D=3Dds=
t&amp;&amp;forEach(obj,function(value,key){dst.hasOwnProperty(key)||(dst[ke=
y]=3Dvalue)})}),dst}function objectKeys(object){if(Object.keys)return Objec=
t.keys(object);var result=3D[];return forEach(object,function(val,key){resu=
lt.push(key)}),result}function indexOf(array,value){if(Array.prototype.inde=
xOf)return array.indexOf(value,Number(arguments[2])||0);var len=3Darray.len=
gth&gt;&gt;&gt;0,from=3DNumber(arguments[2])||0;for((from=3Dfrom&lt;0?Math.=
ceil(from):Math.floor(from))&lt;0&amp;&amp;(from+=3Dlen);f<br>&nbsp;rom&lt;=
len;from++)if(from in array&amp;&amp;array[from]=3D=3D=3Dvalue)return from;=
return-1}function inheritParams(currentParams,newParams,$current,$to) ... .=
..<br><br>Best,<br>Xiuzhi<br>&gt;Hi Eddie &amp; Ed: &nbsp; &gt;Do you have =
any plan to support non-jpeg video stream in obmc-iKVM? &gt;It is possible =
some platforms don't have hardware JPEG engine, instead have the RGB video =
stream. &gt;If possible to support RGB video stream, I think it would be be=
tter if you can add the video frame differentiation in obmc-iKVM because we=
 don't need to send the full screen &gt;to VNC client on every request, it =
can reduce the buffer size at least. (libvncserver already has the video fr=
ame differentiation) &nbsp; &gt;Also, I have implemented a KVM application =
for our platform(nuvoton evb-npcm750) which has hardware video frame differ=
entiation and hardware hextile engine. <a href=3D"https://github.com/Nuvoto=
n-Israel/obmc-ikvm" target=3D"_blank">https://github.com/Nuvoton-Israel/obm=
c-ikvm</a>&nbsp;<a href=3D"https://github.com/Nuvoton-Israel/linux/commit/7=
e90f572323e56e9425b85aafe86dfa5a35c4e7d" target=3D"_blank">https://github.c=
om/Nuvoton-Israel/linux/commit/7e90f572323e56e9425b85aafe86dfa5a35c4e7d</a>=
&nbsp;&nbsp; &gt;I also enabled ED's KVM webui and added kvmws proxy in pyt=
hon web server. <a href=3D"https://github.com/Nuvoton-Israel/meta-openbmc-n=
uvoton-addon/commit/140771b7e898dd5ca8f0364290cce669609088ac" target=3D"_bl=
ank">https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/14=
0771b7e898dd5ca8f0364290cce669609088ac</a>&nbsp;&nbsp; &gt;If you can spare=
 a few m<br>&nbsp;inutes to review my implementation is my pleasure. &nbsp;=
 &gt;Currently, my video driver is not v4l2, so I am going to redesign it t=
o fit v4l2 and your obmc-iKVM, then I will try to add the RGB format suppor=
t in your obmc-ikvm. &nbsp; &gt;Regarding the larger binary size, I think w=
e need to review all configurations of libvncserver and check which functio=
ns should be disabled. &nbsp; &gt;Thanks, &gt;Joseph Liu.<br><br>&nbsp;<br>=
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&nbsp;The privile=
ged confidential information contained in this email is intended for use on=
ly by the addressees as indicated by the original sender of this email. If =
you are not the addressee indicated in this email or are not responsible fo=
r delivery of the email &nbsp;to such a person, please kindly reply to the =
sender indicating this fact and delete all copies of it from your computer =
and network server immediately. Your cooperation is highly appreciated. It =
is advised that any unauthorized use of confidential information &nbsp;of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&nbsp;The privileged confidential info=
rmation contained in this email is intended for use only by the addressees =
as indicated by the original sender of this email. If you are not the addre=
ssee indicated in this email or are not responsible for delivery of the ema=
il &nbsp;to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly appreciated. It is advised that any u=
nauthorized use of confidential information &nbsp;of Nuvoton is strictly pr=
ohibited; and any information in this email irrelevant to the official busi=
ness of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.<b=
r>-------------- next part --------------<br>An HTML attachment was scrubbe=
d...<br>URL: &lt;<a href=3D"http://lists.ozlabs.org/pipermail/openbmc/attac=
hments/20181102/a6129bdf/attachment.html" target=3D"_blank">http://lists.oz=
labs.org/pipermail/openbmc/attachments/20181102/a6129bdf/attachment.html</a=
>&gt;</font><br><br>&nbsp;</div></blockquote></div><BR>
