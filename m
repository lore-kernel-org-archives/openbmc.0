Return-Path: <tyler.sabdon@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FgpCy9eW"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Kn3r5GXwzDqMd
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 22:46:32 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id 188so4345461itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 14 Mar 2019 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mm+Xn4Dv2y6/bWv2olmDZPuaC4R7VWP+ZN/UguQ8VP0=;
 b=FgpCy9eWH4QlenqeSSbZloDQ8eMCDF50XAAqDlX6gotSghPwymDqM0febB87Qa+4hR
 HfDfsrDFaj41le0wXoM1TU+BBhvDCrFaFfzKZo2Hw524iVdNgZkuVgyq1w6JMIzMrvrV
 jCym+zZjbRpvCx0fJ+OatAhEeGz5A4QI3/fITWaTqG8nR9F73vrs+ao507ImmWdhy9YY
 tXvuymEEwXWXoSMKSwvBxS8cg/z4WVzhcZT6AcdxDe3iGCiaWfrVJESMnRUK4CFXRTZ8
 F20h1VgOK1sUrkhZv1EQ81/J+z4/UuYoqa8xSMqMLe9EyGKfiAysv8UYHIjBY7IOCKyr
 q3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mm+Xn4Dv2y6/bWv2olmDZPuaC4R7VWP+ZN/UguQ8VP0=;
 b=otXeNYpDdVRXWNri4KPOFa6Sq5+ZkDyN/ggVdzuMYe1sk0bFhIRyHPnUU6TOJ5zMX9
 vG6tkmtT5ADO1CM8OQQ7RlXP7CtkYPPFRzr0iWWMRZhun6ioYt6QzlQ/wPSXGVTruAuy
 te0xDwfLvIwuQyc71JOazP9t2dIfqRYTcubDg/sxB0/WLyJDLrCBgljDOiV6EHhHJWFR
 AOPCDxCHWe0lPHj3L8ocG3mC3MJgn/bKn+fWZKP80YbzQrjtCjzFnmKklz5h6W1RKrh+
 cP6/p27Ot4lukA6z5CTTJ5T8TZUOJJDim1lV8zmWWoax7owPqNAL2VlZlbvO+lblHmBh
 4uYQ==
X-Gm-Message-State: APjAAAWB9O+O4FYKfNZ2tM/FPRwmLBScaqCvHCApvuc06Ha4M2FwNoaJ
 P98RGqqhlLpgakSTa9ltXqv+SPWfA06vniePVHw=
X-Google-Smtp-Source: APXvYqyHgxpBOjDsaaOmN1cMM0ro6pYkwGPHZ8Vk7GfbqZMlhrqT1FFgp98OvMl2QCTywJ0GwZQ4Lp+WC5/33Sn0rLI=
X-Received: by 2002:a02:6d12:: with SMTP id m18mr7683354jac.54.1552563985680; 
 Thu, 14 Mar 2019 04:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
 <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
 <CAJoAoZkLH8Bvsu8c1UNKdwhoxzJEGXcZ=GpdyrYt2wf_BTTWNg@mail.gmail.com>
 <CAO9PYR+t4BaVDA1+EHG9YXTf3MVd+2kf7LAiP1PcEwQvTgCgyA@mail.gmail.com>
 <CAJoAoZ=iZdB+HA1o9p1d3zgBaT9E93HpAos8PZ0fnXmcT3kJwQ@mail.gmail.com>
 <CAO9PYRLA6=1a9dsNPLj8zM5_xM9p=XUJ6gEe7-LbnFux_1+kkg@mail.gmail.com>
 <OF685C7ABC.91457B7F-ON002583B7.00595194-002583B7.005B0152@notes.na.collabserv.com>
In-Reply-To: <OF685C7ABC.91457B7F-ON002583B7.00595194-002583B7.005B0152@notes.na.collabserv.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 14 Mar 2019 19:46:14 +0800
Message-ID: <CAO9PYR+CdKS5sbhBiJjy2PXEGaczLymS=vvtegG4H6h+q048pg@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Milton Miller II <miltonm@us.ibm.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 venture@google.com, wangzhiqiang8906@gmail.com
Content-Type: multipart/alternative; boundary="000000000000db8f4905840c78dd"
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
X-List-Received-Date: Thu, 14 Mar 2019 11:46:34 -0000

--000000000000db8f4905840c78dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:
    Thank for your kindly reply and that really help me. I meat same
problem discussed before by Patrick and Qianlihu as below. I add

EXTRA_OECONF_append =3D " --enable-remove-from-dbus-on-fail" in hwmon
append, but it still not working. Hwmon monitor service still
terminated  after init() called exit(0). I also try add
"EXTRA_OECONF_append =3D " --enable-negative-errno-on-fail"" and still
not working.

What do I miss configuration or understand?

>* On my board,when host powed off, the fan would stop.
*>>* then,phosphor-hwmon failed to start
*>>* debug:
*>>* cat /sys/class/hwmon/hwmon0/fan1_input
*>*         read error Connection timedout.
*>>* edit the config file,
*>*         LABEL_fan1 =3D fan1
*>*         REMOVERCS =3D 110 // 110 means ETIMEDOUT
*>>* when host powerd on
*>*         1. echo add > /sys/class/hwmon/hwmon0/uevent
*>*         2. phosphor-hwmon started
*>*         3. host power off
*>*         4. phosphor-hwmon did not exit.
*>*         5. cpu usage of hwmon-read would be 4%
*>>* when host powerd off
*>*         1. echo add > /sys/class/hwmon/hwmon0/uevent
*>*         2. failed to start phosphor-hwmon.
*>>* I found when phosphor-hwmon init
*>>*    Sensor::addValue would read fan1_input(there is no fan1_fault in sy=
sfs),
*>*    and it caused read timedout unexpection.
*>>*    so init failed.
*>>* On my board,I  want to boot the bmc with phosphor-hwmon when host
powered off.
*>>* what should I do ?
*
You have a couple options, one will basically remove the sensor from
dbus on read failure, the other just leaves it but sets the value to
-errno (in this case ETIMEDOUT).

There are two configuration option switches for these, you can add it
to your bbappend:

EXTRA_OECONF_append =3D " --enable-remove-from-dbus-on-fail"


EXTRA_OECONF_append =3D " --enable-negative-errno-on-fail"

Milton Miller II <miltonm@us.ibm.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8812:34=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On  03/06/2019 around 11:36PM in some timezone,  Deng Tyler wrote:
>
> >Hi Emily
> >    I found it hardcoded in phosphor-hwmon for different sensor type.
> >I think that scale value may be customized for more flexible to fit
> >custom platform.
>
> Assuming that the sensor is exposed though a kernel sysfs hwmon
> file, you should be looking to specify a gain for the file in sysfs
> instead.
> Many sense devices already support a scale in the device tree.
>
> >
> >Tyler
> >Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:22=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >Tyler,
> >
> >Sorry that I forgot. Yes, the scale is hardcoded for certain sensor
> >types, ie voltage is always millivolts. I have asked about this
> >before but maybe someone else on the list can give a better answer
> >why that's the case.
> >
>
> The Linux kernel hwmon API specifies the units for different sensors
> as they are exposed in sysfs.  Hence the hwmon to dbus bridge can
> hard code the unit for a given type of sensor.
>
> The hwmon API is documented at
> https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
> or
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/hwmon/sysfs-interface
>
> The above spec is linked as "HWMon interface" under the headings
> "D-BUS" then "Path Definitions" headings in
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>
> milton
>
> Speaking for myself only.
>
>

--000000000000db8f4905840c78dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 Thank for your kindly reply and =
that really help me. I meat same problem discussed before by Patrick and <f=
ont color=3D"#000000"><span style=3D"white-space:pre-wrap">Qianlihu as belo=
w. I add </span></font></div><div><pre style=3D"white-space:pre-wrap;color:=
rgb(0,0,0)">EXTRA_OECONF_append =3D &quot; --enable-remove-from-dbus-on-fai=
l&quot; in hwmon append, but it still not working. Hwmon monitor service st=
ill terminated  after init() called exit(0). I also try add &quot;EXTRA_OEC=
ONF_append =3D &quot; --enable-negative-errno-on-fail&quot;&quot; and still=
 not working.</pre><pre style=3D"white-space:pre-wrap;color:rgb(0,0,0)">Wha=
t do I miss configuration or understand?</pre></div><pre style=3D"white-spa=
ce:pre-wrap;color:rgb(0,0,0)">&gt;<i> On my board,when host powed off, the =
fan would stop.
</i>&gt;<i>
</i>&gt;<i> then,phosphor-hwmon failed to start
</i>&gt;<i>
</i>&gt;<i> debug:
</i>&gt;<i>
</i>&gt;<i> cat /sys/class/hwmon/hwmon0/fan1_input
</i>&gt;<i>         read error Connection timedout.
</i>&gt;<i>
</i>&gt;<i> edit the config file,
</i>&gt;<i>         LABEL_fan1 =3D fan1
</i>&gt;<i>         REMOVERCS =3D 110 // 110 means ETIMEDOUT
</i>&gt;<i>
</i>&gt;<i> when host powerd on
</i>&gt;<i>         1. echo add &gt; /sys/class/hwmon/hwmon0/uevent
</i>&gt;<i>         2. phosphor-hwmon started
</i>&gt;<i>         3. host power off
</i>&gt;<i>         4. phosphor-hwmon did not exit.
</i>&gt;<i>         5. cpu usage of hwmon-read would be 4%
</i>&gt;<i>
</i>&gt;<i> when host powerd off
</i>&gt;<i>         1. echo add &gt; /sys/class/hwmon/hwmon0/uevent
</i>&gt;<i>         2. failed to start phosphor-hwmon.
</i>&gt;<i>
</i>&gt;<i> I found when phosphor-hwmon init
</i>&gt;<i>
</i>&gt;<i>    Sensor::addValue would read fan1_input(there is no fan1_faul=
t in sysfs),
</i>&gt;<i>    and it caused read timedout unexpection.
</i>&gt;<i>
</i>&gt;<i>    so init failed.
</i>&gt;<i>
</i>&gt;<i> On my board,I  want to boot the bmc with phosphor-hwmon when ho=
st powered off.
</i>&gt;<i>
</i>&gt;<i> what should I do ?
</i>
You have a couple options, one will basically remove the sensor from
dbus on read failure, the other just leaves it but sets the value to
-errno (in this case ETIMEDOUT).

There are two configuration option switches for these, you can add it
to your bbappend:

EXTRA_OECONF_append =3D &quot; --enable-remove-from-dbus-on-fail&quot;
=C2=A0</pre><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">EXTR=
A_OECONF_append =3D &quot; --enable-negative-errno-on-fail&quot;</span>=C2=
=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">Milton Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com">miltonm=
@us.ibm.com</a>&gt; =E6=96=BC 2019=E5=B9=B43=E6=9C=889=E6=97=A5 =E9=80=B1=
=E5=85=AD =E4=B8=8A=E5=8D=8812:34=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On=C2=A0 03/06/2019 around 11:=
36PM in some timezone,=C2=A0 Deng Tyler wrote:<br>
<br>
&gt;Hi Emily<br>
&gt;=C2=A0 =C2=A0 I found it hardcoded in phosphor-hwmon for different sens=
or type.<br>
&gt;I think that scale value may be customized for more flexible to fit<br>
&gt;custom platform. <br>
<br>
Assuming that the sensor is exposed though a kernel sysfs hwmon<br>
file, you should be looking to specify a gain for the file in sysfs instead=
.<br>
Many sense devices already support a scale in the device tree.<br>
<br>
&gt;<br>
&gt;Tyler<br>
&gt;Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D"=
_blank">emilyshaffer@google.com</a>&gt; =E6=96=BC 2019=E5=B9=B43=E6=9C=887=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=
=9A<br>
&gt;Tyler,<br>
&gt;<br>
&gt;Sorry that I forgot. Yes, the scale is hardcoded for certain sensor<br>
&gt;types, ie voltage is always millivolts. I have asked about this<br>
&gt;before but maybe someone else on the list can give a better answer<br>
&gt;why that&#39;s the case.<br>
&gt;<br>
<br>
The Linux kernel hwmon API specifies the units for different sensors<br>
as they are exposed in sysfs.=C2=A0 Hence the hwmon to dbus bridge can<br>
hard code the unit for a given type of sensor.<br>
<br>
The hwmon API is documented at <br>
<a href=3D"https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface" =
rel=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/Documentati=
on/hwmon/sysfs-interface</a><br>
or <br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/hwmon/sysfs-interface" rel=3D"noreferrer" target=3D"_=
blank">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/hwmon/sysfs-interface</a><br>
<br>
The above spec is linked as &quot;HWMon interface&quot; under the headings<=
br>
&quot;D-BUS&quot; then &quot;Path Definitions&quot; headings in<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/sensor-architecture.=
md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/docs/bl=
ob/master/sensor-architecture.md</a><br>
<br>
milton<br>
<br>
Speaking for myself only.<br>
<br>
</blockquote></div>

--000000000000db8f4905840c78dd--
