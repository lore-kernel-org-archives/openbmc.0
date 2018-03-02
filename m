Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cuOJwbOC"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="R8UcB7us"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsr776wRPzF1n1
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 11:40:19 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id l206so10062167qke.1
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 16:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=A1IlZHMXGh7LvvTep9A1eap/U7qDVjernYkG8Dw7HRM=;
 b=cuOJwbOC8X9Da2z34nTJMsqoGGlvNoHBTB3nnNc+NNCIPiDWC8TNmSJx6ikg18ZKjg
 uOAFJYGfu0y8DnlhpKK4QCL5q8Y5U6tABNzrS+WL7quFVmUpeWp6oU1Lu3+B4KM5sPUu
 Sr1ep++aAMp2VvLtM0SeD0PZnXj7aFVnppJVzagW24Fuc7TGjXQ0zqWjTMYqRY0w7R3m
 Nek5zNxz8tx5QBrv4Y4z07p07vT/B5PNYbyWoRD9FJ6d8UM/glm0p4jVH1DeD5poewKv
 UHlhTAcckLKxEI52Uo99+PNVJ2lOfQc1L8DHyt+hAfrOAuwv6S61kA7wcn5Ho7ATLCXx
 4qNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=A1IlZHMXGh7LvvTep9A1eap/U7qDVjernYkG8Dw7HRM=;
 b=R8UcB7usmXh/BObMUoJvcaZab/5OHJ5ykqyPeYX5eVdXP1kX5UuwPnWz37taKEOSF0
 57pJX/hCAXUrFv5/ITPyDfLS7crfysDCuaTunauwsUQp7fcw5BrW4Rf9LXO9Vq5vdz7Q
 PX/bnCW80XMiAsnAQ1eRvywAZUAc5+HHniRbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=A1IlZHMXGh7LvvTep9A1eap/U7qDVjernYkG8Dw7HRM=;
 b=jeWPuuu7MY4/C7w9ARRKcsd5ZeVbiKgxXL5EK3gmdJHuq4YIbg0wORx7JHK5p4Uo1n
 HZBFY67K9YzqGU3ILutmLoKDWceyYT/2LwwuAGoXsx1WZpJKmLXyLtH0hu0L/Rql7Hda
 fSD8OOnmSR51mDAlxB7o6IXneTpBN7OJkn9QiFTu5cIltCM3BxOO3r7GYvpE1ZtFnHjW
 jkSUPrS/jhk6ItEXyJ3wrS2MnwUo4PSupI2cwhqi7F1CfBxVlop+vgz7aKA2R/Eo9r6u
 7XUPsnYc4R2SyDXh+61GfyQYHfxrQ3PmbVf2uVrlJTv7aPyaA62pkhoMq40Rk26DIxuI
 D8Qw==
X-Gm-Message-State: AElRT7F3JQJjReqAvn42OVhyqWiL0uukuEd4VAqt3tiJGp1sebBAPGM/
 tR9zFUr3SUULrp9lSy4VwAP7imDwkA0ySSdGg1Y=
X-Google-Smtp-Source: AG47ELuTteZF9GpXgd7O8WDw/p/lDhvi8gGWu5MMFe16hHhxgwzY8M9sYIesBdvfwLd6XQSjUGmWYJdnnGXC9SFkSA0=
X-Received: by 10.55.22.144 with SMTP id 16mr5510996qkw.11.1519951217226; Thu,
 01 Mar 2018 16:40:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Thu, 1 Mar 2018 16:39:56 -0800 (PST)
In-Reply-To: <1519944259-27898-2-git-send-email-eajames@linux.vnet.ibm.com>
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519944259-27898-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Mar 2018 11:09:56 +1030
X-Google-Sender-Auth: -tzLBUSLx3sq-muBJ5toiXQKP4Y
Message-ID: <CACPK8XcKZvvU27n575J+GQ=kAm3PONYqWCZwESEaxq5Ne0KP0Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 1/2] hwmon (occ): Remove temperature fault
 attribute and VRM temp alarm
To: Eddie James <eajames@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, spinler@linux.vnet.ibm.com, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2018 00:40:21 -0000

On Fri, Mar 2, 2018 at 9:14 AM, Eddie James <eajames@linux.vnet.ibm.com> wr=
ote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This removes the EAGAIN return for "sensor not ready" and the temperature
> fault and vrm temp alarms attributes.
>
> Apologies for pushing this up so early... Userspace applications aren't
> ready for this change. The hwmon polling application cannot accept EGAIN
> yet, and we can't be returning apparent errors if the sensor is
> temporarily unavailable.

Okay. Brad's email is from October 5th, 2017. That's 148 days ago.

Any ETA on when the userspace plans to get some love?

Cheers,

Joel


>
> Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>> userspace retries for a configurable period on eio, etimedout,
>> ebadmsg, eagain, and exnio.  It also exits cleanly on enoent.
>>
>> If any of these errnos don=E2=80=99t go away after the configured number=
 of retry
>> attempts, an error is logged.  Any other errnos and an error is logged
>> immediately. If this list needs improvement I=E2=80=99d love to hear abo=
ut it.
>>
>> ebadmsg and enxio are observed when i2c devices are unplugged with trans=
fers
>> in various stages of flight.  They occur just before the driver is unbou=
nd
>> after the presence gpio toggle on these devices is noticed and processed
>> (killing the hwmon userspace daemon cleanly).
>>
>> eio, etimedout seem to be bus type errors that appear somewhat infrequen=
tly,
>> but occur nevertheless.
>>
>> we all know what eagain means...
>>
>> It isn=E2=80=99t so much that the hwmon userspace doesn=E2=80=99t suppor=
t this change,
>> its just the resulting behavior difference at the other end of the
>> hwmon abi <-> dbus api translation is not optimal, right now.
>>
>> 1 - Without this change, the hwmon userspace reads a value of 0 out of
>> the sysfs attribute and happily reports that as the temp at the DBus lev=
el.
>>
>> With this change, the hwmon userspace would read the attribute, get an
>> error and retry for a bit.  After a number of retries, the error is
>> logged and the sensor is marked faulted at a dbus level.
>>
>> The issue is the consumer of the sensor at the dbus level.  Today, the
>> dbus consumer happens to translate the sensor value of zero into the
>> desired behavior.  If we submit this change the sensor will be put
>> into faulted state and the consuming application doesn=E2=80=99t have su=
pport
>> for that yet.
>>
>> We have open issues to enhance the application to support faulted sensor=
s,
>> its just not implemented yet.
>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/hwmon/occ/common.c | 33 +++------------------------------
>  1 file changed, 3 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 7c97a4c..a5c4df0 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -304,24 +304,11 @@ static ssize_t occ_show_temp_2(struct device *dev,
>                 val =3D get_unaligned_be32(&temp->sensor_id);
>                 break;
>         case 1:
> -               val =3D temp->value;
> -               if (val =3D=3D OCC_TEMP_SENSOR_FAULT)
> -                       return -EREMOTEIO;
> -
> -               if (temp->fru_type !=3D OCC_FRU_TYPE_VRM) {
> -                       /* sensor not ready */
> -                       if (val =3D=3D 0)
> -                               return -EAGAIN;
> -
> -                       val *=3D 1000;    /* millidegrees */
> -               }
> +               val =3D temp->value * 1000;
>                 break;
>         case 2:
>                 val =3D temp->fru_type;
>                 break;
> -       case 3:
> -               val =3D temp->value =3D=3D OCC_TEMP_SENSOR_FAULT;
> -               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -790,7 +777,7 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>                 num_attrs +=3D (sensors->temp.num_sensors * 2);
>                 break;
>         case 2:
> -               num_attrs +=3D (sensors->temp.num_sensors * 4);
> +               num_attrs +=3D (sensors->temp.num_sensors * 3);
>                 show_temp =3D occ_show_temp_2;
>                 break;
>         default:
> @@ -863,22 +850,13 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>
>         for (i =3D 0; i < sensors->temp.num_sensors; ++i) {
>                 s =3D i + 1;
> -               temp =3D ((struct temp_sensor_2 *)sensors->temp.data) + i=
;
>
>                 snprintf(attr->name, sizeof(attr->name), "temp%d_label", =
s);
>                 attr->sensor =3D OCC_INIT_ATTR(attr->name, 0444, show_tem=
p, NULL,
>                                              0, i);
>                 attr++;
>
> -               if (sensors->temp.version > 1 &&
> -                   temp->fru_type =3D=3D OCC_FRU_TYPE_VRM) {
> -                       snprintf(attr->name, sizeof(attr->name),
> -                                "temp%d_alarm", s);
> -               } else {
> -                       snprintf(attr->name, sizeof(attr->name),
> -                                "temp%d_input", s);
> -               }
> -
> +               snprintf(attr->name, sizeof(attr->name), "temp%d_input", =
s);
>                 attr->sensor =3D OCC_INIT_ATTR(attr->name, 0444, show_tem=
p, NULL,
>                                              1, i);
>                 attr++;
> @@ -890,11 +868,6 @@ static int occ_setup_sensor_attrs(struct occ *occ)
>                                                      show_temp, NULL, 2, =
i);
>                         attr++;
>
> -                       snprintf(attr->name, sizeof(attr->name),
> -                                "temp%d_fault", s);
> -                       attr->sensor =3D OCC_INIT_ATTR(attr->name, 0444,
> -                                                    show_temp, NULL, 3, =
i);
> -                       attr++;
>                 }
>         }
>
> --
> 1.8.3.1
>
