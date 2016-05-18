Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x242.google.com (mail-qg0-x242.google.com
 [IPv6:2607:f8b0:400d:c04::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8wBz0WzDzDqBR
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 23:33:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ljcUDWMD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=OA4gx3Sd; 
 dkim-atps=neutral
Received: by mail-qg0-x242.google.com with SMTP id f74so4155267qge.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=X8yLTAa9QyYQWi9PhwAo4GaaHqdykdthI07l+by0NVU=;
 b=ljcUDWMDDBsi3oS8WhCnxkSPLsNhS8AnXQWeeHE2W8ZoS3O+KQ/JO/KImE0k5qpdfX
 ULaRfR6znshWa2IYX9FZPyJDLRakCzq6rxNoX7NqUqhpl1YeKV7wbEBjDwg3uynTurgz
 ul49si/v/qWUZmjIskJvrf9b+es+DLcbCZmyJ+6dSBHKAcIXrCIcqF74LWj5CyxLDRtj
 wExwfakmvNLnEvs/Ai+BwFqh3UFPnKuXU0KhN5ey5q40/W7KQGhzl6i0JSlqSr+qb5Gn
 jj9QTYUrWoge5gw5FG9jlOMZ8S4P9F1i1VtPBBP6eTe6MBzysYiar6Bw+6N6n70T9+Im
 Yhag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=X8yLTAa9QyYQWi9PhwAo4GaaHqdykdthI07l+by0NVU=;
 b=OA4gx3SdnUQSBBfdNE84Z2lD+rBsMWh6GuEBm15s3ZrUQaNbY2gt1XfaeM3GRJg1gn
 8QWn6I/8zh0ijKaPWdSTotBmeer53rJ1wxTYrLLxIVUkT+QEVdhJOqGtj6rtGQbzY1ry
 TEeXyq2P9zG1OP3dqzGeL3g0Fpt3qDIH2BwAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=X8yLTAa9QyYQWi9PhwAo4GaaHqdykdthI07l+by0NVU=;
 b=GhCsFm/2QxihG3J/NpQDjc7ShGUusiBKOiyRi/PMH6k5SGQFquK9oWloJjrXdSQycl
 KU+OC6qxe9zKcFw0lz7HB6Xq4dRIkf3OfjMk+SJ2Fc+wxdy9xQ2/KAAwtYbuJ0itRYCZ
 3O2esK89rHs5mFX6D4hIqQBaRcVBV1cR+hxg2M2LIOC7tyuA+E/tqebBnMf8j57BNdFp
 dadE2GOFHGc9iTp4945AJaw4vmgx20Jg6JTickck4aYC/BTCblxyHuUXIaOUu3xpWGl/
 jrYLP+bLtpYDGAk3+O+K8XmTdP6ZpDHC6C2+/Ia+DJJM1Vcj5LESnUE2yDdxek/lyFzK
 DwkA==
X-Gm-Message-State: AOPr4FUmUi4VqlKwsBn19R/ZQNvBCrLczopS0bQkF2eVYxqjy4DOh2l9FDcvzPvcn9JJK4BcMjXb7yCXmOVMRw==
X-Received: by 10.140.102.108 with SMTP id v99mr7366164qge.27.1463578424779;
 Wed, 18 May 2016 06:33:44 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Wed, 18 May 2016 06:33:25 -0700 (PDT)
In-Reply-To: <1463513102-14135-3-git-send-email-clg@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 May 2016 23:03:25 +0930
X-Google-Sender-Auth: lAElyHIcAf5eJiQoF5soOTHA1Bc
Message-ID: <CACPK8XdKaan0TN38dhonHWs=mZhn=0=Oqw10Wcqg6h7J_4Xtzg@mail.gmail.com>
Subject: Re: [PATCH qemu 2/3] ast2400: add a rtc device on I2C bus 0
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 13:33:47 -0000

Hey Cedric,

On Wed, May 18, 2016 at 4:55 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
> a ds1338 instead.
>
> The aspeed-bmc-opp-palmetto dts file needs to be changed consequently
> with :
>
>         rtc@68 {
>                 compatible =3D "dallas,ds1338";
>                 reg =3D <0x68>;
>         };

Please see my comments for the tmp device.

How much does the register layout differ between the 1338 and the 3231?

Cheers,

Joel

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/ast2400.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 4576e67cd483..41bfc74493fa 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -159,6 +159,8 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
> +
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0=
x68);
>  }
>
>  static void ast2400_class_init(ObjectClass *oc, void *data)
> --
> 2.1.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
