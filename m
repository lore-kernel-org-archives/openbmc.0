Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 861281A0E27
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:24:13 +1100 (AEDT)
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 14:24:11 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 29 Jan 2016 14:24:09 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 297D82BB0057
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:24:09 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0T4O1Qq50593942
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:24:09 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0T4NawH013142
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:23:36 +1100
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0T4NY8O012790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 15:23:35 +1100
Message-Id: <201601290423.u0T4NY8O012790@d23av01.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 28 Jan 2016 23:23:26 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 28 Jan 2016 23:23:24 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 29 Jan 2016 04:23:23 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 29 Jan 2016 04:23:22 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016012904232140-7481 ;
 Fri, 29 Jan 2016 04:23:21 +0000 
Subject: =?GB2312?B?UmU6ILvYuLSjurvYuLSjultQQVRDSCBwaG9zcGhvci1yZXN0LXNlcnZlcl0g?=
 =?GB2312?B?VGhlIHN0cmVhbWluZyBzdXBwb3J0IGZvciBvYm1jLXJlc3Qu?=
In-Reply-To: <20160129130826.477d4fcd@camb691>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Fri, 29 Jan 2016 04:23:21 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160129130826.477d4fcd@camb691>,
 <OF66059493.03804909-ON00257F49.000380B3-1454027895800@LocalDomain><201601290049.u0T0nquh003020@d23av02.au.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 46627
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16012904-0033-0000-0000-000002D4F542
X-IBM-ISS-SpamDetectors: Score=0.416201; BY=0.293596; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.416201; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004849; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00652073; UDB=6.00295115; UTC=2016-01-29
 04:23:22
x-cbparentid: 16012904-9900-0000-0000-000005E19781
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jan 2016 04:24:13 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Yes Cyril, your suggestion is fair, we s=
hould keep it consistent across all files in a project. There is always deb=
ating between tabs and whitespaces. Even though personally I prefer white s=
paces (that's why my editor automatically convert tab to whitespace for me)=
, I agree that for this project, I should use tabs. Will make an update soo=
n.
<div>&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"=
ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, P=
eng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPOWER Enablement.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Cyril Bur &lt;cyrilbur@gmail.c=
om&gt;<br>To: Peng Fei BG Gou/China/IBM@IBMCN<br>Cc: "openbmc" &lt;openbmc@=
lists.ozlabs.org&gt;, "OpenBMC Patches" &lt;openbmc-patches@stwcx.xyz&gt;<b=
r>Subject: Re: =E5=9B=9E=E5=A4=8D=EF=BC=9A=E5=9B=9E=E5=A4=8D=EF=BC=9A[PATCH=
 phosphor-rest-server] The streaming support for obmc-rest.<br>Date: Fri, J=
an 29, 2016 10:09 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Fri, 29 Jan 2016 00:49:39 +0000<br>"Peng Fei BG Gou" &lt;shgoupf@cn=
.ibm.com&gt; wrote:<br><br>&gt; And the white space you saw in the email th=
read and coding is probably caused by the mixing use of tab and white space=
. The original code uses tab for indent, while I prefer to use 4 white spac=
es for indent. I will discuss with Brad regarding the indent convention for=
 our code. Will fix it up if we strictly need tab in our project.<br><br>In=
 a world where we all have to read each others code, we should make an effo=
rt<br>to not make it hard for everyone. What you have done here is mix diff=
erent<br>indenting styles which only makes it harder to read for everyone t=
o read the<br>code. Imagine a world where I preferred 8 space indenting and=
 I went through<br>and my additions to the file were 8 space indented, this=
 would be impossible to<br>read.<br><br>Typically when a file has been writ=
ten in one way, it is left that way unless<br>that particular way is absolu=
tely abhorrent (5 space indenting...). Tabs are a<br>perfectly valid way of=
 indenting, I don't see the issue here.<br><br>Futhurmore, I know this isn'=
t really for python, if in doubt we should probably<br>be falling back to t=
he openbmc/docs/contributing file and I quote:<br><br>Components of the Ope=
nBMC sources should have consistent style.<br><br>For C code, we typically =
use the Linux coding style, which is<br>documented at:<br><br><a href=3D"ht=
tp://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documenta=
tion/CodingStyle" target=3D"=5Fblank" >http://git.kernel.org/cgit/linux/ker=
nel/git/torvalds/linux.git/tree/Documentation/CodingStyle</a><br><br>(unles=
s you want to write a completely separate Python document, and change all<b=
r>the python in this project, I suggest we follow this one where appropriat=
e)<br><br>Indent with tabs instead of spaces, set at 8 columns<br><br>tl;dr=
<br><br>Don't mix indenting styles, way too hard to read the code.<br><br>&=
gt; &nbsp;<br>&gt; &nbsp;<br>&gt; &nbsp;<br>&gt; &nbsp;=E5=9C=A8 2016=E5=B9=
=B41=E6=9C=8829=E6=97=A5=EF=BC=8C=E4=B8=8A=E5=8D=888:38:15=EF=BC=8C"Peng Fe=
i BG Gou" &lt;shgoupf@cn.ibm.com&gt; =E5=86=99=E9=81=93=EF=BC=9A<br>&gt; &n=
bsp;<br>&gt; &nbsp; &nbsp; &nbsp; Python is indent based languang, so the f=
unction will fail if we have<br>&gt; incorrect indenting. I have tested thi=
s in real bmc machine so I believe the<br>&gt; indenting should be fine for=
 now. Please let Brad review this change since he<br>&gt; is familiar with =
Python.<br>&gt; &nbsp; &nbsp;=E5=9C=A8 2016=E5=B9=B41=E6=9C=8829=E6=97=A5=
=EF=BC=8C=E4=B8=8A=E5=8D=888:24:58=EF=BC=8C"Cyril Bur" &lt;cyrilbur@gmail.c=
om&gt; =E5=86=99=E9=81=93=EF=BC=9A<br>&gt; &nbsp; &nbsp;<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp;On Thu, 28 Jan 2016 02:00:37 -0600<br>&gt; &nbsp; &nbsp; O=
penBMC Patches &nbsp;wrote:<br>&gt; &nbsp; &nbsp; &gt; From: shgoupf<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; Hi Peng,<br>&gt; &nbsp; &=
nbsp; So I'm don't really know python all that well but I do believe this<b=
r>&gt; language is white space sensitive... I'll let a pythoner respond abo=
ut the<br>&gt; rest...<br>&gt; &nbsp; &nbsp; &gt; Changes:<br>&gt; &nbsp; &=
nbsp; &gt; 1) The main idea of this change is to have a streaming path as b=
elow:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; dbus signal -&gt; obmc-rest =
capture the dbus signal -&gt; obmc-rest<br>&gt; &nbsp; &nbsp; &gt; notify t=
he client of the signal receiving. 2) Replace rocket with<br>&gt; &nbsp; &n=
bsp; &gt; gevent WSGI server to support multiple async accesses. 3) Use gev=
ent<br>&gt; &nbsp; &nbsp; &gt; queue to notify the dbus signal receiving. 4=
) The uri to the streaming<br>&gt; &nbsp; &nbsp; &gt; should be in the form=
 as below: <a href=3D"https:////stream/" target=3D"=5Fblank" >https:////str=
eam/</a><br>&gt; &nbsp; &nbsp; &gt; ---<br>&gt; &nbsp; &nbsp; &gt; &nbsp;ob=
mc-rest | 115<br>&gt; &nbsp; &nbsp; &gt; ++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++------ 1 file<br>&gt; &nbsp; &nbsp; &gt; changed, 104=
 insertions(+), 11 deletions(-) mode change 100644 =3D&gt;<br>&gt; &nbsp; &=
nbsp; &gt; 100755 obmc-rest<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp=
; &gt; diff --git a/obmc-rest b/obmc-rest<br>&gt; &nbsp; &nbsp; &gt; old mo=
de 100644<br>&gt; &nbsp; &nbsp; &gt; new mode 100755<br>&gt; &nbsp; &nbsp; =
&gt; index c6d2949..481dafa<br>&gt; &nbsp; &nbsp; &gt; --- a/obmc-rest<br>&=
gt; &nbsp; &nbsp; &gt; +++ b/obmc-rest<br>&gt; &nbsp; &nbsp; &gt; @@ -3,7 +=
3,9 @@<br>&gt; &nbsp; &nbsp; &gt; &nbsp;import os<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp;import sys<br>&gt; &nbsp; &nbsp; &gt; &nbsp;import dbus<br>&gt; &nb=
sp; &nbsp; &gt; +import gobject<br>&gt; &nbsp; &nbsp; &gt; &nbsp;import dbu=
s.exceptions<br>&gt; &nbsp; &nbsp; &gt; +import dbus.mainloop.glib<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp;import json<br>&gt; &nbsp; &nbsp; &gt; &nbsp;impor=
t logging<br>&gt; &nbsp; &nbsp; &gt; &nbsp;from xml.etree import ElementTre=
e<br>&gt; &nbsp; &nbsp; &gt; @@ -14,6 +16,10 @@ from OpenBMCMapper import M=
apper, PathTree,<br>&gt; &nbsp; &nbsp; &gt; IntrospectionNodeParser, ListMa=
tch import spwd<br>&gt; &nbsp; &nbsp; &gt; &nbsp;import grp<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp;import crypt<br>&gt; &nbsp; &nbsp; &gt; +import threading=
<br>&gt; &nbsp; &nbsp; &gt; +import gevent<br>&gt; &nbsp; &nbsp; &gt; +from=
 gevent.pywsgi import WSGIServer<br>&gt; &nbsp; &nbsp; &gt; +from gevent.qu=
eue import Queue<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp;DBUS=5FUNKNOWN=5FINTERFACE =3D 'org.freedesktop.UnknownInterface'<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp;DBUS=5FUNKNOWN=5FMETHOD =3D 'org.freedeskt=
op.DBus.Error.UnknownMethod'<br>&gt; &nbsp; &nbsp; &gt; @@ -59,12 +65,13 @@=
 def makelist(data):<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp;class RouteHandler(object):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
=5Frequire=5Fauth =3D makelist(valid=5Fuser)<br>&gt; &nbsp; &nbsp; &gt; - d=
ef =5F=5Finit=5F=5F(self, app, bus, verbs, rules):<br>&gt; &nbsp; &nbsp; &g=
t; + def =5F=5Finit=5F=5F(self, app, bus, verbs, rules, skips =3D []):<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; self.app =3D app<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; self.bus =3D bus<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.mapper =3D Ma=
pper(bus)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.=5Fverbs =3D makelist(verb=
s)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.=5Frules =3D rules<br>&gt; &nbsp;=
 &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.=
=5Fskips =3D skips<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp; def =5Fsetup(self, **kw):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; req=
uest.route=5Fdata =3D {}<br>&gt; &nbsp; &nbsp; &gt; @@ -79,7 +86,7 @@ class=
 RouteHandler(object):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; return getattr(sel=
f, 'do=5F' + request.method.lower())(**kw)<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; def install(self):<br>&gt; &nbsp; &nbsp=
; &gt; - self.app.route(self.=5Frules, callback =3D self,<br>&gt; &nbsp; &n=
bsp; &gt; + self.app.route(self.=5Frules, callback =3D self, skip =3D self.=
=5Fskips,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; method =3D ['GET', 'PUT', 'PATC=
H', 'POST', 'DELETE'])<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; @staticmethod<br>&gt; &nbsp; &nbsp; &gt; @@ -108,6 +115,58 =
@@ class RouteHandler(object):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; return Non=
e<br>&gt; &nbsp; &nbsp; &gt; &nbsp; raise<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
<br>&gt; &nbsp; &nbsp; &gt; +class SignalHandler(RouteHandler):<br>&gt; &nb=
sp; &nbsp; &gt; + verbs =3D ['GET']<br>&gt; &nbsp; &nbsp; &gt; + rules =3D =
'/stream/'<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + def =
=5F=5Finit=5F=5F(self, app, bus):<br>&gt; &nbsp; &nbsp; &gt; + super(Signal=
Handler, self).=5F=5Finit=5F=5F(<br>&gt; &nbsp; &nbsp; &gt; + app, bus, sel=
f.verbs, self.rules)<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt=
; + def find(self, path, signal):<br>&gt; &nbsp; &nbsp; &gt; + busses =3D s=
elf.try=5Fmapper=5Fcall(self.mapper.get=5Fobject,<br>&gt; &nbsp; &nbsp; &gt=
; + path =3D path)<br>&gt; &nbsp; &nbsp; &gt; + for items in busses.iterite=
ms():<br>&gt; &nbsp; &nbsp; &gt; + s =3D self.find=5Fsignal=5Fon=5Fbus(path=
, signal, *items)<br>&gt; &nbsp; &nbsp; &gt; + if s:<br>&gt; &nbsp; &nbsp; =
&gt; + return s<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + a=
bort(404, =5F4034=5Fmsg %('signal', 'found', signal))<br>&gt; &nbsp; &nbsp;=
 &gt; +<br>&gt; &nbsp; &nbsp; &gt; + def setup(self, path, signal):<br>&gt;=
 &nbsp; &nbsp; &gt; + request.route=5Fdata['map'] =3D self.find(path, signa=
l)<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + def do=5Fget(s=
elf, path, signal):<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;body =3D Queue()<br>&gt; &nbsp; &nbsp; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dsignal =3D DbusSign=
al(bus, request.route=5Fdata['map'][0],<br>&gt; &nbsp; &nbsp; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; request.route=5Fdata['map'][1]=
,<br>&gt; &nbsp; &nbsp; &gt; path)<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dsignal.onData(body.put)<br>&gt=
; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;dsignal.onFinish(lambda: body.put(StopIteration))<br>&gt; &nbsp; &nbsp; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;dsignal.signa=
lSnooping()<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;return body<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp=
; &nbsp; &gt; + @staticmethod<br>&gt; &nbsp; &nbsp; &gt; + def find=5Fsigna=
l(signal, signals):<br>&gt; &nbsp; &nbsp; &gt; + if signals is None:<br>&gt=
; &nbsp; &nbsp; &gt; + return None<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nb=
sp; &nbsp; &gt; + signal =3D find=5Fcase=5Finsensitive(signal, signals.keys=
())<br>&gt; &nbsp; &nbsp; &gt; + if signal is not None:<br>&gt; &nbsp; &nbs=
p; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;return signal<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp;=
 &nbsp; &gt; + def find=5Fsignal=5Fon=5Fbus(self, path, signal, bus, interf=
aces):<br>&gt; &nbsp; &nbsp; &gt; + obj =3D self.bus.get=5Fobject(bus, path=
, introspect =3D False)<br>&gt; &nbsp; &nbsp; &gt; + iface =3D dbus.Interfa=
ce(obj, dbus.INTROSPECTABLE=5FIFACE)<br>&gt; &nbsp; &nbsp; &gt; + data =3D =
iface.Introspect()<br>&gt; &nbsp; &nbsp; &gt; + parser =3D IntrospectionNod=
eParser(<br>&gt; &nbsp; &nbsp; &gt; + ElementTree.fromstring(data),<br>&gt;=
 &nbsp; &nbsp; &gt; + intf=5Fmatch =3D ListMatch(interfaces))<br>&gt; &nbsp=
; &nbsp; &gt; + for x,y in parser.get=5Finterfaces().iteritems():<br>&gt; &=
nbsp; &nbsp; &gt; + s =3D self.find=5Fsignal(signal,<br>&gt; &nbsp; &nbsp; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; y.get('signal'))<br>&gt; &nbsp; &nbsp; &gt; + if s:<br>&gt; &nbs=
p; &nbsp; &gt; + return (x,s)<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp;class DirectoryHandler(RouteHandler):<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; verbs =3D 'GET'<br>&gt; &nbsp; &nbsp; &gt; &nbsp; rules =3D '=
/'<br>&gt; &nbsp; &nbsp; &gt; @@ -715,7 +774,8 @@ class RestApp(Bottle):<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; self.install(JSONPlugin(**json=5Fkw))<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; self.install(JsonApiErrorsPlugin(**json=5Fkw))=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.install(AuthorizationPlugin())<br>&=
gt; &nbsp; &nbsp; &gt; - self.install(JsonApiResponsePlugin())<br>&gt; &nbs=
p; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sel=
f.json=5Fresponse=5Fplugin =3D JsonApiResponsePlugin() &nbsp;<br>&gt; &nbsp=
; &nbsp; Indenting?<br>&gt; &nbsp; &nbsp; &gt; + self.install(self.json=5Fr=
esponse=5Fplugin)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.install(JsonApiReq=
uestPlugin())<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.install(JsonApiRequest=
TypePlugin())<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; =
@@ -726,6 +786,7 @@ class RestApp(Bottle):<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; def create=5Fhandlers(self):<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; # create route handlers<br>&gt; &nbsp; &nbsp; &gt; =
+ self.signal=5Fhandler =3D SignalHandler(self, self.bus)<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; self.session=5Fhandler =3D SessionHandler(self, self.bus)<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.directory=5Fhandler =3D DirectoryHan=
dler(self, self.bus)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; self.list=5Fnames=5F=
handler =3D ListNamesHandler(self, self.bus)<br>&gt; &nbsp; &nbsp; &gt; @@ =
-736,6 +797,11 @@ class RestApp(Bottle):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
self.instance=5Fhandler =3D InstanceHandler(self, self.bus)<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; def install=5Fhandlers=
(self):<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;# Skip json response for signal handler because it<br>&gt;=
 &nbsp; &nbsp; &gt; requires to<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# return a gevent iterable which c=
annot be handled by<br>&gt; &nbsp; &nbsp; &gt; json<br>&gt; &nbsp; &nbsp; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# response plu=
gin<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;self.signal=5Fhandler.=5Fskips =3D<br>&gt; &nbsp; &nbsp; &gt; =
[self.json=5Fresponse=5Fplugin] &nbsp;<br>&gt; &nbsp; &nbsp; Indenting?<br>=
&gt; &nbsp; &nbsp; &gt; + self.signal=5Fhandler.install()<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; self.session=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; self.directory=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; self.list=5Fnames=5Fhandler.install()<br>&gt; &nbsp; &nbsp; &gt; @@ -766=
,21 +832,48 @@ class RestApp(Bottle):<br>&gt; &nbsp; &nbsp; &gt; &nbsp; par=
ts =3D filter(bool, path.split('/'))<br>&gt; &nbsp; &nbsp; &gt; &nbsp; requ=
est.environ['PATH=5FINFO'] =3D '/' + '/'.join(parts) + trailing<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; +class DbusSignal():<br>&=
gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp;def =5F=5Finit=5F=5F(self, bus, dbus=
=5Finterface, signal=5Fname, path):<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;# Register the dbus recieve handler<br>&gt; &nbsp; &nbsp; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;bus.add=5Fsignal=5Freceiver(self.signalRe=
ciever,<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;db=
us=5Finterface =3D dbus=5Finterface,<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;signal=5Fname =3D signal=5Fname,<br>&gt; &nbsp; =
&nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;path =3D path)<br>&gt; &n=
bsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
self.snooping =3D True<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &=
gt; + &nbsp; &nbsp;def signalReciever(self, msg):<br>&gt; &nbsp; &nbsp; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;self.send("Recieved message: %s" % msg)<br>&=
gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;self.snooping =3D False=
<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp;def=
 onData(self, send):<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;self.send =3D send<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt=
; + &nbsp; &nbsp;def onFinish(self, f):<br>&gt; &nbsp; &nbsp; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;self.finish =3D f<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt;=
 &nbsp; &nbsp; &gt; + &nbsp; &nbsp;def signalSnooping(self):<br>&gt; &nbsp;=
 &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;while self.snooping:<br>&gt; &nbs=
p; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mainloop =3D gobj=
ect.MainLoop()<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;gevent.sleep(1)<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;gobject.timeout=5Fadd(1, mainloop.quit)<br>&gt; &nbsp;=
 &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mainloop.run()<br>&=
gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;self.finish()<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp;if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; log =3D logging.getLogger('Rocket.Errors')<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; log.setLevel(logging.INFO)<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 log.addHandler(logging.StreamHandler(sys.stdout))<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;dbus.main=
loop.glib.DBusGMainLoop(set=5Fas=5Fdefault=3DTrue) &nbsp;<br>&gt; &nbsp; &n=
bsp; Indenting?<br>&gt; &nbsp; &nbsp; &gt; &nbsp; bus =3D dbus.SystemBus()<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; app =3D RestApp(bus)<br>&gt; &nbsp; &nbsp=
; &gt; + &nbsp;<br>&gt; &nbsp; &nbsp; ?<br>&gt; &nbsp; &nbsp; &gt; &nbsp; d=
efault=5Fcert =3D os.path.join(sys.prefix, 'share',<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; os.path.basename(=5F=5Ffile=5F=5F), 'cert.pem')<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; - server =3D Rocket(('0.0.0.0'=
,<br>&gt; &nbsp; &nbsp; &gt; - 443,<br>&gt; &nbsp; &nbsp; &gt; - default=5F=
cert,<br>&gt; &nbsp; &nbsp; &gt; - default=5Fcert),<br>&gt; &nbsp; &nbsp; &=
gt; - 'wsgi', {'wsgi=5Fapp': app},<br>&gt; &nbsp; &nbsp; &gt; - min=5Fthrea=
ds =3D 1,<br>&gt; &nbsp; &nbsp; &gt; - max=5Fthreads =3D 1)<br>&gt; &nbsp; =
&nbsp; &gt; - server.start()<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;server =3D WSGIServer(("0.0.0.0", 443), app, keyfile =3D<br>&gt; =
&nbsp; &nbsp; &gt; default=5Fcert,<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;certfile =3D default=5Fcert)<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt=
; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;server.serve=5Fforever() =
&nbsp;<br>&gt; &nbsp; &nbsp; Indenting?</font><br>&nbsp;</div></blockquote>
<div>&nbsp;</div></div></div><BR>
