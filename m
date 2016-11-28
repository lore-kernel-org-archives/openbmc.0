Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS1k35gpdzDvcs
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 20:35:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="umn/72qn"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 20so9541127uak.0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 01:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=LSJ8Ew3AG2l7U9mxKh9ThDfzvxW5L5iSrAkyv8AwG9k=;
 b=umn/72qnpmZjVZH6Im3mq97n5VVlNyeMk6Yl99IeyH+y59w2lGGIX39oC4cVYct27R
 dqWD6sYH2Y4hrQTnuPvubtSV8bREwL8VpSKkqY8/YI/RiwzHqEIX/F3+rPKdadyWf6g7
 +pvpymT7ooHzH+b1zmavpdo4FxQSuzpb47bLhsZDgW4q7C0xVCOfRuAA53OhyP/UZeaO
 +5vG6YkhKS+j1C5YqHou2gGLlBLk3/MD/bTJ6+wTDpJ0t+8I8JeS0M/aX22lDGEUt1W/
 yArj9MqH6A29gENQVybIZKcmUXfuInOpIG9zRTay55NlEa36lTiWpGaytkMK9nN/en3X
 SewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=LSJ8Ew3AG2l7U9mxKh9ThDfzvxW5L5iSrAkyv8AwG9k=;
 b=U6D5LJ80ffDdrJok6NhMeRmaSQJLDAVR/epk7lbApR8xDYHFm7DLhC5lFOhpb/6/+U
 wAfxzvzy+41ZbRVhI26rwB+9JfCcyILNbSDHabkMkhHgMrl3dLbNPpOXOIffJA6okdEZ
 yeH7PpUSyWMsjGw0C8akN2IpvN6/HiknXH9x0/46CeymoUTgW2Qg/A87WCJuK1grddw3
 P/Bp/+yGdHrZpHtFBnO/VFSl/AInDBWMobstsKJQnA93Z3OHG/9co1EoLo1pEvH/enl3
 vpK8Vx+YCCx/2La0Ff7AiykPsD8bD/cy1Bo1j44nRjOpEY2e+t2VK27MxoNHgimLCKkr
 JElg==
X-Gm-Message-State: AKaTC00XEaOnj5ZEpoSJRLlPddS54tMIDi/4YAKfRLvTp4VKd6RHKNxdejxiFn2ECKfNZOiqa3bk8dITm3omaw==
X-Received: by 10.176.83.92 with SMTP id y28mr15163485uay.128.1480325705260;
 Mon, 28 Nov 2016 01:35:05 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Mon, 28 Nov 2016 01:34:44 -0800 (PST)
In-Reply-To: <1480317582-549-1-git-send-email-clg@kaod.org>
References: <1480317582-549-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Nov 2016 20:04:44 +1030
X-Google-Sender-Auth: W07DCuzjVPLTDzIPjxFJ-VkLqqw
Message-ID: <CACPK8XcZYocQgGaK3x-NPvz6D4cuufomz4mBVQ7z=VpL8+5Ttw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: restore labels of the
 flash modules
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
X-List-Received-Date: Mon, 28 Nov 2016 09:35:08 -0000

On Mon, Nov 28, 2016 at 5:49 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> commit e62c7f111755 ("ARM: dts: aspeed: fix flash module device
> nodes") removed the 'label' property under the flash module device
> nodes because of the lack of support in mainline. This change broke a
> number of OpenBMC user space tools. let's revert the label change.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Joel, I will add a proposal patch to extend the 'jedec,spi-nor'
>  binding with a 'label' property in the next version of the Aspeed SMC
>  controller patchset.

Cool, thanks for sending this. I've applied it to dev-4.7 as of b278d67c.

Ideally we would get upstream to ack it first but given we've been
asked to fix this asap, we can carry it our tree for now. Hopefully
upstream have no issues and we will be all good.

Cheers,

Joel

>
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts                | 3 ++-
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts          | 3 ++-
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts          | 3 ++-
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi      | 1 +
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts           | 3 ++-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts           | 3 ++-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts            | 4 +++-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts        | 4 +++-
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts              | 3 ++-
>  arch/arm/boot/dts/aspeed-g5.dtsi                        | 4 ++--
>  11 files changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Do=
cumentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> index 2c91c03e7eb0..b7cd02a3ebe8 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
> @@ -65,6 +65,7 @@ Optional properties:
>                     all chips and support for it can not be detected at r=
untime.
>                     Refer to your chips' datasheet to check if this is su=
pported
>                     by your chip.
> +- label : name to assign to mtd. If omitted, the label is the MTD device=
 name.
>
>  Example:
>
> @@ -75,4 +76,5 @@ Example:
>                 reg =3D <0>;
>                 spi-max-frequency =3D <40000000>;
>                 m25p,fast-read;
> +               label =3D "System-firmware";
>         };
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index fe8fc7a801f6..9d88f3aadbc6 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -33,8 +33,9 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       pnor@0 {
> +       flash@0 {
>                 status =3D "okay";
> +               label =3D "pnor";
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-barreleye.dts
> index 802ce9557836..bedff97fb9b9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -40,9 +40,10 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       pnor@0 {
> +                       flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> +                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/bo=
ot/dts/aspeed-bmc-opp-firestone.dts
> index 005ff89e0c10..bbe09fc85b1e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -61,9 +61,10 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       pnor@0 {
> +                       flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> +                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/ar=
m/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> index 6cfadb42368f..65095a40a203 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> @@ -1,3 +1,4 @@
> +               label =3D "bmc";
>                 partitions {
>                                 #address-cells =3D < 1 >;
>                                 #size-cells =3D < 1 >;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-garrison.dts
> index 92b29d1c665b..7737c09aa20e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -41,9 +41,10 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       pnor@0 {
> +                       flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> +                               label =3D "pnor";
>                                 /* spi-max-frequency =3D <>; */
>                                 /* m25p,fast-read; */
>                         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index ed3c4a9e3d9d..f018074f6bb1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -58,9 +58,10 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2400-smc";
> -                       pnor@0 {
> +                       flash {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor" ;
> +                               label =3D "pnor";
>                         };
>                 };
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 9845e6ca0de9..c23627ec5e84 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -29,6 +29,7 @@
>         };
>         flash@1 {
>                 status =3D "okay";
> +               label =3D "alt";
>         };
>  };
>
> @@ -37,8 +38,9 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       pnor@0 {
> +       flash@0 {
>                 status =3D "okay";
> +               label =3D "pnor";
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/=
boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 5c463f4112f6..9badf3e94599 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -29,6 +29,7 @@
>         };
>         flash@1 {
>                 status =3D "okay";
> +               label =3D "alt";
>         };
>  };
>
> @@ -37,8 +38,9 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       pnor@0 {
> +       flash@0 {
>                 status =3D "okay";
> +               label =3D "pnor";
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index 8ef4ecec17cc..673bab8006e7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -58,8 +58,9 @@
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_spi1_default>;
>
> -       pnor@0 {
> +       flash@0 {
>                 status =3D "okay";
> +               label =3D "pnor";
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index 433461bce607..d6ff41ee6c58 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -58,12 +58,12 @@
>                         #size-cells =3D <0>;
>                         compatible =3D "aspeed,ast2500-smc";
>                         status =3D "disabled";
> -                       pnor@0 {
> +                       flash@0 {
>                                 reg =3D < 0 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 status =3D "disabled";
>                         };
> -                       pnor@1 {
> +                       flash@1 {
>                                 reg =3D < 1 >;
>                                 compatible =3D "jedec,spi-nor";
>                                 status =3D "disabled";
> --
> 2.7.4
>
