Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CB0D81A113E
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 12:26:54 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 5 Jan 2016 11:26:52 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 5 Jan 2016 11:26:49 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 3CAFB2BB0054
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 12:26:49 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u051QgKK28311674
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 12:26:51 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u051QGx3012362
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 12:26:16 +1100
Received: from d50lp01.ny.us.ibm.com ([146.89.104.207])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u051QDqs011157
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 12:26:15 +1100
Message-Id: <201601050126.u051QDqs011157@d23av03.au.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Mon, 4 Jan 2016 20:25:17 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 4 Jan 2016 20:25:15 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 5 Jan 2016 01:25:14 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Jan 2016 01:25:11 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016010501251133-487094 ;
 Tue, 5 Jan 2016 01:25:11 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v3] Add get/set ipmid command support
 with correct DBUS property handling.
In-Reply-To: <20160104173854.2da52ef6@camb691>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Tue, 5 Jan 2016 01:25:11 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160104173854.2da52ef6@camb691>,
 <1450837827-22614-1-git-send-email-openbmc-patches@stwcx.xyz><1450837827-22614-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 12443
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16010501-0029-0000-0000-000002B85C22
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.096222; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004755; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000129; SDB=6.00640627; UDB=6.00288275; UTC=2016-01-05
 01:25:13
x-cbparentid: 16010501-5920-0000-0000-0000058DBF99
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
X-List-Received-Date: Tue, 05 Jan 2016 01:26:54 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Thanks Cyril for your comment.&nbsp;</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I addressed most of your comments in my latest updates to=
 my pull request.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >More answers as below, starting with "&gt;&gt;&gt;&gt; [p=
engfei]: "</div>
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
c@lists.ozlabs.org<br>Subject: Re: [PATCH phosphor-host-ipmid v3] Add get/s=
et ipmid command support with correct DBUS property handling.<br>Date: Mon,=
 Jan 4, 2016 2:40 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Tue, 22 Dec 2015 20:30:27 -0600<br>OpenBMC Patches &lt;openbmc-patc=
hes@stwcx.xyz&gt; wrote:<br><br>&gt; From: shgoupf &lt;shgoupf@cn.ibm.com&g=
t;<br>&gt;<br><br>Hi shgoupf,<br><br>The patch needs work, unfortunately it=
 appears there are some problems you've<br>inherited here but lets not cont=
inue them.<br><br>I've outlined some concerns below.<br><br>&gt; 1) Two met=
hods to handle the dbus property set and get:<br>&gt; &nbsp; &nbsp; a) dbus=
=5Fset=5Fproperty()<br>&gt; &nbsp; &nbsp; b) dbus=5Fget=5Fproperty()<br>&gt=
; 2) The property is stored as a 10 character strings which representsd 5-b=
yte information.<br>&gt; 3) ipmid set method is registered and implemented =
since petitboot will use it to clear the boot options.<br>&gt; 4) Get servi=
ce name via object mapper<br>&gt; &nbsp; &nbsp; a) The connection name is g=
ot via objectmapper.<br>&gt; &nbsp; &nbsp; b) The method used to get the co=
nnection name is object=5Fmapper=5Fget=5Fconnection().<br>&gt; &nbsp; &nbsp=
; c) dbus=5Fget=5Fproperty/dbus=5Fset=5Fproperty will get the connection na=
me via the above method instead of hard coding.<br>&gt; 5) Error code are p=
roperly handled.<br>&gt; 6) Use sprinf/sscanf for int/string conversion.<br=
>&gt; &nbsp; &nbsp; a) Instead of reinventing the wheel by defining methods=
 converting int to string, use sprintf/sscanf should be a more clean and ro=
bust way.<br>&gt; ---<br>&gt; &nbsp;chassishandler.C | 320 ++++++++++++++++=
++++++++++++++++++++++++++++++++++++---<br>&gt; &nbsp;chassishandler.h | &n=
bsp;17 +++<br>&gt; &nbsp;2 files changed, 325 insertions(+), 12 deletions(-=
)<br>&gt;<br>&gt; diff --git a/chassishandler.C b/chassishandler.C<br>&gt; =
index 1389db9..d68b5a8 100644<br>&gt; --- a/chassishandler.C<br>&gt; +++ b/=
chassishandler.C<br>&gt; @@ -9,6 +9,205 @@ const char &nbsp;*chassis=5Fbus=
=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt=
; &nbsp;const char &nbsp;*chassis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/op=
enbmc/control/chassis0";<br>&gt; &nbsp;const char &nbsp;*chassis=5Fintf=5Fn=
ame &nbsp; &nbsp; =3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; &nbsp;<b=
r>&gt; +// Host settings in dbus<br>&gt; +// Service name should be referen=
ced by connection name got via object mapper<br>&gt; +// const char &nbsp;*=
settings=5Fservice=5Fname =3D &nbsp;"org.openbmc.settings.Host";<br>&gt; +c=
onst char &nbsp;*settings=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/openbmc/set=
tings/host0";<br>&gt; +const char &nbsp;*settings=5Fintf=5Fname &nbsp; &nbs=
p;=3D &nbsp;"org.freedesktop.DBus.Properties";<br>&gt; +<br>&gt; +const cha=
r &nbsp;*objmapper=5Fservice=5Fname =3D &nbsp;"org.openbmc.objectmapper";<b=
r>&gt; +const char &nbsp;*objmapper=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/o=
penbmc/objectmapper/objectmapper";<br>&gt; +const char &nbsp;*objmapper=5Fi=
ntf=5Fname &nbsp; &nbsp;=3D &nbsp;"org.openbmc.objectmapper.ObjectMapper";<=
br>&gt; +<br>&gt; +int object=5Fmapper=5Fget=5Fconnection(char** buf, const=
 char* obj=5Fpath)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error=
 =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *m =
=3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus *bus =3D NULL;<br>&gt; + &nbsp; &=
nbsp;char *temp=5Fbuf =3D NULL, *intf =3D NULL;<br>&gt; + &nbsp; &nbsp;size=
=5Ft buf=5Fsize =3D 0;<br>&gt; + &nbsp; &nbsp;int r;<br>&gt; +<br>&gt; + &n=
bsp; &nbsp;// Open the system bus where most system services are provided.<=
br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>&gt; + =
&nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(s=
tderr, "Failed to connect to system bus: %s\n", strerror(-r));<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br=
>&gt; + &nbsp; &nbsp;// Bus, service, object path, interface and method are=
 provided to call<br>&gt; + &nbsp; &nbsp;// the method.<br>&gt; + &nbsp; &n=
bsp;// Signatures and input arguments are provided by the arguments at the<=
br>&gt; + &nbsp; &nbsp;// end.<br><br>Multiline comments should use the mul=
tiline comment style /* */, so:<br><br>&nbsp;&nbsp; &nbsp; &nbsp; /*<br>&nb=
sp;&nbsp; &nbsp; &nbsp; &nbsp;* Bus, service, object path, interface and me=
thod are provided to call<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;* the method.=
<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;* Signatures and input arguments are p=
rovided by the arguments at the<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;* end.<=
br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;*/</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Thanks. I have updated the comment style i=
n my latest pull request.<br><br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=
=5Fmethod(bus,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;objmapper=
=5Fservice=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* service to contact */<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;objmapper=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;objmapper=5Fintf=5Fname, &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; /* interface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
"GetObject", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* method name */<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error, &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* object to return error in */<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* return message on succ=
ess */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj=5Fpath &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (=
r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to=
 issue method call: %s\n", error.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp=
;// Get the key, aka, the connection name<br>&gt; + &nbsp; &nbsp;sd=5Fbus=
=5Fmessage=5Fread(m, "a{sas}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; +=
 &nbsp; &nbsp;// TODO: check the return code. Currently for no reason the m=
essage<br>&gt; + &nbsp; &nbsp;// parsing of object mapper is always complai=
ning about<br>&gt; + &nbsp; &nbsp;// "Device or resource busy", but the res=
ult seems OK for now. Need<br>&gt; + &nbsp; &nbsp;// further checks.<br><br=
>So how sure are you that what you're doing now is robust?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: For now, per my testing, the result is cor=
rect. So I believe we can revisit this later when the issue is addressed.<b=
r><br>&gt; + &nbsp; &nbsp;//r =3D sd=5Fbus=5Fmessage=5Fread(m, "a{sas}", 1,=
 &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; + &nbsp; &nbsp;//if (r &lt; 0) {<b=
r>&gt; + &nbsp; &nbsp;// &nbsp; &nbsp;fprintf(stderr, "Failed to parse resp=
onse message: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbsp;// &nbsp; &nbsp;=
goto finish;<br>&gt; + &nbsp; &nbsp;//}<br><br>Is there a reason you're sen=
ding commented code?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Just want to preserve the code that should=
 be resumed when the issued is addressed.<br><br>&gt; +<br>&gt; + &nbsp; &n=
bsp;buf=5Fsize =3D strlen(temp=5Fbuf) + 1;<br>&gt; + &nbsp; &nbsp;printf("I=
PMID connection name: %s\n", temp=5Fbuf);<br>&gt; + &nbsp; &nbsp;*buf =3D (=
char*)malloc(buf=5Fsize);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (*buf =3D=3D =
NULL) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Malloc failed=
 for get=5Fsys=5Fboot=5Foptions");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcpy(*buf, temp=5Fbuf, buf=5Fsiz=
e);<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffr=
ee(&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&g=
t; + &nbsp; &nbsp;sd=5Fbus=5Funref(bus);<br>&gt; +<br>&gt; + &nbsp; &nbsp;r=
eturn r;<br>&gt; +}<br>&gt; +<br>&gt; +int dbus=5Fget=5Fproperty(char* buf)=
<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FER=
ROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *m =3D NULL;<br>&gt; =
+ &nbsp; &nbsp;sd=5Fbus *bus =3D NULL;<br>&gt; + &nbsp; &nbsp;char* temp=5F=
buf =3D NULL;<br>&gt; + &nbsp; &nbsp;uint8=5Ft* get=5Fvalue =3D NULL;<br>&g=
t; + &nbsp; &nbsp;char* connection =3D NULL;<br>&gt; + &nbsp; &nbsp;int r, =
i;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D object=5Fmapper=5Fget=5Fconnectio=
n(&amp;connection, settings=5Fobject=5Fname);<br>&gt; + &nbsp; &nbsp;if (r =
&lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to g=
et connection, return value: %d.\n", r);<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;p=
rintf("connection: %s\n", connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;// =
Open the system bus where most system services are provided.<br>&gt; + &nbs=
p; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>&gt; + &nbsp; &nbsp;i=
f (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed=
 to connect to system bus: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;// Bus, service, object path, interface and method are provided to c=
all<br>&gt; + &nbsp; &nbsp;// the method.<br>&gt; + &nbsp; &nbsp;// Signatu=
res and input arguments are provided by the arguments at the<br>&gt; + &nbs=
p; &nbsp;// end.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod(bus,=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection, &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; /* service to contact */<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; /* interface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;"Get", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* meth=
od name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error, &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object to return error=
 in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return message o=
n success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ss", &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; /* first argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"boot=5Fflags"); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* second argument */<b=
r>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;fprintf(stderr, "Failed to issue method call: %s\n", error.messag=
e);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbs=
p;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;// The output should be parsed exactly=
 the same as the output formatting<br>&gt; + &nbsp; &nbsp;// specified.<br>=
&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread(m, "v", "s", &amp;temp=
=5Fbuf);<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;fprintf(stderr, "Failed to parse response message: %s\n", strerro=
r(-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf("IPMID boot option property=
 get: {%s}.\n", (char*) temp=5Fbuf);<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcp=
y(buf, temp=5Fbuf, 2*NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED + 1);<br><br>Th=
is isn't the only place you do this 2*value + 1, I also don't see a place<b=
r>you've used NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED do you just want to ma=
ke the #define<br>11? What are you trying to do?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: comments added in the code to explain this=
. Quoted as below:</font></div>
<div><table data-tab-size=3D"8" >        <tbody>                <tr>       =
                 <td>+ /*</td>                </tr>                <tr>    =
                    <td>&nbsp;</td>                        <td data-line-nu=
mber=3D"420" id=3D"diff-f609493af6d78ff9bfaa4742d40f1ca5R420" >&nbsp;</td> =
                       <td>+ * To represent a hex in string, e.g., "A0A0", =
which represents two bytes</td>                </tr>                <tr>   =
                     <td>&nbsp;</td>                        <td data-line-n=
umber=3D"421" id=3D"diff-f609493af6d78ff9bfaa4742d40f1ca5R421" >&nbsp;</td>=
                        <td>+ * in the hex, but requires 5 bytes to store i=
t as string, i.e., 4</td>                </tr>                <tr>         =
               <td>&nbsp;</td>                        <td data-line-number=
=3D"422" id=3D"diff-f609493af6d78ff9bfaa4742d40f1ca5R422" >&nbsp;</td>     =
                   <td>+ * characters to store the "A0A0" and 1 additional =
space for "\0".</td>                </tr>                <tr>              =
          <td>&nbsp;</td>                        <td data-line-number=3D"42=
3" id=3D"diff-f609493af6d78ff9bfaa4742d40f1ca5R423" >&nbsp;</td>           =
             <td>+ * Thereby we have 2 * &lt;number of bytes&gt; + 1 for th=
e string buffer.</td>                </tr>                <tr>             =
           <td>&nbsp;</td>                        <td data-line-number=3D"4=
24" id=3D"diff-f609493af6d78ff9bfaa4742d40f1ca5R424" >&nbsp;</td>          =
              <td>+ */</td>                </tr>        </tbody></table>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5F=
free(&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>=
&gt; + &nbsp; &nbsp;sd=5Fbus=5Funref(bus);<br>&gt; + &nbsp; &nbsp;free(conn=
ection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +<br=
>&gt; +int dbus=5Fset=5Fproperty(const char* buf)<br>&gt; +{<br>&gt; + &nbs=
p; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbs=
p; &nbsp;sd=5Fbus=5Fmessage *m =3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus *b=
us =3D NULL;<br>&gt; + &nbsp; &nbsp;char* connection =3D NULL;<br>&gt; + &n=
bsp; &nbsp;int r;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =3D object=5Fmapper=5F=
get=5Fconnection(&amp;connection, settings=5Fobject=5Fname);<br>&gt; + &nbs=
p; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r, "Failed to get connection, return value: %d.\n", r);<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &n=
bsp;printf("connection: %s\n", connection);<br>&gt; +<br>&gt; + &nbsp; &nbs=
p;// Open the system bus where most system services are provided.<br>&gt; +=
 &nbsp; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem(&amp;bus);<br>&gt; + &nbsp; &n=
bsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "F=
ailed to connect to system bus: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &=
nbsp; &nbsp;// Bus, service, object path, interface and method are provided=
 to call<br>&gt; + &nbsp; &nbsp;// the method.<br>&gt; + &nbsp; &nbsp;// Si=
gnatures and input arguments are provided by the arguments at the<br>&gt; +=
 &nbsp; &nbsp;// end.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod=
(bus,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection, &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; /* service to contact */<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path =
*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fnam=
e, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; /* interface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;"Set", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/*=
 method name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;err=
or, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object to return =
error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return mess=
age on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ssv",=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* input signatur=
e */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fn=
ame, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; /* first argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;"boot=5Fflags", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* second argument=
 */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* third argument */<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;buf); &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* fourth argument */<br>&gt; +<br>&gt; =
+ &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf=
(stderr, "Failed to issue method call: %s\n", error.message);<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>=
&gt; + &nbsp; &nbsp;printf("IPMID boot option property set: {%s}.\n", buf);=
<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(=
&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(m);<br>&gt; =
+ &nbsp; &nbsp;sd=5Fbus=5Funref(bus);<br>&gt; + &nbsp; &nbsp;free(connectio=
n);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +<br>&gt;=
 &nbsp;void register=5Fnetfn=5Fchassis=5Ffunctions() =5F=5Fattribute=5F=5F(=
(constructor));<br>&gt; &nbsp;<br>&gt; &nbsp;struct get=5Fsys=5Fboot=5Fopti=
ons=5Ft {<br>&gt; @@ -17,8 +216,25 @@ struct get=5Fsys=5Fboot=5Foptions=5Ft=
 {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft block;<br>&gt; &nbsp;} &nbsp;=5F=
=5Fattribute=5F=5F ((packed));<br>&gt; &nbsp;<br>&gt; -ipmi=5Fret=5Ft ipmi=
=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; -=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; +struct set=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; + &=
nbsp; &nbsp;uint8=5Ft parameter;<br>&gt; + &nbsp; &nbsp;union {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;struct {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;uint8=5Ft d1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint8=5Ft d2;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft=
 d3;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d4;<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d5;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d6;<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d7;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;uint8=5Ft d8;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;} data8;=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft data64;<br>&gt; + &nbsp; &=
nbsp;} data;<br>&gt; +} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br><br>Ok s=
o I'm opposed to casting an array into a struct however, after having<br>re=
ad part 28.12 - how can you be sure that the data portion is going to be 8<=
br>bytes? It looks like you could get zero data...<br><br>"Passing 0-bytes =
of parameter data allows the parameter valid bit to be<br>changed without a=
ffecting the present parameter setting. "<br><br>I'm worried.</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: currently this patch only supports petitbo=
ot, as petitboot only uses 8 bytes, I believe it's fine to do this.<br><br>=
&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft n=
etfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Freq=
uest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft conte=
xt)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;printf("Handling CHASSIS WI=
LDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);<br>&gt; @@ -48,7 +264,7 @@ =
int ipmi=5Fchassis=5Fpower=5Fcontrol(const char *method)<br>&gt; &nbsp;<br>=
&gt; &nbsp; rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp; &nbsp; &nbsp=
; &nbsp; // On the System Bus<br>&gt; &nbsp; chassis=5Fbus=5Fname, &nbsp; &=
nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; - chassis=5Fobject=5Fname,=
 &nbsp; &nbsp; // Object path<br>&gt; + chassis=5Fobject=5Fname, &nbsp; &nb=
sp; // Object path<br>&gt; &nbsp; chassis=5Fintf=5Fname, &nbsp; &nbsp; &nbs=
p; // Interface name<br>&gt; &nbsp; method, &nbsp; &nbsp; &nbsp; // Method =
to be called<br>&gt; &nbsp; &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; // objec=
t to return error<br>&gt; @@ -73,8 +289,8 @@ int ipmi=5Fchassis=5Fpower=5Fc=
ontrol(const char *method)<br>&gt; &nbsp;//--------------------------------=
--------------------------------------<br>&gt; &nbsp;// Chassis Control com=
mands<br>&gt; &nbsp;//-----------------------------------------------------=
-----------------<br>&gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fn=
etfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft re=
quest, ipmi=5Fresponse=5Ft response,<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=
=5Fcontrol(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ip=
mi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &=
nbsp;{<br>&gt; &nbsp; // Error from power off.<br>&gt; @@ -105,8 +321,8 @@ =
ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=
=5Ft cmd,<br>&gt; &nbsp; return ( (rc &lt; 0) ? IPMI=5FCC=5FINVALID : IPMI=
=5FCC=5FOK);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -ipmi=5Fret=5Ft ipmi=5F=
chassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft=
 cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ip=
mi=5Fresponse=5Ft response,<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5F=
sys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5F=
t response,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=
=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &nbsp;{<br>&gt; &nbsp;=
 &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; @@ -116,23 +332=
,100 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fn=
etfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &n=
bsp;get=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (get=5Fsys=5Fboot=5Foptions=
=5Ft*) request;<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;// TODO Return defaul=
t values to OPAL until dbus interface is available<br>&gt; + &nbsp; &nbsp;c=
har* buf =3D (char*)malloc(NUM=5FRETURN=5FBYTES=5FOF=5FGET*2 + 1);<br><br>W=
hy are you mallocing buf, whats wrong with having it on the stack?</font></=
div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>See my previous comment about the 2*value + 1, where you'=
ve used it twice with<br>2* +1 and once without, what's going on?<br>&gt; +=
<br>&gt; + &nbsp; &nbsp;if (buf =3D=3D NULL) {<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;fprintf(stderr, "Malloc failed for get=5Fsys=5Fboot=5Foptions.\n")=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&=
gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Init the buffer to=
 all zero.<br>&gt; + &nbsp; &nbsp;memset(buf, 0, NUM=5FRETURN=5FBYTES=5FOF=
=5FGET*2 + 1);<br>&gt; +<br><br>Might I suggest you use calloc(1, &lt;size&=
gt;); rather than malloc if you want<br>zeroed memory?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp;// Parameter #5 means boot flags. Ple=
ase refer to 28.13 of ipmi doc.<br>&gt; + &nbsp; &nbsp;// This is the only =
parameter used by petitboot.<br>&gt; + &nbsp; &nbsp;if (reqptr-&gt;paramete=
r =3D=3D 5)<br>&gt; + &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;i=
nt r =3D dbus=5Fget=5Fproperty(buf);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;fprintf(stderr, "Dbus get property failed for get=5Fsys=5Fboot=5Foptions.\=
n");<br><br>If I'm not mistaken you'll have a leak of buf here?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IP=
MI=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fvalue;<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;sscanf(buf, "%llX", &amp;return=5Fvalue);<br><br>ato=
ll()?</font></div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: I believe sscanf works fine so no need to =
change it.<br><br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =
=3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/=
/ TODO: last 3 bytes<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// (NUM=5FRETURN=
=5FBYTES=5FOF=5FGET - NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED) is meanlingle=
ss<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, (uint8=5Ft*)(&amp;=
return=5Fvalue), *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;free(bu=
f);<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;else<br>&gt; + &nbsp; &=
nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5F=
BYTES=5FOF=5FGET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// 0x80: parameter n=
ot supported<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;buf[0] =3D 0x80;<br><br>#=
define?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, buf, *=
data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;free(buf);<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n", reqp=
tr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5F=
PARM=5FNOT=5FSUPPORTED;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;return rc;<br>&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchass=
is=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5F=
response=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=
=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; +{<br>&gt; + &nb=
sp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; + &nbsp; =
&nbsp;printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; + &nbsp; &nbsp;p=
rintf("IPMID set command required return bytes: %i\n", *data=5Flen);<br>&gt=
; +<br>&gt; + &nbsp; &nbsp;set=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (set=
=5Fsys=5Fboot=5Foptions=5Ft*) request;<br>&gt; +<br>&gt; + &nbsp; &nbsp;cha=
r* output=5Fbuf =3D (char*)malloc(NUM=5FRETURN=5FBYTES=5FOF=5FSET);<br>&gt;=
 +<br>&gt; + &nbsp; &nbsp;if (output=5Fbuf =3D=3D NULL) {<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp;fprintf(stderr, "Malloc failed for set=5Fsys=5Fboot=5Fo=
ptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5F=
SPACE;<br>&gt; + &nbsp; &nbsp;}<br>&gt; &nbsp;<br><br>You didn't zero the m=
emory here? get/sets should probably do the same in this<br>respect.</font>=
</div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; &nbsp; &nbsp; &nbsp;if (reqptr-&gt;parameter =3D=3D =
5) // Parameter #5<br>&gt; &nbsp; &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &n=
bsp; &nbsp;uint8=5Ft buf[] =3D {0x1,0x5,80,0,0,0,0};<br>&gt; - &nbsp; &nbsp=
; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<br>&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;memcpy(response, &amp;buf, *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;char input=5Fbuf[NUM=5FINPUT=5FBYTES=5FOF=5FSET*2 + 1];<br><br>Gah=
 those odd maths again?<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sprintf(in=
put=5Fbuf, "%llX", reqptr-&gt;data.data64);<br>&gt; +<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty(input=5Fbuf);<br>&gt; +<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus set property failed for set=
=5Fsys=5Fboot=5Foptions.\n");<br><br>Leak of output=5Fbuf?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IP=
MI=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=
=5FSET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// 0x0: return code OK.<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf[0] =3D 0x0;<br><br>#define?</fo=
nt></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, output=
=5Fbuf, *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;free(output=5Fbu=
f);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp;else<br>&gt; =
&nbsp; &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// 0x80: paramet=
er not supported<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf[0] =3D 0=
x80;<br><br>#define?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: Yes, good point. Updated in the latest pul=
l request.<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, output=
=5Fbuf, *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;free(output=5Fbu=
f);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported =
parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; - &nbsp; &nbsp; &nbsp; &n=
bsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED; &nbsp; &nbsp; &nbsp; &nbsp;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPOR=
TED;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nb=
sp;return rc;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; +<br>&gt; &nbsp;void r=
egister=5Fnetfn=5Fchassis=5Ffunctions()<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbs=
p; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, =
IPMI=5FCMD=5FWILDCARD);<br>&gt; @@ -141,6 +434,9 @@ void register=5Fnetfn=
=5Fchassis=5Ffunctions()<br>&gt; &nbsp; &nbsp; &nbsp;printf("Registering Ne=
tFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=
=5FOPTIONS);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=
=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=
=5Fget=5Fsys=5Fboot=5Foptions);<br>&gt; &nbsp;<br>&gt; + &nbsp; &nbsp;print=
f("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FS=
ET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallba=
ck(NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5F=
chassis=5Fset=5Fsys=5Fboot=5Foptions);<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbs=
p;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5F=
CMD=5FCHASSIS=5FCONTROL);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcal=
lback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassi=
s=5Fcontrol);<br>&gt; &nbsp;}<br>&gt; diff --git a/chassishandler.h b/chass=
ishandler.h<br>&gt; index 1a26411..4676667 100644<br>&gt; --- a/chassishand=
ler.h<br>&gt; +++ b/chassishandler.h<br>&gt; @@ -3,12 +3,22 @@<br>&gt; &nbs=
p;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt; &nbsp;<br>&gt; +// TODO:=
 Petitboot requires 8 bytes of response<br>&gt; +// however only 5 of them =
are used. The remaining<br>&gt; +// 3 bytes are not used in petitboot and t=
he value<br>&gt; +// of them are all zero.<br><br>Just so I'm understanding=
 correctly, you're writing an IPMI daemon here? I'm<br>not sure you should =
be noting quirks of petitboot, you should be doing what the<br>IPMI spec sa=
ys</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt; [pengfei]: currently this patch only supports petitbo=
ot, as petitboot only uses 8 bytes, I believe it's fine to do this.<br><br>=
&gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FGET 8<br>&gt; +#define NUM=5FRETU=
RN=5FBYTES=5FOF=5FGET=5FUSED 5<br>&gt; +#define NUM=5FRETURN=5FBYTES=5FOF=
=5FSET 1<br>&gt; +#define NUM=5FINPUT=5FBYTES=5FOF=5FSET 5<br>&gt; +<br>&gt=
; &nbsp;// IPMI commands for Chassis net functions.<br>&gt; &nbsp;enum ipmi=
=5Fnetfn=5Fapp=5Fcmds<br>&gt; &nbsp;{<br>&gt; &nbsp; // Chassis Control<br>=
&gt; &nbsp; IPMI=5FCMD=5FCHASSIS=5FCONTROL &nbsp;=3D 0x02,<br>&gt; &nbsp; &=
nbsp; &nbsp;// Get capability bits<br>&gt; + &nbsp; &nbsp;IPMI=5FCMD=5FSET=
=5FSYS=5FBOOT=5FOPTIONS =3D 0x08,<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5F=
GET=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,<br>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt=
; @@ -18,6 +28,13 @@ enum ipmi=5Fchassis=5Freturn=5Fcodes<br>&gt; &nbsp; &n=
bsp; &nbsp;IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,<br>&gt; &nbsp;};<br=
>&gt; &nbsp;<br>&gt; +// Generic completion codes,<br>&gt; +// see IPMI doc=
 section 5.2<br>&gt; +enum ipmi=5Fgeneric=5Freturn=5Fcodes<br>&gt; +{<br>&g=
t; + &nbsp; &nbsp;IPMI=5FOUT=5FOF=5FSPACE =3D 0xC4,<br>&gt; +};<br>&gt; +<b=
r>&gt; &nbsp;// Various Chassis operations under a single command.<br>&gt; =
&nbsp;enum ipmi=5Fchassis=5Fcontrol=5Fcmds : uint8=5Ft<br>&gt; &nbsp;{</fon=
t></div></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
