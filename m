Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7F9EF1A0102
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 17:14:15 +1100 (AEDT)
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 16:14:13 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 6 Jan 2016 16:14:12 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 230B02CE8054
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 17:14:12 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u066E4Wx52822134
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 17:14:12 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u066Ddct024397
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 17:13:39 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u066Dbgg023586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 17:13:38 +1100
Message-Id: <201601060613.u066Dbgg023586@d23av03.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 5 Jan 2016 23:13:13 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 5 Jan 2016 23:13:10 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 06:13:09 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 6 Jan 2016 06:13:06 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016010606135038-32176 ;
 Wed, 6 Jan 2016 06:13:50 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <20160106160934.493e446f@camb691>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Wed, 6 Jan 2016 06:13:06 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160106160934.493e446f@camb691>,
 <1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz><1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 25511
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
x-cbid: 16010606-0033-0000-0000-000002AF96AD
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004758; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00641199; UDB=6.00288616; UTC=2016-01-06
 06:13:08
x-cbparentid: 16010606-4778-0000-0000-000001765683
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
X-List-Received-Date: Wed, 06 Jan 2016 06:14:16 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hey Cyril,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks for your detailed review on this patch.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Just want to answer (most of) your questions in batch:</d=
iv>
<div dir=3D"ltr" >1) This patch intended to add the functionality of ipmi s=
et/get boot option, with dbus property and object mapper used, so I believe=
 all of the contents in this patch should be considered as a whole. We shou=
ldn't split them into multiple patches.</div>
<div dir=3D"ltr" >2) atoi is an alternative, but I don't see there is any r=
eason why to use it since sscanf/sprintf works fine for now. I don't believ=
e there is too much performance concern there.&nbsp;</div>
<div dir=3D"ltr" >3) For those sd=5Fbus method call with signatures ("s", "=
v", "s{ass}", etc.), I believe the current way I use it is valid since I ha=
ve tested them already.</div>
<div dir=3D"ltr" >4) For the commented out error handling, I believe it's j=
ust a work around, but it did works according to my test. So I believe it's=
 OK for this patch to have it and we should revisit it later.</div>
<div dir=3D"ltr" >5) For the way how return code is handled, I believe it i=
s working fine.</div>
<div dir=3D"ltr" >6) For the coding style stuff, such as spaces between fun=
ction names and the bracket, I don't think it's a major issue. Maybe it's a=
 minor issue that they are not consistent with some piece of code elsewhere=
. It can be fixed with my auto style tool very easily.&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >In a sum, thanks for your effort on reviewing this, but I=
 believe most of your current concerns either are invalid or are&nbsp;only =
minor issues.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, Peng Fei (=E8=8B=
=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Cyril Bur &lt;cyri=
lbur@gmail.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;=
, Peng Fei BG Gou/China/IBM@IBMCN<br>Cc: openbmc@lists.ozlabs.org<br>Subjec=
t: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid command=
 support with correct DBUS property handling.<br>Date: Wed, Jan 6, 2016 1:1=
0 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Mon, &nbsp;4 Jan 2016 19:10:26 -0600<br>OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt; wrote:<br><br>&gt; From: shgoupf &lt;shgoupf@cn.ibm.=
com&gt;<br>&gt;<br><br>Hi again,<br><br>&gt; 1) Add support for IPMI get/se=
t boot option command.<br>&gt; &nbsp; &nbsp; a) boot options stored in dbus=
 property.<br>&gt; &nbsp; &nbsp; b) IPMI get boot option command get boot o=
ption from the dbus<br>&gt; &nbsp; &nbsp; property.<br>&gt; &nbsp; &nbsp; c=
) IPMI set boot option coomand set boot option to the dbus<br>&gt; &nbsp; &=
nbsp; property.<br>&gt; 2) Two methods to handle the dbus property set and =
get:<br>&gt; &nbsp; &nbsp; a) dbus=5Fset=5Fproperty()<br>&gt; &nbsp; &nbsp;=
 b) dbus=5Fget=5Fproperty()<br>&gt; 3) The property is stored as a 10 chara=
cter strings which representsd 5-byte information.<br>&gt; 4) ipmid set met=
hod is registered and implemented since petitboot will use it to clear the =
boot options.<br>&gt; 5) Get service name via object mapper<br>&gt; &nbsp; =
&nbsp; a) The connection name is got via objectmapper.<br>&gt; &nbsp; &nbsp=
; b) The method used to get the connection name is object=5Fmapper=5Fget=5F=
connection().<br>&gt; &nbsp; &nbsp; c) dbus=5Fget=5Fproperty/dbus=5Fset=5Fp=
roperty will get the connection name via the above method instead of hard c=
oding.<br>&gt; 6) Error code are properly handled.<br>&gt; 7) Use sprinf/ss=
canf for int/string conversion.<br>&gt; &nbsp; &nbsp; a) Instead of reinven=
ting the wheel by defining methods converting int to string, use sprintf/ss=
canf should be a more clean and robust way.<br><br>Plus 1 for not reinventi=
ng the wheel but perhaps consider using the best tool<br>for the job, sscan=
f can and does do what you want however atoi, atol, atoll,<br>strtol, strto=
ll, strtoq functions are all designed for this exact purpose. They<br>will =
perform much better than sscanf, also the str* versions give great control<=
br>and error detection capabilities.<br><br><br>&gt; 8) Fix issues addresse=
d by the community.<br>&gt; &nbsp; &nbsp; a) change malloc heap to stack lo=
cal variable.<br>&gt; &nbsp; &nbsp; b) Fix multi line comment style from "/=
/" to "/**/".<br>&gt; &nbsp; &nbsp; c) Add defines for return codes.<br>&gt=
; &nbsp; &nbsp; d) Add more comments.<br><br>It looks like you're adding mo=
re and more into this same patch. A single patch<br>should be one clearly d=
efined piece of work. So you're implementing some new<br>functionality, tha=
t should be its own patch. You're also adding some error<br>handling paths =
- also, its own patch. You've changed some whitespace (some of<br>which was=
 a bad thing) but the good whitespace changes should also be their own<br>p=
atch.<br><br>&gt; &nbsp;chassishandler.C | 492 ++++++++++++++++++++++++++++=
+++++++++++++++++----------<br>&gt; &nbsp;chassishandler.h | &nbsp;18 ++<br=
>&gt; &nbsp;2 files changed, 423 insertions(+), 87 deletions(-)<br>&gt;<br>=
&gt; diff --git a/chassishandler.C b/chassishandler.C<br>&gt; index 1389db9=
..4d941e8 100644<br>&gt; --- a/chassishandler.C<br>&gt; +++ b/chassishandle=
r.C<br>&gt; @@ -5,11 +5,235 @@<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&=
gt; &nbsp;<br>&gt; &nbsp;// OpenBMC Chassis Manager dbus framework<br>&gt; =
-const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.=
openbmc.control.Chassis";<br>&gt; -const char &nbsp;*chassis=5Fobject=5Fnam=
e &nbsp; =3D &nbsp;"/org/openbmc/control/chassis0";<br>&gt; -const char &nb=
sp;*chassis=5Fintf=5Fname &nbsp; &nbsp; =3D &nbsp;"org.openbmc.control.Chas=
sis";<br>&gt; +const char * chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &n=
bsp;"org.openbmc.control.Chassis";<br>&gt; +const char * chassis=5Fobject=
=5Fname &nbsp; =3D &nbsp;"/org/openbmc/control/chassis0";<br>&gt; +const ch=
ar * chassis=5Fintf=5Fname &nbsp; &nbsp; =3D &nbsp;"org.openbmc.control.Cha=
ssis";<br>&gt; &nbsp;<br><br>Not necessary, if anything you should remove t=
he double space but what you've<br>done doesn't look good.<br><br>&gt; -voi=
d register=5Fnetfn=5Fchassis=5Ffunctions() =5F=5Fattribute=5F=5F((construct=
or));<br>&gt; +// Host settings in dbus<br>&gt; +// Service name should be =
referenced by connection name got via object mapper<br>&gt; +const char * s=
ettings=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/openbmc/settings/host0";<br>&=
gt; +const char * settings=5Fintf=5Fname &nbsp; &nbsp;=3D &nbsp;"org.freede=
sktop.DBus.Properties";<br>&gt; +<br>&gt; +const char * objmapper=5Fservice=
=5Fname =3D &nbsp;"org.openbmc.objectmapper";<br>&gt; +const char * objmapp=
er=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/openbmc/objectmapper/objectmapper"=
;<br>&gt; +const char * objmapper=5Fintf=5Fname &nbsp; &nbsp;=3D &nbsp;"org=
.openbmc.objectmapper.ObjectMapper";<br>&gt; +<br><br>We probably want to t=
ry to keep a consistent style. I looked at ipmid.C and<br>that file isn't c=
onsistent but it seems to be mostly "type *name;" and that's<br>the most co=
mmon way everywhere else with C code.<br><br>&gt; +int object=5Fmapper=5Fge=
t=5Fconnection (char ** buf, const char * obj=5Fpath)<br>&gt; +{<br>&gt; + =
&nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + =
&nbsp; &nbsp;sd=5Fbus=5Fmessage * m =3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fb=
us * bus =3D NULL;<br>&gt; + &nbsp; &nbsp;char * temp=5Fbuf =3D NULL, *intf=
 =3D NULL;<br>&gt; + &nbsp; &nbsp;size=5Ft buf=5Fsize =3D 0;<br>&gt; + &nbs=
p; &nbsp;int r;<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Open the system bus whe=
re most system services are provided.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fopen=5Fsystem (&amp;bus);<br>&gt; +<br><br>As an added stylistic note, a=
gain for consistency, ipmid.C, you should avoid<br>having a space between t=
he function name and the parameters<br><br>&gt; + &nbsp; &nbsp;if (r &lt; 0=
) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to connec=
t to system bus: %s\n", strerror (-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*=
<br>&gt; + &nbsp; &nbsp; * Bus, service, object path, interface and method =
are provided to call<br>&gt; + &nbsp; &nbsp; * the method.<br>&gt; + &nbsp;=
 &nbsp; * Signatures and input arguments are provided by the arguments at t=
he<br>&gt; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbs=
p; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod (bus,<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;objmapper=5Fservice=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;/* service to contact */<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;objmapper=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;objmapper=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interface name */<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;"GetObject", &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; /* method name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error, &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* object to return error =
in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* return message on success */<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;obj=5Fpath &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first=
 argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; );<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Fail=
ed to issue method call: %s\n", error.message);<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; =
&nbsp;// Get the key, aka, the connection name<br>&gt; + &nbsp; &nbsp;sd=5F=
bus=5Fmessage=5Fread (m, "a{sas}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&g=
t; +<br><br>This seems very roundabout, could you explain this method call.=
 What are you<br>expecting to receive? From the looks of what you're using =
it for wouldn't it<br>make more sense to just sd=5Fbus=5Fmessage=5Fread a "=
s"?<br><br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * TODO: check the=
 return code. Currently for no reason the message<br>&gt; + &nbsp; &nbsp; *=
 parsing of object mapper is always complaining about<br>&gt; + &nbsp; &nbs=
p; * "Device or resource busy", but the result seems OK for now. Need<br>&g=
t; + &nbsp; &nbsp; * further checks.<br><br>If sd=5Fbus=5Fmessage=5Fread re=
turns a negative value, something definitely went<br>wrong, I highly highly=
 doubt you can use the result if it turns a negative.<br><br>&gt; + &nbsp; =
&nbsp; * TODO: The following code is preserved in the comments so that it c=
an be<br>&gt; + &nbsp; &nbsp; * resumed after the problem aforementioned is=
 resolved.<br>&gt; + &nbsp; &nbsp; *r =3D sd=5Fbus=5Fmessage=5Fread(m, "a{s=
as}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; + &nbsp; &nbsp; *if (r &lt=
; 0) {<br>&gt; + &nbsp; &nbsp; * &nbsp; &nbsp;fprintf(stderr, "Failed to pa=
rse response message: %s\n", strerror(-r));<br>&gt; + &nbsp; &nbsp; * &nbsp=
; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp; *}<br><br>The code is in git, =
it is saved there, delete it now and when someone wants to<br>add it back t=
hey can look in the git history for what was deleted. Having said<br>that, =
the error check should be there, if you're hitting it, you should figure<br=
>out why.<br><br>&gt; + &nbsp; &nbsp; */<br>&gt; +<br>&gt; + &nbsp; &nbsp;b=
uf=5Fsize =3D strlen (temp=5Fbuf) + 1;<br>&gt; + &nbsp; &nbsp;printf ("IPMI=
D connection name: %s\n", temp=5Fbuf);<br>&gt; + &nbsp; &nbsp;*buf =3D (cha=
r *)malloc (buf=5Fsize);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (*buf =3D=3D N=
ULL) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Malloc failed=
 for get=5Fsys=5Fboot=5Foptions");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =
=3D -1;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; =
&nbsp;}<br>&gt; +<br><br>I don't mind using malloc but these are strings no=
? Couldn't strndup be used,<br>might make life easier? Not a big concern.<b=
r><br>&gt; + &nbsp; &nbsp;memcpy (*buf, temp=5Fbuf, buf=5Fsize);<br>&gt; +<=
br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;error=
);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref (m);<br>&gt; + &nbsp; =
&nbsp;sd=5Fbus=5Funref (bus);<br>&gt; +<br><br>Spaces between name and para=
ms<br><br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<br>&gt; +<br>&gt; +int d=
bus=5Fget=5Fproperty (char * buf)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;sd=5Fbu=
s=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbu=
s=5Fmessage * m =3D NULL;<br>&gt; + &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<b=
r>&gt; + &nbsp; &nbsp;char * temp=5Fbuf =3D NULL;<br>&gt; + &nbsp; &nbsp;ui=
nt8=5Ft * get=5Fvalue =3D NULL;<br>&gt; + &nbsp; &nbsp;char * connection =
=3D NULL;<br>&gt; + &nbsp; &nbsp;int r, i;<br>&gt; +<br>&gt; + &nbsp; &nbsp=
;r =3D object=5Fmapper=5Fget=5Fconnection (&amp;connection, settings=5Fobje=
ct=5Fname);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to get connection, return v=
alue: %d.\n", r);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt;=
 + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("connection: %s\=
n", connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Open the system bus wh=
ere most system services are provided.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbu=
s=5Fopen=5Fsystem (&amp;bus);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0=
) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to connec=
t to system bus: %s\n", strerror (-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*=
<br>&gt; + &nbsp; &nbsp; * Bus, service, object path, interface and method =
are provided to call<br>&gt; + &nbsp; &nbsp; * the method.<br>&gt; + &nbsp;=
 &nbsp; * Signatures and input arguments are provided by the arguments at t=
he<br>&gt; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbs=
p; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod (bus,<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;connection, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* service to contact *=
/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object pat=
h */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* in=
terface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"Get", &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* method name */<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;&amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
/* object to return error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return mes=
sage on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ss", &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;"boot=5Fflags"); &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;/* second argument */<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to issue method =
call: %s\n", error.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto fini=
sh;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + =
&nbsp; &nbsp; * The output should be parsed exactly the same as the output =
formatting<br>&gt; + &nbsp; &nbsp; * specified.<br>&gt; + &nbsp; &nbsp; */<=
br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread (m, "v", "s", &amp;t=
emp=5Fbuf);<br>&gt; +<br><br>Why not just read a "s"?<br><br>&gt; + &nbsp; =
&nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr,=
 "Failed to parse response message: %s\n", strerror (-r));<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt=
; + &nbsp; &nbsp;printf ("IPMID boot option property get: {%s}.\n", (char *=
) temp=5Fbuf);<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; =
* To represent a hex in string, e.g., "A0A0", which represents two bytes<br=
>&gt; + &nbsp; &nbsp; * in the hex, but requires 5 bytes to store it as str=
ing, i.e., 4<br>&gt; + &nbsp; &nbsp; * characters to store the "A0A0" and 1=
 additional space for "\0".<br>&gt; + &nbsp; &nbsp; * Thereby we have 2 * &=
lt;number of bytes&gt; + 1 for the string buffer.<br>&gt; + &nbsp; &nbsp; *=
/<br><br>So why don't you have #define NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUS=
ED 11 ?<br><br>This question is out of scope of this patch but why are we p=
assing around<br>numbers as strings? dbus handles other types...<br><br>&gt=
; + &nbsp; &nbsp;memcpy (buf, temp=5Fbuf, 2 * NUM=5FRETURN=5FBYTES=5FOF=5FG=
ET=5FUSED + 1);<br>&gt; +<br>&gt; +finish:<br>&gt; + &nbsp; &nbsp;sd=5Fbus=
=5Ferror=5Ffree (&amp;error);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Fu=
nref (m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Funref (bus);<br>&gt; + &nbsp; &=
nbsp;free (connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; =
+}<br>&gt; +<br>&gt; +int dbus=5Fset=5Fproperty (const char * buf)<br>&gt; =
+{<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNUL=
L;<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage * m =3D NULL;<br>&gt; + &nbsp;=
 &nbsp;sd=5Fbus * bus =3D NULL;<br>&gt; + &nbsp; &nbsp;char * connection =
=3D NULL;<br>&gt; + &nbsp; &nbsp;int r;<br>&gt; +<br>&gt; + &nbsp; &nbsp;r =
=3D object=5Fmapper=5Fget=5Fconnection (&amp;connection, settings=5Fobject=
=5Fname);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to get connection, return val=
ue: %d.\n", r);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; +=
 &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("connection: %s\n"=
, connection);<br>&gt; +<br>&gt; + &nbsp; &nbsp;// Open the system bus wher=
e most system services are provided.<br>&gt; + &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fopen=5Fsystem (&amp;bus);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0)=
 {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to connect=
 to system bus: %s\n", strerror (-r));<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
;goto finish;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/*<=
br>&gt; + &nbsp; &nbsp; * Bus, service, object path, interface and method a=
re provided to call<br>&gt; + &nbsp; &nbsp; * the method.<br>&gt; + &nbsp; =
&nbsp; * Signatures and input arguments are provided by the arguments at th=
e<br>&gt; + &nbsp; &nbsp; * end.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp=
; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod (bus,<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;connection, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* service to contact */=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path=
 */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* int=
erface name */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"Set", &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* method name */<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /=
* object to return error in */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return mess=
age on success */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ssv", &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* input signature */<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;"boot=5Fflags", &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
/* second argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* third argument */<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;buf); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; /* fourth argument */<br>&gt; +<br><br>Are we documenting th=
ese interfaces at all, I don't understand why "ssv" and<br>then a hardcoded=
 "s", why not "sss"?<br><br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to issue method call: %s=
\n", error.message);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&=
gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("IPMID boot o=
ption property set: {%s}.\n", buf);<br>&gt; +<br>&gt; +finish:<br>&gt; + &n=
bsp; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;error);<br>&gt; + &nbsp; &nbsp;sd=
=5Fbus=5Fmessage=5Funref (m);<br>&gt; + &nbsp; &nbsp;sd=5Fbus=5Funref (bus)=
;<br>&gt; + &nbsp; &nbsp;free (connection);<br>&gt; +<br>&gt; + &nbsp; &nbs=
p;return r;<br>&gt; +}<br>&gt; +<br>&gt; +void register=5Fnetfn=5Fchassis=
=5Ffunctions () =5F=5Fattribute=5F=5F ((constructor));<br>&gt; &nbsp;<br>&g=
t; &nbsp;struct get=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp; &nbs=
p;uint8=5Ft parameter;<br>&gt; @@ -17,11 +241,28 @@ struct get=5Fsys=5Fboot=
=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft block;<br>&gt; &nbsp=
;} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &nbsp;<br>&gt; -ipmi=5Fr=
et=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd=
,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=
=5Fresponse=5Ft response,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdat=
a=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; +struct set=5Fs=
ys=5Fboot=5Foptions=5Ft {<br>&gt; + &nbsp; &nbsp;uint8=5Ft parameter;<br>&g=
t; + &nbsp; &nbsp;union {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;struct {<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d1;<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d2;<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d3;<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;uint8=5Ft d4;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;uint8=5Ft d5;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ui=
nt8=5Ft d6;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d7=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d8;<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;} data8;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
uint64=5Ft data64;<br>&gt; + &nbsp; &nbsp;} data;<br>&gt; +} &nbsp;=5F=5Fat=
tribute=5F=5F ((packed));<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=
=5Fwildcard (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Frespo=
nse=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=
=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &nbsp;{<b=
r>&gt; - &nbsp; &nbsp;printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[=
0x%X]\n",netfn, cmd);<br>&gt; + &nbsp; &nbsp;printf ("Handling CHASSIS WILD=
CARD Netfn:[0x%X], Cmd:[0x%X]\n", netfn, cmd);<br><br>Be careful with chang=
es like this, you didn't change this code...<br><br>&gt; &nbsp; &nbsp; &nbs=
p;// Status code.<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5F=
CC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; @@ -31,116 =
+272,193 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn=
, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;//-------------------------------------=
-----------------------<br>&gt; &nbsp;// Calls into Chassis Control Dbus ob=
ject to do the power off<br>&gt; &nbsp;//----------------------------------=
--------------------------<br>&gt; -int ipmi=5Fchassis=5Fpower=5Fcontrol(co=
nst char *method)<br>&gt; +int ipmi=5Fchassis=5Fpower=5Fcontrol (const char=
 * method)<br>&gt; &nbsp;{<br>&gt; - // sd=5Fbus error<br>&gt; - int rc =3D=
 0;<br>&gt; + &nbsp; &nbsp;// sd=5Fbus error<br>&gt; + &nbsp; &nbsp;int rc =
=3D 0;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;// SD Bus error report me=
chanism.<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror bus=5Ferror =3D SD=5F=
BUS=5FERROR=5FNULL;<br>&gt; &nbsp;<br>&gt; - // Response from the call. Alt=
hough there is no response for this call,<br>&gt; - // obligated to mention=
 this to make compiler happy.<br>&gt; - sd=5Fbus=5Fmessage *response =3D NU=
LL;<br>&gt; -<br>&gt; - // Gets a hook onto either a SYSTEM or SESSION bus<=
br>&gt; - sd=5Fbus *bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<b=
r>&gt; -<br>&gt; - rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp; &nbsp=
; &nbsp; &nbsp; // On the System Bus<br>&gt; - chassis=5Fbus=5Fname, &nbsp;=
 &nbsp; &nbsp; &nbsp;// Service to contact<br>&gt; - chassis=5Fobject=5Fnam=
e, &nbsp; &nbsp; // Object path<br>&gt; - chassis=5Fintf=5Fname, &nbsp; &nb=
sp; &nbsp; // Interface name<br>&gt; - method, &nbsp; &nbsp; &nbsp; // Meth=
od to be called<br>&gt; - &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; // object =
to return error<br>&gt; - &amp;response, // Response buffer if any<br>&gt; =
- NULL); // No input arguments<br>&gt; - if(rc &lt; 0)<br>&gt; - {<br>&gt; =
- fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.message);<=
br>&gt; - }<br>&gt; - else<br>&gt; - {<br>&gt; - printf("Chassis Power Off =
initiated successfully\n");<br>&gt; - }<br>&gt; -<br>&gt; - &nbsp; &nbsp;sd=
=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>&gt; - &nbsp; &nbsp;sd=5Fbus=5F=
message=5Funref(response);<br>&gt; -<br>&gt; - return rc;<br>&gt; + &nbsp; =
&nbsp;/*<br>&gt; + &nbsp; &nbsp; * Response from the call. Although there i=
s no response for this call,<br>&gt; + &nbsp; &nbsp; * obligated to mention=
 this to make compiler happy.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &=
nbsp;sd=5Fbus=5Fmessage * response =3D NULL;<br>&gt; +<br>&gt; + &nbsp; &nb=
sp;// Gets a hook onto either a SYSTEM or SESSION bus<br>&gt; + &nbsp; &nbs=
p;sd=5Fbus * bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection ();<br>&gt;=
 +<br>&gt; + &nbsp; &nbsp;rc =3D sd=5Fbus=5Fcall=5Fmethod (bus=5Ftype, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* On the System Bus*/<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; chassis=5Fbus=5Fname, &nbsp; &nbsp; &nbsp; =
&nbsp;/* Service to contact*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chassis=5Fob=
ject=5Fname, &nbsp; &nbsp; /* Object path*/<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; chassis=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; /* Interface name*/<br>&gt; +=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; method, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;/* Method to be called*/<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* obje=
ct to return error*/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;response, &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Response buffer if any*/<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; NULL); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; /* No input arguments*/<br>&gt; +<br>&gt; + &nbsp; =
&nbsp;if (rc &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr=
, "ERROR initiating Power Off:[%s]\n", bus=5Ferror.message);<br>&gt; + &nbs=
p; &nbsp;} else {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;printf ("Chassis Pow=
er Off initiated successfully\n");<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&g=
t; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;bus=5Ferror);<br>&gt; + &nb=
sp; &nbsp;sd=5Fbus=5Fmessage=5Funref (response);<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;return rc;<br><br>Cleanups are great but please send them as a separ=
ate patch, this helps people<br>a lot when reviewing patches, if it is just=
 a cleanup then people can focus on<br>checking that you didn't change beha=
viour OR if you're sending a functional<br>change patch people can focus on=
 checking that you're achieving what you set<br>out to do.<br><br>&gt; &nbs=
p;}<br>&gt; &nbsp;<br>&gt; &nbsp;<br>&gt; &nbsp;//-------------------------=
---------------------------------------------<br>&gt; &nbsp;// Chassis Cont=
rol commands<br>&gt; &nbsp;//----------------------------------------------=
------------------------<br>&gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(i=
pmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=
=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=
=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; +ipmi=5Fret=5Ft =
ipmi=5Fchassis=5Fcontrol (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Frequest=5Ft request, ipmi=
=5Fresponse=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ip=
mi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &nbsp;{=
<br>&gt; - // Error from power off.<br>&gt; - int rc =3D 0;<br>&gt; + &nbsp=
; &nbsp;// Error from power off.<br>&gt; + &nbsp; &nbsp;int rc =3D 0;<br>&g=
t; &nbsp;<br>&gt; - // No response for this command.<br>&gt; + &nbsp; &nbsp=
;// No response for this command.<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =
=3D 0;<br>&gt; &nbsp;<br>&gt; - // Catch the actual operaton by peeking int=
o request buffer<br>&gt; - uint8=5Ft chassis=5Fctrl=5Fcmd =3D *(uint8=5Ft *=
)request;<br>&gt; - printf("Chassis Control Command: Operation:[0x%X]\n",ch=
assis=5Fctrl=5Fcmd);<br>&gt; -<br>&gt; - switch(chassis=5Fctrl=5Fcmd)<br>&g=
t; - {<br>&gt; - case CMD=5FPOWER=5FOFF:<br>&gt; - rc =3D ipmi=5Fchassis=5F=
power=5Fcontrol("powerOff");<br>&gt; - break;<br>&gt; - case CMD=5FHARD=5FR=
ESET:<br>&gt; - rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol("reboot");<br>&gt; =
- break;<br>&gt; - default:<br>&gt; - {<br>&gt; - fprintf(stderr, "Invalid =
Chassis Control command:[0x%X] received\n",chassis=5Fctrl=5Fcmd);<br>&gt; -=
 rc =3D -1;<br>&gt; - }<br>&gt; - }<br>&gt; -<br>&gt; - return ( (rc &lt; 0=
) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<br>&gt; + &nbsp; &nbsp;// Catch =
the actual operaton by peeking into request buffer<br>&gt; + &nbsp; &nbsp;u=
int8=5Ft chassis=5Fctrl=5Fcmd =3D * (uint8=5Ft *)request;<br>&gt; + &nbsp; =
&nbsp;printf ("Chassis Control Command: Operation:[0x%X]\n", chassis=5Fctrl=
=5Fcmd);<br>&gt; +<br>&gt; + &nbsp; &nbsp;switch (chassis=5Fctrl=5Fcmd) {<b=
r>&gt; + &nbsp; &nbsp;case CMD=5FPOWER=5FOFF:<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol ("powerOff");<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;break;<br>&gt; +<br>&gt; + &nbsp; &nbsp;case CMD=5F=
HARD=5FRESET:<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D ipmi=5Fchassis=5F=
power=5Fcontrol ("reboot");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;break;<br>=
&gt; +<br>&gt; + &nbsp; &nbsp;default: {<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;fprintf (stderr, "Invalid Chassis Control command:[0x%X] received\n", ch=
assis=5Fctrl=5Fcmd);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt=
; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbs=
p;return ((rc &lt; 0) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<br>&gt; &nbs=
p;}<br>&gt; &nbsp;<br>&gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboo=
t=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; - &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft respons=
e,<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen,=
 ipmi=5Fcontext=5Ft context)<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=
=5Fsys=5Fboot=5Foptions (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft d=
ata=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp=
; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;*=
data=5Flen =3D 0;<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;printf("IPMI GET=5F=
SYS=5FBOOT=5FOPTIONS\n");<br>&gt; + &nbsp; &nbsp;printf ("IPMI GET=5FSYS=5F=
BOOT=5FOPTIONS\n");<br>&gt; +<br>&gt; + &nbsp; &nbsp;get=5Fsys=5Fboot=5Fopt=
ions=5Ft * reqptr =3D (get=5Fsys=5Fboot=5Foptions=5Ft *) request;<br>&gt; +=
<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * To represent a hex in =
string, e.g., "A0A0", which represents two bytes<br>&gt; + &nbsp; &nbsp; * =
in the hex, but requires 5 bytes to store it as string, i.e., 4<br>&gt; + &=
nbsp; &nbsp; * characters to store the "A0A0" and 1 additional space for "\=
0".<br>&gt; + &nbsp; &nbsp; * Thereby we have 2 * &lt;number of bytes&gt; +=
 1 for the string buffer.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp=
;char buf[NUM=5FRETURN=5FBYTES=5FOF=5FGET * 2 + 1] =3D {0};<br><br>Once aga=
in, why not #define NUM=5FRETURN=5FBYTES=5FOF=5FGET 11<br><br>&gt; &nbsp;<b=
r>&gt; - &nbsp; &nbsp;get=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (get=5Fsys=
=5Fboot=5Foptions=5Ft*) request;<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp;=
 &nbsp; * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc.=
<br>&gt; + &nbsp; &nbsp; * This is the only parameter used by petitboot.<br=
>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;if (reqptr-&gt;parameter =
=3D=3D 5) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fget=5Fpro=
perty (buf);<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;// TODO Return default v=
alues to OPAL until dbus interface is available<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;fprintf (stderr, "Dbus get property failed for get=5Fsys=5Fboot=5Foptions=
.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=
=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt=
; - &nbsp; &nbsp;if (reqptr-&gt;parameter =3D=3D 5) // Parameter #5<br>&gt;=
 - &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft buf[] =3D =
{0x1,0x5,80,0,0,0,0};<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D =
sizeof(buf);<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf=
, *data=5Flen);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fva=
lue;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf (buf, "%llX", &amp;return=
=5Fvalue);<br><br>See my comment at the top about the best tool for the job=
.<br><br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5F=
RETURN=5FBYTES=5FOF=5FGET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/*<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; * TODO: last 3 bytes<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; *(NUM=5FRETURN=5FBYTES=5FOF=5FGET - NUM=5FRETURN=5FBYTES=5FOF=
=5FGET=5FUSED) is meanlingless<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; */<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy (response, (uint8=5Ft *) (&amp;ret=
urn=5Fvalue), *data=5Flen);<br><br>So this interests me, does whoever is go=
ing to be reading response know to read<br>it as a uint64=5Ft on success bu=
t as an array of chars on failure, also, rather<br>than #defineing, wouldn'=
t:<br><br>*data=5Flen =3D sizeof(return=5Fvalue);<br><br>be better?<br><br>=
<br>I've done some looking around in ipmid.C and I don't think what you've =
done<br>will work,<br><a href=3D"https://github.com/openbmc/phosphor-host-i=
pmid/blob/master/ipmid.C#L276" target=3D"=5Fblank" >https://github.com/open=
bmc/phosphor-host-ipmid/blob/master/ipmid.C#L276</a><br>appears to use the =
first byte of response as the completion code but you've<br>just written wh=
atever the first byte of your uint64=5Ft is into response[0]...<br><br>Also=
, 28.13 in the IPMI spec doesn't seem to match up with whats going on here,=
<br>am I missing something?<br><br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;buf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy (response, buf, *data=5Flen);<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Unsupported parameter 0=
x%x\n", reqptr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return =
IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; -=
 &nbsp; &nbsp;else<br>&gt; - &nbsp; &nbsp;{<br>&gt; - &nbsp; &nbsp; &nbsp; =
&nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;parameter)=
;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPP=
ORTED; &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; +<br>&gt; + &nbsp; &nbsp;return =
rc;<br>&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=
=5Fboot=5Foptions (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft re=
sponse,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Fl=
en, ipmi=5Fcontext=5Ft context)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;ipmi=5Fre=
t=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("IPMI=
 SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; + &nbsp; &nbsp;printf ("IPMID set =
command required return bytes: %i\n", *data=5Flen);<br>&gt; +<br>&gt; + &nb=
sp; &nbsp;set=5Fsys=5Fboot=5Foptions=5Ft * reqptr =3D (set=5Fsys=5Fboot=5Fo=
ptions=5Ft *) request;<br>&gt; +<br>&gt; + &nbsp; &nbsp;char output=5Fbuf[N=
UM=5FRETURN=5FBYTES=5FOF=5FSET] =3D {0};<br>&gt; +<br>&gt; + &nbsp; &nbsp;/=
*<br>&gt; + &nbsp; &nbsp; * Parameter #5 means boot flags. Please refer to =
28.13 of ipmi doc.<br>&gt; + &nbsp; &nbsp; * This is the only parameter use=
d by petitboot.<br>&gt; + &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp;if (reqpt=
r-&gt;parameter =3D=3D 5) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/*<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; * To represent a hex in string, e.g., "A0A0"=
, which represents two bytes<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * in the=
 hex, but requires 5 bytes to store it as string, i.e., 4<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; * characters to store the "A0A0" and 1 additional spac=
e for "\0".<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * Thereby we have 2 * &lt=
;number of bytes&gt; + 1 for the string buffer.<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;char input=5Fbuf[NUM=5FI=
NPUT=5FBYTES=5FOF=5FSET * 2 + 1];<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;spri=
ntf (input=5Fbuf, "%llX", reqptr-&gt;data.data64);<br>&gt; +<br>&gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty (input=5Fbuf);<br>&g=
t; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Dbus set property faile=
d for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D N=
UM=5FRETURN=5FBYTES=5FOF=5FSET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Ret=
urn code OK.<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf[0] =3D IPMI=
=5FOK;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy (response, output=5Fbuf,=
 *data=5Flen);<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;// Parameter not supported<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ou=
tput=5Fbuf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;memcpy (response, output=5Fbuf, *data=5Flen);<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Unsupported parameter 0x%x\n", re=
qptr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=
=5FPARM=5FNOT=5FSUPPORTED;<br><br>As far as I can see you're simply using o=
utput=5Fbuf to assign the first byte of<br>response to either IPMI=5FOK or =
IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED and you're using<br>memcpy.<br><br>Would=
n't it be nicer to<br>memset(response, 0, *data=5Flen);<br>(or not even mem=
set since NUM=5FRETURN=5FBYTES=5FOF=5FSET is 1) and<br>*response =3D IPMI=
=5FOK;<br>or<br>*response =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>and av=
oid having output=5Fbuf at all?<br><br>Which makes me wonder why response i=
s actually a void *, is this a good idea?<br><br>&gt; &nbsp; &nbsp; &nbsp;}=
<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &nbsp;}<br>&=
gt; &nbsp;<br>&gt; -void register=5Fnetfn=5Fchassis=5Ffunctions()<br>&gt; +=
void register=5Fnetfn=5Fchassis=5Ffunctions ()<br>&gt; &nbsp;{<br>&gt; - &n=
bsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS=
, IPMI=5FCMD=5FWILDCARD);<br>&gt; - &nbsp; &nbsp;ipmi=5Fregister=5Fcallback=
(NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fchassis=5Fwildcard);=
<br>&gt; + &nbsp; &nbsp;printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", N=
ETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregi=
ster=5Fcallback (NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fchas=
sis=5Fwildcard);<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;printf("Registering =
NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=
=5FOPTIONS);<br>&gt; - &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHA=
SSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=
=5Fsys=5Fboot=5Foptions);<br>&gt; + &nbsp; &nbsp;printf ("Registering NetFn=
:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FO=
PTIONS);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback (NETFUN=5FCHASSI=
S, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsy=
s=5Fboot=5Foptions);<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;printf("Register=
ing NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCO=
NTROL);<br>&gt; - &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS,=
 IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol);<br>&gt; +=
 &nbsp; &nbsp;printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCH=
ASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &nbsp;ipm=
i=5Fregister=5Fcallback (NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5F=
OPTIONS, NULL, ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions);<br>&gt; +<br>&=
gt; + &nbsp; &nbsp;printf ("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=
=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>&gt; + &nbsp; &nbsp;ipmi=5F=
register=5Fcallback (NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL=
, ipmi=5Fchassis=5Fcontrol);<br>&gt; &nbsp;}<br>&gt; +<br>&gt; diff --git a=
/chassishandler.h b/chassishandler.h<br>&gt; index 1a26411..a310741 100644<=
br>&gt; --- a/chassishandler.h<br>&gt; +++ b/chassishandler.h<br>&gt; @@ -3=
,21 +3,39 @@<br>&gt; &nbsp;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt;=
 &nbsp;<br>&gt; +// TODO: Petitboot requires 8 bytes of response<br>&gt; +/=
/ however only 5 of them are used. The remaining<br>&gt; +// 3 bytes are no=
t used in petitboot and the value<br>&gt; +// of them are all zero.<br>&gt;=
 +#define NUM=5FRETURN=5FBYTES=5FOF=5FGET 8<br>&gt; +#define NUM=5FRETURN=
=5FBYTES=5FOF=5FGET=5FUSED 5<br>&gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FS=
ET 1<br>&gt; +#define NUM=5FINPUT=5FBYTES=5FOF=5FSET 5<br>&gt; +<br>&gt; &n=
bsp;// IPMI commands for Chassis net functions.<br>&gt; &nbsp;enum ipmi=5Fn=
etfn=5Fapp=5Fcmds<br>&gt; &nbsp;{<br>&gt; &nbsp; // Chassis Control<br>&gt;=
 &nbsp; IPMI=5FCMD=5FCHASSIS=5FCONTROL &nbsp;=3D 0x02,<br>&gt; &nbsp; &nbsp=
; &nbsp;// Get capability bits<br>&gt; + &nbsp; &nbsp;IPMI=5FCMD=5FSET=5FSY=
S=5FBOOT=5FOPTIONS =3D 0x08,<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5FGET=
=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,<br>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt; &=
nbsp;// Command specific completion codes<br>&gt; &nbsp;enum ipmi=5Fchassis=
=5Freturn=5Fcodes<br>&gt; &nbsp;{<br>&gt; + &nbsp; &nbsp;IPMI=5FOK =3D 0x0,=
<br>&gt; &nbsp; &nbsp; &nbsp;IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,<b=
r>&gt; &nbsp;};<br>&gt; &nbsp;<br>&gt; +// Generic completion codes,<br>&gt=
; +// see IPMI doc section 5.2<br>&gt; +enum ipmi=5Fgeneric=5Freturn=5Fcode=
s<br>&gt; +{<br>&gt; + &nbsp; &nbsp;IPMI=5FOUT=5FOF=5FSPACE =3D 0xC4,<br>&g=
t; +};<br>&gt; +<br>&gt; &nbsp;// Various Chassis operations under a single=
 command.<br>&gt; &nbsp;enum ipmi=5Fchassis=5Fcontrol=5Fcmds : uint8=5Ft<br=
>&gt; &nbsp;{</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
