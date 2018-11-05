Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eklpYouu"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pNhm2vGPzDrPv
 for <openbmc@lists.ozlabs.org>; Mon,  5 Nov 2018 17:54:47 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id y10-v6so39119edr.4
 for <openbmc@lists.ozlabs.org>; Sun, 04 Nov 2018 22:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pt3+gZacvJBp+Nboa+lMd1A3BnVcFs4ZTFl374I5b7I=;
 b=eklpYouuGN4jq+Wt/U8+LKkUAIOQvog/mZWl9LFn4OsHN5eMF0QPi27WpfHG6tMcq2
 UUM9molbNo7+3XW+kptUp/8u+nXS1Nwj8UVhxzAX7IjAscxUWAEmeDuLNojmNKHULmC7
 Gpra0CIKLukmGNM1ko0rByhtC3kAWm7rLxQQbV5FejEVXOXpp4hexsy6QIUFdCb5lq9w
 2QgLDUGq1hJK1lkty8lJhCpxkS/va0CZqzjeM23qojNKIfmdpfN2p4JNOsv7olLDuagO
 rI5XfpWK7VFsPyBFqyltavvi2LB4bkfOwjC/uPUVUeUtdJCUEh7hGKenvTuUMJlfU4nw
 PDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pt3+gZacvJBp+Nboa+lMd1A3BnVcFs4ZTFl374I5b7I=;
 b=Rj4k4D2fTJVirWzAQ9G6QUDTU+FWvfTau8oV+2jZtpb2FPHcZFqaRw7T6n0KvPvTu+
 JlDvrJKsGhAFcXOrj7QFGCWmyAsZDMj+3i5MznSjJeP3q2XsU0r5VKW6qdZQ/GdvNsPr
 P+L6Tk/PYI8renVambc5X7zheCREoDXzOgzIhKUIsbBx/Sa90R3uJtU7jkb7rQW4Q2ua
 VHUZCEEJ2NGRoFdPG0Z69DLLhMRCGV8afdiHntjk9tj85siMVDwzqifsohsmdGJkclb7
 54PmBRzHiRFE0JrQurzl86UUaWK7SMLlw88BZ2/Pcz8KscjvG69FpX8ixwB/8b9H10qT
 wZhA==
X-Gm-Message-State: AGRZ1gLvQMC8haduWkjNhBxTPKtVBm6YKLpSOOzCcdN/UQ9odidLnVhB
 UnaUDUmD+JQHv2WT86nlJNaPj2LeERKAOnHZ8IY=
X-Google-Smtp-Source: AJdET5cTZHdRwBqEco4ZYC8R1OjxJIYF8VqX3ok2Q0sXK1jGgoXItvz6dkR1I63EMdInA+Ywj8TW0pdeWQ3lEnc7rMw=
X-Received: by 2002:a50:ae8f:: with SMTP id
 e15-v6mr17038189edd.142.1541400884777; 
 Sun, 04 Nov 2018 22:54:44 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
In-Reply-To: <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 5 Nov 2018 12:24:26 +0530
Message-ID: <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: Emily Shaffer <emilyshaffer@google.com>
Cc: openbmc@lists.ozlabs.org, Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="0000000000003197790579e55cc4"
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
X-List-Received-Date: Mon, 05 Nov 2018 06:54:49 -0000

--0000000000003197790579e55cc4
Content-Type: text/plain; charset="UTF-8"

I tried the command *busctl --system introspect
xyz.openbmc_project.Hwmon@.service
/xyz/openbmc_project/Sensors/temperature/ambient
xyz.openbmc_project.sensor.Threshold.Warning | grep property *and it outputs

*Failed to introspect object
/xyz/openbmc_project/Sensors/temperature/ambient of service
xyz.openbmc_project.Hwmon@.service: Invalid argument.*

I added the file
*meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf*
in machine configuration directory with the following contents for dbus
mapping.



*LABEL_temp1 = ambientWARNLO_temp1=-40WARNHI_temp1=125*


*Whether this is correct or not?*

On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <emilyshaffer@google.com>
wrote:

> Have you tried a dbus introspect to see if the sensor is coming across
> dbus correctly? There is a sample introspect command on the sensor howto,
> check out the busctl usage.
> https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>
> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:
>
>> I added the sensor configuration to phosphor-host-ipmid's sensor
>> configuration like.
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> *0x12: &temperature  sensorType: 0x01  path:
>> /xyz/openbmc_project/sensors/temperature/ambient  sensorReadingType: 0x01
>> multiplierM: 235  offsetB: 0  bExp: 0  unit:
>> xyz.openbmc_project.Sensor.Value.Unit.DegreesC  scale: -3  rExp: -3
>> serviceInterface: org.freedesktop.DBus.Properties  readingType:
>> readingData  interfaces:    xyz.openbmc_project.Sensor.Value:
>> Value:        Offsets:          0xFF:            type: int64_t*
>>
>>
>> When I run the command *ipmitool -I dbus sdr elist full*, it gives the
>> following.
>>
>> *ambient          | 12h | ns  |  0.0 | Disabled*
>>
>> It is not giving the sensor reading and it is showing the sensor device
>> is disabled.
>>
>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com>
>> wrote:
>>
>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wrote:
>>> >
>>> > Hi All,
>>> >
>>> > I built OpenBMC Linux using Zaius configuration and booted on BMC
>>> Aspeed AST-2500. The board we are using have one temperature sensor (Texas
>>> Instruments TMP75) on I2C-12 interface.
>>> >
>>> > I added the file
>>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000
>>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>>> following contents.
>>> >
>>> > LABEL_temp1 = ambient
>>> > WARNLO_temp1=-40
>>> > WARNHI_temp1=125
>>> >
>>> > I added the following patch to the kernel file
>>> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
>>> >
>>> >  &i2c12 {
>>> > -    status = "disabled";
>>> > +    status = "okay";
>>> > +
>>> > +    tmp75@48 {
>>> > +        compatible = "ti,tmp75";
>>> > +        reg = <0x48>;
>>> > +    };
>>> > +
>>> >  };
>>> >
>>> > After booting Linux, the changes are reflected in
>>> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
>>> Also,
>>> > tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000
>>> /i2c-bus@90.
>>> >
>>> > when I am running the ipmitool command: ipmitool -I dbus sdr elist
>>> full it is not showing the temperature sensor and its reading.
>>> >
>>> > Please someone help to resolve the problem.
>>>
>>> You'll need to add the sensor configuration to the
>>> phosphor-host-ipmid's sensor configuration, see:
>>>
>>>
>>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>>>
>>> >
>>> >
>>> > Thanks and Regards,
>>> >
>>> > Akash
>>> >
>>>
>>

--0000000000003197790579e55cc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I tried the command <i>b=
usctl --system introspect xyz.openbmc_project.Hwmon@.service /xyz/openbmc_p=
roject/Sensors/temperature/ambient xyz.openbmc_project.sensor.Threshold.War=
ning | grep property </i>and it outputs</div><div dir=3D"ltr"><i><br></i></=
div><div dir=3D"ltr"><i>Failed to introspect object /xyz/openbmc_project/Se=
nsors/temperature/ambient of service xyz.openbmc_project.Hwmon@.service: In=
valid argument.</i></div><div><br></div><div>I added the file <i>meta-zaius=
/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i=
2c-bus@90/tmp75@48.conf</i> in machine configuration directory with the fol=
lowing contents for dbus mapping.<br><i><br>LABEL_temp1 =3D ambient<br>WARN=
LO_temp1=3D-40<br>WARNHI_temp1=3D125</i></div><div><i><br></i></div><div><i=
>Whether this is correct or not?<br></i></div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer=
 &lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank">emilyshaf=
fer@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Have =
you tried a dbus introspect to see if the sensor is coming across dbus corr=
ectly? There is a sample introspect command on the sensor howto, check out =
the busctl usage.=C2=A0<a href=3D"https://github.com/openbmc/docs/blob/mast=
er/sensor-architecture.md" target=3D"_blank">https://github.com/openbmc/doc=
s/blob/master/sensor-architecture.md</a><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Fri, Nov 2, 2018, 3:21 AM AKASH G J &lt;<a href=3D"mail=
to:akashgj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div>I added the sensor configuration to=
 phosphor-host-ipmid&#39;s sensor configuration like.</div><div><br></div><=
div><i>0x12: &amp;temperature<br>=C2=A0 sensorType: 0x01<br>=C2=A0 path: /x=
yz/openbmc_project/sensors/temperature/ambient<br>=C2=A0 sensorReadingType:=
 0x01<br>=C2=A0 multiplierM: 235<br>=C2=A0 offsetB: 0<br>=C2=A0 bExp: 0<br>=
=C2=A0 unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC<br>=C2=A0 scale=
: -3<br>=C2=A0 rExp: -3<br>=C2=A0 serviceInterface: org.freedesktop.DBus.Pr=
operties<br>=C2=A0 readingType: readingData<br>=C2=A0 interfaces:<br>=C2=A0=
=C2=A0=C2=A0 xyz.openbmc_project.Sensor.Value:<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Value:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Offsets:<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xFF:<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: int64_t</i></d=
iv><div><i><br></i></div><div><i><br></i></div><div>When I run the command =
<i>ipmitool -I dbus sdr elist full</i>, it gives the following.</div><div><=
i><br></i></div><div><i>ambient=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 12h | ns=C2=A0 |=C2=A0 0.0 | Disabled</i></div><div><i><br><=
/i></div><div>It is not giving the sensor reading and it is showing the sen=
sor device is disabled.<br></div></div></div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Thu, Nov 1, 2018 at 11:28 PM Patrick Ventu=
re &lt;<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@goog=
le.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Oct 3=
0, 2018 at 10:13 PM AKASH G J &lt;<a href=3D"mailto:akashgj91@gmail.com" ta=
rget=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi All,<br>
&gt;<br>
&gt; I built OpenBMC Linux using Zaius configuration and booted on BMC Aspe=
ed AST-2500. The board we are using have one temperature sensor (Texas Inst=
ruments TMP75) on I2C-12 interface.<br>
&gt;<br>
&gt; I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/o=
bmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine configur=
ation directory with the following contents.<br>
&gt;<br>
&gt; LABEL_temp1 =3D ambient<br>
&gt; WARNLO_temp1=3D-40<br>
&gt; WARNHI_temp1=3D125<br>
&gt;<br>
&gt; I added the following patch to the kernel file linux/arch/arm/boot/dts=
/aspeed-bmc-opp-zaius.dts.<br>
&gt;<br>
&gt;=C2=A0 &amp;i2c12 {<br>
&gt; -=C2=A0 =C2=A0 status =3D &quot;disabled&quot;;<br>
&gt; +=C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tmp75@48 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;ti,tmp75&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x48&gt;;<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; After booting Linux, the changes are reflected in /sys/firmware/device=
tree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48. Also,<br>
&gt; tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/=
i2c-bus@90.<br>
&gt;<br>
&gt; when I am running the ipmitool command: ipmitool -I dbus sdr elist ful=
l it is not showing the temperature sensor and its reading.<br>
&gt;<br>
&gt; Please someone help to resolve the problem.<br>
<br>
You&#39;ll need to add the sensor configuration to the<br>
phosphor-host-ipmid&#39;s sensor configuration, see:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/met=
a-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/b=
lob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sen=
sor-inventory%25/config.yaml</a><br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks and Regards,<br>
&gt;<br>
&gt; Akash<br>
&gt;<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--0000000000003197790579e55cc4--
