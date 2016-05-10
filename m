Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3tVW6sXwzDq5s
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 18:59:47 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 10 May 2016 18:59:45 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 May 2016 18:59:43 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id B8D452BB00AF
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 18:57:47 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4A8vdvw57671802
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 18:57:42 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4A8uSw2028770
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 18:56:28 +1000
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4A8uQ9u028419
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 18:56:27 +1000
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 10 May 2016 02:46:08 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 10 May 2016 02:46:07 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 10 May 2016 08:46:05 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 10 May 2016 08:46:04 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016051008460284-88885 ;
 Tue, 10 May 2016 08:46:02 +0000 
MIME-Version: 1.0
In-Reply-To: <1462859449-5466-11-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton v9 10/23] Modify the hard-coded hwmon ID for
 PowerCap
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, johnhcwang <hsienchiang@gmail.com>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Tue, 10 May 2016 16:42:51 +0800
References: <1462859449-5466-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462859449-5466-11-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: 3C9C595E:A406A5BD-48257FAF:002FAE8A;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 51131
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BBF53CDFBC281A8f9e8a93df938690918cC7BBF53CDFBC281A"
Content-Disposition: inline
x-cbid: 16051008-0017-0000-0000-000004858233
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005262; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00700053; UDB=6.00323937; UTC=2016-05-10
 08:46:05
x-cbparentid: 16051008-3202-0000-0000-00000034AB52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF3C9C595E.A406A5BD-ON48257FAF.002FAE8A-48257FAF.002FDE7A@notes.na.collabserv.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 08:59:48 -0000


--0__=C7BBF53CDFBC281A8f9e8a93df938690918cC7BBF53CDFBC281A
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

The hard-coded 'PowerCap' hwmon sysfs file path is fixed in pull request:
https://github.com/openbmc/skeleton/pull/50

Please have a look.

Thanks,
-Yi

"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
05/10/2016 01:50:36 PM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Cc: johnhcwang <hsienchiang@gmail.com>
> Date: 05/10/2016 01:54 PM
> Subject: [PATCH skeleton v9 10/23] Modify the hard-coded hwmon ID for
PowerCap
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> From: johnhcwang <hsienchiang@gmail.com>
>
> After we enable I2C-6 lm75 outlet sensor in device stree, the hwmon ID
> of PowerCap won't be 3 anymore. So we have to modify it as real ID.
> ---
>  bin/Sensors.py         | 2 +-
>  bin/sensor=5Fmanager2.py | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bin/Sensors.py b/bin/Sensors.py
> index f951eeb..1c6a961 100755
> --- a/bin/Sensors.py
> +++ b/bin/Sensors.py
> @@ -137,7 +137,7 @@ class PowerCap(VirtualSensor):
>     def =5F=5Finit=5F=5F(self, bus, name):
>        VirtualSensor.=5F=5Finit=5F=5F(self, bus, name)
>        SensorValue.setValue(self, 0)
> -      self.sysfs=5Fattr =3D "/sys/class/hwmon/hwmon3/user=5Fpowercap"
> +      self.sysfs=5Fattr =3D "/sys/class/hwmon/hwmon4/user=5Fpowercap"
>     ##override setValue method
>     @dbus.service.method(SensorValue.IFACE=5FNAME,
>        in=5Fsignature=3D'v', out=5Fsignature=3D'')
> diff --git a/bin/sensor=5Fmanager2.py b/bin/sensor=5Fmanager2.py
> index b5aac53..6aaef3e 100755
> --- a/bin/sensor=5Fmanager2.py
> +++ b/bin/sensor=5Fmanager2.py
> @@ -54,9 +54,9 @@ if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':
>
>     obj=5Fpath =3D OBJ=5FPATH+"/host/PowerCap"
>     sensor=5Fobj =3D Sensors.PowerCap(bus,obj=5Fpath)
> -   ## hwmon3 is default for master OCC on Barreleye.
> +   ## hwmon4 is default for master OCC on Barreleye.
>     ## should rewrite sensor=5Fmanager to remove hardcode
> -   sensor=5Fobj.sysfs=5Fattr =3D "/sys/class/hwmon/hwmon3/user=5Fpowerca=
p"
> +   sensor=5Fobj.sysfs=5Fattr =3D "/sys/class/hwmon/hwmon4/user=5Fpowerca=
p"
>     root=5Fsensor.add(obj=5Fpath,sensor=5Fobj)
>
>     obj=5Fpath =3D OBJ=5FPATH+"/host/BootProgress"
> --
> 2.8.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=C7BBF53CDFBC281A8f9e8a93df938690918cC7BBF53CDFBC281A
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>The hard-coded 'PowerCap' hwmon sysfs file path is fixed in =
pull request: <a href=3D"https://github.com/openbmc/skeleton/pull/50">https=
://github.com/openbmc/skeleton/pull/50</a><br><br>Please have a look.<br><b=
r>Thanks,<br>-Yi<br><br><tt>&quot;openbmc&quot; &lt;openbmc-bounces+shliyi=
=3Dcn.ibm.com@lists.ozlabs.org&gt; wrote on 05/10/2016 01:50:36 PM:<br><br>=
&gt; From: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</tt><br><tt>&g=
t; To: openbmc@lists.ozlabs.org</tt><br><tt>&gt; Cc: johnhcwang &lt;hsiench=
iang@gmail.com&gt;</tt><br><tt>&gt; Date: 05/10/2016 01:54 PM</tt><br><tt>&=
gt; Subject: [PATCH skeleton v9 10/23] Modify the hard-coded hwmon ID for P=
owerCap</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+s=
hliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; From: joh=
nhcwang &lt;hsienchiang@gmail.com&gt;<br>&gt; <br>&gt; After we enable I2C-=
6 lm75 outlet sensor in device stree, the hwmon ID<br>&gt; of PowerCap won'=
t be 3 anymore. So we have to modify it as real ID.<br>&gt; ---<br>&gt; &nb=
sp;bin/Sensors.py &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>&gt; &nbsp;bin/sens=
or=5Fmanager2.py | 4 ++--<br>&gt; &nbsp;2 files changed, 3 insertions(+), 3=
 deletions(-)<br>&gt; <br>&gt; diff --git a/bin/Sensors.py b/bin/Sensors.py=
<br>&gt; index f951eeb..1c6a961 100755<br>&gt; --- a/bin/Sensors.py<br>&gt;=
 +++ b/bin/Sensors.py<br>&gt; @@ -137,7 +137,7 @@ class PowerCap(VirtualSen=
sor):<br>&gt; &nbsp; &nbsp; def =5F=5Finit=5F=5F(self, bus, name):<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp;VirtualSensor.=5F=5Finit=5F=5F(self, bus, name)<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;SensorValue.setValue(self, 0)<br>&gt; - =
&nbsp; &nbsp; &nbsp;self.sysfs=5Fattr =3D &quot;/sys/class/hwmon/hwmon3/use=
r=5Fpowercap&quot;<br>&gt; + &nbsp; &nbsp; &nbsp;self.sysfs=5Fattr =3D &quo=
t;/sys/class/hwmon/hwmon4/user=5Fpowercap&quot;<br>&gt; &nbsp; &nbsp; ##ove=
rride setValue method<br>&gt; &nbsp; &nbsp; @dbus.service.method(SensorValu=
e.IFACE=5FNAME,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;in=5Fsignature=3D'v', ou=
t=5Fsignature=3D'')<br>&gt; diff --git a/bin/sensor=5Fmanager2.py b/bin/sen=
sor=5Fmanager2.py<br>&gt; index b5aac53..6aaef3e 100755<br>&gt; --- a/bin/s=
ensor=5Fmanager2.py<br>&gt; +++ b/bin/sensor=5Fmanager2.py<br>&gt; @@ -54,9=
 +54,9 @@ if =5F=5Fname=5F=5F =3D=3D '=5F=5Fmain=5F=5F':<br>&gt; &nbsp;<br>=
&gt; &nbsp; &nbsp; obj=5Fpath =3D OBJ=5FPATH+&quot;/host/PowerCap&quot;<br>=
&gt; &nbsp; &nbsp; sensor=5Fobj =3D Sensors.PowerCap(bus,obj=5Fpath)<br>&gt=
; - &nbsp; ## hwmon3 is default for master OCC on Barreleye.<br>&gt; + &nbs=
p; ## hwmon4 is default for master OCC on Barreleye.<br>&gt; &nbsp; &nbsp; =
## should rewrite sensor=5Fmanager to remove hardcode<br>&gt; - &nbsp; sens=
or=5Fobj.sysfs=5Fattr =3D &quot;/sys/class/hwmon/hwmon3/user=5Fpowercap&quo=
t;<br>&gt; + &nbsp; sensor=5Fobj.sysfs=5Fattr =3D &quot;/sys/class/hwmon/hw=
mon4/user=5Fpowercap&quot;<br>&gt; &nbsp; &nbsp; root=5Fsensor.add(obj=5Fpa=
th,sensor=5Fobj)<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; obj=5Fpath =3D OBJ=5F=
PATH+&quot;/host/BootProgress&quot;<br>&gt; -- <br>&gt; 2.8.1<br>&gt; <br>&=
gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt=
; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlab=
s.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=C7BBF53CDFBC281A8f9e8a93df938690918cC7BBF53CDFBC281A--
