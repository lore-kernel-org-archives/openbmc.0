Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMg9q6S3GzDvj6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sci/39DL"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id u15so1444027oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=lo4OP7TgV6DwFqBjo8+pvd2cdcX8z37lXEtvEKyATvg=;
 b=Sci/39DLD3wT4An3L/GmYvAOyCelMORpzld/1iiArJ4IWKhS3ei54hVz6fOQOI8/oO
 cUX9V0lfxLpzwR5PMYLFfuxFhzHNo7vL8rus3/8cOsiQSgYOAmQcELvigmX/myP5lssk
 2jZVlwU0R4p4IBWXlcRaZ/TjXr9GAuT6l0rvs0GdxFlka/Hk5VPzul6Yb+PqyO9v1XTs
 b6EGn6yHGCOl37uDrKjdKd1NksSQ/+SZSG4DPhjwiGwtKEOh4D/VVUFF5cSnToIrnGPf
 VgdBzonMjEu9+BCwpV6yVWFXiTAoQamAkrXaeMKxggjBKvbMZwxcqJ6LhSzdRwkTLz4W
 zhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=lo4OP7TgV6DwFqBjo8+pvd2cdcX8z37lXEtvEKyATvg=;
 b=lVJio/suv14rGHdL0JklHhb1GkAkGdRXg4iBbyWT8puPMVmqnYOhNFMHgs7/a01GYs
 t2xltw1i3oGXlt9fYtjl5BEpZLErdxXGINkB5SJ61HHdPVV4knfrTJDle6LDkJ+PojpN
 lHfPabXp+xdkgkFEsOomV2FC3UlSm+4xMVoGDHG1V2HpuRdQWJNz/UvJFe7pJg3O7BmR
 NbPsnBVv9ri5OK4byrVvKXYlzObPRAj4j0t1AubLJZQaucGu0Y9CJ3CX08dR+Et6wuBd
 4rxneJqHwk0H1539jxL6h16TkcUYkEWu4V/dNyBInoH+D1LL5QYYrrUWUb9+TvDaXwCC
 zcQQ==
X-Gm-Message-State: AKaTC01ChyaK8y7o/XdbPMz9Lk8r8B2cP/At/0fuOX9VxJ5dsNk0KpQlQeTEkaoGton9Mj581zJtF8VQjnBdZA==
X-Received: by 10.157.17.26 with SMTP id g26mr7359936ote.230.1479713133942;
 Sun, 20 Nov 2016 23:25:33 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:13 -0800 (PST)
In-Reply-To: <1479478938-13267-6-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-6-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:13 +1030
X-Google-Sender-Auth: YrPfpOQmxLTORge1sVHVj3zIHsI
Message-ID: <CACPK8Xec9Hctt6LXSi0BR_rKKRTSttUS5FS0E2Zz38NSdwsijg@mail.gmail.com>
Subject: Re: [PATCH qemu 05/38] aspeed: add support for the romulus-bmc board
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:36 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The Romulus machine is an OpenPOWER system with an AST2500 SoC for
> the BMC and a POWER9 chip for the host. It does not make much
> difference for qemu a part from the fact that the FMC controller has
> two SPI flash module slaves.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 159d562e8912..aea73f79d92c 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -41,8 +41,10 @@ typedef struct AspeedBoardConfig {
>  enum {
>      PALMETTO_BMC,
>      AST2500_EVB,
> +    ROMULUS_BMC,
>  };
>
> +/* 0x120CE416 */

Is this the value of the strap as taken from the hardware? Perhaps add
a comment to say so.

>  #define PALMETTO_BMC_HW_STRAP1 (                                        =
\
>          SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               =
\
>          SCU_AST2400_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=3D6, CWL=3D5 =
*/) | \
> @@ -56,6 +58,7 @@ enum {
>          SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
>          SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>
