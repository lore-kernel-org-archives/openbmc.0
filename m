Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJRSh694SzDvnG
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 12:27:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SU03dqc7"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id z62so4798598oiz.1
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 17:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xWO4uS46DJ9G0P6afvadRrws5a+zJay6fZ+TYADn/LE=;
 b=SU03dqc7QF8ygZjEhM+dfYfXkAUxzTm4NZTnuudOohD22jFn4P6xiVAu3dGRZw3Gsi
 tsnTyxhQTxYwa8sHtBMY/Bgdmw7woGGNosrllOPbKeD1CBqni8UMt+nCqOqpz5mkhn2h
 OaVC2Bc2V1wRp0jxUjrbhNdDft8Q8UVxH9T+svwjqKV9tgyImUbbKUrhXivnieM2yqIj
 rlFv+IoE19xh6GCew0RTJwqpVopeIWqaOV5edKmoXtgKDaRW0q2xwhjJ4G+NquBxdOnb
 UGYMBAKZ+WLy2nptoYw6ZqGJFUF8Z9H46FvJ0idzTtJyMAyBpOsqDbrKNGDNrS+5QBBo
 dSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xWO4uS46DJ9G0P6afvadRrws5a+zJay6fZ+TYADn/LE=;
 b=e/nSi+dbr75fBJDMmgdZZN3/Bosv5ssV9kQ8uqyk20nt/42pBRN/1/PKfbSZBmanY3
 NYe0nMbvXdVsiQnNxzSIByMLCeMk6OOv46Qypu7Nse3pPta8KANIVv6Eo0xtzRKyax7Q
 1qJMgz/XoVQ4HWzLkkBbibttcbPx/9bqn/DZKetst3+o9c9tinFEFhCCiL0btxI1GrKS
 jzurs9MsvtebbY343C18fqsguE6AV6z777aGps8EE7FzrIuPsJILQgoM4B3Z9k1tymza
 0L+EUvMXn2jCTVBE5kLqlAB7zSuGpM4XQT10R7ddrtOPlI9hAzmpnc2w0h8KqLniEHGC
 QV5g==
X-Gm-Message-State: ABUngvc4YCWOLEUib1fdBvbQW9CP+xcOqS3Ht2MDqrg9EAC1o/65MkarfMKlBuFUl5tleB+fJlj+kOJkDKSvQQ==
X-Received: by 10.157.36.36 with SMTP id p33mr503552ota.8.1479259634895; Tue,
 15 Nov 2016 17:27:14 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Tue, 15 Nov 2016 17:26:54 -0800 (PST)
In-Reply-To: <1479205434-5223-1-git-send-email-clg@kaod.org>
References: <1479205434-5223-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Nov 2016 11:56:54 +1030
X-Google-Sender-Auth: c6vf7lS4stzmWjyq-GN8onHUtqg
Message-ID: <CACPK8XcxoECp5uTAXpuiKhPok94fW0R+f+sBVcOgaFfNG6HyDg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: fix flash module device
 nodes
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
X-List-Received-Date: Wed, 16 Nov 2016 01:27:17 -0000

On Tue, Nov 15, 2016 at 8:53 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> The "label" property can not be used under the flash module device
> nodes. Remove them and use 'pnor' in the device node name to identify
> the host pnor flash module from user space. Also introduce a
> 'partitions' node to describe the bmc layout.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks for sending this. For reference userspace sees this now on ast2400:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00001000 "u-boot"
mtd1: 00020000 00001000 "u-boot-env"
mtd2: 00280000 00001000 "kernel"
mtd3: 001c0000 00001000 "initramfs"
mtd4: 01740000 00001000 "rofs"
mtd5: 00400000 00001000 "rwfs"
mtd6: 02000000 00010000 "1e630000.spi:pnor@0"

And on ast2500:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00001000 "u-boot"
mtd1: 00020000 00001000 "u-boot-env"
mtd2: 00280000 00001000 "kernel"
mtd3: 001c0000 00001000 "initramfs"
mtd4: 01740000 00001000 "rofs"
mtd5: 00400000 00001000 "rwfs"
mtd6: 02000000 00001000 "1e620000.flash-controller:flash@1"
mtd7: 08000000 00001000 "1e630000.flash-controller:pnor@0"


pflash uses strstr to match on a mtd device with 'pnor' in it, so this
should maintain compatibility with that tool.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel


> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 17 +++++++++-------=
-
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  3 +--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  3 +--
>  arch/arm/boot/dts/aspeed-g5.dtsi                   |  4 ++--
>  10 files changed, 19 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index 37b6793698e0..3dc472ae10e9 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -30,7 +30,7 @@
>
>  &spi1 {
>         status =3D "okay";
> -       flash@0 {
> +       pnor@0 {
>                 status =3D "okay";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-barreleye.dts
> index 6ca618bd331d..802ce9557836 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -40,10 +40,9 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       flash {
> +                       pnor@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> -                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index e677e9ff00b8..005ff89e0c10 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -61,10 +61,9 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       flash {
> +                       pnor@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> -                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/ar=
m/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> index ca8639b52f6d..6cfadb42368f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> @@ -1,28 +1,29 @@
> -/* This file is the label for the bmc primary flash and its partitions *=
/
> -                               label =3D "bmc";
> +               partitions {
>                                 #address-cells =3D < 1 >;
>                                 #size-cells =3D < 1 >;
> -                               u-boot {
> +                               compatible =3D "fixed-partitions";
> +                               u-boot@0 {
>                                         reg =3D < 0 0x60000 >;
>                                         label =3D "u-boot";
>                                 };
> -                               u-boot-env {
> +                               u-boot-env@60000 {
>                                         reg =3D < 0x60000 0x20000 >;
>                                         label =3D "u-boot-env";
>                                 };
> -                               kernel  {
> +                               kernel@80000 {
>                                         reg =3D < 0x80000 0x280000 >;
>                                         label =3D "kernel";
>                                 };
> -                               initramfs {
> +                               initramfs@300000 {
>                                         reg =3D < 0x300000 0x1c0000 >;
>                                         label =3D "initramfs";
>                                 };
> -                               rofs  {
> +                               rofs@0c0000 {
>                                         reg =3D < 0x4c0000 0x1740000 >;
>                                         label =3D "rofs";
>                                 };
> -                               rwfs  {
> +                               rwfs@1c00000 {
>                                         reg =3D < 0x1c00000 0x400000 >;
>                                         label =3D "rwfs";
>                                 };
> +               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index a4471fb3b36b..92b29d1c665b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -41,10 +41,9 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       flash {
> +                       pnor@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> -                               label =3D "pnor";
>                                 /* spi-max-frequency =3D <>; */
>                                 /* m25p,fast-read; */
>                         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index 0fd60c4eafad..8fe248f4d531 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -58,10 +58,9 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       flash {
> +                       pnor@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> -                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 4c4c547fe412..9845e6ca0de9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -29,7 +29,6 @@
>         };
>         flash@1 {
>                 status =3D "okay";
> -               label =3D "alt";
>         };
>  };
>
> @@ -38,7 +37,7 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       flash@0 {
> +       pnor@0 {
>                 status =3D "okay";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 7badbda288d3..c7458ae6efd7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -29,7 +29,6 @@
>         };
>         flash@1 {
>                 status =3D "okay";
> -               label =3D "alt";
>         };
>  };
>
> @@ -38,7 +37,7 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       flash@0 {
> +       pnor@0 {
>                 status =3D "okay";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index 673bab8006e7..8ef4ecec17cc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -58,9 +58,8 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       flash@0 {
> +       pnor@0 {
>                 status =3D "okay";
> -               label =3D "pnor";
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index be95fd42dbd7..099d0aab87b6 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -58,12 +58,12 @@
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2500-smc";
>                         status =3D "disabled";
> -                       flash@0 {
> +                       pnor@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 status =3D "disabled";
>                         };
> -                       flash@1 {
> +                       pnor@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 status =3D "disabled";
> --
> 2.7.4
>
