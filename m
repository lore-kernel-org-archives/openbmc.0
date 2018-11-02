Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UzB/t7OA"; 
 dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mmCY0JcbzF37D
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 02:27:19 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id y16so2415601qki.7
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1BzG6RfNHzLIJZkpQ65X+NuQxylR2PwmDVk8qP/kbmQ=;
 b=UzB/t7OAvbVken/+ZAiHuyMJ07OyDECFfvDAjhRACFbLMmVe2loU69SyDgTS7SxbCX
 qhz5RZt4b6w6xGpfl2z/riN65x5pyCNPAYUYl9aLACHJu8vrGO66vTYMYc7o6Cw/byAd
 mrSuy7ubQLfWpBFbQo6DEVW7PrLucEhIAyfGPcrnCdaiywpnqV4bgcgdH0ecTbcinOeB
 FnTeH6g12e7tXEjC79KnTyRQprywerXz0q/ihA6v7AoRJ3ObkcRjpqdHwN9NNUEKCnnf
 eaVbQ2qnogWt9mOatpBPRFiOHd+nk7iHQsNKw8hEq8iu7SMXoVC+anPsxcVvKVDWVVKE
 uzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1BzG6RfNHzLIJZkpQ65X+NuQxylR2PwmDVk8qP/kbmQ=;
 b=lGnmqPOF0H9Q4IqOUumS0eVG0PyacIE+vSpEdSXfIeIRy8zOrBIzjF3WpdYLqHYK9x
 TJ4jlVV26DwOrghXZARQR5dUVoMIbpTxivmG4NijUmEi9Ws16rzrchrm+i7Ksg5i8C/J
 aKGjxzJO3SmvTubqw5dHWORBtcH2j0/4tJmzwKs7n1vIEG1QoFBRatmsApMSStZ/6yLj
 O0viRfAB4up9Va+WrVf9m/ZHlBvrorJpRahPay8mF3v0V8WbzVGPllPIa5ugqAOaB9sS
 PIqNeGPnn+ByYXD8cxCEDSnFPaWsmm2UcirBVF/R0T5W1zjL+MK3F+M2/XFK6W6wkO8S
 6L8Q==
X-Gm-Message-State: AGRZ1gLfAvWRiWmmiKLxCgg4J7WEMorpmVRVANm4aBBJA9HWbnkfLcBQ
 ix2V7kkcFc+PQwupQsGnDbuKtU8Lpc+7pSrec7XmzQ==
X-Google-Smtp-Source: AJdET5ehAaMnJjI/3qR3v1EyeGFPuyHL+t4PL0PPg9boeGQnYeODH9Sa7vwjI23Ff2FoSmSxRTtb0YV9CrwztwbTisg=
X-Received: by 2002:ac8:50b:: with SMTP id
 u11-v6mr11245645qtg.366.1541172435664; 
 Fri, 02 Nov 2018 08:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
In-Reply-To: <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 2 Nov 2018 08:27:02 -0700
Message-ID: <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: AKASH G J <akashgj91@gmail.com>
Cc: openbmc@lists.ozlabs.org, venture@google.com
Content-Type: multipart/alternative; boundary="0000000000009338400579b02b6c"
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
X-List-Received-Date: Fri, 02 Nov 2018 15:27:22 -0000

--0000000000009338400579b02b6c
Content-Type: text/plain; charset="UTF-8"

Have you tried a dbus introspect to see if the sensor is coming across dbus
correctly? There is a sample introspect command on the sensor howto, check
out the busctl usage.
https://github.com/openbmc/docs/blob/master/sensor-architecture.md

On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:

> I added the sensor configuration to phosphor-host-ipmid's sensor
> configuration like.
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> *0x12: &temperature  sensorType: 0x01  path:
> /xyz/openbmc_project/sensors/temperature/ambient  sensorReadingType: 0x01
> multiplierM: 235  offsetB: 0  bExp: 0  unit:
> xyz.openbmc_project.Sensor.Value.Unit.DegreesC  scale: -3  rExp: -3
> serviceInterface: org.freedesktop.DBus.Properties  readingType:
> readingData  interfaces:    xyz.openbmc_project.Sensor.Value:
> Value:        Offsets:          0xFF:            type: int64_t*
>
>
> When I run the command *ipmitool -I dbus sdr elist full*, it gives the
> following.
>
> *ambient          | 12h | ns  |  0.0 | Disabled*
>
> It is not giving the sensor reading and it is showing the sensor device is
> disabled.
>
> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com>
> wrote:
>
>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wrote:
>> >
>> > Hi All,
>> >
>> > I built OpenBMC Linux using Zaius configuration and booted on BMC
>> Aspeed AST-2500. The board we are using have one temperature sensor (Texas
>> Instruments TMP75) on I2C-12 interface.
>> >
>> > I added the file
>> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000
>> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
>> following contents.
>> >
>> > LABEL_temp1 = ambient
>> > WARNLO_temp1=-40
>> > WARNHI_temp1=125
>> >
>> > I added the following patch to the kernel file
>> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
>> >
>> >  &i2c12 {
>> > -    status = "disabled";
>> > +    status = "okay";
>> > +
>> > +    tmp75@48 {
>> > +        compatible = "ti,tmp75";
>> > +        reg = <0x48>;
>> > +    };
>> > +
>> >  };
>> >
>> > After booting Linux, the changes are reflected in
>> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
>> Also,
>> > tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000
>> /i2c-bus@90.
>> >
>> > when I am running the ipmitool command: ipmitool -I dbus sdr elist full
>> it is not showing the temperature sensor and its reading.
>> >
>> > Please someone help to resolve the problem.
>>
>> You'll need to add the sensor configuration to the
>> phosphor-host-ipmid's sensor configuration, see:
>>
>>
>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>>
>> >
>> >
>> > Thanks and Regards,
>> >
>> > Akash
>> >
>>
>

--0000000000009338400579b02b6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Have you tried a dbus introspect to see if the sensor is coming across dbus=
 correctly? There is a sample introspect command on the sensor howto, check=
 out the busctl usage.=C2=A0<a href=3D"https://github.com/openbmc/docs/blob=
/master/sensor-architecture.md">https://github.com/openbmc/docs/blob/master=
/sensor-architecture.md</a><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Fri, Nov 2, 2018, 3:21 AM AKASH G J &lt;<a href=3D"mailto:akashgj91@=
gmail.com">akashgj91@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div>I added the sensor configuration to phosphor-host-ipmid&#39;s sens=
or configuration like.</div><div><br></div><div><i>0x12: &amp;temperature<b=
r>=C2=A0 sensorType: 0x01<br>=C2=A0 path: /xyz/openbmc_project/sensors/temp=
erature/ambient<br>=C2=A0 sensorReadingType: 0x01<br>=C2=A0 multiplierM: 23=
5<br>=C2=A0 offsetB: 0<br>=C2=A0 bExp: 0<br>=C2=A0 unit: xyz.openbmc_projec=
t.Sensor.Value.Unit.DegreesC<br>=C2=A0 scale: -3<br>=C2=A0 rExp: -3<br>=C2=
=A0 serviceInterface: org.freedesktop.DBus.Properties<br>=C2=A0 readingType=
: readingData<br>=C2=A0 interfaces:<br>=C2=A0=C2=A0=C2=A0 xyz.openbmc_proje=
ct.Sensor.Value:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value:<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Offsets:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0xFF:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 type: int64_t</i></div><div><i><br></i></div><d=
iv><i><br></i></div><div>When I run the command <i>ipmitool -I dbus sdr eli=
st full</i>, it gives the following.</div><div><i><br></i></div><div><i>amb=
ient=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12h | ns=C2=A0=
 |=C2=A0 0.0 | Disabled</i></div><div><i><br></i></div><div>It is not givin=
g the sensor reading and it is showing the sensor device is disabled.<br></=
div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture &lt;<a href=3D"mailto:vent=
ure@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Tue, Oct 30, 2018 at 10:13 PM AKASH G J=
 &lt;<a href=3D"mailto:akashgj91@gmail.com" target=3D"_blank">akashgj91@gma=
il.com</a>&gt; wrote:<br>
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

--0000000000009338400579b02b6c--
