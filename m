Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12b; helo=mail-it1-x12b.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CtQZIM7A"; 
 dkim-atps=neutral
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42q07P5LTJzF35Q
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 17:31:29 +1100 (AEDT)
Received: by mail-it1-x12b.google.com with SMTP id t190-v6so10663471itb.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 22:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H0KZYgWID86CZve20TSY9DI0D18t3zkX5TJzdaw/zu4=;
 b=CtQZIM7AdGSRRYO0bbou+ybqxAt7lkfbBvu02BEhMlZ0+sHYg0oB4V6rwZjsoPYBBj
 AeCAWRwF+/Cj/6/e4oC/Ld/hrP2csXaBcPE5QjeYx6GVjMuP5LZPxoe2tiOnworM+e8f
 CcLLpmnD+miBEzqm9wNjtEOGdvaOTYYw3ODGEI9itFJBlS4PBWh2C6uhsPd90DaLRjGX
 Ag+eyi24XpvjvWhSoPBdH1aH5tJ/F+7VOYXHDVvuygUTqeoTgdzEZEMxavjghdG+HpYx
 VrDhlYeskS+815vpKNSQw3Kc4U7df1u8H/iO2QRjhOLojQq1QjwI6AuvnbbjyAOp5lGm
 kmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0KZYgWID86CZve20TSY9DI0D18t3zkX5TJzdaw/zu4=;
 b=NC+7uNDEDaF8EO3kxO1BAo9JX8A7eWV8eKE8f51DlEtpC2FcLiMrCFSzqOWoPBd0Bf
 M+ahMmotRsY9u+oyivBaOOyqOWuxsxX7r/TSVmKsKe/UvXB+dhHjT7qn0YNqlAyGnD7i
 HG9l41+exbTF8wQ2A8MpanBnB8fD74ZpuRVLRbvmOWUElb9X9RYhs6UrAZIlOJVgzqWl
 4VSo/6Bjl+4yXy2RYSe0ehGb1ZaYFwGzxF5Yu63/kw41BgrxqQtiE00IepmCgzDSCmlb
 DMdCu8hK9yBY2XyBdGjSSnP8gAKtbn3JB5AMBJQ4KFBqN975x15lLZtpTHVbAz77SNXg
 BgZQ==
X-Gm-Message-State: AGRZ1gKoZ3tEMXPtHov6QpLSliH5nGpR5HlVSQYg2LvzmYGg4hiAlydP
 CQM51pCFqEuVctL1bMh8uyThM5M97jze6qbULTeMiA==
X-Google-Smtp-Source: AJdET5cqLHVicpD5PPO9WVHrNKsn09uUSLafwGceMuErnpe2KBSNn/VNtNE8Cd0FEfWIGhpNt99Zuda6r6UcIOYFgZM=
X-Received: by 2002:a02:9f85:: with SMTP id a5-v6mr23237873jam.2.1541485886894; 
 Mon, 05 Nov 2018 22:31:26 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
 <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
 <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
 <CAN9Jwz32MtVCdXtfF-iJhEc6bHgbtddz6ETGQ1Sik-s2+_B3AA@mail.gmail.com>
In-Reply-To: <CAN9Jwz32MtVCdXtfF-iJhEc6bHgbtddz6ETGQ1Sik-s2+_B3AA@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 5 Nov 2018 22:30:59 -0800
Message-ID: <CAGMNF6WJiNJC0GMSb9PuC+HPvx+PjwwL2wqmcoLVMcUob0TtYQ@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: leetroy@gmail.com
Cc: akashgj91@gmail.com, Emily Shaffer <emilyshaffer@google.com>, 
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b75d350579f92670"
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
X-List-Received-Date: Tue, 06 Nov 2018 06:31:31 -0000

--000000000000b75d350579f92670
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 5, 2018 at 10:17 PM Troy Lee <leetroy@gmail.com> wrote:

> The *service* here doesn't relate to systemd service.
>
> It is the name on D-Bus.
> https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names
>
> Try this command to list all the services related to hwmon:
> # busctl --no-page list | grep -E "Hwmon1|PID"
>
> First column will be the service name.
>
> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > No such service is available in root file system. The output of the
> command ls / -R | grep Hwmon  is
> >
> > root@zaius:~# ls / -R | grep Hwmon
> > xyz.openbmc_project.Hwmon@.service
> > system-xyz.openbmc_project.Hwmon.slice
> >
> /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.slic=
e:
> > system-xyz.openbmc_project.Hwmon.slice
> >
> /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.slic=
e:
> > root@zaius:~#
> >
> > On Mon, Nov 5, 2018 at 1:20 PM Troy Lee <leetroy@gmail.com> wrote:
> >>
> >> Your service path doesn't look right.
> >>
> >> According to:
> >>
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-bus
> >>
> >> It should be something like this:
> >>   xyz.openbmc_project.Hwmon-<hash>.Hwmon1
> >>
> >>
> >>
> >> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
> >> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A
> >> >
> >> > I tried the command busctl --system introspect
> xyz.openbmc_project.Hwmon@.service
> /xyz/openbmc_project/Sensors/temperature/ambient
> xyz.openbmc_project.sensor.Threshold.Warning | grep property and it outpu=
ts
> >> >
> >> > Failed to introspect object
> /xyz/openbmc_project/Sensors/temperature/ambient of service
> xyz.openbmc_project.Hwmon@.service: Invalid argument.
> >> >
> >> > I added the file
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2=
c@1e6e2000
> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
> following contents for dbus mapping.
> >> >
> >> > LABEL_temp1 =3D ambient
> >> > WARNLO_temp1=3D-40
> >> > WARNHI_temp1=3D125
> >> >
> >> > Whether this is correct or not?
> >> >
> >> > On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <emilyshaffer@google.co=
m>
> wrote:
> >> >>
> >> >> Have you tried a dbus introspect to see if the sensor is coming
> across dbus correctly? There is a sample introspect command on the sensor
> howto, check out the busctl usage.
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
> >> >>
> >> >> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:
> >> >>>
> >> >>> I added the sensor configuration to phosphor-host-ipmid's sensor
> configuration like.
> >> >>>
> >> >>> 0x12: &temperature
> >> >>>   sensorType: 0x01
> >> >>>   path: /xyz/openbmc_project/sensors/temperature/ambient
> >> >>>   sensorReadingType: 0x01
> >> >>>   multiplierM: 235
> >> >>>   offsetB: 0
> >> >>>   bExp: 0
> >> >>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
> >> >>>   scale: -3
> >> >>>   rExp: -3
> >> >>>   serviceInterface: org.freedesktop.DBus.Properties
> >> >>>   readingType: readingData
> >> >>>   interfaces:
> >> >>>     xyz.openbmc_project.Sensor.Value:
> >> >>>       Value:
> >> >>>         Offsets:
> >> >>>           0xFF:
> >> >>>             type: int64_t
> >> >>>
> >> >>>
> >> >>> When I run the command ipmitool -I dbus sdr elist full, it gives
> the following.
> >> >>>
> >> >>> ambient          | 12h | ns  |  0.0 | Disabled
> >> >>>
> >> >>> It is not giving the sensor reading and it is showing the sensor
> device is disabled.
> >> >>>
> >> >>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.co=
m>
> wrote:
> >> >>>>
> >> >>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com>
> wrote:
> >> >>>> >
> >> >>>> > Hi All,
> >> >>>> >
> >> >>>> > I built OpenBMC Linux using Zaius configuration and booted on
> BMC Aspeed AST-2500. The board we are using have one temperature sensor
> (Texas Instruments TMP75) on I2C-12 interface.
> >> >>>> >
> >> >>>> > I added the file
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2=
c@1e6e2000
> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
> following contents.
> >> >>>> >
> >> >>>> > LABEL_temp1 =3D ambient
> >> >>>> > WARNLO_temp1=3D-40
> >> >>>> > WARNHI_temp1=3D125
> >> >>>> >
> >> >>>> > I added the following patch to the kernel file
> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
> >> >>>> >
> >> >>>> >  &i2c12 {
> >> >>>> > -    status =3D "disabled";
> >> >>>> > +    status =3D "okay";
> >> >>>> > +
> >> >>>> > +    tmp75@48 {
> >> >>>> > +        compatible =3D "ti,tmp75";
> >> >>>> > +        reg =3D <0x48>;
> >> >>>> > +    };
> >> >>>> > +
> >> >>>> >  };
> >> >>>> >
> >> >>>> > After booting Linux, the changes are reflected in
> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
> Also,
> >> >>>> > tmp78.conf is showing in
> /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90.
>

Besides what others suggested looks like you have a mismatch between your
device path and the path for the environment file. They need to have the
same path.

Steps to try:
1. Fix the path of your environment file to be
meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwon/ahb/apb/i2c@1=
e78a000
/i2c-bus@440/tmp75@48.conf
2. Make sure the hwmon sysfs interface shows up and temp1_input reads a
valid value
3. Play with busctl as others suggested and make sure the sensor value is
reported over DBus


> >> >>>> >
> >> >>>> > when I am running the ipmitool command: ipmitool -I dbus sdr
> elist full it is not showing the temperature sensor and its reading.
> >> >>>> >
> >> >>>> > Please someone help to resolve the problem.
> >> >>>>
> >> >>>> You'll need to add the sensor configuration to the
> >> >>>> phosphor-host-ipmid's sensor configuration, see:
> >> >>>>
> >> >>>>
> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/r=
ecipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
> >> >>>>
> >> >>>> >
> >> >>>> >
> >> >>>> > Thanks and Regards,
> >> >>>> >
> >> >>>> > Akash
> >> >>>> >
>


--=20
Regards,
Kun

--000000000000b75d350579f92670
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, No=
v 5, 2018 at 10:17 PM Troy Lee &lt;<a href=3D"mailto:leetroy@gmail.com">lee=
troy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The *=
service* here doesn&#39;t relate to systemd service.<br>
<br>
It is the name on D-Bus.<br>
<a href=3D"https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-hwmon=
#d-bus-bus-names</a><br>
<br>
Try this command to list all the services related to hwmon:<br>
# busctl --no-page list | grep -E &quot;Hwmon1|PID&quot;<br>
<br>
First column will be the service name.<br>
<br>
Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:LeeTroy@gmail.com" target=3D"_=
blank">LeeTroy@gmail.com</a>&gt;<br>
AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akas=
hgj91@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; No such service is available in root file system. The output of the co=
mmand ls / -R | grep Hwmon=C2=A0 is<br>
&gt;<br>
&gt; root@zaius:~# ls / -R | grep Hwmon<br>
&gt; xyz.openbmc_project.Hwmon@.service<br>
&gt; system-xyz.openbmc_project.Hwmon.slice<br>
&gt; /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:<br>
&gt; system-xyz.openbmc_project.Hwmon.slice<br>
&gt; /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.s=
lice:<br>
&gt; root@zaius:~#<br>
&gt;<br>
&gt; On Mon, Nov 5, 2018 at 1:20 PM Troy Lee &lt;<a href=3D"mailto:leetroy@=
gmail.com" target=3D"_blank">leetroy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Your service path doesn&#39;t look right.<br>
&gt;&gt;<br>
&gt;&gt; According to:<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/sensor-arch=
itecture.md#d-bus" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
openbmc/docs/blob/master/sensor-architecture.md#d-bus</a><br>
&gt;&gt;<br>
&gt;&gt; It should be something like this:<br>
&gt;&gt;=C2=A0 =C2=A0xyz.openbmc_project.Hwmon-&lt;hash&gt;.Hwmon1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yu-Ting Lee (Troy Lee) &lt;<a href=3D"mailto:LeeTroy@gmail.com" ta=
rget=3D"_blank">LeeTroy@gmail.com</a>&gt;<br>
&gt;&gt; AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_bl=
ank">akashgj91@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I tried the command busctl --system introspect xyz.openbmc_pr=
oject.Hwmon@.service /xyz/openbmc_project/Sensors/temperature/ambient xyz.o=
penbmc_project.sensor.Threshold.Warning | grep property and it outputs<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Failed to introspect object /xyz/openbmc_project/Sensors/temp=
erature/ambient of service xyz.openbmc_project.Hwmon@.service: Invalid argu=
ment.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I added the file meta-zaius/recipes-phosphor/sensors/phosphor=
-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine=
 configuration directory with the following contents for dbus mapping.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; LABEL_temp1 =3D ambient<br>
&gt;&gt; &gt; WARNLO_temp1=3D-40<br>
&gt;&gt; &gt; WARNHI_temp1=3D125<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Whether this is correct or not?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer &lt;<a href=3D"m=
ailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@google.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Have you tried a dbus introspect to see if the sensor is =
coming across dbus correctly? There is a sample introspect command on the s=
ensor howto, check out the busctl usage. <a href=3D"https://github.com/open=
bmc/docs/blob/master/sensor-architecture.md" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openbmc/docs/blob/master/sensor-architecture.md</=
a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Fri, Nov 2, 2018, 3:21 AM AKASH G J &lt;<a href=3D"mai=
lto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; I added the sensor configuration to phosphor-host-ipm=
id&#39;s sensor configuration like.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; 0x12: &amp;temperature<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0sensorType: 0x01<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0path: /xyz/openbmc_project/sensors/temper=
ature/ambient<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0sensorReadingType: 0x01<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0multiplierM: 235<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0offsetB: 0<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0bExp: 0<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0unit: xyz.openbmc_project.Sensor.Value.Un=
it.DegreesC<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0scale: -3<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0rExp: -3<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0serviceInterface: org.freedesktop.DBus.Pr=
operties<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0readingType: readingData<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0interfaces:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0xyz.openbmc_project.Sensor.Value:<=
br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Value:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Offsets:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF:<br>
&gt;&gt; &gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type: =
int64_t<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; When I run the command ipmitool -I dbus sdr elist ful=
l, it gives the following.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; ambient=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12h | ns=
=C2=A0 |=C2=A0 0.0 | Disabled<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; It is not giving the sensor reading and it is showing=
 the sensor device is disabled.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture &lt;<=
a href=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; On Tue, Oct 30, 2018 at 10:13 PM AKASH G J &lt;<a=
 href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com<=
/a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Hi All,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I built OpenBMC Linux using Zaius configurat=
ion and booted on BMC Aspeed AST-2500. The board we are using have one temp=
erature sensor (Texas Instruments TMP75) on I2C-12 interface.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I added the file meta-zaius/recipes-phosphor=
/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@4=
8.conf in machine configuration directory with the following contents.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; LABEL_temp1 =3D ambient<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; WARNLO_temp1=3D-40<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; WARNHI_temp1=3D125<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; I added the following patch to the kernel fi=
le linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;=C2=A0 &amp;i2c12 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; -=C2=A0 =C2=A0 status =3D &quot;disabled&quo=
t;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<=
br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 tmp75@48 {<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D =
&quot;ti,tmp75&quot;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x4=
8&gt;;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;=C2=A0 };<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; After booting Linux, the changes are reflect=
ed in /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@=
48. Also,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; tmp78.conf is showing in /etc/default/obmc/h=
wmon/ahb/apb/i2c@1e78a000/i2c-bus@90.<br></blockquote><div><br></div><div>B=
esides what others suggested looks like you have a mismatch between your de=
vice path and the path for the environment file. They need to have the same=
 path.<br></div><div><br></div><div>Steps to try:</div><div>1. Fix the path=
 of your environment file to be meta-zaius/recipes-phosphor/sensors/phospho=
r-hwmon%/obmc/hwon/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.conf=C2=A0</di=
v><div>2. Make sure the hwmon sysfs interface shows up and temp1_input read=
s a valid value</div><div>3. Play with busctl as others suggested and make =
sure the sensor value is reported over DBus</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; when I am running the ipmitool command: ipmi=
tool -I dbus sdr elist full it is not showing the temperature sensor and it=
s reading.<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Please someone help to resolve the problem.<=
br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; You&#39;ll need to add the sensor configuration t=
o the<br>
&gt;&gt; &gt;&gt;&gt;&gt; phosphor-host-ipmid&#39;s sensor configuration, s=
ee:<br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blo=
b/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-senso=
r-inventory%25/config.yaml" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosp=
hor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml</a><br>
&gt;&gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Thanks and Regards,<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt; Akash<br>
&gt;&gt; &gt;&gt;&gt;&gt; &gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div></div>

--000000000000b75d350579f92670--
