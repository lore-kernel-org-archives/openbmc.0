Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EnJNOPdp"; 
 dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pR3509lmzDrPw
 for <openbmc@lists.ozlabs.org>; Mon,  5 Nov 2018 19:40:48 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id a2-v6so2168892edi.5
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6s/b4SlZAVs7jbU9jCjjFRTYGcrH6kSIWbfkH2lsEk=;
 b=EnJNOPdp+wlthCHU40X7f/Dd/xXHHAw1q4pq5ApmwFrIfLK4UMXGwI7uPdbegpGTb4
 AtZb7drqxJ59yqHN0RDF+C3XAB+ZQs6SE+qFcOG96/WoJrpO/lFibo53FjmmDCZzD6rr
 W1cdB8csaI3jhL/F7IsucUHBUneJYeVrbJrehKdvwNHyH6lKegjLCpmamu9C6C79kA8/
 IVTrHjW4SoJ5GPqSxJAgb9CIWH2od0cQIO/9IMaJ09fC6vxVUxxou3WmDAHvXXq/oCmh
 b4m+q8+v9DY05C8yT+XtWXpgwMNLb7C9/DRzE20J2/JWIBB8HNOIHS87tFRDzrDqNbMa
 VSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6s/b4SlZAVs7jbU9jCjjFRTYGcrH6kSIWbfkH2lsEk=;
 b=afBxojtGHoXXAPZ8YvykKycUpX95aJohCBU530f8GPJRaWpC7OotrRvoYePp06qiec
 TOLFbLnQAGPL5OQzEww/JDHCMsyPcypO3H/TJNA45R6gkUPDBEouTxobZ3XUF47wrCr/
 j58K/CHduZmqVxBIhaLPCW+EwKt3PvZyg5celL9c3ObPfOyNU5Ro7989F1LXr1dQ3XZE
 VystheP85G8CxBne4ioCfiA9pveQfJ5Kj+q+rNt7IJsRACk8xwNB68tZWg8kbxkakVUs
 RvKCUkl73vh0WiVuogg6YSCvUo63DawOsE3uu9vBiMV+cP7USpy9n8/P3x4Kbl+6bVvr
 8Ctw==
X-Gm-Message-State: AGRZ1gJJ0WuRUegJyQmuN2DEyNuKToOZdebZ5+8JZbdM7EZV/5FPjDpP
 4scQyKjSVRzGr16CuygKvFfEeDRW2vKisqdu380=
X-Google-Smtp-Source: AJdET5e7HFE0ycflJb6yDBI+JxGkUCc12qhGpbhm/t1oQ6TdY4i8Cx3U4b3h6mHHFh6IDZEJzS6HK5Fb4VHrJ7+QScs=
X-Received: by 2002:a50:f53d:: with SMTP id
 t58-v6mr17330274edm.43.1541407245118; 
 Mon, 05 Nov 2018 00:40:45 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
 <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
In-Reply-To: <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 5 Nov 2018 14:10:26 +0530
Message-ID: <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: leetroy@gmail.com
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004cb1a60579e6d7ad"
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
X-List-Received-Date: Mon, 05 Nov 2018 08:40:50 -0000

--0000000000004cb1a60579e6d7ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No such service is available in root file system. The output of the command=
 *ls
/ -R | grep Hwmon  *is







*root@zaius:~# ls / -R | grep
Hwmon
xyz.openbmc_project.Hwmon@.service
system-xyz.openbmc_project.Hwmon.slice
/sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.slice:
system-xyz.openbmc_project.Hwmon.slice
/sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.slice:
root@zaius:~#*

On Mon, Nov 5, 2018 at 1:20 PM Troy Lee <leetroy@gmail.com> wrote:

> Your service path doesn't look right.
>
> According to:
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-bus
>
> It should be something like this:
>   xyz.openbmc_project.Hwmon-<hash>.Hwmon1
>
>
>
> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > I tried the command busctl --system introspect xyz.openbmc_project.Hwmo=
n@.service
> /xyz/openbmc_project/Sensors/temperature/ambient
> xyz.openbmc_project.sensor.Threshold.Warning | grep property and it outpu=
ts
> >
> > Failed to introspect object
> /xyz/openbmc_project/Sensors/temperature/ambient of service
> xyz.openbmc_project.Hwmon@.service: Invalid argument.
> >
> > I added the file
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2=
c@1e6e2000
> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
> following contents for dbus mapping.
> >
> > LABEL_temp1 =3D ambient
> > WARNLO_temp1=3D-40
> > WARNHI_temp1=3D125
> >
> > Whether this is correct or not?
> >
> > On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <emilyshaffer@google.com>
> wrote:
> >>
> >> Have you tried a dbus introspect to see if the sensor is coming across
> dbus correctly? There is a sample introspect command on the sensor howto,
> check out the busctl usage.
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> >>
> >> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:
> >>>
> >>> I added the sensor configuration to phosphor-host-ipmid's sensor
> configuration like.
> >>>
> >>> 0x12: &temperature
> >>>   sensorType: 0x01
> >>>   path: /xyz/openbmc_project/sensors/temperature/ambient
> >>>   sensorReadingType: 0x01
> >>>   multiplierM: 235
> >>>   offsetB: 0
> >>>   bExp: 0
> >>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
> >>>   scale: -3
> >>>   rExp: -3
> >>>   serviceInterface: org.freedesktop.DBus.Properties
> >>>   readingType: readingData
> >>>   interfaces:
> >>>     xyz.openbmc_project.Sensor.Value:
> >>>       Value:
> >>>         Offsets:
> >>>           0xFF:
> >>>             type: int64_t
> >>>
> >>>
> >>> When I run the command ipmitool -I dbus sdr elist full, it gives the
> following.
> >>>
> >>> ambient          | 12h | ns  |  0.0 | Disabled
> >>>
> >>> It is not giving the sensor reading and it is showing the sensor
> device is disabled.
> >>>
> >>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com>
> wrote:
> >>>>
> >>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com>
> wrote:
> >>>> >
> >>>> > Hi All,
> >>>> >
> >>>> > I built OpenBMC Linux using Zaius configuration and booted on BMC
> Aspeed AST-2500. The board we are using have one temperature sensor (Texa=
s
> Instruments TMP75) on I2C-12 interface.
> >>>> >
> >>>> > I added the file
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2=
c@1e6e2000
> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
> following contents.
> >>>> >
> >>>> > LABEL_temp1 =3D ambient
> >>>> > WARNLO_temp1=3D-40
> >>>> > WARNHI_temp1=3D125
> >>>> >
> >>>> > I added the following patch to the kernel file
> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
> >>>> >
> >>>> >  &i2c12 {
> >>>> > -    status =3D "disabled";
> >>>> > +    status =3D "okay";
> >>>> > +
> >>>> > +    tmp75@48 {
> >>>> > +        compatible =3D "ti,tmp75";
> >>>> > +        reg =3D <0x48>;
> >>>> > +    };
> >>>> > +
> >>>> >  };
> >>>> >
> >>>> > After booting Linux, the changes are reflected in
> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
> Also,
> >>>> > tmp78.conf is showing in
> /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90.
> >>>> >
> >>>> > when I am running the ipmitool command: ipmitool -I dbus sdr elist
> full it is not showing the temperature sensor and its reading.
> >>>> >
> >>>> > Please someone help to resolve the problem.
> >>>>
> >>>> You'll need to add the sensor configuration to the
> >>>> phosphor-host-ipmid's sensor configuration, see:
> >>>>
> >>>>
> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/r=
ecipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
> >>>>
> >>>> >
> >>>> >
> >>>> > Thanks and Regards,
> >>>> >
> >>>> > Akash
> >>>> >
>

--0000000000004cb1a60579e6d7ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>No such service is available in root=
 file system. The output of the command <i>ls / -R | grep Hwmon=C2=A0 </i>i=
s<i><br></i></div><div><br></div><div><i>root@zaius:~# ls / -R | grep Hwmon=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br><b>xyz.openbmc_project.Hw=
mon@.service=C2=A0=C2=A0=C2=A0=C2=A0</b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>system-=
xyz.openbmc_project.Hwmon.slice=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>/sys/fs/cgroup/s=
ystemd/system.slice/system-xyz.openbmc_project.Hwmon.slice:=C2=A0=C2=A0=C2=
=A0=C2=A0 <br>system-xyz.openbmc_project.Hwmon.slice=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <br>/sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:=C2=A0=C2=A0=C2=A0=C2=A0 <br>root@zaius:~#</i><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Nov 5, 2018 at 1:20 PM Troy=
 Lee &lt;<a href=3D"mailto:leetroy@gmail.com">leetroy@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Your service path doesn&#39;t l=
ook right.<br>
<br>
According to:<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/sensor-architecture.=
md#d-bus" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/d=
ocs/blob/master/sensor-architecture.md#d-bus</a><br>
<br>
It should be something like this:<br>
=C2=A0 xyz.openbmc_project.Hwmon-&lt;hash&gt;.Hwmon1<br>
<br>
<br>
<br>
Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:LeeTroy@gmail.com" target=3D"_=
blank">LeeTroy@gmail.com</a>&gt;<br>
AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akas=
hgj91@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; I tried the command busctl --system introspect xyz.openbmc_project.Hwm=
on@.service /xyz/openbmc_project/Sensors/temperature/ambient xyz.openbmc_pr=
oject.sensor.Threshold.Warning | grep property and it outputs<br>
&gt;<br>
&gt; Failed to introspect object /xyz/openbmc_project/Sensors/temperature/a=
mbient of service xyz.openbmc_project.Hwmon@.service: Invalid argument.<br>
&gt;<br>
&gt; I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/o=
bmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine configur=
ation directory with the following contents for dbus mapping.<br>
&gt;<br>
&gt; LABEL_temp1 =3D ambient<br>
&gt; WARNLO_temp1=3D-40<br>
&gt; WARNHI_temp1=3D125<br>
&gt;<br>
&gt; Whether this is correct or not?<br>
&gt;<br>
&gt; On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer &lt;<a href=3D"mailto:emi=
lyshaffer@google.com" target=3D"_blank">emilyshaffer@google.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; Have you tried a dbus introspect to see if the sensor is coming ac=
ross dbus correctly? There is a sample introspect command on the sensor how=
to, check out the busctl usage. <a href=3D"https://github.com/openbmc/docs/=
blob/master/sensor-architecture.md" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/openbmc/docs/blob/master/sensor-architecture.md</a><br>
&gt;&gt;<br>
&gt;&gt; On Fri, Nov 2, 2018, 3:21 AM AKASH G J &lt;<a href=3D"mailto:akash=
gj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I added the sensor configuration to phosphor-host-ipmid&#39;s =
sensor configuration like.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 0x12: &amp;temperature<br>
&gt;&gt;&gt;=C2=A0 =C2=A0sensorType: 0x01<br>
&gt;&gt;&gt;=C2=A0 =C2=A0path: /xyz/openbmc_project/sensors/temperature/amb=
ient<br>
&gt;&gt;&gt;=C2=A0 =C2=A0sensorReadingType: 0x01<br>
&gt;&gt;&gt;=C2=A0 =C2=A0multiplierM: 235<br>
&gt;&gt;&gt;=C2=A0 =C2=A0offsetB: 0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0bExp: 0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0unit: xyz.openbmc_project.Sensor.Value.Unit.Degree=
sC<br>
&gt;&gt;&gt;=C2=A0 =C2=A0scale: -3<br>
&gt;&gt;&gt;=C2=A0 =C2=A0rExp: -3<br>
&gt;&gt;&gt;=C2=A0 =C2=A0serviceInterface: org.freedesktop.DBus.Properties<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0readingType: readingData<br>
&gt;&gt;&gt;=C2=A0 =C2=A0interfaces:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0xyz.openbmc_project.Sensor.Value:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Value:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Offsets:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type: int64_t<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; When I run the command ipmitool -I dbus sdr elist full, it giv=
es the following.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ambient=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12h | ns=C2=A0 |=
=C2=A0 0.0 | Disabled<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It is not giving the sensor reading and it is showing the sens=
or device is disabled.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture &lt;<a href=3D=
"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wr=
ote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, Oct 30, 2018 at 10:13 PM AKASH G J &lt;<a href=3D"=
mailto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Hi All,<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; I built OpenBMC Linux using Zaius configuration and b=
ooted on BMC Aspeed AST-2500. The board we are using have one temperature s=
ensor (Texas Instruments TMP75) on I2C-12 interface.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; I added the file meta-zaius/recipes-phosphor/sensors/=
phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in=
 machine configuration directory with the following contents.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; LABEL_temp1 =3D ambient<br>
&gt;&gt;&gt;&gt; &gt; WARNLO_temp1=3D-40<br>
&gt;&gt;&gt;&gt; &gt; WARNHI_temp1=3D125<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; I added the following patch to the kernel file linux/=
arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;=C2=A0 &amp;i2c12 {<br>
&gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 status =3D &quot;disabled&quot;;<br>
&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 tmp75@48 {<br>
&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,=
tmp75&quot;;<br>
&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x48&gt;;<br=
>
&gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; After booting Linux, the changes are reflected in /sy=
s/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48. Also,=
<br>
&gt;&gt;&gt;&gt; &gt; tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/=
apb/i2c@1e78a000/i2c-bus@90.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; when I am running the ipmitool command: ipmitool -I d=
bus sdr elist full it is not showing the temperature sensor and its reading=
.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Please someone help to resolve the problem.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; You&#39;ll need to add the sensor configuration to the<br>
&gt;&gt;&gt;&gt; phosphor-host-ipmid&#39;s sensor configuration, see:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/master/=
meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-invento=
ry%25/config.yaml" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/=
phosphor-ipmi-sensor-inventory%25/config.yaml</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Thanks and Regards,<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Akash<br>
&gt;&gt;&gt;&gt; &gt;<br>
</blockquote></div></div>

--0000000000004cb1a60579e6d7ad--
