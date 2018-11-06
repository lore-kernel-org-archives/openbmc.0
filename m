Return-Path: <leetroy@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=leetroy@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IMbCOYCJ"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42pzp50536zDsN0
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 17:16:28 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id f24so10419482otl.5
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 22:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OCUr+FLl47xyae/eYfWVRZL1zQIKpNkIVsBz52MfSRA=;
 b=IMbCOYCJZwlYk0d5LGYRN3GzNyW6+JgaLA/TOolJEN1q+4CJCCtiYvnsj2Ha33CFoP
 71vw568HSzSeF7WDCkcA5dI4uquQERByH8NoYZhtcf2/yVZfS+nRLmq4bEKj2Bf6FOhE
 si88fRn0o7bT6y2ReQomyfTvcGUm9TCyoooTAGYLK6H1krxYh7jQbee1Mr+nB3IXbkvJ
 vZKkEX7QXXhrL6KlMVwUVMOVHRbGK9LbG+fanESYAdsl3meK8CetGz/iQWsmrsmFbnaD
 kcCROT0Pf1pJdYCFdY9xgGL91JBo+CgrrP1s6+FsZulYCQA81VAhYa2f3fzoatFnKMwf
 jZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OCUr+FLl47xyae/eYfWVRZL1zQIKpNkIVsBz52MfSRA=;
 b=oXlc6391IwrNSX98tIyJ/X3lOjUhDH47z5V68E1/31yWgiMBqDvewGjoEM+lJ6WRoQ
 vRH8noHhPB5DkTMGRxY0+AlODSwT5KTiwgLu3goGSQ6Tq16FMIuO6M4SviykrUwhZxLw
 2Z2dJDWFKQa0/2NUwZYT0S1Cb8P/ruTNF1UBY9yoQw62b2DF/pE6YDxlbHxkXDXgQ+c2
 DC0+X37VgZ7R91NpJBWstYNVlFDAzAyhQoarvgia2QedXj+7X8+xNfWc+EodBZmgHksA
 WZZIkBUn4ToTXzadCt8DJ16/4xUHORm9lY5WBxFPE6vcqRjwBHgkgfytHT/wExvswest
 pvgQ==
X-Gm-Message-State: AGRZ1gKnFoEmIcONKTvOcMirjU84hS7IhIHGqwk/gGQPEhzAsdQuyDeX
 8HscXBL9gvvnH6KHBnrcFW0w0T4clTJb8EV+2n8D6yxTrcAj+g==
X-Google-Smtp-Source: AJdET5e8uYkDYE30e0sJj2dY+Zxt80zM6C/rpxbQb4cCeUBgJvUmbFIRxc1gRqg/oqe9MI9d0Y8300n8lZxRv4GYV5c=
X-Received: by 2002:a9d:49a0:: with SMTP id g32mr7572965otf.79.1541484986454; 
 Mon, 05 Nov 2018 22:16:26 -0800 (PST)
MIME-Version: 1.0
References: <CAE33tLEc5RU1yMv=zQt9hOqpZyBSZzyK0o1fcBpbAyUsBiekLw@mail.gmail.com>
 <CAO=notwyytBnoZtBwsdazN5qWz3jC6gJkFd61M+=6mLWmL5GYw@mail.gmail.com>
 <CAE33tLGStFhMOHRmFxOE-sGmZbnq3Gdj-oJu6a4nLDhmypmzVA@mail.gmail.com>
 <CAJoAoZkLVk-4ABqXW7A9=TcxLS-FipXRyj+RBep9H3UsQxMtFw@mail.gmail.com>
 <CAE33tLGG3B3gjbfJ9vjgR-UsSyLDTthDCONhZBfVHO7=J=jpDg@mail.gmail.com>
 <CAN9Jwz1AxDdHug-nKxdTfN=M0yF8v=Bf_6574PrwVY6ZrDZC-Q@mail.gmail.com>
 <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
In-Reply-To: <CAE33tLHDoGXi_Uf3tzDM1S-FZstjngPLDcbUG6SHGm-teXv62A@mail.gmail.com>
From: Troy Lee <leetroy@gmail.com>
Date: Tue, 6 Nov 2018 14:16:15 +0800
Message-ID: <CAN9Jwz32MtVCdXtfF-iJhEc6bHgbtddz6ETGQ1Sik-s2+_B3AA@mail.gmail.com>
Subject: Re: Temperature Sensor Reading not showing up.
To: AKASH G J <akashgj91@gmail.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Tue, 06 Nov 2018 06:16:30 -0000

The *service* here doesn't relate to systemd service.

It is the name on D-Bus.
https://github.com/openbmc/phosphor-hwmon#d-bus-bus-names

Try this command to list all the services related to hwmon:
# busctl --no-page list | grep -E "Hwmon1|PID"

First column will be the service name.

Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> No such service is available in root file system. The output of the comma=
nd ls / -R | grep Hwmon  is
>
> root@zaius:~# ls / -R | grep Hwmon
> xyz.openbmc_project.Hwmon@.service
> system-xyz.openbmc_project.Hwmon.slice
> /sys/fs/cgroup/systemd/system.slice/system-xyz.openbmc_project.Hwmon.slic=
e:
> system-xyz.openbmc_project.Hwmon.slice
> /sys/fs/cgroup/unified/system.slice/system-xyz.openbmc_project.Hwmon.slic=
e:
> root@zaius:~#
>
> On Mon, Nov 5, 2018 at 1:20 PM Troy Lee <leetroy@gmail.com> wrote:
>>
>> Your service path doesn't look right.
>>
>> According to:
>> https://github.com/openbmc/docs/blob/master/sensor-architecture.md#d-bus
>>
>> It should be something like this:
>>   xyz.openbmc_project.Hwmon-<hash>.Hwmon1
>>
>>
>>
>> Yu-Ting Lee (Troy Lee) <LeeTroy@gmail.com>
>> AKASH G J <akashgj91@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:55=E5=AF=AB=E9=81=93=EF=BC=9A
>> >
>> > I tried the command busctl --system introspect xyz.openbmc_project.Hwm=
on@.service /xyz/openbmc_project/Sensors/temperature/ambient xyz.openbmc_pr=
oject.sensor.Threshold.Warning | grep property and it outputs
>> >
>> > Failed to introspect object /xyz/openbmc_project/Sensors/temperature/a=
mbient of service xyz.openbmc_project.Hwmon@.service: Invalid argument.
>> >
>> > I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwmon%/o=
bmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine configur=
ation directory with the following contents for dbus mapping.
>> >
>> > LABEL_temp1 =3D ambient
>> > WARNLO_temp1=3D-40
>> > WARNHI_temp1=3D125
>> >
>> > Whether this is correct or not?
>> >
>> > On Fri, Nov 2, 2018 at 8:57 PM Emily Shaffer <emilyshaffer@google.com>=
 wrote:
>> >>
>> >> Have you tried a dbus introspect to see if the sensor is coming acros=
s dbus correctly? There is a sample introspect command on the sensor howto,=
 check out the busctl usage. https://github.com/openbmc/docs/blob/master/se=
nsor-architecture.md
>> >>
>> >> On Fri, Nov 2, 2018, 3:21 AM AKASH G J <akashgj91@gmail.com> wrote:
>> >>>
>> >>> I added the sensor configuration to phosphor-host-ipmid's sensor con=
figuration like.
>> >>>
>> >>> 0x12: &temperature
>> >>>   sensorType: 0x01
>> >>>   path: /xyz/openbmc_project/sensors/temperature/ambient
>> >>>   sensorReadingType: 0x01
>> >>>   multiplierM: 235
>> >>>   offsetB: 0
>> >>>   bExp: 0
>> >>>   unit: xyz.openbmc_project.Sensor.Value.Unit.DegreesC
>> >>>   scale: -3
>> >>>   rExp: -3
>> >>>   serviceInterface: org.freedesktop.DBus.Properties
>> >>>   readingType: readingData
>> >>>   interfaces:
>> >>>     xyz.openbmc_project.Sensor.Value:
>> >>>       Value:
>> >>>         Offsets:
>> >>>           0xFF:
>> >>>             type: int64_t
>> >>>
>> >>>
>> >>> When I run the command ipmitool -I dbus sdr elist full, it gives the=
 following.
>> >>>
>> >>> ambient          | 12h | ns  |  0.0 | Disabled
>> >>>
>> >>> It is not giving the sensor reading and it is showing the sensor dev=
ice is disabled.
>> >>>
>> >>> On Thu, Nov 1, 2018 at 11:28 PM Patrick Venture <venture@google.com>=
 wrote:
>> >>>>
>> >>>> On Tue, Oct 30, 2018 at 10:13 PM AKASH G J <akashgj91@gmail.com> wr=
ote:
>> >>>> >
>> >>>> > Hi All,
>> >>>> >
>> >>>> > I built OpenBMC Linux using Zaius configuration and booted on BMC=
 Aspeed AST-2500. The board we are using have one temperature sensor (Texas=
 Instruments TMP75) on I2C-12 interface.
>> >>>> >
>> >>>> > I added the file meta-zaius/recipes-phosphor/sensors/phosphor-hwm=
on%/obmc/hwmon/ahb/apb/i2c@1e6e2000/i2c-bus@90/tmp75@48.conf in machine con=
figuration directory with the following contents.
>> >>>> >
>> >>>> > LABEL_temp1 =3D ambient
>> >>>> > WARNLO_temp1=3D-40
>> >>>> > WARNHI_temp1=3D125
>> >>>> >
>> >>>> > I added the following patch to the kernel file linux/arch/arm/boo=
t/dts/aspeed-bmc-opp-zaius.dts.
>> >>>> >
>> >>>> >  &i2c12 {
>> >>>> > -    status =3D "disabled";
>> >>>> > +    status =3D "okay";
>> >>>> > +
>> >>>> > +    tmp75@48 {
>> >>>> > +        compatible =3D "ti,tmp75";
>> >>>> > +        reg =3D <0x48>;
>> >>>> > +    };
>> >>>> > +
>> >>>> >  };
>> >>>> >
>> >>>> > After booting Linux, the changes are reflected in /sys/firmware/d=
evicetree/base/ahb/apb/i2c@1e78a000/i2c-bus@440/tmp75@48. Also,
>> >>>> > tmp78.conf is showing in /etc/default/obmc/hwmon/ahb/apb/i2c@1e78=
a000/i2c-bus@90.
>> >>>> >
>> >>>> > when I am running the ipmitool command: ipmitool -I dbus sdr elis=
t full it is not showing the temperature sensor and its reading.
>> >>>> >
>> >>>> > Please someone help to resolve the problem.
>> >>>>
>> >>>> You'll need to add the sensor configuration to the
>> >>>> phosphor-host-ipmid's sensor configuration, see:
>> >>>>
>> >>>> https://github.com/openbmc/openbmc/blob/master/meta-ingrasys/meta-z=
aius/recipes-phosphor/ipmi/phosphor-ipmi-sensor-inventory%25/config.yaml
>> >>>>
>> >>>> >
>> >>>> >
>> >>>> > Thanks and Regards,
>> >>>> >
>> >>>> > Akash
>> >>>> >
