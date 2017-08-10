Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT2HQ5B0kzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 08:04:50 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7AM49ed139484
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:04:48 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c8t691hgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:04:48 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 10 Aug 2017 22:04:47 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 10 Aug 2017 22:04:44 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017081022044318-1052062 ;
 Thu, 10 Aug 2017 22:04:43 +0000 
MIME-Version: 1.0
In-Reply-To: <1502374854.1431709.1069264592.5D5C9137@webmail.messagingengine.com>
Subject: Re: Crashing Phosphor Settings Manager
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?ISO-8859-1?Q?David_M=FCller?= (ELSOFT AG) <d.mueller@elsoft.ch>,
 openbmc@lists.ozlabs.org,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Thu, 10 Aug 2017 17:04:42 -0500
References: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
 <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
 <1502374854.1431709.1069264592.5D5C9137@webmail.messagingengine.com>
X-KeepSent: 17629436:FAAE5DE7-86258178:00512E66;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 53227
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BEBDFC2A8F68f9e8a93df938690918c09BB0BEBDFC2A8F6"
Content-Disposition: inline
x-cbid: 17081022-5101-0000-0000-0000060D7814
X-IBM-SpamModules-Scores: BY=0.020823; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.015101
X-IBM-SpamModules-Versions: BY=3.00007521; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00900474; UDB=6.00450821; IPR=6.00680676; 
 BA=6.00005522; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016634; XFM=3.00000015;
 UTC=2017-08-10 22:04:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-10 21:32:15 - 6.00007160
x-cbparentid: 17081022-5102-0000-0000-0000A7A9F5F8
Message-Id: <OF17629436.FAAE5DE7-ON86258178.00512E66-86258178.007947E6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 22:04:51 -0000


--0__=09BB0BEBDFC2A8F68f9e8a93df938690918c09BB0BEBDFC2A8F6
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1



"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
08/10/2017 09:20:54 AM:

> From: Andrew Jeffery <andrew@aj.id.au>
> To: David M=FCller (ELSOFT AG) <d.mueller@elsoft.ch>,
openbmc@lists.ozlabs.org
> Date: 08/10/2017 09:21 AM
> Subject: Re: Crashing Phosphor Settings Manager
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Hi Dave,
>
> On Thu, Aug 10, 2017, at 23:07, David M=FCller (ELSOFT AG) wrote:
> > Hello
> >
> > While trying to further debug my problem, I had the idea to check how
> > things are done on the AST2500 eval board. So I built and install a new
> > flash image using the "evb-ast2500" configuration.
> >
> > Unfortunately the symtoms are the same as with my custom configuration.
> >
> > - The evb-ast2500 OpenBMC configuration is known to be good, isn't it?
> >
> > - Which process/service is responsible for the "/org/openbmc/control"
> >   object?

I don't think there is any one process that is responsible
for /org/openbmc/control.
It is a parent of other processes though.

org.openbmc.control.Bmc       /org/openbmc/control/bmc0
org.openbmc.control.Power     /org/openbmc/control/power0
org.openbmc.control.Chassis   /org/openbmc/control/chassis0
org.openbmc.control.BmcFlash  /org/openbmc/control/flash

So it appears not 1 of the 4 processes is starting up on the evb-ast2500
build.
That is not a bad thing though.  The org.openbmc.control (any org.openbmc
really)
is in violation of the dbus spec and as such we have moved most services
over to
xyz.openbmc=5Fproject.  Seems like the evb-ast2500 is ready to have the
settings=5Fmanager.py from phosphor/settingd repository fixed up.

So you can ignore that message and focus on the /xyz/openbmc/control
interfaces

> >
> >
> > root@evb-ast2500:~# cat /etc/os-release
> > ID=3D"openbmc-phosphor"
> > NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> > VERSION=3D"v1.99.8-208"
> > VERSION=5FID=3D"v1.99.8-208-g4ee67571-dirty"
> > PRETTY=5FNAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference
> > Distro) v1.99.8-208"
> > BUILD=5FID=3D"v1.99.8"
> >
> >
> >
> > Aug 10 11:28:27 evb-ast2500 daemon.info systemd[1]: Starting Phosphor
> > Settings Manager...
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > Traceback (most recent call last):
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > File "/usr/sbin/settings=5Fmanager.py", line 262, in <module>
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > allobjects =3D create=5Fobject(s.SETTINGS)
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > File "/usr/sbin/settings=5Fmanager.py", line 72, in create=5Fobject
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > retries=3D10, interval=3D0.1)
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> > 66, in get=5Fsubtree=5Fpaths
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > retries, interval)
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> > 42, in retry
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > return func()
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > File "/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py", line
> > 65, in <lambda>
> > Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:
> > path, de/lib/python2.7/site-packages/dbus/connection.py", line 651, in
> > call=5Fblocking
> > Aug 10 11:40:45 evb-ast2500 daemon.info settings=5Fmanager.py[1589]:
> > message, timeout)
> > Aug 10 11:40:45 evb-ast2500 daemon.info settings=5Fmanager.py[1589]:
> > dbus.exceptions.DBusException: org.freedesktop.DBus.Error.FileNotFound:
> > path or object not found: /org/openbmc/control
> > Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
> > org.openbmc.settings.Host
> > .service: Main process exited, code=3Dexited, status=3D1/FAILURE
> > Aug 10 11:40:45 evb-ast2500 daemon.err systemd[1]: Failed to start
> > Phosphor Settings Manager.
> > Aug 10 11:40:45 evb-ast2500 daemon.notice systemd[1]:
> > org.openbmc.settings.Host.service: Unit entered failed state.
> > Aug 10 11:40:45 evb-ast2500 daemon.warn systemd[1]:
> > org.openbmc.settings.Host.service: Failed with result 'exit-code'.
> > Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]:
> > org.openbmc.settings.Host.service: Service hold-off time over,
> > scheduling restart.
> > Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]: Stopped Phosphor
> > Settings Manager.
>
> Your best bet might be to open an issue on Github. I had a quick search
> and couldn't see any existing issues that were relevant.
>
> Andrew
>
> >
> >
> > Dave
>

--0__=09BB0BEBDFC2A8F68f9e8a93df938690918c09BB0BEBDFC2A8F6
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces=
+austenc=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 08/10/2017 09:20:54 AM:=
<br><br>&gt; From: Andrew Jeffery &lt;andrew@aj.id.au&gt;</font></tt><br><t=
t><font size=3D"2">&gt; To: David M=FCller (ELSOFT AG) &lt;d.mueller@elsoft=
.ch&gt;, openbmc@lists.ozlabs.org</font></tt><br><tt><font size=3D"2">&gt; =
Date: 08/10/2017 09:21 AM</font></tt><br><tt><font size=3D"2">&gt; Subject:=
 Re: Crashing Phosphor Settings Manager</font></tt><br><tt><font size=3D"2"=
>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com=
@lists.ozlabs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Hi =
Dave,<br>&gt; <br>&gt; On Thu, Aug 10, 2017, at 23:07, David M=FCller (ELSO=
FT AG) wrote:<br>&gt; &gt; Hello<br>&gt; &gt; <br>&gt; &gt; While trying to=
 further debug my problem, I had the idea to check how<br>&gt; &gt; things =
are done on the AST2500 eval board. So I built and install a new<br>&gt; &g=
t; flash image using the &quot;evb-ast2500&quot; configuration.<br>&gt; &gt=
; <br>&gt; &gt; Unfortunately the symtoms are the same as with my custom co=
nfiguration.<br>&gt; &gt; <br>&gt; &gt; - The evb-ast2500 OpenBMC configura=
tion is known to be good, isn't it?<br>&gt; &gt; <br>&gt; &gt; - Which proc=
ess/service is responsible for the &quot;/org/openbmc/control&quot;<br>&gt;=
 &gt; &nbsp; object?<br></font></tt><br><tt><font size=3D"2">I don't think =
there is any one process that is responsible for /org/openbmc/control.</fon=
t></tt><br><tt><font size=3D"2">It is a parent of other processes though. &=
nbsp;</font></tt><br><br><tt><font size=3D"2">org.openbmc.control.Bmc &nbsp=
; &nbsp; &nbsp; /org/openbmc/control/bmc0</font></tt><br><tt><font size=3D"=
2">org.openbmc.control.Power &nbsp; &nbsp; /org/openbmc/control/power0</fon=
t></tt><br><tt><font size=3D"2">org.openbmc.control.Chassis &nbsp; /org/ope=
nbmc/control/chassis0</font></tt><br><tt><font size=3D"2">org.openbmc.contr=
ol.BmcFlash &nbsp;/org/openbmc/control/flash</font></tt><br><br><tt><font s=
ize=3D"2">So it appears not 1 of the 4 processes is starting up on the evb-=
ast2500 build.</font></tt><br><tt><font size=3D"2">That is not a bad thing =
though. &nbsp;The org.openbmc.control (any org.openbmc really)</font></tt><=
br><tt><font size=3D"2">is in violation of the dbus spec and as such we hav=
e moved most services over to</font></tt><br><tt><font size=3D"2">xyz.openb=
mc=5Fproject. &nbsp;Seems like the evb-ast2500 is ready to have the </font>=
</tt><br><tt><font size=3D"2">settings=5Fmanager.py from phosphor/settingd =
repository fixed up.</font></tt><br><br><tt><font size=3D"2">So you can ign=
ore that message and focus on the /xyz/openbmc/control interfaces</font></t=
t><br><br><tt><font size=3D"2">&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; root@e=
vb-ast2500:~# cat /etc/os-release<br>&gt; &gt; ID=3D&quot;openbmc-phosphor&=
quot;<br>&gt; &gt; NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project =
Reference Distro)&quot;<br>&gt; &gt; VERSION=3D&quot;v1.99.8-208&quot;<br>&=
gt; &gt; VERSION=5FID=3D&quot;v1.99.8-208-g4ee67571-dirty&quot;<br>&gt; &gt=
; PRETTY=5FNAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Referenc=
e<br>&gt; &gt; Distro) v1.99.8-208&quot;<br>&gt; &gt; BUILD=5FID=3D&quot;v1=
.99.8&quot;<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; Aug 10 1=
1:28:27 evb-ast2500 daemon.info systemd[1]: Starting Phosphor<br>&gt; &gt; =
Settings Manager...<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info se=
ttings=5Fmanager.py[1033]:<br>&gt; &gt; Traceback (most recent call last):<=
br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py[=
1033]:<br>&gt; &gt; File &quot;/usr/sbin/settings=5Fmanager.py&quot;, line =
262, in &lt;module&gt;<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info=
 settings=5Fmanager.py[1033]:<br>&gt; &gt; allobjects =3D create=5Fobject(s=
.SETTINGS)<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info settings=5F=
manager.py[1033]:<br>&gt; &gt; File &quot;/usr/sbin/settings=5Fmanager.py&q=
uot;, line 72, in create=5Fobject<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 =
daemon.info settings=5Fmanager.py[1033]:<br>&gt; &gt; retries=3D10, interva=
l=3D0.1)<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fma=
nager.py[1033]:<br>&gt; &gt; File &quot;/usr/lib/python2.7/site-packages/ob=
mc/mapper/bindings.py&quot;, line<br>&gt; &gt; 66, in get=5Fsubtree=5Fpaths=
<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info settings=5Fmanager.py=
[1033]:<br>&gt; &gt; retries, interval)<br>&gt; &gt; Aug 10 11:28:29 evb-as=
t2500 daemon.info settings=5Fmanager.py[1033]:<br>&gt; &gt; File &quot;/usr=
/lib/python2.7/site-packages/obmc/mapper/bindings.py&quot;, line<br>&gt; &g=
t; 42, in retry<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500 daemon.info settin=
gs=5Fmanager.py[1033]:<br>&gt; &gt; return func()<br>&gt; &gt; Aug 10 11:28=
:29 evb-ast2500 daemon.info settings=5Fmanager.py[1033]:<br>&gt; &gt; File =
&quot;/usr/lib/python2.7/site-packages/obmc/mapper/bindings.py&quot;, line<=
br>&gt; &gt; 65, in &lt;lambda&gt;<br>&gt; &gt; Aug 10 11:28:29 evb-ast2500=
 daemon.info settings=5Fmanager.py[1033]:<br>&gt; &gt; path, de/lib/python2=
.7/site-packages/dbus/connection.py&quot;, line 651, in<br>&gt; &gt; call=
=5Fblocking<br>&gt; &gt; Aug 10 11:40:45 evb-ast2500 daemon.info settings=
=5Fmanager.py[1589]:<br>&gt; &gt; message, timeout)<br>&gt; &gt; Aug 10 11:=
40:45 evb-ast2500 daemon.info settings=5Fmanager.py[1589]:<br>&gt; &gt; dbu=
s.exceptions.DBusException: org.freedesktop.DBus.Error.FileNotFound:<br>&gt=
; &gt; path or object not found: /org/openbmc/control<br>&gt; &gt; Aug 10 1=
1:40:45 evb-ast2500 daemon.notice systemd[1]:<br>&gt; &gt; org.openbmc.sett=
ings.Host<br>&gt; &gt; .service: Main process exited, code=3Dexited, status=
=3D1/FAILURE<br>&gt; &gt; Aug 10 11:40:45 evb-ast2500 daemon.err systemd[1]=
: Failed to start<br>&gt; &gt; Phosphor Settings Manager.<br>&gt; &gt; Aug =
10 11:40:45 evb-ast2500 daemon.notice systemd[1]:<br>&gt; &gt; org.openbmc.=
settings.Host.service: Unit entered failed state.<br>&gt; &gt; Aug 10 11:40=
:45 evb-ast2500 daemon.warn systemd[1]:<br>&gt; &gt; org.openbmc.settings.H=
ost.service: Failed with result 'exit-code'.<br>&gt; &gt; Aug 10 11:40:46 e=
vb-ast2500 daemon.info systemd[1]:<br>&gt; &gt; org.openbmc.settings.Host.s=
ervice: Service hold-off time over,<br>&gt; &gt; scheduling restart.<br>&gt=
; &gt; Aug 10 11:40:46 evb-ast2500 daemon.info systemd[1]: Stopped Phosphor=
<br>&gt; &gt; Settings Manager.<br>&gt; <br>&gt; Your best bet might be to =
open an issue on Github. I had a quick search<br>&gt; and couldn't see any =
existing issues that were relevant.<br>&gt; <br>&gt; Andrew<br>&gt; <br>&gt=
; &gt; <br>&gt; &gt; <br>&gt; &gt; Dave<br>&gt; <br></font></tt><BR>
</body></html>

--0__=09BB0BEBDFC2A8F68f9e8a93df938690918c09BB0BEBDFC2A8F6--
