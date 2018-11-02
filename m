Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hF+dfkA8"; 
 dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mdNH2fZ2zF37g
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 21:19:26 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id d6-v6so1439762edi.2
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oEfVcJm3tRNXnQvmyx7CGiv/rq9u5j9FZwtkkanwMEs=;
 b=hF+dfkA8J3qBnhXmHjMyUQbQaVFCdp+7upuwX3N1udvG6QXlgV3twY8ecQglirznq3
 raNAcV8ICj50XlbxHThhhe9NOeNCrpKB+6yafAbB5ZF7mU2SuXfrQCvHVJhUjY55Jy4w
 KHiplgCNvpfSpSUlMyRQa7skHL1LydF+0cnT24DMbGE1J3BuRgZK2OtoBKOO0/jzNEFK
 RRPObyf7GHdUmmj9Gxq/AzNTf+TtNt0Hq+B0BAJ8enl564eVKUAPQKyJTw6yDceakJpK
 InLXgQRTzBy/ojEp0E7X1aFN6tPdhnbcqFEWINg9DFk0Ll1XhDkRiWNeXVYxLYVLp+/e
 N+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oEfVcJm3tRNXnQvmyx7CGiv/rq9u5j9FZwtkkanwMEs=;
 b=tQfDadZobigiZT0pn7O2gC8jFOl8MbZfncI4SRWWkfa5sGIz01l58O6wVFq7d3z/cf
 DoX9PGgESM8VeEQabMlIlw63mwoC1+5TSFYa1EDjD4dx5N2UzRaoycLR2q0YmU2c7PIO
 grJGpYoaK2gM0o0WXh1oStcRarm6sAHUtE8101SbMk8UQsUAyADQMPrMJ0SvtHzNJDYl
 fu1GsFW/GDAsMEI35pZ7rEiRZE/ABWp2Rj/dK2rl/O1z9bp6+3iZuq8ba6iZWevCqWuM
 9A6rLl/dJYOB/3F/XS3tI5o777QuQAlkwKTA9zzKZ3zSBV5b77oRtxfScmvyH8Nw76ey
 h4JQ==
X-Gm-Message-State: AGRZ1gKdDIt8+AoQPKXCHqr3KMsO6boR8oVUWPK4Ab6q5cfuSM9Wn8Q3
 hPAfW9jOmWgduB6xdZL1Cy4B8jITL1a7EOhASQg=
X-Google-Smtp-Source: AJdET5ezG1DIH3OKPKirkBcwRCgQiXGjfEynQIKO2K0lN2iBe5WvUM9tyPsAHlHrQdgv5xOzesRap0mpRi7rFekDGWU=
X-Received: by 2002:a50:9250:: with SMTP id
 j16-v6mr7908214eda.259.1541153963939; 
 Fri, 02 Nov 2018 03:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
In-Reply-To: <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
From: AKASH G J <akashgj91@gmail.com>
Date: Fri, 2 Nov 2018 15:49:05 +0530
Message-ID: <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: venture@google.com
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000909bb60579abdec3"
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
X-List-Received-Date: Fri, 02 Nov 2018 10:19:28 -0000

--000000000000909bb60579abdec3
Content-Type: text/plain; charset="UTF-8"

I added the sensor configuration to phosphor-host-ipmid's sensor
configuration like.


















*0x12: &temperature  sensorType: 0x01  path:
/xyz/openbmc_project/sensors/temperature/ambient  sensorReadingType: 0x01
multiplierM: 235  offsetB: 0  bExp: 0  unit:
xyz.openbmc_project.Sensor.Value.Unit.DegreesC  scale: -3  rExp: -3
serviceInterface: org.freedesktop.DBus.Properties  readingType:
readingData  interfaces:    xyz.openbmc_project.Sensor.Value:
Value:        Offsets:          0xFF:            type: int64_t*


When I run the command *ipmitool -I dbus sdr elist full*, it gives the
following.

*ambient          | 12h | ns  |  0.0 | Disabled*

It is not giving the sensor reading and it is showing the sensor device is
disabled.

On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com> wrote:

> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wrote:
> >
> > Hi All,
> >
> > I built OpenBMC Linux using Zaius configuration and booted on BMC Aspeed
> AST-2500. The board we are using have one temperature sensor (Texas
> Instruments TMP75) on I2C-12 interface.
> >
> > I added the file
> meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc/hwmon/ahb/apb/i2c@1e6e2000
> /i2c-bus@90/tmp75@48.conf in machine configuration directory with the
> following contents.
> >
> > LABEL_temp1 = ambient
> > WARNLO_temp1=-40
> > WARNHI_temp1=125
> >
> > I added the following patch to the kernel file
> linux/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts.
> >
> >  &i2c12 {
> > -    status = "disabled";
> > +    status = "okay";
> > +
> > +    tmp75@48 {
> > +        compatible = "ti,tmp75";
> > +        reg = <0x48>;
> > +    };
> > +
> >  };
> >
> > After booting Linux, the changes are reflected in
> /sys/firmware/devicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48.
> Also,
> > tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000
> /i2c-bus@90.
> >
> > when I am running the ipmitool command: ipmitool -I dbus sdr elist full
> it is not showing the temperature sensor and its reading.
> >
> > Please someone help to resolve the problem.
>
> You'll need to add the sensor configuration to the
> phosphor-host-ipmid's sensor configuration, see:
>
>
> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>
> >
> >
> > Thanks and Regards,
> >
> > Akash
> >
>

--000000000000909bb60579abdec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>I =
added the sensor configuration to phosphor-host-ipmid&#39;s sensor configur=
ation like.</div><div><br></div><div><i>0x12: &amp;temperature<br>=C2=A0 se=
nsorType: 0x01<br>=C2=A0 path: /xyz/openbmc_project/sensors/temperature/amb=
ient<br>=C2=A0 sensorReadingType: 0x01<br>=C2=A0 multiplierM: 235<br>=C2=A0=
 offsetB: 0<br>=C2=A0 bExp: 0<br>=C2=A0 unit: xyz.openbmc_project.Sensor.Va=
lue.Unit.DegreesC<br>=C2=A0 scale: -3<br>=C2=A0 rExp: -3<br>=C2=A0 serviceI=
nterface: org.freedesktop.DBus.Properties<br>=C2=A0 readingType: readingDat=
a<br>=C2=A0 interfaces:<br>=C2=A0=C2=A0=C2=A0 xyz.openbmc_project.Sensor.Va=
lue:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Value:<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Offsets:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0xFF:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type: int64_t</i></div><div><i><br></i></div><div><i><br></=
i></div><div>When I run the command <i>ipmitool -I dbus sdr elist full</i>,=
 it gives the following.</div><div><i><br></i></div><div><i>ambient=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12h | ns=C2=A0 |=C2=A0 0=
.0 | Disabled</i></div><div><i><br></i></div><div>It is not giving the sens=
or reading and it is showing the sensor device is disabled.<br></div></div>=
</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, N=
ov 1, 2018 at 11:28 PM Patrick Venture &lt;<a href=3D"mailto:venture@google=
.com">venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Tue, Oct 30, 2018 at 10:13 PM AKASH G J &lt;<a href=3D"mailto:akash=
gj91@gmail.com" target=3D"_blank">akashgj91@gmail.com</a>&gt; wrote:<br>
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

--000000000000909bb60579abdec3--
