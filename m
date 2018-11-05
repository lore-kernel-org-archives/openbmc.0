Return-Path: <leetroy@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DaF7QolA"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pPxN3Fy0zDrPv
 for <openbmc@lists.ozlabs.org>; Mon,  5 Nov 2018 18:50:45 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id x63-v6so2927905oix.9
 for <openbmc@lists.ozlabs.org>; Sun, 04 Nov 2018 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zdwhVUksUhLo8lNAUFvSaKhPMKSRScBjiW8GXtMtNCU=;
 b=DaF7QolADn9RhkasKY8qQYvQb4JvvcKdHgb4pc35Y4y3+e8ns0v948/3TeoHqPqw7b
 ve8m7PBslscs+IghUgKUZz/pQ+dEJH6edK3mkjztkWKIxmWz8y38foI2Lrtg1vqM1o0A
 CPTorFl6pN6o+ouyWneyTYYp99t/mue/0J3gNL/zi1Q49A37K5VZ7+4JdM6A1OPUF7DA
 S8KXe0/cBIfhjmay9fAsph4ddrQj34o+lG3CQ9XOmU0+S5OojkHLqj6SXSUvPAYDSQ+u
 Y5ULKwVQxvsW6WhqC5vNyBQuO+/ZRH8n39uxAmA7yUsum0YgmWgxfJ1yh2U8j7IlMAhl
 ofJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zdwhVUksUhLo8lNAUFvSaKhPMKSRScBjiW8GXtMtNCU=;
 b=QH7jN9ZcuWOp1ykcV8rW35u7QJWWUSl5iSsWd+721x2/PD0xiOO8fJER/qDpyHDJhB
 MOuj5zgWAFE29Q0rsSAO8N9Tf0SDmhryVNpoAZE6hSZA3RcR2jqM3pb9ooPFjs7e92TW
 lMIYae+Z2tWtyRWo9TLrESK4X3E8hDmWILMXSc7LIhrI7KskhRyoRXGFMMNUYt3/towa
 GO+up/7DMRk7mzqO1vdo3/zCt/P+W+2yMGq+3zUJbMRYsQJyP95eYJ0qBk8kRp0ulRHy
 pKdkjFq3wWLfcZTt0+tGZvDZ7H9qDZOf5oHjomZkM74WcHA1sDLrHHUw6dfH/ZydwrFT
 jyWw==
X-Gm-Message-State: AGRZ1gJJ8osY8dvxxOJrLnz50zjNllPe1FrqiSEDGicZUsgCt/Uvo5M2
 KryzP44RmH1Ibqhx8FV9yfRwEV++7uI0xRA/wgE=
X-Google-Smtp-Source: AJdET5eYCDcgy0cH6CY85joW8HT2G6PFmCmEx3d7J9ExQnmwu1pDiZNq5XaSNApTCLu/FOfZVwmQrXIA1038BKmOfno=
X-Received: by 2002:aca:bbc5:: with SMTP id
 l188-v6mr12771551oif.340.1541404241356; 
 Sun, 04 Nov 2018 23:50:41 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
In-Reply-To: <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Mon, 5 Nov 2018 15:50:29 +0800
Message-ID: <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: akashgj91@gmail.com
Cc: emilyshaffer@google.com, venture@google.com, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 05 Nov 2018 07:50:49 -0000

Your service path doesn't look right.

According to:
https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-bus

It should be something like this:
  xyz.openbmc_project.Hwmon-<hash>.Hwmon1



Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> I tried the command busctl --system introspect xyz.openbmc_project.Hwmon@=
.service /xyz/openbmc_project/Sensors/temperature/ambient xyz.openbmc_proje=
ct.sensor.Threshold.Warning | grep property and it outputs
>
> Failed to introspect object /xyz/openbmc_project/Sensors/temperature/ambi=
ent of service xyz.openbmc_project.Hwmon@.service: Invalid argument.
>
> I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/obmc=
/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine configurati=
on directory with the following contents for dbus mapping.
>
> LABEL_temp1 =3D ambient
> WARNLO_temp1=3D-40
> WARNHI_temp1=3D125
>
> Whether this is correct or not?
>
> On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <emilyshaffer@google.com> wr=
ote:
>>
>> Have you tried a dbus introspect to see if the sensor is coming across d=
bus correctly? There is a sample introspect command on the sensor howto, ch=
eck out the busctl usage. https://github.com/openbmc/docs/blob/master/senso=
r-architecture.md
>>
>> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:
>>>
>>> I added the sensor configuration to phosphor-host-ipmid's sensor config=
uration like.
>>>
>>> 0x12: &temperature
>>>   sensorType: 0x01
>>>   path: /xyz/openbmc_project/sensors/temperature/ambient
>>>   sensorReadingType: 0x01
>>>   multiplierM: 235
>>>   offsetB: 0
>>>   bExp: 0
>>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
>>>   scale: -3
>>>   rExp: -3
>>>   serviceInterface: org.freedesktop.DBus.Properties
>>>   readingType: readingData
>>>   interfaces:
>>>     xyz.openbmc_project.Sensor.Value:
>>>       Value:
>>>         Offsets:
>>>           0xFF:
>>>             type: int64_t
>>>
>>>
>>> When I run the command ipmitool -I dbus sdr elist full, it gives the fo=
llowing.
>>>
>>> ambient          | 12h | ns  |  0.0 | Disabled
>>>
>>> It is not giving the sensor reading and it is showing the sensor device=
 is disabled.
>>>
>>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com> wr=
ote:
>>>>
>>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wrote=
:
>>>> >
>>>> > Hi All,
>>>> >
>>>> > I built OpenBMC Linux using Zaius configuration and booted on BMC As=
peed AST-2500. The board we are using have one temperature sensor (Texas In=
struments TMP75) on I2C-12 interface.
>>>> >
>>>> > I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%=
/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine config=
uration directory with the following contents.
>>>> >
>>>> > LABEL_temp1 =3D ambient
>>>> > WARNLO_temp1=3D-40
>>>> > WARNHI_temp1=3D125
>>>> >
>>>> > I added the following patch to the kernel file linux/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts.
>>>> >
>>>> >  &i2c12 {
>>>> > -    status =3D "disabled";
>>>> > +    status =3D "okay";
>>>> > +
>>>> > +    tmp75@48 {
>>>> > +        compatible =3D "ti,tmp75";
>>>> > +        reg =3D <0x48>;
>>>> > +    };
>>>> > +
>>>> >  };
>>>> >
>>>> > After booting Linux, the changes are reflected in /sys/firmware/devi=
cetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48. Also,
>>>> > tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a00=
0/i2c-bus@90.
>>>> >
>>>> > when I am running the ipmitool command: ipmitool -I dbus sdr elist f=
ull it is not showing the temperature sensor and its reading.
>>>> >
>>>> > Please someone help to resolve the problem.
>>>>
>>>> You'll need to add the sensor configuration to the
>>>> phosphor-host-ipmid's sensor configuration, see:
>>>>
>>>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-zaiu=
s/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>>>>
>>>> >
>>>> >
>>>> > Thanks and Regards,
>>>> >
>>>> > Akash
>>>> >
