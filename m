Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5hk1YbxzDvMC
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 16:04:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uEN7aruL; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so7335330vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 22:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ChL5qoOT1afeys0lcJ7OrJAf5OvNFT0IKohHjwni9Mk=;
 b=uEN7aruLFaUxly5nGIN5LnzgZXmC/BTJuIHiqDbmzWLmsaSypVHy7c/xcOOHeeP27X
 Dg+dS7rv3XpLJlOLN5o48Z9TU2yD0srhQedWNBl8tMXz7f6xVG+md4GWhtRsYuLLN3CN
 w32FwTLPzMyxSZdbSmfo4nfa5Y2NyAkWwpDC/LK/seL+r/660WFXSOacIqyc0VQE4LHn
 w8Cl8ElU2F+j0qJYoVyFAsHTkPHuDhuRtiGKmpk0XF9OfJk7rX5Yb09cl5yPoW3CpEt4
 MiDJoy5jOpFXkh8holgIHKjbXmSnuy2f8DKHdXjrOvs/KXuwkov4nalWLNldnu7GY1+p
 Fp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ChL5qoOT1afeys0lcJ7OrJAf5OvNFT0IKohHjwni9Mk=;
 b=INONBvCGAG1bP0AKetaW59wZwQL81lJXoT1dwwwfQg6bDBbwOhfZHusY1QcHfrX6Zv
 vAUwXXxEHK0VeQISV32IhGrtMtWEyTPXQn2JsOEPAvbhQTztXYkcR9ttrF8x9/voI+wT
 4h5VA5B4ZlQoKCLObwmbE/URcITMKZfyLao3BBhGbaLnv2OUhbro6sQIsXpT5UMEqRaX
 osbNc4AK5Mmq9/NJHHe38irz7vzQ92IuBzPcfHH9poSZ3OfN1UbPnJAJF2uXZOQD41jm
 Ac/LQiusopjPll+2hSxegWMPmfZxWlQu0Xs19+4GZ5yef3nYb4VjxJ2zpikxLK8uuLr/
 UM2g==
X-Gm-Message-State: AA6/9RnPSJuiWN09t9lfZUqO2qg5osIoIticnDyNxTh7GaEVOGqM5DscQiw6jsTEdqOQX4rPyJRHW189s8huDw==
X-Received: by 10.31.115.8 with SMTP id o8mr16611764vkc.2.1476680644348; Sun,
 16 Oct 2016 22:04:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 22:03:43 -0700 (PDT)
In-Reply-To: <1476448684-6149-10-git-send-email-clg@kaod.org>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-10-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:33:43 +1030
X-Google-Sender-Auth: J5o7Mu45PNLy--tutGd67eanrb0
Message-ID: <CACPK8XcL2JQgxxZEgK4tnO3o_+No4YKo_8edEC1NS5yACvZVMQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 09/12] mtd: spi-nor: aspeed: add DMA support
 to smc controller
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2016 05:04:06 -0000

On Fri, Oct 14, 2016 at 11:08 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The Aspeed FMC controller can handle transfers to the flash modules
> using DMAs. A couple of registers first need to be programmed with the
> DRAM and flash addresses and the length of the transfer. The transfer
> is then initiated using a DMA control register and an interrupt
> notifies the completion.
>
> Such transfers can replace the current IO mode in the read/write ops
> when some conditions are met on the size and the alignment. In case of
> failure, a timeout for instance, the operation is restarted using the
> IO mode.
>
> DMA support does not seem to be that efficient. So we provide some
> sysfs files for tuning and to switch it on and off (default is off)

It looks like this version only has a module parameter, and not the sysfs f=
iles.

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 246 +++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 243 insertions(+), 3 deletions(-)
>

>         /*
> @@ -530,6 +769,7 @@ static int aspeed_smc_probe(struct platform_device *p=
dev)
>                         continue;
>                 }
>
> +               chip->phys_base =3D r->start;
>                 /*
>                  * Always turn on the write enable bit in the type and se=
ttings
>                  * or flash configuration register to allow opcodes to be=
 sent
> @@ -621,7 +861,7 @@ static struct platform_driver aspeed_smc_driver =3D {
>         .probe =3D aspeed_smc_probe,
>         .remove =3D aspeed_smc_remove,
>         .driver =3D {
> -               .name =3D KBUILD_MODNAME,
> +               .name =3D DEVICE_NAME,

This should be in a different commit.

>                 .of_match_table =3D aspeed_smc_matches,
>         }
>  };
> --
> 2.7.4
>
