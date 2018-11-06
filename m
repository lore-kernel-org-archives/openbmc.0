Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjAVwOEQ"; 
 dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42q4cZ3RbGzF39w
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 20:53:34 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id a2-v6so5364214edi.5
 for <openbmc@lists.ozlabs.org>; Tue, 06 Nov 2018 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FuKlM/x1Xfq4q9xba8k6M9XAPm2Tnv86iWGMObIVUCw=;
 b=PjAVwOEQt7SpJFuHrA/NJam2eHEijUzTYRLhQW8HkwsP3R0rPfxipV115+aZtSj2S3
 8btSG+/630abw4wOnJ2Buyj/zHnYcoC3D61QbHUvR0RdkXqFNm7nMfjeOvf6JPrMMPgD
 Vtpa5f7tdlr2qw4Bzok1cdy/B5LK48gH8a+eQPejb7v5LEG5mE25bjTN3VM8R9tXtjfL
 qQxBa0fTl9Yd4vNt11hYZv9l79KkcpX9+VnJ0BjRndNw099vCLMbgW+oj/qzQeYbeMsG
 Gqi4uMxpImTrjbYrskPth/co9hGw/r1FTBJkDCzxd8nSxUpbJcMZ9L3fnXQ102oRq1rf
 lGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FuKlM/x1Xfq4q9xba8k6M9XAPm2Tnv86iWGMObIVUCw=;
 b=ViPjGkzZM3We4X3Iz6uWY5GwFqjVQw/28GvRod0ma52lKZIKWtxxU8CywiSicTIPmf
 U6RwrD/ELsQAnn3jdtl16ysJxM1dJVhv3DiNO6KzyGs9vkDkk5f7rotinh7mC4vlTrA1
 tEbh9SMtTVrQnb7+7Yjvz2AkG2HN/V8rZrrJ3RppIcHbzdkuEHTc1k0JSbGV1SLk7Lzu
 Yb8LMa9mzWxN2jtat5hOw/Fp4IDZrHmVJ/8g34Hs6ZiuutfGy6dA5g85johFO7qhD0Ez
 Y3SSn27jZjC/8lLOyld452zJl+tdf4RKymUCznEE5Lx9cc1rAjeG5PooIvPK4UiCI5uW
 otQA==
X-Gm-Message-State: AGRZ1gKBB91LCtT3a4rWTxqpGrzlG5w/sxSX+oI4OgcVVrfi9XbmigQj
 YE5Q/Fb95mBl4puh3TSkkluvk4v/8wWw0UA9XSA=
X-Google-Smtp-Source: AJdET5fMLSfK9Pinrenpjl77/yVunojBTpZUeMM1b7xAmQr+4fH2kpQDQ+543vAx6O6SVXkkQt+MDqhLPZB2M3VZrso=
X-Received: by 2002:a17:906:a4cf:: with SMTP id
 cc15-v6mr16608851ejb.157.1541498011452; 
 Tue, 06 Nov 2018 01:53:31 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
 <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
 <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
 <CAN9Jwz32MtVCdXtfF-iJhEc6bHgbtddz6ETGQ1Sik-s2+_B3AA@mail.gmail.com>
 <CAGMNF6WJiNJC0GMSb9PuC+HPvx+PjwwL2wqmcoLVMcUob0TtYQ@mail.gmail.com>
In-Reply-To: <CAGMNF6WJiNJC0GMSb9PuC+HPvx+PjwwL2wqmcoLVMcUob0TtYQ@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Tue, 6 Nov 2018 15:23:13 +0530
Message-ID: <CAE33tLEuF0DXJvdPxA1xfVTq4YuHZppOSShP71_vEBt_nsKxyw@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: kunyi@google.com
Cc: Troy Lee <leetroy@gmail.com>, Emily Shaffer <emilyshaffer@google.com>, 
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000006507fd0579fbf924"
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
X-List-Received-Date: Tue, 06 Nov 2018 09:53:35 -0000

--0000000000006507fd0579fbf924
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I corrected the path of the environment file to be
meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwon/ahb/apb/i2c@1=
e78a000
/i2c-bus@440/tmp75@48.conf.

Still temp1_input is not coming on the sysfs (/sys/class/hwmon/hwmon0)

On Tue, Nov 6, 2018 at 12:01 PM Kun Yi <kunyi@google.com> wrote:

>
> On Mon, Nov 5, 2018 at 10:17 PM Troy Lee <leetroy@gmail.com> wrote:
>
>> The *service* here doesn't relate to systemd service.
>>
>> It is the name on D-Bus.
>> https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names
>>
>> Try this command to list all the services related to hwmon:
>> # busctl --no-page list | grep -E "Hwmon1|PID"
>>
>> First column will be the service name.
>>
>> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A
>> >
>> > No such service is available in root file system. The output of the
>> command ls / -R | grep Hwmon  is
>> >
>> > root@zaius:~# ls / -R | grep Hwmon
>> > xyz.openbmc_project.Hwmon@.service
>> > system-xyz.openbmc_project.Hwmon.slice
>> >
>> /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.sli=
ce:
>> > system-xyz.openbmc_project.Hwmon.slice
>> >
>> /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.sli=
ce:
>> > root@zaius:~#
>> >
>> > On Mon, Nov 5, 2018 at 1:20 PM Troy Lee <leetroy@gmail.com> wrote:
>> >>
>> >> Your service path doesn't look right.
>> >>
>> >> According to:
>> >>
>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-bus
>> >>
>> >> It should be something like this:
>> >>   xyz.openbmc_project.Hwmon-<hash>.Hwmon1
>> >>
>> >>
>> >>
>> >> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>> >> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=
=9A
>> >> >
>> >> > I tried the command busctl --system introspect
>> xyz.openbmc_project.Hwmon@.service
>> /xyz/openbmc_project/Sensors/temperature/ambient
>> xyz.openbmc_project.sensor.Threshold.Warning | grep property and it outp=
uts
>> >> >
>> >> > Failed to introspect object
>> /xyz/openbmc_project/Sensors/temperature/ambient of service
>> xyz.openbmc_project.Hwmon@.service: Invalid argument.
>> >> >
>> >> > I added the file
>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i=
2c@1e6e2000
>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>> following contents for dbus mapping.
>> >> >
>> >> > LABEL_temp1 =3D ambient
>> >> > WARNLO_temp1=3D-40
>> >> > WARNHI_temp1=3D125
>> >> >
>> >> > Whether this is correct or not?
>> >> >
>> >> > On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <
>> emilyshaffer@google.com> wrote:
>> >> >>
>> >> >> Have you tried a dbus introspect to see if the sensor is coming
>> across dbus correctly? There is a sample introspect command on the senso=
r
>> howto, check out the busctl usage.
>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>> >> >>
>> >> >> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote=
:
>> >> >>>
>> >> >>> I added the sensor configuration to phosphor-host-ipmid's sensor
>> configuration like.
>> >> >>>
>> >> >>> 0x12: &temperature
>> >> >>>   sensorType: 0x01
>> >> >>>   path: /xyz/openbmc_project/sensors/temperature/ambient
>> >> >>>   sensorReadingType: 0x01
>> >> >>>   multiplierM: 235
>> >> >>>   offsetB: 0
>> >> >>>   bExp: 0
>> >> >>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
>> >> >>>   scale: -3
>> >> >>>   rExp: -3
>> >> >>>   serviceInterface: org.freedesktop.DBus.Properties
>> >> >>>   readingType: readingData
>> >> >>>   interfaces:
>> >> >>>     xyz.openbmc_project.Sensor.Value:
>> >> >>>       Value:
>> >> >>>         Offsets:
>> >> >>>           0xFF:
>> >> >>>             type: int64_t
>> >> >>>
>> >> >>>
>> >> >>> When I run the command ipmitool -I dbus sdr elist full, it gives
>> the following.
>> >> >>>
>> >> >>> ambient          | 12h | ns  |  0.0 | Disabled
>> >> >>>
>> >> >>> It is not giving the sensor reading and it is showing the sensor
>> device is disabled.
>> >> >>>
>> >> >>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <
>> venture@google.com> wrote:
>> >> >>>>
>> >> >>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com>
>> wrote:
>> >> >>>> >
>> >> >>>> > Hi All,
>> >> >>>> >
>> >> >>>> > I built OpenBMC Linux using Zaius configuration and booted on
>> BMC Aspeed AST-2500. The board we are using have one temperature sensor
>> (Texas Instruments TMP75) on I2C-12 interface.
>> >> >>>> >
>> >> >>>> > I added the file
>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i=
2c@1e6e2000
>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>> following contents.
>> >> >>>> >
>> >> >>>> > LABEL_temp1 =3D ambient
>> >> >>>> > WARNLO_temp1=3D-40
>> >> >>>> > WARNHI_temp1=3D125
>> >> >>>> >
>> >> >>>> > I added the following patch to the kernel file
>> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
>> >> >>>> >
>> >> >>>> >  &i2c12 {
>> >> >>>> > -    status =3D "disabled";
>> >> >>>> > +    status =3D "okay";
>> >> >>>> > +
>> >> >>>> > +    tmp75@48 {
>> >> >>>> > +        compatible =3D "ti,tmp75";
>> >> >>>> > +        reg =3D <0x48>;
>> >> >>>> > +    };
>> >> >>>> > +
>> >> >>>> >  };
>> >> >>>> >
>> >> >>>> > After booting Linux, the changes are reflected in
>> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
>> Also,
>> >> >>>> > tmp78.conf is showing in
>> /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@90.
>>
>
> Besides what others suggested looks like you have a mismatch between your
> device path and the path for the environment file. They need to have the
> same path.
>
> Steps to try:
> 1. Fix the path of your environment file to be
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwon/ahb/apb/i2c=
@1e78a000
> /i2c-bus@440/tmp75@48.conf
> 2. Make sure the hwmon sysfs interface shows up and temp1_input reads a
> valid value
> 3. Play with busctl as others suggested and make sure the sensor value is
> reported over DBus
>
>
>> >> >>>> >
>> >> >>>> > when I am running the ipmitool command: ipmitool -I dbus sdr
>> elist full it is not showing the temperature sensor and its reading.
>> >> >>>> >
>> >> >>>> > Please someone help to resolve the problem.
>> >> >>>>
>> >> >>>> You'll need to add the sensor configuration to the
>> >> >>>> phosphor-host-ipmid's sensor configuration, see:
>> >> >>>>
>> >> >>>>
>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/=
recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>> >> >>>>
>> >> >>>> >
>> >> >>>> >
>> >> >>>> > Thanks and Regards,
>> >> >>>> >
>> >> >>>> > Akash
>> >> >>>> >
>>
>
>
> --
> Regards,
> Kun
>

--0000000000006507fd0579fbf924
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I corrected the path of the environm=
ent file to be meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwo=
n/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.conf.</div><div><br></div><div>=
Still temp1_input is not coming on the sysfs (/sys/class/hwmon/hwmon0)<br><=
/div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, No=
v 6, 2018 at 12:01 PM Kun Yi &lt;<a href=3D"mailto:kunyi@google.com" target=
=3D"_blank">kunyi@google.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Mon, Nov 5, 2018 at 10:17 PM Troy Lee &lt;<a href=3D"mailto:leetroy@gmail=
.com" target=3D"_blank">leetroy@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">The *service* here doesn&#39;t relate to systemd serv=
ice.<br>
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
 class=3D"m_-4733956080620071153m_5375469761459664922gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div>=
</div></div>
</blockquote></div>

--0000000000006507fd0579fbf924--
