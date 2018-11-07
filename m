Return-Path: <a.soldatov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.soldatov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="h+qHTaGq"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qlS16MfGzF3Fx
 for <openbmc@lists.ozlabs.org>; Wed,  7 Nov 2018 23:03:29 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 91B2441207;
 Wed,  7 Nov 2018 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-type:content-type:content-language
 :accept-language:in-reply-to:references:message-id:date:date
 :subject:subject:from:from:received:received:received:received;
 s=mta-01; t=1541592205; x=1543406606; bh=0+ExTbYdY89xDuZgjPcZ8b
 bfopT9t4VLAML3BabMg1c=; b=h+qHTaGqth0d60w03fjwcM3TjiBA9tXhCX84Do
 8hwAJvL8GffEa01LKHWyUuw+O9e8Yzl6mIdfrVR8o7m/7yW9qJV8y8R27rZjtYfQ
 4ROZVtB/GukAXVSfeATA5RN3R+yOWz3N6Tt8ZEKp8FixzQDQIK6Azo/oRUyH16KX
 PHqnA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4hf3Zj2qdNN; Wed,  7 Nov 2018 15:03:25 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 151B1411FD;
 Wed,  7 Nov 2018 15:03:25 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 7 Nov 2018 15:03:24 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895]) by
 T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895%14]) with mapi id
 15.01.0669.032; Wed, 7 Nov 2018 15:03:24 +0300
From: Alexander Soldatov <a.soldatov@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: LED colors in d-bus
Thread-Topic: LED colors in d-bus
Thread-Index: AQHUddZ9UjpxNsPM30OcOKXiS0PIgKVEN+if
Date: Wed, 7 Nov 2018 12:03:24 +0000
Message-ID: <1f1d5e90c70e4da681e59eba68b2a83f@yadro.com>
References: <db6eb8d5-5677-1356-1744-12cabf3911ed@yadro.com>
In-Reply-To: <db6eb8d5-5677-1356-1744-12cabf3911ed@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.4.87]
Content-Type: multipart/alternative;
 boundary="_000_1f1d5e90c70e4da681e59eba68b2a83fyadrocom_"
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 07 Nov 2018 12:03:30 -0000

--_000_1f1d5e90c70e4da681e59eba68b2a83fyadrocom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

  Hi all!

  There are some ideas for setting led color in DBus. Led nodes in DBus are=
 created by phosphor-led-sysfs. phosphor-led-sysfs is started by udev rule =
for the sysfs led. Suggestion is to add enviroment file (e.x. /etc/default/=
obmc/leds/led.conf), which contains colors for all system leds. The conf fi=
le could be look like:

COLOR_alarm_red =3D "Red"
COLOR_alarm_yel =3D "Yellow"
COLOR_heartbeat =3D "Green"
COLOR_id_blue =3D "Blue"
COLOR_power_red =3D "Red"


  phosphor-led-sysfs looks for led color in the enviroment variables and se=
ts led color.


  Regards,

  Alexnader Soldatov.

________________________________
=EF=D4: Alexander Amelkin
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 6 =CE=CF=D1=C2=D2=D1 2018 =C7. 16:41:57
=EB=CF=CD=D5: openbmc@lists.ozlabs.org
=EB=CF=D0=C9=D1: Alexander Soldatov; Vishwanatha Subbanna
=F4=C5=CD=C1: LED colors in d-bus


Hi all!

Since commit a1e70a7af by Vishwanatha Subbanna to phosphor-dbus-interfaces =
(see https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interface=
s/+/1136/ ), there is a property 'Color' for leds.

However, it looks like nothing is setting that property for any of the supp=
orted platforms. So any led always has it in d-bus set to Unknown.

It is unclear to us what was the intention for adding that property. It has=
 not been explained in the commit log for the commit. It is also unclear wh=
at could be the correct way to set that property. phosphor-led-manager oper=
ates on groups. A single led can be a part of multiple groups, so 'led.yaml=
' in phosphor-led-manager looks like a wrong place to attach a color proper=
ty to leds. Each leds used in led.yaml is called by the name taken from Lin=
ux devicetree. However, the bindings for leds in Linux devicetree do not im=
ply color information as well.

Are there any hints on how to set that property the right way? Can you imag=
ine any real use cases for the color property? Maybe we should just ditch i=
t completely? It's been 2 years since it has been introduced and nobody see=
ms to have cared...

Thanks.

Alexander.

--_000_1f1d5e90c70e4da681e59eba68b2a83fyadrocom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div>
<p>&nbsp; Hi all!<br>
</p>
<p>&nbsp; There are some ideas for setting led color in DBus. Led nodes in =
DBus are created by phosphor-led-sysfs.
<span>phosphor-led-sysfs is started by udev rule for the sysfs led. Suggest=
ion is to add enviroment file (e.x. /etc/default/obmc/leds/led.conf), which=
 contains colors for all system leds. The conf file could be look like:</sp=
an></p>
<p><span></span></p>
<div><br>
</div>
<div>COLOR_alarm_red =3D &quot;Red&quot;<br>
COLOR_alarm_yel =3D &quot;Yellow&quot;<br>
COLOR_heartbeat =3D &quot;Green&quot;<br>
COLOR_id_blue =3D &quot;Blue&quot;<br>
COLOR_power_red =3D &quot;Red&quot;</div>
<p><br>
</p>
&nbsp; <span>phosphor-led-sysfs</span> looks for led color in the enviromen=
t variables and sets led color.</div>
&nbsp; <br>
<p></p>
<p>&nbsp; Regards,</p>
<p>&nbsp; Alexnader Soldatov.<br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=EF=D4:</b> Alexander Amelkin<b=
r>
<b>=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF:</b> 6 =CE=CF=D1=C2=D2=D1 2018 =C7. 16:41=
:57<br>
<b>=EB=CF=CD=D5:</b> openbmc@lists.ozlabs.org<br>
<b>=EB=CF=D0=C9=D1:</b> Alexander Soldatov; Vishwanatha Subbanna<br>
<b>=F4=C5=CD=C1:</b> LED colors in d-bus</font>
<div>&nbsp;</div>
</div>
<div>
<p>Hi all!<br>
</p>
<p>Since commit a1e70a7af by <span><span role=3D"listitem" data-id=3D"10000=
14" title=3D"vishwa@linux.vnet.ibm.com Votable:
          Code-Review, Verified, Ok-To-Test" class=3D"com-google-gerrit-cli=
ent-change-ChangeScreen_BinderImpl_GenCss_style-label_user">Vishwanatha
 Subbanna</span></span> to phosphor-dbus-interfaces (see <a class=3D"moz-tx=
t-link-freetext" href=3D"https://gerrit.openbmc-project.xyz/#/c/openbmc/pho=
sphor-dbus-interfaces/&#43;/1136/">
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/&#4=
3;/1136/</a> ), there is a property 'Color' for leds.</p>
<p>However, it looks like nothing is setting that property for any of the s=
upported platforms. So any led always has it in d-bus set to Unknown.</p>
<p>It is unclear to us what was the intention for adding that property. It =
has not been explained in the commit log for the commit. It is also unclear=
 what could be the correct way to set that property. phosphor-led-manager o=
perates on groups. A single led
 can be a part of multiple groups, so 'led.yaml' in phosphor-led-manager lo=
oks like a wrong place to attach a color property to leds. Each leds used i=
n led.yaml is called by the name taken from Linux devicetree. However, the =
bindings for leds in Linux devicetree
 do not imply color information as well.</p>
<p>Are there any hints on how to set that property the right way? Can you i=
magine any real use cases for the color property? Maybe we should just ditc=
h it completely? It's been 2 years since it has been introduced and nobody =
seems to have cared...<br>
</p>
<p>Thanks.</p>
<p>Alexander.<br>
</p>
</div>
</body>
</html>

--_000_1f1d5e90c70e4da681e59eba68b2a83fyadrocom_--
