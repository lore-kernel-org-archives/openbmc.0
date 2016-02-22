Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DB0A21A06C8
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:53:28 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 18:53:26 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 22 Feb 2016 18:53:22 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 865202BB0057
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:53:21 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1M8rD2B26017938
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:53:21 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1M8qmci003399
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:52:49 +1100
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1M8qkNG002951
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 19:52:48 +1100
Message-Id: <201602220852.u1M8qkNG002951@d23av06.au.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 03:42:25 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 22 Feb 2016 03:42:23 -0500
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 22 Feb 2016 08:42:22 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 22 Feb 2016 08:42:20 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016022208421969-77298 ;
 Mon, 22 Feb 2016 08:42:19 +0000 
In-Reply-To: <1456104727.3064.29.camel@aj.id.au>
Subject: Re: [PATCH skeleton] skeleton: fixed hard-coding for master OCC hwmon
 sysfs path
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: andrew@aj.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Mon, 22 Feb 2016 08:42:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1456104727.3064.29.camel@aj.id.au>,
 <1455909058-21748-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455909058-21748-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016_FP1 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 13615
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16022208-0029-0000-0000-00004417110F
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.291549; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004947; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000145; SDB=6.00663293; UDB=6.00301987; UTC=2016-02-22
 08:42:20
x-cbparentid: 16022208-5090-0000-0000-0000073D4937
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
X-List-Received-Date: Mon, 22 Feb 2016 08:53:29 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hi Andrew,<br><br>Thank you for the comment.<br><br>After some thoug=
hts I would like to abandon this patch, since sensor=5Fmanager2.py will be =
invoked before OCC becomes active.<br>So searching hwmon sysfs for "user=5F=
powercap" attribute will always fail, since only after OCC becomes active, =
the OCC hwmon sysfs attributes can be created.<br><br>I will resubmit a pat=
ch.<br><br>For your comments, please see bellow:<br><br><font color=3D"#990=
099">-----"openbmc" &lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc-bounc=
es+shliyi=3Dcn.ibm.com@lists.ozlabs.org">openbmc-bounces+shliyi=3Dcn.ibm.co=
m@lists.ozlabs.org</a>&gt; wrote: -----</font><br><br>&gt;To: OpenBMC Patch=
es &lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">ope=
nbmc-patches@stwcx.xyz</a>&gt;,<br>&gt;<a target=3D"=5Fblank" href=3D"mailt=
o:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&gt;From: Andre=
w Jeffery <br>&gt;Sent by: "openbmc" <br>&gt;Date: 02/22/2016 09:33AM<br>&g=
t;Subject: Re: [PATCH skeleton] skeleton: fixed hard-coding for master<br>&=
gt;OCC hwmon sysfs path<br>&gt;<br>&gt;Hi Yi Li,<br>&gt;<br>&gt;On Fri, 201=
6-02-19 at 13:10 -0600, OpenBMC Patches wrote:<br>&gt;&gt; From: Yi Li &lt;=
<a target=3D"=5Fblank" href=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a=
>&gt;<br>&gt;&gt; <br><br>&gt;&gt;  &gt;         &gt; obj=5Fpath =3D OBJ=5F=
PATH+"/host/PowerCap"<br>&gt;&gt;  &gt;         &gt; sensor=5Fobj =3D Senso=
rs.PowerCap(bus,obj=5Fpath)<br>&gt;&gt; -&gt;         &gt; ## hwmon3 is def=
ault for master OCC on Barreleye.<br>&gt;&gt; -&gt;         &gt; ## should =
rewrite sensor=5Fmanager to remove hardcode<br>&gt;&gt; -&gt;         &gt; =
sensor=5Fobj.sysfs=5Fattr =3D<br>&gt;"/sys/class/hwmon/hwmon3/user=5Fpowerc=
ap"<br>&gt;&gt; +&gt;         &gt; ## scan hwmon sysfs for master occ's use=
r=5Fpowercap attribute<br>&gt;&gt; +&gt;         &gt; for pcap=5Ffile in<br=
>&gt;glob.glob('/sys/class/hwmon/*/user=5Fpowercap'):<br>&gt;&gt; +&gt;    =
     &gt;         &gt; occ=5Fi2c=5Fdev =3D os.path.dirname(pcap=5Ffile)+'/d=
evice'<br>&gt;&gt; +&gt;         &gt;         &gt; occ=5Fi2c=5Fdev =3D<br>&=
gt;os.path.realpath(occ=5Fi2c=5Fdev).split('/').pop()<br>&gt;&gt; +&gt;    =
     &gt;         &gt; # master OCC address<br>&gt;&gt; +&gt;         &gt; =
        &gt; if occ=5Fi2c=5Fdev =3D=3D '3-0050':<br>&gt;&gt; +&gt;         =
&gt;         &gt;         &gt; sensor=5Fobj.sysfs=5Fattr =3D pcap=5Ffile<br=
>&gt;<br>&gt;Have you tested the code in the for loop? Because running the =
body in<br>&gt;a<br>&gt;Python shell doesn't give me confidence the if-cond=
ition will ever be<br>&gt;satisfied:<br>&gt;<br><br>The skeleton creates se=
nsors in the order following BMC states, see Barreleye.py.<br>When I did te=
st, I manually booted the host. But when obmc actually boots, sensor=5Fmang=
er2.py will be invoked before OCC becomes active.<br>"glob.glob()" search w=
ill return empty list.<br><br>I will need to fix this.<br><br>&gt;    andre=
w@keelia    :~$ python<br>&gt;    Python 2.7.10 (default, Oct 14 2015, 16:0=
9:02) <br>&gt;    [GCC 5.2.1 20151010] on linux2<br>&gt;    Type "help", "c=
opyright", "credits" or "license" for more<br>&gt;information.<br>&gt;    &=
gt;&gt;&gt; import os<br>&gt;    &gt;&gt;&gt; pcap=5Ffile =3D     "/sys/cla=
ss/hwmon/hwmon3/user=5Fpowercap"<br>&gt;&gt;&gt;&gt; os.path.dirname(pcap=
=5Ffile)+"/device"<br>&gt;'/sys/class/hwmon/hwmon3/device'<br>&gt;&gt;&gt;&=
gt; os.path.realpath(=5F).split('/')<br>&gt;['', 'sys', 'class', 'hwmon', '=
hwmon3', 'device']<br>&gt;&gt;&gt;&gt; =5F.pop()<br>&gt;'device'<br>&gt;&gt=
;&gt;&gt; <br>&gt;<br>&gt;I can't see how occ=5Fi2c=5Fdev will ever take th=
e value '3-0050'? Are we<br>&gt;missing additional globbing and/or reading =
of files?<br>&gt;<br><br>"os.path.realpath()" will resolve the symbol link =
to real file path, e.g:"/sys/class/hwmon3/device", the real path will be e.=
g:"/sys/class/i2c-adaptor/... ... /3-0050".<br><br>&gt;&gt;          root=
=5Fsensor.add(obj=5Fpath,sensor=5Fobj)<br>&gt;<br>&gt;Have you given consid=
eration to what should be done if the<br>&gt;if-condition<br>&gt;in the for=
 loop above never fires? Is it still valid to add<br>&gt;sensor=5Fobj?<br>&=
gt;<br><br>Yes. In Sensor.py, I assigned a default path to "sysfs=5Fattr"<b=
r><br>"CONTROL=5FIFACE =3D 'org.openbmc.Control'<br>class PowerCap(VirtualS=
ensor):<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; def =5F=5Finit=5F=5F(=
self, bus, name):<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VirtualSensor.=5F=5Finit=5F=5F(self, b=
us, name)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; SensorValue.setValue(self, 0)<br>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; self.sysfs=5Fattr =3D "/sys/class/hwmon/hwmon3/user=5Fpowercap"<br>"<br>=
<br>Thanks,<br>-Yi<br></font><BR>
