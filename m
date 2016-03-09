Return-Path: <miltonm@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DF81D1A0060
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 10:58:37 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 16:58:35 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 16:58:32 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id A43383E4004F
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:58:31 -0700 (MST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u29NwVNY29687998
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 23:58:31 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u29NwUNe032608
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 18:58:31 -0500
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u29NwTrf032544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 18:58:30 -0500
Message-Id: <201603092358.u29NwTrf032544@d01av02.pok.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 16:58:29 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 9 Mar 2016 16:58:27 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 9 Mar 2016 23:58:26 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 23:58:24 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016030923582421-515570 ;
 Wed, 9 Mar 2016 23:58:24 +0000 
In-Reply-To: <201603090609.u2969XFJ20775402@d28relay05.in.ibm.com>
Subject: Re: [PATCH openpower-host-ipmi-oem] Add IPMI interface to allow FW
 updates from Host
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>, Cyril Bur
 <cyrilbur@gmail.com>, "Adriana Kobylak" <anoo@us.ibm.com>
Cc: openbmc@lists.ozlabs.org
Date: Wed, 9 Mar 2016 23:58:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <201603090609.u2969XFJ20775402@d28relay05.in.ibm.com>,
 <1457115626-18686-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457115626-18686-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160309163435.220afa51@camb691>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP4 March 02, 2016
X-LLNOutbound: False
X-Disclaimed: 7407
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16030923-0021-0000-0000-000017F2478E
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.034494; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005017; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00671049; UDB=6.00306633; UTC=2016-03-09
 23:58:26
x-cbparentid: 16030923-4778-0000-0000-0000025E15AD
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
X-List-Received-Date: Wed, 09 Mar 2016 23:58:38 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 3/9/2016, "Vishwanatha Subbanna" &lt;<a target=3D"=5Fblank" h=
ref=3D"mailto:vishwanath@in.ibm.com">vishwanath@in.ibm.com</a>&gt; wrote:<b=
r>&gt; Cyril Bur &lt;<a target=3D"=5Fblank" href=3D"mailto:cyrilbur@gmail.c=
om">cyrilbur@gmail.com</a>&gt; wrote:<br>&gt;&gt; On Fri, &nbsp;4 Mar 2016 =
12:20:26 -0600<br>&gt;&gt; OpenBMC Patches &lt;<a target=3D"=5Fblank" href=
=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt; wro=
te:<br>&gt;&gt; <br>&gt;&gt; &gt; From: Adriana Kobylak &lt;<a target=3D"=
=5Fblank" href=3D"mailto:anoo@us.ibm.com">anoo@us.ibm.com</a>&gt;<br>&gt;&g=
t; &gt; <br>&gt;&gt; &gt; New OEM IPMI command to execute commands that wou=
ld allow the<br>&gt;Host<br>&gt;&gt; to have access to the BMC to perform a=
 FW update.<br>&gt;&gt; &gt; ---<br>&gt;&gt; &gt; &nbsp;Makefile &nbsp; &nb=
sp; | &nbsp;2 +-<br>&gt;&gt; &gt; &nbsp;oemhandler.C | 52 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++<br>&gt;&gt; &gt; &nbsp;oemhandler.h | &=
nbsp;1 +<br>&gt;&gt; &gt; &nbsp;3 files changed, 54 insertions(+), 1 deleti=
on(-)<br>&gt;&gt; &gt; <br>&gt;&gt; &gt; diff --git a/Makefile b/Makefile<b=
r>&gt;&gt; &gt; index eaa7324..bacdef9 100644<br>&gt;&gt; &gt; --- a/Makefi=
le<br>&gt;&gt; &gt; +++ b/Makefile<br>&gt;&gt; &gt; @@ -10,7 +10,7 @@ CXXFL=
AGS +=3D -fPIC -Wall<br>&gt;&gt; &gt; &nbsp;all: &nbsp;$(LIB=5FOEM)<br>&gt;=
&gt; &gt; &nbsp;<br>&gt;&gt; &gt; &nbsp;%.o: %.C<br>&gt;&gt; &gt; - &nbsp; =
$(CXX) -c $&lt; $(CXXFLAGS) -o $@<br>&gt;&gt; &gt; + &nbsp; $(CXX) -std=3Dc=
++14 -c $&lt; $(CXXFLAGS) -o $@<br>&gt;&gt; &gt; &nbsp;<br>&gt;&gt; <br>&gt=
;&gt; This isn't a CXXFLAGS thing?<br><br>I've seen some projects say CFLAG=
S etc are for the makefile<br>invoker not for changing for the needs of the=
 individual file being<br>compiled.&nbsp; Others have mechanisims to extend=
 the flags.<br><br>Is the standard only needed to pick up the attributes on=
 the stream?<br><br>&gt;&gt; <br>&gt;&gt; &gt; &nbsp;$(LIB=5FOEM): $(LIB=5F=
OEM=5FOBJ)<br>&gt;&gt; &gt; &nbsp; &nbsp; $(CXX) $^ -shared $(LDFLAGS) -o $=
@<br>&gt;&gt; &gt; diff --git a/oemhandler.C b/oemhandler.C<br>&gt;&gt; &gt=
; index f577d67..22452d6 100644<br>&gt;&gt; &gt; --- a/oemhandler.C<br>&gt;=
&gt; &gt; +++ b/oemhandler.C<br>&gt;&gt; &gt; @@ -1,7 +1,9 @@<br>&gt;&gt; &=
gt; &nbsp;#include "oemhandler.h"<br>&gt;&gt; &gt; &nbsp;#include &lt;host-=
ipmid/ipmid-api.h&gt;<br>&gt;&gt; &gt; +#include &lt;fstream&gt;<br>&gt;&gt=
; &gt; &nbsp;#include &lt;stdio.h&gt;<br>&gt;&gt; &gt; &nbsp;#include &lt;s=
tring.h&gt;<br>&gt;&gt; &gt; +#include &lt;systemd/sd-bus.h&gt;<br>&gt;&gt;=
 &gt; &nbsp;<br>&gt;&gt; &gt; &nbsp;void register=5Fnetfn=5Foem=5Fpartial=
=5Fesel()<br>&gt;=5F=5Fattribute=5F=5F((constructor));<br>&gt;&gt; &gt; &nb=
sp;<br>&gt;&gt; &gt; @@ -70,10 +72,60 @@ ipmi=5Fret=5Ft <br>&gt;&gt; ipmi=
=5Fibm=5Foem=5Fpartial=5Fesel(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&gt;&gt; &gt; &nbsp; &nbsp; return rc;<br>&gt;&gt; &gt; &nbsp;}<br>&gt;&g=
t; &gt; &nbsp;<br>&gt;&gt; &gt; +// Prepare for FW Update.<br>&gt;&gt; &gt;=
 +// Execute needed commands to prepare the system for a fw update<br>&gt;<=
br>&gt;&gt; from the host.<br>&gt;&gt; &gt; +ipmi=5Fret=5Ft ipmi=5Fibm=5Foe=
m=5Fprep=5Ffw=5Fupdate(ipmi=5Fnetfn=5Ft netfn,<br>&gt;ipmi=5Fcmd=5Ft cmd,<b=
r>&gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=
=5Frequest=5Ft request, <br>&gt;&gt; ipmi=5Fresponse=5Ft response,<br>&gt;&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=
=5Flen=5Ft data=5Flen, <br>&gt;&gt; ipmi=5Fcontext=5Ft context)<br>&gt;&gt;=
 &gt; +{<br>&gt;&gt; &gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft ipmi=5Frc =3D IPMI=
=5FCC=5FOK;<br>&gt;&gt; &gt; + &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt;&gt; =
&gt; +<br>&gt;&gt; &gt; + &nbsp; &nbsp;int rc =3D 0;<br>&gt;&gt; &gt; + &nb=
sp; &nbsp;std::ofstream rwfs=5Ffile;<br>&gt;&gt; &gt; + &nbsp; &nbsp;const =
char &nbsp;*busname =3D "org.openbmc.control.Bmc";<br>&gt;&gt; &gt; + &nbsp=
; &nbsp;const char &nbsp;*objname =3D "/org/openbmc/control/bmc0";<br>&gt;&=
gt; &gt; + &nbsp; &nbsp;const char &nbsp;*iface =3D "org.openbmc.control.Bm=
c";<br>&gt;&gt; &gt; + &nbsp; &nbsp;sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbu=
s=5Fconnection();<br>&gt;&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply=
 =3D NULL;<br>&gt;&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5F=
BUS=5FERROR=5FNULL;<br>&gt;&gt; &gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt;&gt=
; &gt; +<br>&gt;&gt; &gt; + &nbsp; &nbsp;// Set one time flag<br>&gt;&gt; &=
gt; + &nbsp; &nbsp;rc =3D system("fw=5Fsetenv openbmconce copy-files-to-ram=
<br>&gt;copy-base-filesystem-to-ram");<br>&gt;&gt; &gt; + &nbsp; &nbsp;rc =
=3D WEXITSTATUS(rc);<br>&gt;&gt; &gt; + &nbsp; &nbsp;if (rc !=3D 0) {<br>&g=
t;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "fw=5Fsetenv openb=
mconce failed with<br>&gt;rc=3D%d\n", rc);<br>&gt;&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;return IPMI=5FCC=5FUNSPECIFIED=5FERROR; <br>&gt;&gt; &gt; + &=
nbsp; &nbsp;}<br>&gt;&gt; &gt; +<br>&gt;&gt; &gt; + &nbsp; &nbsp;// Touch t=
he image-rwfs file to perform an empty update to <br>&gt;&gt; force the sav=
e<br>&gt;&gt; &gt; + &nbsp; &nbsp;// in case we're already in ram and the f=
lash is the same <br>&gt;&gt; causing the ram files<br>&gt;&gt; &gt; + &nbs=
p; &nbsp;// to not be copied back to flash<br>&gt;&gt; &gt; + &nbsp; &nbsp;=
rwfs=5Ffile.open("/run/initramfs/image-rwfs",<br>&gt;std::ofstream::out | s=
td::ofstream::app);<br>&gt;<br>&gt;Need to handle the file open and access =
errors. Also, any reason why<br>&gt;std::ofstream used instead of fopen(3).=
<br>&gt;fopen may have been lighter IMO.<br>&gt;<br><br>Actually a simple o=
pen system call would be even cheaper as no file <br>IO buffers are needed.=
&nbsp; We only need to make sure the file exists <br>and create it if not, =
without changing it if it does exist.<br><br>&gt;&gt; &gt; + &nbsp; &nbsp;r=
wfs=5Ffile.close();<br>&gt;<br>&gt;Handle errors on closing. ?<br>&gt;<br>&=
gt;&gt; &gt; +<br>&gt;&gt; &gt; + &nbsp; &nbsp;// Reboot the BMC for settin=
gs to take effect<br>&gt;&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fm=
ethod(bus, busname, objname, iface,<br>&gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "war=
mReset", &amp;error, &amp;reply, NULL);<br>&gt;&gt; &gt; + &nbsp; &nbsp;if =
(r &lt; 0) {<br>&gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, =
"Failed to reset BMC: %s\n",<br>&gt;strerror(-r));<br>&gt;&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;return -1;<br>&gt;&gt; &gt; + &nbsp; &nbsp;}<br>&gt;<=
br>&gt;Return needs to be one of the IPMI specified rc than a "-1". May be<=
br>&gt;IPMI=5FCC=5FINVALID is better suited here. ?<br>&gt;Also this has me=
mory leak on error. Need to free the 'error' and<br>&gt;'reply'.<br>&gt;<br=
>&gt;Also, if this call results in BMC being rebooted, does this call ever<=
br>&gt;return and the reboot is done Async ?.<br>&gt;<br>&gt;&gt; &gt; + &n=
bsp; &nbsp;printf("Warning: BMC is going down for reboot!\n");<br>&gt;&gt; =
&gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt;&gt; &gt; +=
 &nbsp; &nbsp;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt;&gt; &gt;=
 +<br>&gt;&gt; &gt; + &nbsp; &nbsp;return ipmi=5Frc;<br>&gt;&gt; &gt; +}<br=
>&gt;&gt; &gt; &nbsp;<br>&gt;&gt; &gt; &nbsp;void register=5Fnetfn=5Foem=5F=
partial=5Fesel()<br>&gt;&gt; &gt; &nbsp;{<br>&gt;&gt; &gt; &nbsp; &nbsp; pr=
intf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FOEM, <br>&gt;&gt; IP=
MI=5FCMD=5FPESEL);<br>&gt;&gt; &gt; &nbsp; &nbsp; ipmi=5Fregister=5Fcallbac=
k(NETFUN=5FOEM, IPMI=5FCMD=5FPESEL, NULL, <br>&gt;&gt; ipmi=5Fibm=5Foem=5Fp=
artial=5Fesel);<br>&gt;&gt; &gt; +<br>&gt;&gt; &gt; + &nbsp; &nbsp;printf("=
Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FOEM,<br>&gt;<br>&gt;&gt; =
IPMI=5FCMD=5FPREP=5FFW=5FUPDATE);<br>&gt;&gt; &gt; + &nbsp; &nbsp;ipmi=5Fre=
gister=5Fcallback(NETFUN=5FOEM, IPMI=5FCMD=5FPREP=5FFW=5FUPDATE, <br>&gt;&g=
t; NULL, ipmi=5Fibm=5Foem=5Fprep=5Ffw=5Fupdate);<br>&gt;&gt; &gt; +<br>&gt;=
&gt; &gt; &nbsp; &nbsp; return;<br>&gt;&gt; &gt; &nbsp;}<br>&gt;&gt; &gt; d=
iff --git a/oemhandler.h b/oemhandler.h<br>&gt;&gt; &gt; index 9cc397f..71a=
e01c 100644<br>&gt;&gt; &gt; --- a/oemhandler.h<br>&gt;&gt; &gt; +++ b/oemh=
andler.h<br>&gt;&gt; &gt; @@ -8,6 +8,7 @@<br>&gt;&gt; &gt; &nbsp;// IPMI co=
mmands for net functions.<br>&gt;&gt; &gt; &nbsp;enum ipmi=5Fnetfn=5Foem=5F=
cmds<br>&gt;&gt; &gt; &nbsp;{<br>&gt;&gt; &gt; + &nbsp; &nbsp;IPMI=5FCMD=5F=
PREP=5FFW=5FUPDATE =3D 0x10,<br>&gt;&gt; &gt; &nbsp; &nbsp; &nbsp;IPMI=5FCM=
D=5FPESEL =3D 0xF0,<br>&gt;&gt; &gt; &nbsp;};<br>&gt;&gt; &gt;&nbsp; <br><b=
r>milton<br></font><BR>
