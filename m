Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6D72B1A00E9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 18:20:32 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 17:20:31 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 7 Jan 2016 17:20:29 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 444CB2BB0057
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 18:20:29 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u077KN0d31326294
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:20:31 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u077Jupn028609
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:19:57 +1100
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u077Jsf6028268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:19:55 +1100
Message-Id: <201601070719.u077Jsf6028268@d23av01.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 02:19:45 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 7 Jan 2016 02:19:42 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 07:19:41 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Jan 2016 07:19:38 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016010707201065-48544 ;
 Thu, 7 Jan 2016 07:20:10 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v5] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <20160107165526.7070d265@camb691>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Thu, 7 Jan 2016 07:19:37 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160107165526.7070d265@camb691>,
 <1452069029-12958-1-git-send-email-openbmc-patches@stwcx.xyz><1452069029-12958-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 28035
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
x-cbid: 16010707-0025-0000-0000-000002B4E3BC
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0.286324; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004760; HX=3.00000238; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00641698; UDB=6.00288913; UTC=2016-01-07
 07:19:40
x-cbparentid: 16010707-9588-0000-0000-000001714332
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
X-List-Received-Date: Thu, 07 Jan 2016 07:20:32 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hey Cyril,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please see my comments starting with&nbsp;&nbsp;<span sty=
le=3D"font-size: 10.5pt;" >&gt;&gt;&gt;&gt; [pengfei]:&nbsp;</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, Peng Fei (=E8=8B=
=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Cyril Bur &lt;cyrilbur@gmail.com&gt;<br>To: OpenBMC Patches &lt;o=
penbmc-patches@stwcx.xyz&gt;, Peng Fei BG Gou/China/IBM@IBMCN<br>Cc: openbm=
c@lists.ozlabs.org<br>Subject: Re: [PATCH phosphor-host-ipmid v5] Add get/s=
et boot option ipmid command support with correct DBUS property handling.<b=
r>Date: Thu, Jan 7, 2016 2:05 PM<br>&nbsp;
<div><div><font face=3D"Default Monospace,Courier New,Courier,monospace" si=
ze=3D"2" >On Wed, &nbsp;6 Jan 2016 02:30:29 -0600<br>OpenBMC Patches &lt;op=
enbmc-patches@stwcx.xyz&gt; wrote:<br><br>Hi Peng,<br><br>Thanks for follow=
ing my recommendations, much appreciated.<br><br>Ultimately we have a commo=
n goal which is to have the best possible code go<br>into the project, lets=
 work together on this.<br><br><br><br>&gt; From: shgoupf &lt;shgoupf@cn.ib=
m.com&gt;<br>&gt;<br>&gt; 1) Add support for IPMI get/set boot option comma=
nd.<br>&gt; &nbsp; &nbsp; a) boot options stored in dbus property.<br>&gt; =
&nbsp; &nbsp; b) IPMI get boot option command get boot option from the dbus=
<br>&gt; &nbsp; &nbsp; property.<br>&gt; &nbsp; &nbsp; c) IPMI set boot opt=
ion coomand set boot option to the dbus<br>&gt; &nbsp; &nbsp; property.<br>=
&gt; 2) Two methods to handle the dbus property set and get:<br>&gt; &nbsp;=
 &nbsp; a) dbus=5Fset=5Fproperty()<br>&gt; &nbsp; &nbsp; b) dbus=5Fget=5Fpr=
operty()<br>&gt; 3) The property is stored as a 10 character strings which =
representsd 5-byte information.<br>&gt; 4) ipmid set method is registered a=
nd implemented since petitboot will use it to clear the boot options.<br>&g=
t; 5) Get service name via object mapper<br>&gt; &nbsp; &nbsp; a) The conne=
ction name is got via objectmapper.<br>&gt; &nbsp; &nbsp; b) The method use=
d to get the connection name is object=5Fmapper=5Fget=5Fconnection().<br>&g=
t; &nbsp; &nbsp; c) dbus=5Fget=5Fproperty/dbus=5Fset=5Fproperty will get th=
e connection name via the above method instead of hard coding.<br>&gt; 6) E=
rror code are properly handled.<br>&gt; 7) Use sprinf/sscanf for int/string=
 conversion.<br>&gt; &nbsp; &nbsp; a) Instead of reinventing the wheel by d=
efining methods converting int to string, use sprintf/sscanf should be a mo=
re clean and robust way.<br>&gt; 8) Fix issues addressed by the community.<=
br>&gt; &nbsp; &nbsp; a) change malloc heap to stack local variable.<br>&gt=
; &nbsp; &nbsp; b) Fix multi line comment style from "//" to "/**/".<br>&gt=
; &nbsp; &nbsp; c) Add defines for return codes.<br>&gt; &nbsp; &nbsp; d) A=
dd more comments.<br>&gt; ---<br>&gt; &nbsp;chassishandler.C | 472 ++++++++=
++++++++++++++++++++++++++++++++++++++---------<br>&gt; &nbsp;chassishandle=
r.h | &nbsp;18 +++<br>&gt; &nbsp;2 files changed, 413 insertions(+), 77 del=
etions(-)<br>&gt;<br>&gt; diff --git a/chassishandler.C b/chassishandler.C<=
br>&gt; index 1389db9..8d516de 100644<br>&gt; --- a/chassishandler.C<br>&gt=
; +++ b/chassishandler.C<br>&gt; @@ -5,9 +5,233 @@<br>&gt; &nbsp;#include &=
lt;stdint.h&gt;<br>&gt; &nbsp;<br>&gt; &nbsp;// OpenBMC Chassis Manager dbu=
s framework<br>&gt; -const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &=
nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; -const char &nbsp;*ch=
assis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/openbmc/control/chassis0";<br>=
&gt; -const char &nbsp;*chassis=5Fintf=5Fname &nbsp; &nbsp; =3D &nbsp;"org.=
openbmc.control.Chassis";<br>&gt; +const char *chassis=5Fbus=5Fname &nbsp; =
&nbsp; &nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; +const char *=
chassis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/openbmc/control/chassis0";<b=
r>&gt; +const char *chassis=5Fintf=5Fname &nbsp; &nbsp; =3D &nbsp;"org.open=
bmc.control.Chassis";<br>&gt; +<br>&gt; +// Host settings in dbus<br>&gt; +=
// Service name should be referenced by connection name got via object mapp=
er<br>&gt; +const char *settings=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/open=
bmc/settings/host0";<br>&gt; +const char *settings=5Fintf=5Fname &nbsp; &nb=
sp;=3D &nbsp;"org.freedesktop.DBus.Properties";<br>&gt; +<br>&gt; +const ch=
ar *objmapper=5Fservice=5Fname =3D &nbsp;"org.openbmc.objectmapper";<br>&gt=
; +const char *objmapper=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/openbmc/obje=
ctmapper/objectmapper";<br>&gt; +const char *objmapper=5Fintf=5Fname &nbsp;=
 &nbsp;=3D &nbsp;"org.openbmc.objectmapper.ObjectMapper";<br>&gt; +<br>&gt;=
 +int object=5Fmapper=5Fget=5Fconnection(char ** buf, const char * obj=5Fpa=
th)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=
=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage * m =3D NULL;<br=
>&gt; + &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<br>&gt; + &nbsp; &nbsp;char *=
 temp=5Fbuf =3D NULL, *intf =3D NULL;<br><br>Still strange spacing with the=
 * character</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next update. =
Actually it's just a different style preference. Maybe you will be interest=
ed in the astyle which will automatically format your code with various for=
matting options, as below:</div>
<div><a href=3D"http://astyle.sourceforge.net/astyle.html" >http://astyle.s=
ourceforge.net/astyle.html</a></div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; + &nbsp; &nbsp;size=5Ft buf=5Fsize =3D 0;<br>&gt; + &nbsp; &n=
bsp;int r;<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Open the system bus where mo=
st system services are provided.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fop=
en=5Fsystem(&amp;bus);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to connect to sys=
tem bus: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto fi=
nish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; =
+ &nbsp; &nbsp; * Bus, service, object path, interface and method are provi=
ded to call<br>&gt; + &nbsp; &nbsp; * the method.<br>&gt; + &nbsp; &nbsp; *=
 Signatures and input arguments are provided by the arguments at the<br>&gt=
; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;=
r =3D sd=5Fbus=5Fcall=5Fmethod(bus,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; objmapper=5Fs=
ervice=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;/* service to contact */<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; objmappe=
r=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; /* object path */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; objmapper=
=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; /* interface name */<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Ge=
tObject", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* method name */<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;/* object to return error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;m,=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* =
return message on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "s", &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; obj=5Fpath &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; /* first argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;);<br>&gt; +<br>&gt=
; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprin=
tf(stderr, "Failed to issue method call: %s\n", error.message);<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<b=
r>&gt; + &nbsp; &nbsp;// Get the key, aka, the connection name<br>&gt; + &n=
bsp; &nbsp;sd=5Fbus=5Fmessage=5Fread(m, "a{sas}", 1, &amp;temp=5Fbuf, 1, &a=
mp;intf);<br>&gt; +<br><br>Still unsure about these interfaces, are you com=
menting them in the docs repo?</font></div>
<div><br>&gt;&gt;&gt;&gt; [pengfei]: Actually "busctl introspect" will give=
 all the information about what exactly the signature a dbus method/propert=
y has. So there is no need for a specific doc. please refer to "busctl intr=
ospect" for the signature of each dbus method. As a result, I believe the u=
sage in of my dbus signature is fine for now.<br><br><font face=3D"Default =
Monospace,Courier New,Courier,monospace" size=3D"2" >&gt; + &nbsp; &nbsp;/*=
<br>&gt; + &nbsp; &nbsp; * TODO: check the return code. Currently for no re=
ason the message<br>&gt; + &nbsp; &nbsp; * parsing of object mapper is alwa=
ys complaining about<br>&gt; + &nbsp; &nbsp; * "Device or resource busy", b=
ut the result seems OK for now. Need<br>&gt; + &nbsp; &nbsp; * further chec=
ks.<br>&gt; + &nbsp; &nbsp; * TODO: The following code is preserved in the =
comments so that it can be<br>&gt; + &nbsp; &nbsp; * resumed after the prob=
lem aforementioned is resolved.<br>&gt; + &nbsp; &nbsp; *r =3D sd=5Fbus=5Fm=
essage=5Fread(m, "a{sas}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; + &nb=
sp; &nbsp; *if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; * &nbsp; &nbsp;fprintf(=
stderr, "Failed to parse response message: %s\n", strerror(-r));<br>&gt; + =
&nbsp; &nbsp; * &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp; *}<br>&gt=
; + &nbsp; &nbsp; */<br><br>This still worries me a lot, I've been looking =
through sd=5Fbus=5Fmessage=5Fread(),<br>feel free to take a look,<br><a hre=
f=3D"https://fossies.org/dox/systemd-228/dir=5F2d204f9a98721f367282e89b8157=
1312.html" target=3D"=5Fblank" >https://fossies.org/dox/systemd-228/dir=5F2=
d204f9a98721f367282e89b81571312.html</a>.<br><br>If it returns a negative v=
alue there is absolutely no guarantee that it has<br>correctly set the para=
meters you passed, it may not have at all depending on at<br>which point it=
 detects the error. This means you might be reading from an<br>invalid poin=
ter later on.<br><br>I know you say it works, I'm concerned that you might =
be getting quite lucky<br>and that it only appears to work.</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:&nbsp;Again. I believe this piece of code i=
s tricky here. But I believe there should be some problem in the objecmappe=
r, not for this code (I investigate it a lot). This is very simple dbus met=
hod call process. So I believe for this patch, a "TODO" is sufficient to ad=
dress the issues. We can fix it later when object mapper is updated.<br><br=
><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D"2" =
>&gt; +<br>&gt; + &nbsp; &nbsp;buf=5Fsize =3D strlen(temp=5Fbuf) + 1;<br>&g=
t; + &nbsp; &nbsp;printf("IPMID connection name: %s\n", temp=5Fbuf);<br>&gt=
; + &nbsp; &nbsp;*buf =3D (char *)malloc(buf=5Fsize);<br>&gt; +<br>&gt; + &=
nbsp; &nbsp;if (*buf =3D=3D NULL) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fp=
rintf(stderr, "Malloc failed for get=5Fsys=5Fboot=5Foptions");<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;r =3D -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;got=
o finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcpy(=
*buf, temp=5Fbuf, buf=5Fsize);<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; =
&nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=
=5Fmessage=5Funref(m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Funref(bus);<br>&gt=
; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +<br>&gt; +int dbus=
=5Fget=5Fproperty(char * buf)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5F=
error error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5F=
message * m =3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<br>&g=
t; + &nbsp; &nbsp;char * temp=5Fbuf =3D NULL;<br>&gt; + &nbsp; &nbsp;uint8=
=5Ft * get=5Fvalue =3D NULL;<br>&gt; + &nbsp; &nbsp;char * connection =3D N=
ULL;<br><br>More strange spacing around the *</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:&nbsp;answered before.<br><br><font face=3D=
"Default Monospace,Courier New,Courier,monospace" size=3D"2" >&gt; + &nbsp;=
 &nbsp;int r, i;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D object=5Fmapper=5Fg=
et=5Fconnection(&amp;connection, settings=5Fobject=5Fname);<br>&gt; +<br>&g=
t; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fpri=
ntf(stderr, "Failed to get connection, return value: %d.\n", r);<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<=
br>&gt; + &nbsp; &nbsp;printf("connection: %s\n", connection);<br>&gt; +<br=
>&gt; + &nbsp; &nbsp;// Open the system bus where most system services are =
provided.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<=
br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;fprintf(stderr, "Failed to connect to system bus: %s\n", strerro=
r(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * Bus, =
service, object path, interface and method are provided to call<br>&gt; + &=
nbsp; &nbsp; * the method.<br>&gt; + &nbsp; &nbsp; * Signatures and input a=
rguments are provided by the arguments at the<br>&gt; + &nbsp; &nbsp; * end=
.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=
=5Fmethod(bus,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; connection, &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; /* service to contact */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; settings=
=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; /* object path */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; settings=5F=
intf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; /* interface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Get",=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* method name */=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; /* object to return error in */<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &a=
mp;m, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* r=
eturn message on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "ss", &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; settings=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; "boot=5Fflags"); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* secon=
d argument */<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to issue method call: %s\n=
", error.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt=
; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nb=
sp; * The output should be parsed exactly the same as the output formatting=
<br>&gt; + &nbsp; &nbsp; * specified.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + =
&nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread(m, "v", "s", &amp;temp=5Fbuf);=
<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;fprintf(stderr, "Failed to parse response message: %s\n", strer=
ror(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp=
; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf("IPMID boot option proper=
ty get: {%s}.\n", (char *) temp=5Fbuf);<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*=
<br>&gt; + &nbsp; &nbsp; * To represent a hex in string, e.g., "A0A0", whic=
h represents two bytes<br>&gt; + &nbsp; &nbsp; * in the hex, but requires 5=
 bytes to store it as string, i.e., 4<br>&gt; + &nbsp; &nbsp; * characters =
to store the "A0A0" and 1 additional space for "\0".<br>&gt; + &nbsp; &nbsp=
; * Thereby we have 2 * &lt;number of bytes&gt; + 1 for the string buffer.<=
br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;memcpy(buf, temp=5Fbuf, 2=
 * NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED + 1);<br>&gt; +<br>&gt; +finish:<=
br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; + &nbsp=
; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fun=
ref(bus);<br>&gt; + &nbsp; &nbsp;free(connection);<br>&gt; +<br>&gt; + &nbs=
p; &nbsp;return r;<br>&gt; +}<br>&gt; +<br>&gt; +int dbus=5Fset=5Fproperty(=
const char * buf)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =
=3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage * m =
=3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<br>&gt; + &nbsp; =
&nbsp;char * connection =3D NULL;<br>&gt; + &nbsp; &nbsp;int r;<br>&gt; +<b=
r>&gt; + &nbsp; &nbsp;r =3D object=5Fmapper=5Fget=5Fconnection(&amp;connect=
ion, settings=5Fobject=5Fname);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt;=
 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to get c=
onnection, return value: %d.\n", r);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;g=
oto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;print=
f("connection: %s\n", connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Open=
 the system bus where most system services are provided.<br>&gt; + &nbsp; &=
nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>&gt; +<br>&gt; + &nbsp; &=
nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "=
Failed to connect to system bus: %s\n", strerror(-r));<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + =
&nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * Bus, service, object path, interf=
ace and method are provided to call<br>&gt; + &nbsp; &nbsp; * the method.<b=
r>&gt; + &nbsp; &nbsp; * Signatures and input arguments are provided by the=
 arguments at the<br>&gt; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &nbsp; */=
<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; connection, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* service to c=
ontact */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; settings=5Fobject=5Fname, &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object p=
ath */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; settings=5Fintf=5Fname, &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interf=
ace name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "Set", &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;/* method name */<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp=
;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object to ret=
urn error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;m, &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return message on success */<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; "ssv", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;/* input signature */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; settings=5Fintf=
=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; /* first argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "boot=5Ffl=
ags", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* second argument */<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; "s", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;/* third argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; buf); &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* fourth argument */<br><br>Still u=
nsure about these interfaces, are you commenting them in the docs repo?</fo=
nt></div>
<div><br>&gt;&gt;&gt;&gt; [pengfei]:=E2=80=8B answered before.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;fprintf(stderr, "Failed to issue method call: %s\n", error=
.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbs=
p; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf("IPMID boot option prope=
rty set: {%s}.\n", buf);<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;=
sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmess=
age=5Funref(m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Funref(bus);<br>&gt; + &nb=
sp; &nbsp;free(connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&=
gt; +}<br>&gt; &nbsp;<br>&gt; &nbsp;void register=5Fnetfn=5Fchassis=5Ffunct=
ions() =5F=5Fattribute=5F=5F((constructor));<br>&gt; &nbsp;<br>&gt; @@ -15,=
13 +239,30 @@ struct get=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp;=
 &nbsp;uint8=5Ft parameter;<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft set;<br>&=
gt; &nbsp; &nbsp; &nbsp;uint8=5Ft block;<br>&gt; -} &nbsp;=5F=5Fattribute=
=5F=5F ((packed));<br>&gt; +} &nbsp;=5F=5Fattribute=5F=5F((packed));<br>&gt=
; &nbsp;<br>&gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft=
 netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fr=
equest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; - &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=
<br>&gt; +struct set=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; + &nbsp; &nbsp;ui=
nt8=5Ft parameter;<br>&gt; + &nbsp; &nbsp;union {<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;struct {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uin=
t8=5Ft d1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d2;=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d3;<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d4;<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d5;<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;uint8=5Ft d6;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;uint8=5Ft d7;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;uint8=5Ft d8;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;} data8;<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;uint64=5Ft data64;<br>&gt; + &nbsp; &nbsp;} data;<b=
r>&gt; +} &nbsp;=5F=5Fattribute=5F=5F((packed));<br>&gt; +<br>&gt; +ipmi=5F=
ret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cm=
d,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Frequest=5Ft reques=
t, ipmi=5Fresponse=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; =
&nbsp;{<br>&gt; - &nbsp; &nbsp;printf("Handling CHASSIS WILDCARD Netfn:[0x%=
X], Cmd:[0x%X]\n",netfn, cmd);<br>&gt; + &nbsp; &nbsp;printf("Handling CHAS=
SIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n", netfn, cmd);<br>&gt; &nbsp; &nbsp=
; &nbsp;// Status code.<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D I=
PMI=5FCC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; @@ -3=
1,103 +272,176 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft=
 netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;//-------------------------------=
-----------------------------<br>&gt; &nbsp;// Calls into Chassis Control D=
bus object to do the power off<br>&gt; &nbsp;//----------------------------=
--------------------------------<br>&gt; -int ipmi=5Fchassis=5Fpower=5Fcont=
rol(const char *method)<br>&gt; +int ipmi=5Fchassis=5Fpower=5Fcontrol(const=
 char * method)<br>&gt; &nbsp;{<br>&gt; - // sd=5Fbus error<br>&gt; - int r=
c =3D 0;<br>&gt; + &nbsp; &nbsp;// sd=5Fbus error<br>&gt; + &nbsp; &nbsp;in=
t rc =3D 0;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;// SD Bus error repo=
rt mechanism.<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror bus=5Ferror =3D =
SD=5FBUS=5FERROR=5FNULL;<br>&gt; &nbsp;<br>&gt; - // Response from the call=
. Although there is no response for this call,<br>&gt; - // obligated to me=
ntion this to make compiler happy.<br>&gt; - sd=5Fbus=5Fmessage *response =
=3D NULL;<br>&gt; -<br>&gt; - // Gets a hook onto either a SYSTEM or SESSIO=
N bus<br>&gt; - sd=5Fbus *bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnectio=
n();<br>&gt; -<br>&gt; - rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp;=
 &nbsp; &nbsp; &nbsp; // On the System Bus<br>&gt; - chassis=5Fbus=5Fname, =
&nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; - chassis=5Fobject=
=5Fname, &nbsp; &nbsp; // Object path<br>&gt; - chassis=5Fintf=5Fname, &nbs=
p; &nbsp; &nbsp; // Interface name<br>&gt; - method, &nbsp; &nbsp; &nbsp; /=
/ Method to be called<br>&gt; - &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; // o=
bject to return error<br>&gt; - &amp;response, // Response buffer if any<br=
>&gt; - NULL); // No input arguments<br>&gt; - if(rc &lt; 0)<br>&gt; - {<br=
>&gt; - fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.mess=
age);<br>&gt; - }<br>&gt; - else<br>&gt; - {<br>&gt; - printf("Chassis Powe=
r Off initiated successfully\n");<br>&gt; - }<br>&gt; + &nbsp; &nbsp;/*<br>=
&gt; + &nbsp; &nbsp; * Response from the call. Although there is no respons=
e for this call,<br>&gt; + &nbsp; &nbsp; * obligated to mention this to mak=
e compiler happy.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;sd=5Fbu=
s=5Fmessage * response =3D NULL;<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Gets a=
 hook onto either a SYSTEM or SESSION bus<br>&gt; + &nbsp; &nbsp;sd=5Fbus *=
 bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>&gt; +<br>&gt; + =
&nbsp; &nbsp;rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* On the System Bus*/<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;chassis=5Fbus=5Fname, &nbsp; &nbsp; &nbsp; &nbsp;/* Servic=
e to contact*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chassis=5Fobject=5Fname, &nb=
sp; &nbsp; /* Object path*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chassis=5Fintf=
=5Fname, &nbsp; &nbsp; &nbsp; /* Interface name*/<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;method, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* Method to be called*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;bus=5Ferror=
, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* object to return error=
*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;response, &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; /* Response buffer if any*/<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;NULL); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; /* No input arguments*/<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (rc &lt; 0)=
 {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "ERROR initiating P=
ower Off:[%s]\n", bus=5Ferror.message);<br>&gt; + &nbsp; &nbsp;} else {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;printf("Chassis Power Off initiated succe=
ssfully\n");<br>&gt; + &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; =
&nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>&gt; &nbsp; &nbsp; &nbs=
p;sd=5Fbus=5Fmessage=5Funref(response);<br>&gt; &nbsp;<br>&gt; - return rc;=
<br>&gt; + &nbsp; &nbsp;return rc;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &=
nbsp;<br>&gt; &nbsp;//-----------------------------------------------------=
-----------------<br>&gt; &nbsp;// Chassis Control commands<br>&gt; &nbsp;/=
/----------------------------------------------------------------------<br>=
&gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft netfn, ipmi=
=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Frespon=
se=5Ft response,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=
=5Fcontext=5Ft context)<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ip=
mi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen,=
 ipmi=5Fcontext=5Ft context)<br>&gt; &nbsp;{<br>&gt; - // Error from power =
off.<br>&gt; - int rc =3D 0;<br>&gt; + &nbsp; &nbsp;// Error from power off=
.<br>&gt; + &nbsp; &nbsp;int rc =3D 0;<br>&gt; &nbsp;<br>&gt; - // No respo=
nse for this command.<br>&gt; + &nbsp; &nbsp;// No response for this comman=
d.<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &nbsp;<br>&gt; - =
// Catch the actual operaton by peeking into request buffer<br>&gt; - uint8=
=5Ft chassis=5Fctrl=5Fcmd =3D *(uint8=5Ft *)request;<br>&gt; - printf("Chas=
sis Control Command: Operation:[0x%X]\n",chassis=5Fctrl=5Fcmd);<br>&gt; -<b=
r>&gt; - switch(chassis=5Fctrl=5Fcmd)<br>&gt; - {<br>&gt; - case CMD=5FPOWE=
R=5FOFF:<br>&gt; - rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol("powerOff");<br>=
&gt; - break;<br>&gt; - case CMD=5FHARD=5FRESET:<br>&gt; - rc =3D ipmi=5Fch=
assis=5Fpower=5Fcontrol("reboot");<br>&gt; - break;<br>&gt; - default:<br>&=
gt; - {<br>&gt; - fprintf(stderr, "Invalid Chassis Control command:[0x%X] r=
eceived\n",chassis=5Fctrl=5Fcmd);<br>&gt; - rc =3D -1;<br>&gt; - }<br>&gt; =
- }<br>&gt; -<br>&gt; - return ( (rc &lt; 0) ? IPMI=5FCC=5FINVALID : IPMI=
=5FCC=5FOK);<br>&gt; + &nbsp; &nbsp;// Catch the actual operaton by peeking=
 into request buffer<br>&gt; + &nbsp; &nbsp;uint8=5Ft chassis=5Fctrl=5Fcmd =
=3D * (uint8=5Ft *)request;<br>&gt; + &nbsp; &nbsp;printf("Chassis Control =
Command: Operation:[0x%X]\n", chassis=5Fctrl=5Fcmd);<br>&gt; +<br>&gt; + &n=
bsp; &nbsp;switch (chassis=5Fctrl=5Fcmd) {<br>&gt; + &nbsp; &nbsp;case CMD=
=5FPOWER=5FOFF:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D ipmi=5Fchassis=
=5Fpower=5Fcontrol("powerOff");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;break;=
<br>&gt; +<br>&gt; + &nbsp; &nbsp;case CMD=5FHARD=5FRESET:<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol("reboot");<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;break;<br>&gt; +<br>&gt; + &nbsp; &nbsp;d=
efault: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Invalid Cha=
ssis Control command:[0x%X] received\n", chassis=5Fctrl=5Fcmd);<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nb=
sp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;return ((rc &lt; 0) ? IPMI=5FC=
C=5FINVALID : IPMI=5FCC=5FOK);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -ipmi=
=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft net=
fn, ipmi=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Freque=
st=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; - &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>=
&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnet=
fn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=
=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft contex=
t)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=
=5FCC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &nbsp;<b=
r>&gt; &nbsp; &nbsp; &nbsp;printf("IPMI GET=5FSYS=5FBOOT=5FOPTIONS\n");<br>=
&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;get=5Fsys=5Fboot=5Foptions=5Ft *reqptr =
=3D (get=5Fsys=5Fboot=5Foptions=5Ft*) request;<br>&gt; + &nbsp; &nbsp;get=
=5Fsys=5Fboot=5Foptions=5Ft * reqptr =3D (get=5Fsys=5Fboot=5Foptions=5Ft *)=
 request;<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * To =
represent a hex in string, e.g., "A0A0", which represents two bytes<br>&gt;=
 + &nbsp; &nbsp; * in the hex, but requires 5 bytes to store it as string, =
i.e., 4<br>&gt; + &nbsp; &nbsp; * characters to store the "A0A0" and 1 addi=
tional space for "\0".<br>&gt; + &nbsp; &nbsp; * Thereby we have 2 * &lt;nu=
mber of bytes&gt; + 1 for the string buffer.<br>&gt; + &nbsp; &nbsp; */<br>=
&gt; + &nbsp; &nbsp;char buf[NUM=5FRETURN=5FBYTES=5FOF=5FGET * 2 + 1] =3D {=
0};<br><br>I still don't follow why these odd #define numbers, why don't yo=
u put the * 2 +<br>1 inside the #define?<br><br>Or, really we should be dis=
cussing why numbers are being passed around as<br>strings.</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:=E2=80=8B I think the explicit calculation =
of the bytes in the code is much more clear and straightforward for users. =
As for why the option is stored as strings. That is because the current dev=
eloper of the boot option property (not me) prefers that. I don't think thi=
s matters a lot.&nbsp;</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;// TODO Return default values t=
o OPAL until dbus interface is available<br>&gt; + &nbsp; &nbsp;/*<br>&gt; =
+ &nbsp; &nbsp; * Parameter #5 means boot flags. Please refer to 28.13 of i=
pmi doc.<br>&gt; + &nbsp; &nbsp; * This is the only parameter used by petit=
boot.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;if (reqptr-&gt;para=
meter =3D=3D 5) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fget=
=5Fproperty(buf);<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;if (reqptr-&gt;para=
meter =3D=3D 5) // Parameter #5<br>&gt; - &nbsp; &nbsp;{<br>&gt; - &nbsp; &=
nbsp; &nbsp; &nbsp;uint8=5Ft buf[] =3D {0x1,0x5,80,0,0,0,0};<br>&gt; - &nbs=
p; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<br>&gt; - &nbsp; &nbsp;=
 &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Flen);<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;fprintf(stderr, "Dbus get property failed for get=5Fsys=5Fboot=5Fo=
ptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=
=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fvalue;<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;sscanf(buf, "%llX", &amp;return=5Fvalue);<br><br>Why c=
an't we a) be passing numbers around as numbers b) use the correct tool<br>=
for the job.</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:=E2=80=8B answered before.&nbsp;The boot op=
tion is stored as string, not integer, so the conversion is necessary.<br><=
br><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D"2=
" >&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=
=5FBYTES=5FOF=5FGET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/*<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; * TODO: last 3 bytes<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; *(NUM=5FRETURN=5FBYTES=5FOF=5FGET - NUM=5FRETURN=5FBYTES=5FOF=5FGET=
=5FUSED) is meanlingless<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; */<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, (uint8=5Ft *)(&amp;return=5Fva=
lue), *data=5Flen);<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;buf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;memcpy(response, buf, *data=5Flen);<br><br>... previ=
ous comments, there really is no need for the memcpy</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:=E2=80=8B I believe the memcpy is needed to=
 keep return value correct and consistent if different return size is used.=
<br><br><font face=3D"Default Monospace,Courier New,Courier,monospace" size=
=3D"2" >&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported para=
meter 0x%x\n", reqptr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &nbsp; &nbsp; &nbsp;}<br=
>&gt; - &nbsp; &nbsp;else<br>&gt; - &nbsp; &nbsp;{<br>&gt; +<br>&gt; + &nbs=
p; &nbsp;return rc;<br>&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fcha=
ssis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cm=
d,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5F=
response=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Fl=
en=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; +{<br>&gt; + &nbsp; =
&nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; + &nbsp; &nbs=
p;printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; + &nbsp; &nbsp;print=
f("IPMID set command required return bytes: %i\n", *data=5Flen);<br>&gt; +<=
br>&gt; + &nbsp; &nbsp;set=5Fsys=5Fboot=5Foptions=5Ft * reqptr =3D (set=5Fs=
ys=5Fboot=5Foptions=5Ft *) request;<br>&gt; +<br>&gt; + &nbsp; &nbsp;char o=
utput=5Fbuf[NUM=5FRETURN=5FBYTES=5FOF=5FSET] =3D {0};<br>&gt; +<br>&gt; + &=
nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * Parameter #5 means boot flags. Ple=
ase refer to 28.13 of ipmi doc.<br>&gt; + &nbsp; &nbsp; * This is the only =
parameter used by petitboot.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &n=
bsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;/*<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * To represent a hex in string,=
 e.g., "A0A0", which represents two bytes<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; * in the hex, but requires 5 bytes to store it as string, i.e., 4<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; * characters to store the "A0A0" and 1 ad=
ditional space for "\0".<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * Thereby we=
 have 2 * &lt;number of bytes&gt; + 1 for the string buffer.<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char input=
=5Fbuf[NUM=5FINPUT=5FBYTES=5FOF=5FSET * 2 + 1];<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;sprintf(input=5Fbuf, "%llX", reqptr-&gt;data.data64);<br>&gt; +<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty(input=
=5Fbuf);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus set p=
roperty failed for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*dat=
a=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FSET;<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;// Return code OK.<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf=
[0] =3D IPMI=5FOK;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, ou=
tput=5Fbuf, *data=5Flen);<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;output=5Fbuf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, output=5Fbuf, *data=5Flen);<br>=
<br>... previous comments, there really is no need for the memcpy</font></d=
iv>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]:=E2=80=8B answered before.<br><br><font fac=
e=3D"Default Monospace,Courier New,Courier,monospace" size=3D"2" >&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n=
", reqptr-&gt;parameter);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=
=5FCC=5FPARM=5FNOT=5FSUPPORTED; &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &n=
bsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;return rc;<b=
r>&gt; @@ -135,12 +449,16 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fbo=
ot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;<br>=
&gt; &nbsp;void register=5Fnetfn=5Fchassis=5Ffunctions()<br>&gt; &nbsp;{<br=
>&gt; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=
=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);<br>&gt; + &nbsp; &nbsp;printf("Register=
ing NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);<=
br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IP=
MI=5FCMD=5FWILDCARD, NULL, ipmi=5Fchassis=5Fwildcard);<br>&gt; &nbsp;<br>&g=
t; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5F=
CHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &nbsp;p=
rintf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCM=
D=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregiste=
r=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NUL=
L, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);<br>&gt; &nbsp;<br>&gt; - &=
nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSI=
S, IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>&gt; + &nbsp; &nbsp;printf("Register=
ing NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=
=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFU=
N=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=
=5Fset=5Fsys=5Fboot=5Foptions);<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf("Re=
gistering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASS=
IS=5FCONTROL);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFU=
N=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol=
);<br>&gt; &nbsp;}<br>&gt; +<br>&gt; diff --git a/chassishandler.h b/chassi=
shandler.h<br>&gt; index 1a26411..a310741 100644<br>&gt; --- a/chassishandl=
er.h<br>&gt; +++ b/chassishandler.h<br>&gt; @@ -3,21 +3,39 @@<br>&gt; &nbsp=
;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt; &nbsp;<br>&gt; +// TODO: =
Petitboot requires 8 bytes of response<br>&gt; +// however only 5 of them a=
re used. The remaining<br>&gt; +// 3 bytes are not used in petitboot and th=
e value<br>&gt; +// of them are all zero.<br>&gt; +#define NUM=5FRETURN=5FB=
YTES=5FOF=5FGET 8<br>&gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED 5=
<br>&gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FSET 1<br>&gt; +#define NUM=5F=
INPUT=5FBYTES=5FOF=5FSET 5<br>&gt; +<br>&gt; &nbsp;// IPMI commands for Cha=
ssis net functions.<br>&gt; &nbsp;enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>&gt; &n=
bsp;{<br>&gt; &nbsp; // Chassis Control<br>&gt; &nbsp; IPMI=5FCMD=5FCHASSIS=
=5FCONTROL &nbsp;=3D 0x02,<br>&gt; &nbsp; &nbsp; &nbsp;// Get capability bi=
ts<br>&gt; + &nbsp; &nbsp;IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS =3D 0x08,=
<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS =3D 0x=
09,<br>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt; &nbsp;// Command specific compl=
etion codes<br>&gt; &nbsp;enum ipmi=5Fchassis=5Freturn=5Fcodes<br>&gt; &nbs=
p;{<br>&gt; + &nbsp; &nbsp;IPMI=5FOK =3D 0x0,<br>&gt; &nbsp; &nbsp; &nbsp;I=
PMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,<br>&gt; &nbsp;};<br>&gt; &nbsp;=
<br>&gt; +// Generic completion codes,<br>&gt; +// see IPMI doc section 5.2=
<br>&gt; +enum ipmi=5Fgeneric=5Freturn=5Fcodes<br>&gt; +{<br>&gt; + &nbsp; =
&nbsp;IPMI=5FOUT=5FOF=5FSPACE =3D 0xC4,<br>&gt; +};<br>&gt; +<br>&gt; &nbsp=
;// Various Chassis operations under a single command.<br>&gt; &nbsp;enum i=
pmi=5Fchassis=5Fcontrol=5Fcmds : uint8=5Ft<br>&gt; &nbsp;{</font></div></di=
v></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
