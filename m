Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x242.google.com (mail-qg0-x242.google.com
 [IPv6:2607:f8b0:400d:c04::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8w6b4CVPzDqBR
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 23:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aFKPMTmS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Tthne69h; 
 dkim-atps=neutral
Received: by mail-qg0-x242.google.com with SMTP id b14so4147548qge.2
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Wre4TMtcMHOGjI1iYZ3xbM3feWeeQBvgcUcFlAjFkRQ=;
 b=aFKPMTmSQ0TltJMH1DGmFTfK2/78idQbVs6CvGBD+/qJbWVD0M7WAiRXBi/VpnzNXT
 7dzBDv5Y1GhZx8ZrzXuIdHJOxDyeY7nC5fb/4JB1OZAkrrHhn7hwEjvDUA+soCXmwN9j
 R1vKll1DMBv/q0+xMqQHZsMDTc9FUReQzaSlOIb4LcdPKwHKN9FKhJbJJFqVqGQSklJq
 18lsnRzN8+7BdUxBpg9gx/MNcQDm2YEYsMdhi9uFOqJ5kquztlwfnXVYTDhT/TRHgxLD
 0yRMBbsmF7nxlZPNOx66WPFuUkZTuzSWWTXK7u/kvTTGsjLO3QvXvNAr/Z9nCSpVjWYp
 tXvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Wre4TMtcMHOGjI1iYZ3xbM3feWeeQBvgcUcFlAjFkRQ=;
 b=Tthne69hGQKYjKZNVZ8kHceWau98u2EsUsqX2bj731kVKkJE1BXKYnps1Vt7p/SaFi
 cgZnbaT2sn9wNm7awW3VakFi+4HvvgF27xUkYawTakPltpCigJiypv9Qp2a/hOUXfeTx
 CWzJH+cBd6wXtUUdugEkfuhe4wwYm8CFztCD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Wre4TMtcMHOGjI1iYZ3xbM3feWeeQBvgcUcFlAjFkRQ=;
 b=cDqsN2y8chZqwhxiowxa0g9oEPYCA2SM2pIcw7MN9odVAJ5LVa11+IqtDRQfbwtn4G
 8OHONm6FWt6WdUo7P1YrtEhGkWFTFSNonRBYf0ibCRx3eafKcl5ljiMeyoJedfVh+DOo
 ZWSFAXzD4XcDjq+0l4q5k2mRaPKsxD9yNm8E51Fy0dqI/7Xmgq5657tlTpPRMYKl0czL
 oFL9wedZQ5rucKp3epT717lfVdvac4C1jv7oyywh/PxdkGbByL8enmAHZAmEYxbarsot
 szSL78oVtvEXy9bZfj9caU9gbYcJJmBy1EYz/RkeSF2StYtcFdjbhahajIfEXhqPDmkb
 qZ2w==
X-Gm-Message-State: AOPr4FVDcUSi7cj+fhdYKogbqXSMasKr9peRxOnb+jprhiQFJqR+dXTyW8Ntj2hX/+C+REC1tjVmy3X2RrTL2g==
X-Received: by 10.140.248.84 with SMTP id t81mr7869728qhc.94.1463578196928;
 Wed, 18 May 2016 06:29:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Wed, 18 May 2016 06:29:37 -0700 (PDT)
In-Reply-To: <1463513102-14135-4-git-send-email-clg@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 May 2016 22:59:37 +0930
X-Google-Sender-Auth: nEsdA9iMkeHpSljak-k5IT7jEXM
Message-ID: <CACPK8XdhpRLh2Gg7eOgUKRfDYkt0zZCQ26bvfyy9=GB5X-TGfg@mail.gmail.com>
Subject: Re: [PATCH qemu 3/3] ast2400: add a temp sensor device on I2C bus 3
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
X-List-Received-Date: Wed, 18 May 2016 13:30:00 -0000

Hey Cedric,

On Wed, May 18, 2016 at 4:55 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The palmetto platform has a tmp421 device. Qemu has not (yet). Let's
> use a tmp105 instead.
>
> The aspeed-bmc-opp-palmetto dts file should to be changed consequently
> with :
>
>         i2c2: i2c-bus@c0 {
>                 tmp423@4c {
>                         compatible =3D "ti,tmp105";
>                         reg =3D <0x4c>;
>                 };
>         };
>
> Temperature can be changed from the monitor with :
>
>         (qemu) qom-set /machine/unattached/device[2] temperature 12000

This takes us back to the discussion we had with the Ethernet device.
We need to make the call between emulating something that is close to
a BMC in order for us to test the OpenBMC userspace stack, and making
the Qemu model strictly follow the palmetto and barreleye machines so
we can test both the kernel and userspace.

How much does the tmp105 differ from the tmp421? Could we add a model
for the 421?

Cheers,

Joel

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/ast2400.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 41bfc74493fa..d231d98a88e1 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -161,6 +161,9 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0=
x68);
> +    dev =3D i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 2),
> +                           "tmp105", 0x4c);
> +    object_property_set_int(OBJECT(dev), 25000, "temperature", &err);
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
