Return-Path: <austenc@us.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9F59A1A009B
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2015 11:29:12 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 21 Nov 2015 17:29:09 -0700
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 21 Nov 2015 17:29:08 -0700
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id DDCBA6E8045
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 19:17:17 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAM0T7rv22085730
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2015 00:29:07 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAM0R4IT017018
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 19:27:04 -0500
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAM0R3Ah016992
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 19:27:03 -0500
Message-Id: <201511220027.tAM0R3Ah016992@d01av05.pok.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sat, 21 Nov 2015 19:29:05 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 21 Nov 2015 19:29:03 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Sun, 22 Nov 2015 00:29:02 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 22 Nov 2015 00:28:59 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015112200295441-140511 ;
 Sun, 22 Nov 2015 00:29:54 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI soft power off
In-Reply-To: <OF8DB8A0D9.558AC8A8-ON00257F04.007DF879-1448146556258@LocalDomain>
From: "Chris Austen" <austenc@us.ibm.com>
To: "Norman James" <njames@us.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Sun, 22 Nov 2015 00:28:59 +0000
Sensitivity: 
MIME-Version: 1.0
References: <OF8DB8A0D9.558AC8A8-ON00257F04.007DF879-1448146556258@LocalDomain>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_11092015_FP2 November 12, 2015
X-LLNOutbound: False
X-Disclaimed: 10783
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15112200-0033-0000-0000-000006F06824
X-IBM-ISS-SpamDetectors: Score=0.379461; BY=0.271494; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.379461; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004604; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000121; SDB=6.00620781; UDB=6.00275734; UTC=2015-11-22
 00:29:01
x-cbparentid: 15112200-0598-0000-0000-00000550D37A
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
X-List-Received-Date: Sun, 22 Nov 2015 00:29:13 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >The method also exists in
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >/org/openbmc/HostServices</font></div>
<div>&nbsp;</div>&nbsp;

<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Norman James/Austin/IBM<br>To:=
 Chris Austen/Austin/IBM@ibmus<br>Cc: "openbmc-patches@stwcx.xyz" &lt;openb=
mc-patches@stwcx.xyz&gt;, "openbmc@lists.ozlabs.org" &lt;openbmc@lists.ozla=
bs.org&gt;<br>Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI soft power o=
ff<br>Date: Sat, Nov 21, 2015 4:55 PM<br>&nbsp;<br><!--Notes ACF
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf8" >-->
<div>Softpoweroff is a method on chassis0. &nbsp;What dbus obj are u talkin=
g about?<br><br>Sent from my iPhone</div>
<div><br>On Nov 21, 2015, at 12:43 PM, Chris Austen &lt;<a href=3D"mailto:a=
ustenc@us.ibm.com" target=3D"=5Fblank" >austenc@us.ibm.com</a>&gt; wrote:<b=
r>&nbsp;</div>
<blockquote type=3D"cite" ><div><div dir=3D"ltr" style=3D"font-family:Arial=
;font-size:10.5pt" ><div dir=3D"ltr" >what makes SoftPowerOff different eno=
ugh to have its own dbus object?&nbsp; Shouldn't the soft power off simple =
be another method in the /or/openbmc/chassis/chassis0 interface?
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: OpenBMC Patches &lt;<a href=3D=
"mailto:openbmc-patches@stwcx.xyz" target=3D"=5Fblank" >openbmc-patches@stw=
cx.xyz</a>&gt;<br>Sent by: "openbmc" &lt;<a href=3D"mailto:openbmc-bounces+=
austenc=3Dus.ibm.com@lists.ozlabs.org" target=3D"=5Fblank" >openbmc-bounces=
+austenc=3Dus.ibm.com@lists.ozlabs.org</a>&gt;<br>To: <a href=3D"mailto:ope=
nbmc@lists.ozlabs.org" target=3D"=5Fblank" >openbmc@lists.ozlabs.org</a><br=
>Cc:<br>Subject: [PATCH phosphor-host-ipmid v2] IPMI soft power off<br>Date=
: Sat, Nov 21, 2015 12:10 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >From: vishwa &lt;<a href=3D"mailto:vishwanath@in.ibm.com" target=3D"=
=5Fblank" >vishwanath@in.ibm.com</a>&gt;<br><br>---<br>&nbsp;Makefile &nbsp=
; &nbsp; &nbsp; &nbsp; | &nbsp; 5 +--<br>&nbsp;apphandler.C &nbsp; &nbsp; |=
 &nbsp;67 +++++++++++++++++++++++++++++--<br>&nbsp;apphandler.h &nbsp; &nbs=
p; | &nbsp;33 ++++++++++++++-<br>&nbsp;chassishandler.C | &nbsp;85 ++++++++=
++++++++++++++++++++++++++++++-<br>&nbsp;chassishandler.h | &nbsp;15 ++++++=
+<br>&nbsp;host-services.c &nbsp;| 119 ++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++<br>&nbsp;host-services.h &nbsp;| &nbsp; 3 ++<br>&nbsp;i=
pmid-api.h &nbsp; &nbsp; &nbsp;| &nbsp; 4 +-<br>&nbsp;ipmid.C &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp; 6 ++-<br>&nbsp;ipmid.H &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;| &nbsp; 1 +<br>&nbsp;10 files changed, 325 insertions(+), 13 d=
eletions(-)<br>&nbsp;create mode 100644 host-services.c<br>&nbsp;create mod=
e 100644 host-services.h<br><br>diff --git a/Makefile b/Makefile<br>index 1=
a37c0f..1851c9f 100644<br>--- a/Makefile<br>+++ b/Makefile<br>@@ -5,8 +5,7 =
@@ TESTER =3D testit<br>&nbsp;TESTADDSEL =3D testaddsel<br>&nbsp;<br>&nbsp;=
DAEMON =3D ipmid<br>-DAEMON=5FOBJ &nbsp;=3D $(DAEMON).o<br>-<br>+DAEMON=5FO=
BJ &nbsp;=3D ipmid.o host-services.o<br>&nbsp;<br>&nbsp;LIB=5FAPP=5FOBJ =3D=
 apphandler.o &nbsp; &nbsp; \<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; sensorhandler.o &nbsp;\<br>@@ -28,7 +27,7 @@ LIB=5FAPP &nbsp; =
&nbsp; =3D libapphandler.so<br>&nbsp;INSTALLED=5FLIBS +=3D $(LIB=5FAPP)<br>=
&nbsp;INSTALLED=5FHEADERS =3D ipmid-api.h<br>&nbsp;<br>-INC=5FFLAG +=3D $(s=
hell pkg-config --cflags --libs libsystemd) -I. -O2<br>+INC=5FFLAG +=3D $(s=
hell pkg-config --cflags --libs libsystemd) -I. -O2<br>&nbsp;LIB=5FFLAG +=
=3D $(shell pkg-config &nbsp;--libs libsystemd) -rdynamic<br>&nbsp;IPMID=5F=
PATH ?=3D -DHOST=5FIPMI=5FLIB=5FPATH=3D\"/usr/lib/host-ipmid/\"<br>&nbsp;<b=
r>diff --git a/apphandler.C b/apphandler.C<br>index 6467397..d3df330 100644=
<br>--- a/apphandler.C<br>+++ b/apphandler.C<br>@@ -10,19 +10,75 @@ extern =
sd=5Fbus *bus;<br>&nbsp;<br>&nbsp;void register=5Fnetfn=5Fapp=5Ffunctions()=
 =5F=5Fattribute=5F=5F((constructor));<br>&nbsp;<br>+//--------------------=
-------------------------------------------------<br>+// Called by Host on =
seeing a SMS=5FATN bit set. Return a hardcoded<br>+// value of 0x2 indicati=
ng we need Host read some data.<br>+//-------------------------------------=
------------------------------<br>+ipmi=5Fret=5Ft ipmi=5Fapp=5Fget=5Fmsg=5F=
flags(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>+ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>+ &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=
<br>+{<br>+ // Generic return from IPMI commands.<br>+ &nbsp; &nbsp;ipmi=5F=
ret=5Ft rc =3D IPMI=5FCC=5FOK;<br>+<br>+ &nbsp; &nbsp;printf("IPMI APP GET =
MSG FLAGS returning with [bit:2] set\n");<br>+<br>+ // From IPMI spec V2.0 =
for Get Message Flags Command :<br>+ // bit:[1] from LSB : 1b =3D Event Mes=
sage Buffer Full.<br>+ // Return as 0 if Event Message Buffer is not suppor=
ted,<br>+ // or when the Event Message buffer is disabled.<br>+ // TODO. Fo=
r now. assume its not disabled and send "0x2" anyway:<br>+<br>+ uint8=5Ft s=
et=5Fevent=5Fmsg=5Fbuffer=5Ffull =3D 0x2;<br>+ &nbsp; &nbsp;*data=5Flen =3D=
 sizeof(set=5Fevent=5Fmsg=5Fbuffer=5Ffull);<br>+<br>+ &nbsp; &nbsp;// Pack =
the actual response<br>+ &nbsp; &nbsp;memcpy(response, &amp;set=5Fevent=5Fm=
sg=5Fbuffer=5Ffull, *data=5Flen);<br>+<br>+ &nbsp; &nbsp;return rc;<br>+}<b=
r>&nbsp;<br>+//------------------------------------------------------------=
-------<br>+// Called by Host post response from Get=5FMessage=5FFlags<br>+=
//-------------------------------------------------------------------<br>&n=
bsp;ipmi=5Fret=5Ft ipmi=5Fapp=5Fread=5Fevent(ipmi=5Fnetfn=5Ft netfn, ipmi=
=5Fcmd=5Ft cmd,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft re=
quest, ipmi=5Fresponse=5Ft response,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&nbsp;{<br=
>&nbsp;&nbsp; &nbsp; ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>- &nbsp; &nbs=
p;*data=5Flen =3D 0;<br>+ &nbsp; &nbsp;printf("IPMI APP READ EVENT command =
received\n");<br>&nbsp;<br>- &nbsp; &nbsp;printf("IPMI APP READ EVENT Ignor=
ing for now\n");<br>- &nbsp; &nbsp;return rc;<br>+ // TODO : For now, this =
is catering only to the Soft Power Off via OEM SEL<br>+ // &nbsp; &nbsp; &n=
bsp; &nbsp;mechanism. If we need to make this generically used for some<br>=
+ // &nbsp; &nbsp; &nbsp; &nbsp;other conditions, then we can take advantag=
e of context pointer.<br>&nbsp;<br>-}<br>+ struct oem=5Fsel=5Ftimestamped s=
oft=5Foff =3D {0};<br>+ &nbsp; &nbsp;*data=5Flen =3D sizeof(struct oem=5Fse=
l=5Ftimestamped);<br>+<br>+ // either id[0] -or- id[1] can be filled in. We=
 will use id[0]<br>+ soft=5Foff.id[0] =3D SEL=5FOEM=5FID=5F0;<br>+ soft=5Fo=
ff.id[1] =3D SEL=5FOEM=5FID=5F0;<br>+ soft=5Foff.type =3D SEL=5FRECORD=5FTY=
PE=5FOEM;<br>+<br>+ // Following 3 bytes are from IANA Manufactre=5FId fiel=
d. See below<br>+ soft=5Foff.manuf=5Fid[0]=3D 0x41;<br>+ soft=5Foff.manuf=
=5Fid[1]=3D 0xA7;<br>+ soft=5Foff.manuf=5Fid[2]=3D 0x00;<br>+<br>+ // per I=
PMI spec NetFuntion for OEM<br>+ soft=5Foff.netfun =3D 0x3A;<br>&nbsp;<br>+=
 // Mechanism to kick start soft shutdown.<br>+ soft=5Foff.cmd =3D CMD=5FPO=
WER;<br>+ soft=5Foff.data[0] =3D SOFT=5FOFF;<br>+<br>+ // All '0xFF' since =
unused.<br>+ memset(&amp;soft=5Foff.data[1], 0xFF, 3);<br>+<br>+ &nbsp; &nb=
sp;// Pack the actual response<br>+ &nbsp; &nbsp;memcpy(response, &amp;soft=
=5Foff, *data=5Flen);<br>+ &nbsp; &nbsp;return rc;<br>+}<br>&nbsp;<br>&nbsp=
;ipmi=5Fret=5Ft ipmi=5Fapp=5Fset=5Facpi=5Fpower=5Fstate(ipmi=5Fnetfn=5Ft ne=
tfn, ipmi=5Fcmd=5Ft cmd,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Freque=
st=5Ft request, ipmi=5Fresponse=5Ft response,<br>@@ -359,6 +415,9 @@ void r=
egister=5Fnetfn=5Fapp=5Ffunctions()<br>&nbsp;&nbsp; &nbsp; ipmi=5Fregister=
=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES, NULL,<=
br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; ipmi=5Fapp=5Fset=5Fbmc=5Fglobal=5Fenables);<br>&nbsp;<br>+ &nb=
sp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP, IPM=
I=5FCMD=5FGET=5FMSG=5FFLAGS);<br>+ &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(=
NETFUN=5FAPP, IPMI=5FCMD=5FGET=5FMSG=5FFLAGS, NULL, ipmi=5Fapp=5Fget=5Fmsg=
=5Fflags);<br>+<br>&nbsp;&nbsp; &nbsp; return;<br>&nbsp;}<br>&nbsp;<br>diff=
 --git a/apphandler.h b/apphandler.h<br>index 35a2b20..aa2a55d 100644<br>--=
- a/apphandler.h<br>+++ b/apphandler.h<br>@@ -1,6 +1,19 @@<br>&nbsp;#ifndef=
 =5F=5FHOST=5FIPMI=5FAPP=5FHANDLER=5FH=5F=5F<br>&nbsp;#define =5F=5FHOST=5F=
IPMI=5FAPP=5FHANDLER=5FH=5F=5F<br>&nbsp;<br>+#include &lt;stdint.h&gt;<br>+=
<br>+// These are per skiboot ipmi-sel code<br>+<br>+// OEM=5FSEL type with=
 Timestamp<br>+#define SEL=5FOEM=5FID=5F0 0x55<br>+// SEL type is OEM and -=
not- general SEL<br>+#define SEL=5FRECORD=5FTYPE=5FOEM 0xC0<br>+// Minor co=
mmand for soft shurdown<br>+#define SOFT=5FOFF 0x00<br>+// Major command fo=
r Any kind of power ops<br>+#define CMD=5FPOWER 0x04<br>+<br>&nbsp;// IPMI =
commands for App net functions.<br>&nbsp;enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>=
&nbsp;{<br>@@ -11,9 +24,27 @@ enum ipmi=5Fnetfn=5Fapp=5Fcmds<br>&nbsp;&nbsp=
; &nbsp; IPMI=5FCMD=5FRESET=5FWD &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; =3D 0x22,<br>&nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FSET=5FWD &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D 0x24,<br>&nbsp;&nbsp; &nbsp;=
 IPMI=5FCMD=5FSET=5FBMC=5FGLOBAL=5FENABLES =3D 0x2E,<br>+ &nbsp; &nbsp;IPMI=
=5FCMD=5FGET=5FMSG=5FFLAGS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x31,<br>&=
nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FREAD=5FEVENT &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; =3D 0x35,<br>&nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FGET=5FCAP=5FBIT &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D 0x36,<br>-<br>&nbsp;};<br>&nbsp=
;<br>+// A Mechanism to tell host to shtudown hosts by sending this PEM SEL=
. Really<br>+// the only used fields by skiboot are:<br>+// id[0] / id[1] f=
or ID=5F0 , ID=5F1<br>+// type : SEL=5FRECORD=5FTYPE=5FOEM as standard SELs=
 are ignored by skiboot<br>+// cmd : CMD=5FPOWER for power functions<br>+//=
 data[0], specific commands. &nbsp;example Soft power off. power cycle, etc=
.<br>+struct oem=5Fsel=5Ftimestamped<br>+{<br>+ /* SEL header */<br>+ uint8=
=5Ft id[2];<br>+ uint8=5Ft type;<br>+ uint8=5Ft manuf=5Fid[3];<br>+ uint8=
=5Ft timestamp[4];<br>+ /* OEM SEL data (6 bytes) follows */<br>+ uint8=5Ft=
 netfun;<br>+ uint8=5Ft cmd;<br>+ uint8=5Ft data[4];<br>+};<br>&nbsp;#endif=
<br>diff --git a/chassishandler.C b/chassishandler.C<br>index d00a124..56b8=
375 100644<br>--- a/chassishandler.C<br>+++ b/chassishandler.C<br>@@ -4,6 +=
4,11 @@<br>&nbsp;#include &lt;string.h&gt;<br>&nbsp;#include &lt;stdint.h&g=
t;<br>&nbsp;<br>+// OpenBMC Chassis Manager dbus framework<br>+const char &=
nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.openbmc.contr=
ol.Chassis";<br>+const char &nbsp;*chassis=5Fobject=5Fname &nbsp; =3D &nbsp=
;"/org/openbmc/control/chassis0";<br>+const char &nbsp;*chassis=5Fintf=5Fna=
me &nbsp; &nbsp; =3D &nbsp;"org.openbmc.control.Chassis";<br>+<br>&nbsp;voi=
d register=5Fnetfn=5Fchassis=5Ffunctions() =5F=5Fattribute=5F=5F((construct=
or));<br>&nbsp;<br>&nbsp;struct get=5Fsys=5Fboot=5Foptions=5Ft {<br>@@ -23,=
6 +28,82 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn=
, ipmi=5Fcmd=5Ft cmd,<br>&nbsp;&nbsp; &nbsp; return rc;<br>&nbsp;}<br>&nbsp=
;<br>+//------------------------------------------------------------<br>+//=
 Calls into Chassis Control Dbus object to do the power off<br>+//---------=
---------------------------------------------------<br>+int ipmi=5Fchassis=
=5Fpower=5Foff()<br>+{<br>+ // sd=5Fbus error<br>+ int rc =3D 0;<br>+<br>+ =
&nbsp; &nbsp;// SD Bus error report mechanism.<br>+ &nbsp; &nbsp;sd=5Fbus=
=5Ferror bus=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;<br>+<br>+ // Response fro=
m the call. Although there is no response for this call,<br>+ // obligated =
to mention this to make compiler happy.<br>+ sd=5Fbus=5Fmessage *response =
=3D NULL;<br>+<br>+ // Gets a hook onto either a SYSTEM or SESSION bus<br>+=
 sd=5Fbus *bus=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>+<br>+ =
rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp; &nbsp; &nbsp; &nbsp; // =
On the System Bus<br>+ chassis=5Fbus=5Fname, &nbsp; &nbsp; &nbsp; &nbsp;// =
Service to contact<br>+ chassis=5Fobject=5Fname, &nbsp; &nbsp; // Object pa=
th<br>+ chassis=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; // Interface name<br>+ =
"powerOff", &nbsp; &nbsp; &nbsp; // Method to be called<br>+ &amp;bus=5Ferr=
or, &nbsp; &nbsp; &nbsp; // object to return error<br>+ &amp;response, // R=
esponse buffer if any<br>+ NULL); // No input arguments<br>+ if(rc &lt; 0)<=
br>+ {<br>+ fprintf(stderr,"ERROR initiating Power Off:[%s]\n",bus=5Ferror.=
message);<br>+ }<br>+ else<br>+ {<br>+ printf("Chassis Power Off initiated =
successfully\n");<br>+ }<br>+<br>+ &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&am=
p;bus=5Ferror);<br>+ &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(response);<br>=
+<br>+ return rc;<br>+}<br>+<br>+//----------------------------------------=
------------------------------<br>+// Chassis Control commands<br>+//------=
----------------------------------------------------------------<br>+ipmi=
=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft =
cmd,<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,=
<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)=
<br>+{<br>+ // Error from power off.<br>+ int rc =3D 0;<br>+<br>+ // No res=
ponse for this command.<br>+ &nbsp; &nbsp;*data=5Flen =3D 0;<br>+<br>+ // C=
atch the actual operaton by peeking into request buffer<br>+ uint8=5Ft chas=
sis=5Fctrl=5Fcmd =3D *(uint8=5Ft *)request;<br>+ printf("Chassis Control Co=
mmand: Operation:[0x%X]\n",chassis=5Fctrl=5Fcmd);<br>+<br>+ switch(chassis=
=5Fctrl=5Fcmd)<br>+ {<br>+ case CMD=5FPOWER=5FOFF:<br>+ case CMD=5FHARD=5FR=
ESET:<br>+ {<br>+ rc =3D ipmi=5Fchassis=5Fpower=5Foff();<br>+ break;<br>+ }=
<br>+ default:<br>+ {<br>+ fprintf(stderr, "Invalid Chassis Control command=
:[0x%X] received\n",chassis=5Fctrl=5Fcmd);<br>+ rc =3D -1;<br>+ }<br>+ }<br=
>+<br>+ return ( (rc &lt; 0) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<br>+}=
<br>+<br>&nbsp;ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(i=
pmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&nbsp;&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&nbsp;&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fconte=
xt=5Ft context)<br>@@ -58,5 +139,7 @@ void register=5Fnetfn=5Fchassis=5Ffun=
ctions()<br>&nbsp;<br>&nbsp;&nbsp; &nbsp; printf("Registering NetFn:[0x%X],=
 Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<=
br>&nbsp;&nbsp; &nbsp; ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5F=
CMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=
=5Foptions);<br>-}<br>&nbsp;<br>+ &nbsp; &nbsp;printf("Registering NetFn:[0=
x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>+=
 &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHA=
SSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol);<br>+}<br>diff --git a/chas=
sishandler.h b/chassishandler.h<br>index 99ed366..1a26411 100644<br>--- a/c=
hassishandler.h<br>+++ b/chassishandler.h<br>@@ -1,9 +1,13 @@<br>&nbsp;#ifn=
def =5F=5FHOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F<br>&nbsp;#define =5F=5F=
HOST=5FIPMI=5FCHASSIS=5FHANDLER=5FH=5F=5F<br>&nbsp;<br>+#include &lt;stdint=
.h&gt;<br>+<br>&nbsp;// IPMI commands for Chassis net functions.<br>&nbsp;e=
num ipmi=5Fnetfn=5Fapp=5Fcmds<br>&nbsp;{<br>+ // Chassis Control<br>+ IPMI=
=5FCMD=5FCHASSIS=5FCONTROL &nbsp;=3D 0x02,<br>&nbsp;&nbsp; &nbsp; // Get ca=
pability bits<br>&nbsp;&nbsp; &nbsp; IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTION=
S =3D 0x09,<br>&nbsp;};<br>@@ -14,4 +18,15 @@ enum ipmi=5Fchassis=5Freturn=
=5Fcodes<br>&nbsp;&nbsp; &nbsp; IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80=
,<br>&nbsp;};<br>&nbsp;<br>+// Various Chassis operations under a single co=
mmand.<br>+enum ipmi=5Fchassis=5Fcontrol=5Fcmds : uint8=5Ft<br>+{<br>+ CMD=
=5FPOWER=5FOFF &nbsp; =3D 0x00,<br>+ CMD=5FPOWER=5FON &nbsp; =3D 0x01,<br>+=
 CMD=5FPOWER=5FCYCLE &nbsp; =3D 0x02,<br>+ CMD=5FHARD=5FRESET &nbsp; =3D 0x=
03,<br>+ CMD=5FPULSE=5FDIAGNOSTIC=5FINTR &nbsp;=3D 0x04,<br>+ CMD=5FSOFT=5F=
OFF=5FVIA=5FOVER=5FTEMP =3D 0x05,<br>+};<br>+<br>&nbsp;#endif<br>diff --git=
 a/host-services.c b/host-services.c<br>new file mode 100644<br>index 00000=
00..89f0b6c<br>--- /dev/null<br>+++ b/host-services.c<br>@@ -0,0 +1,119 @@<=
br>+#include &lt;stdio.h&gt;<br>+#include &lt;stdlib.h&gt;<br>+#include &lt=
;errno.h&gt;<br>+#include &lt;systemd/sd-bus.h&gt;<br>+<br>+// OpenBMC Host=
 IPMI dbus framework<br>+const char &nbsp;*bus=5Fname &nbsp; &nbsp; &nbsp;=
=3D &nbsp;"org.openbmc.HostIpmi";<br>+const char &nbsp;*object=5Fname &nbsp=
; =3D &nbsp;"/org/openbmc/HostIpmi/1";<br>+const char &nbsp;*intf=5Fname &n=
bsp; &nbsp; =3D &nbsp;"org.openbmc.HostIpmi";<br>+<br>+//------------------=
-------------------------------------------------<br>+// Gets called by Pow=
erOff handler when a Soft Power off is requested<br>+//--------------------=
-----------------------------------------------<br>+static int soft=5Fpower=
=5Foff(sd=5Fbus=5Fmessage *m, void *userdata, sd=5Fbus=5Ferror *ret=5Ferror=
)<br>+{<br>+ int64=5Ft bt=5Fresp =3D -1;<br>+ int rc =3D 0;<br>+<br>+ // St=
eps to be taken when we get this.<br>+ // 1: Send a SMS=5FATN to the Host<b=
r>+ // 2: Host receives it and sends a GetMsgFlags IPMI command<br>+ // 3: =
IPMID app handler will respond to that with a MSgFlag with bit:0x2<br>+ // =
&nbsp; set indicating we have a message for Host<br>+ // 4: Host sends a Ge=
tMsgBuffer command and app handler will respond to<br>+ // &nbsp; that with=
 a OEM-SEL with certain fields packed indicating to the<br>+ // &nbsp; host=
 that it do a shutdown of the partitions. &nbsp;<br>+ // 5: Host does the p=
artition shutdown and calls Chassis Power off command<br>+ // 6: App handle=
r handles the command by making a call to ChassisManager<br>+ // &nbsp; Dbu=
s<br>+<br>+ // Now the job is to send the SMS=5FATTN.<br>+<br>+ &nbsp; &nbs=
p;// Req message contains the specifics about which method etc that we want=
 to<br>+ &nbsp; &nbsp;// access on which bus, object<br>+ &nbsp; &nbsp;sd=
=5Fbus=5Fmessage *response =3D NULL;<br>+<br>+ // Error return mechanism<br=
>+ &nbsp; &nbsp;sd=5Fbus=5Ferror bus=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;<b=
r>+<br>+ // Gets a hook onto either a SYSTEM or SESSION bus<br>+ sd=5Fbus *=
bus =3D (sd=5Fbus *)ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>+<br>+ rc =3D=
 sd=5Fbus=5Fcall=5Fmethod(bus, &nbsp; &nbsp; &nbsp; &nbsp;// On the System =
Bus<br>+ bus=5Fname, &nbsp; &nbsp; &nbsp; &nbsp;// Service to contact<br>+ =
object=5Fname, &nbsp; &nbsp; // Object path<br>+ intf=5Fname, &nbsp; &nbsp;=
 &nbsp; // Interface name<br>+ "setAttention", &nbsp;// Method to be called=
<br>+ &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp;// object to return error<br>+ =
&amp;response, // Response buffer if any<br>+ NULL); // No input arguments<=
br>+ if(rc &lt; 0)<br>+ {<br>+ fprintf(stderr,"ERROR initiating Power Off:[=
%s]\n",bus=5Ferror.message);<br>+ goto finish;<br>+ }<br>+<br>+ // See if w=
e were able to successfully raise SMS=5FATN<br>+ &nbsp; &nbsp;rc =3D sd=5Fb=
us=5Fmessage=5Fread(response, "x", &amp;bt=5Fresp);<br>+ &nbsp; &nbsp;if (r=
c &lt; 0)<br>+ {<br>+ fprintf(stderr, "Failed to get a rc from BT for SMS=
=5FATN: %s\n", strerror(-rc));<br>+ goto finish;<br>+ &nbsp; &nbsp;}<br>+<b=
r>+finish:<br>+ &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>=
+ &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref(response);<br>+<br>+ if(rc &lt; 0=
)<br>+ {<br>+ return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "x", rc);<br>+ }=
<br>+ else<br>+ {<br>+ return sd=5Fbus=5Freply=5Fmethod=5Freturn(m, "x", bt=
=5Fresp);<br>+ }<br>+}<br>+<br>+//-----------------------------------------=
--<br>+// Function pointer of APIs exposed via Dbus<br>+//-----------------=
--------------------------<br>+static const sd=5Fbus=5Fvtable host=5Fservic=
es=5Fvtable[] =3D<br>+{<br>+ SD=5FBUS=5FVTABLE=5FSTART(0),<br>+ // Takes No=
("") arguments -but- returns a value of type 64 bit integer("x")<br>+ SD=5F=
BUS=5FMETHOD("SoftPowerOff", "", "x", &amp;soft=5Fpower=5Foff, SD=5FBUS=5FV=
TABLE=5FUNPRIVILEGED),<br>+ SD=5FBUS=5FVTABLE=5FEND,<br>+};<br>+<br>+//----=
--------------------------------------------------<br>+// Called by IPMID a=
s part of the start up<br>+// ---------------------------------------------=
--------<br>+int start=5Fhost=5Fservice(sd=5Fbus *bus, sd=5Fbus=5Fslot *slo=
t)<br>+{<br>+ int rc =3D 0;<br>+<br>+ /* Install the object */<br>+ rc =3D =
sd=5Fbus=5Fadd=5Fobject=5Fvtable(bus,<br>+ &amp;slot,<br>+ "/org/openbmc/Ho=
stServices", &nbsp;/* object path */<br>+ "org.openbmc.HostServices", &nbsp=
; /* interface name */<br>+ host=5Fservices=5Fvtable,<br>+ NULL);<br>+ if (=
rc &lt; 0)<br>+ {<br>+ fprintf(stderr, "Failed to issue method call: %s\n",=
 strerror(-rc));<br>+ }<br>+ else<br>+ {<br>+ /* Take one in OpenBmc */<br>=
+ rc =3D sd=5Fbus=5Frequest=5Fname(bus, "org.openbmc.HostServices", 0);<br>=
+ if (rc &lt; 0)<br>+ {<br>+ fprintf(stderr, "Failed to acquire service nam=
e: %s\n", strerror(-rc));<br>+ }<br>+ }<br>+<br>+ return rc &lt; 0 ? EXIT=
=5FFAILURE : EXIT=5FSUCCESS;<br>+}<br>diff --git a/host-services.h b/host-s=
ervices.h<br>new file mode 100644<br>index 0000000..0d93480<br>--- /dev/nul=
l<br>+++ b/host-services.h<br>@@ -0,0 +1,3 @@<br>+#include &lt;systemd/sd-b=
us.h&gt;<br>+<br>+extern "C" int start=5Fhost=5Fservice(sd=5Fbus *, sd=5Fbu=
s=5Fslot *);<br>diff --git a/ipmid-api.h b/ipmid-api.h<br>index 34d3bbe..95=
2dd3f 100644<br>--- a/ipmid-api.h<br>+++ b/ipmid-api.h<br>@@ -53,7 +53,7 @@=
 typedef ipmi=5Fret=5Ft (*ipmid=5Fcallback=5Ft)(ipmi=5Fnetfn=5Ft, ipmi=5Fcm=
d=5Ft, ipmi=5Frequest=5Ft,<br>&nbsp;// information of netfn, cmd, callback =
handler pointer and context data.<br>&nbsp;// Making this a extern "C" so t=
hat plugin libraries written in C can also use<br>&nbsp;// it.<br>-extern "=
C" void ipmi=5Fregister=5Fcallback(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=5Ft,<br>+ex=
tern "C" void ipmi=5Fregister=5Fcallback(ipmi=5Fnetfn=5Ft, ipmi=5Fcmd=5Ft,<=
br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ip=
mi=5Fcontext=5Ft, ipmid=5Fcallback=5Ft);<br>&nbsp;<br>&nbsp;// These are th=
e command network functions, the response<br>@@ -94,5 +94,5 @@ enum ipmi=5F=
return=5Fcodes<br>&nbsp;&nbsp; &nbsp; IPMI=5FCC=5FUNSPECIFIED=5FERROR =3D 0=
xFF,<br>&nbsp;};<br>&nbsp;<br>-sd=5Fbus *ipmid=5Fget=5Fsd=5Fbus=5Fconnectio=
n(void);<br>+extern "C" sd=5Fbus* ipmid=5Fget=5Fsd=5Fbus=5Fconnection(void)=
;<br>&nbsp;#endif<br>diff --git a/ipmid.C b/ipmid.C<br>index 6b1eacc..44070=
5c 100644<br>--- a/ipmid.C<br>+++ b/ipmid.C<br>@@ -40,7 +40,6 @@ typedef st=
d::pair&lt;ipmid=5Fcallback=5Ft, ipmi=5Fcontext=5Ft&gt; ipmi=5Ffn=5Fcontext=
=5Ft;<br>&nbsp;std::map&lt;ipmi=5Ffn=5Fcmd=5Ft, ipmi=5Ffn=5Fcontext=5Ft&gt;=
 g=5Fipmid=5Frouter=5Fmap;<br>&nbsp;<br>&nbsp;<br>-<br>&nbsp;#ifndef HEXDUM=
P=5FCOLS<br>&nbsp;#define HEXDUMP=5FCOLS 16<br>&nbsp;#endif<br>@@ -418,6 +4=
17,10 @@ int main(int argc, char *argv[])<br>&nbsp;&nbsp; &nbsp; // Registe=
r all the handlers that provider implementation to IPMI commands.<br>&nbsp;=
&nbsp; &nbsp; ipmi=5Fregister=5Fcallback=5Fhandlers(HOST=5FIPMI=5FLIB=5FPAT=
H);<br>&nbsp;<br>+ // Start the Host Services Dbus Objects<br>+ start=5Fhos=
t=5Fservice(bus, slot);<br>+<br>+ // Watch for BT messages<br>&nbsp;&nbsp; =
&nbsp; r =3D sd=5Fbus=5Fadd=5Fmatch(bus, &amp;slot, FILTER, handle=5Fipmi=
=5Fcommand, NULL);<br>&nbsp;&nbsp; &nbsp; if (r &lt; 0) {<br>&nbsp;&nbsp; &=
nbsp; &nbsp; &nbsp; fprintf(stderr, "Failed: sd=5Fbus=5Fadd=5Fmatch: %s : %=
s\n", strerror(-r), FILTER);<br>@@ -427,7 +430,6 @@ int main(int argc, char=
 *argv[])<br>&nbsp;<br>&nbsp;&nbsp; &nbsp; for (;;) {<br>&nbsp;&nbsp; &nbsp=
; &nbsp; &nbsp; /* Process requests */<br>-<br>&nbsp;&nbsp; &nbsp; &nbsp; &=
nbsp; r =3D sd=5Fbus=5Fprocess(bus, NULL);<br>&nbsp;&nbsp; &nbsp; &nbsp; &n=
bsp; if (r &lt; 0) {<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fpr=
intf(stderr, "Failed to process bus: %s\n", strerror(-r));<br>diff --git a/=
ipmid.H b/ipmid.H<br>index 73b60e6..3de2c8c 100644<br>--- a/ipmid.H<br>+++ =
b/ipmid.H<br>@@ -2,6 +2,7 @@<br>&nbsp;#define =5F=5FHOST=5FIPMID=5FIPMI=5FH=
=5F=5F<br>&nbsp;#include "ipmid-api.h"<br>&nbsp;#include &lt;stdio.h&gt;<br=
>+#include "host-services.h"<br>&nbsp;<br>&nbsp;// When the requester sends=
 in a netfn and a command along with data, this<br>&nbsp;// function will l=
ook for registered handlers that will handle that [netfn,cmd]<br>--<br>2.6.=
3<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F<br>openbmc mailing list<br><a href=3D"mailto:openbmc@lists.ozlabs.or=
g" target=3D"=5Fblank" >openbmc@lists.ozlabs.org</a><br><a href=3D"https://=
lists.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlab=
s.org/listinfo/openbmc</a></font></div></blockquote></div></div></div></div=
>&nbsp;

<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>openbmc mailing list<br><a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"=5Fblank" >openbmc@lists.ozlabs.org</a><br><a href=3D"https://lists.ozl=
abs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.org/lis=
tinfo/openbmc</a></font></div></div></blockquote></blockquote></div></div><=
/div></div><BR>
