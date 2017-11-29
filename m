Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G4dw/J5z"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymw080qSmzDrZV
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 20:16:55 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id x204so2996917lfa.11
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 01:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eBW08dIgKjuv47+PgSV0x7MZJjT0KEi61m6Tkuo8wKs=;
 b=G4dw/J5zg2McKATYgnJ/Bh2J6MsYRD9XXiZSGaZ9Jl3ccxl182TtEK64n6euk2sSQK
 +fAYEGKULMCLulagSHatyvc64a4bKaqYhaI89hkxhGmnvTaMQB0H8sT/JEl8N2n5hlFf
 RmRFyQjbEGZgfIfRx8Dt98Q9+x3o/gtWfs+36UPsWeuIE5W7+DSkK/d0DoqVbIqJVtVc
 4v7DVPkxf5SsEx4wRgjPOjItBXdDPg2cNWRQI/d3XJMeowshxy66kzdM2Vd9ORkOuBaN
 zLn/sf0urFIwDLplFhP6NtsOcyYUDErOP1GnDG7tRTTEhpzbDQOi5bFM45RWhPWmV/RU
 KEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eBW08dIgKjuv47+PgSV0x7MZJjT0KEi61m6Tkuo8wKs=;
 b=FXqHRCEHK5VqMvaFKgg0AucwvLC0B7zEaVL8pe1VMTx7mzghfw6P02L57sgDrab35l
 LV3D7aZKhrFhTEpN29fRK1AgNpTLqHm5d6MmhBGuvDsk/LifL7BPF4Bng7OaDxWMZmrW
 I4XWJgrm0Z31y9XROzE8Xp4ORjRVXa2R2eLfEZmGudtZiggqt3Tjb9bTAZZDOTH7k1jz
 +2Uo8tTuVicKHIwkrZLBgoLgmoJl63D4fY5JBeu+HcHMfZYxqTQBTFP51f4UeEjfiOf5
 8vhdfeooBHgIxSjGuAt8CjQo047JroPfLfvSiLo5eJ2wD9qG5r4ck776bDa362MXwqqh
 AlxA==
X-Gm-Message-State: AJaThX5aYeHxmPHuG0sSBDTsQRCDEuCemdMOXuldJrr9DAv7L2szn9nE
 XB/GzoeCfK2owcNfzY3Dd1+uQZ8jIMGWGdbO+Lk=
X-Google-Smtp-Source: AGs4zMaKoLqkQIAMI9nwrI6hidtSFzXmd4mNK6cCMSIAAwJn3+YRJboQFNvFMuxBC3RjnrkmE+BpdGYnf8wCicC4a74=
X-Received: by 10.25.81.133 with SMTP id g5mr813563lfl.77.1511947010544; Wed,
 29 Nov 2017 01:16:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 01:16:30 -0800 (PST)
In-Reply-To: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
References: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Nov 2017 19:46:30 +1030
X-Google-Sender-Auth: a3lwEKVdv5K7txaGwT-jepAwR2w
Message-ID: <CACPK8XdW=PZX-geQ20t_G7cXtGGCKjD2Y-LoLO+DfEb6Huadtg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 1/2] ARM: dts: aspeed: Rename
 aspeed-bmc-opp-flash-layout.dtsi
To: James Feist <james.feist@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 09:16:57 -0000

On Wed, Nov 29, 2017 at 5:58 AM, James Feist
<james.feist@linux.intel.com> wrote:
> Rename aspeed-bmc-opp-flash-layout.dtsi to openbmc-flash-layout.dtsi
> as this file is not open power specific.
>
> Signed-off-by: James Feist <james.feist@linux.intel.com>

This one looks okay. I've been flat out working on upstream and our
v4.13 tree, but I will find some time to merge these for you in the
coming days.


> ---
>  Changes since v1:
>  - Added patch 2 that depends on this patch.
>
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 26 ----------------------
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |  2 +-
>  arch/arm/boot/dts/openbmc-flash-layout.dtsi        | 26 ++++++++++++++++++++++
>  13 files changed, 37 insertions(+), 37 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout.dtsi
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 3543989..d75b2e8 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -21,7 +21,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index d1dc2ef..2d0bc10 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -24,7 +24,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 6e70ca5..0b7a238 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -61,7 +61,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 93ad3ea..e8e61f7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -50,7 +50,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> deleted file mode 100644
> index 4bcfd1b..0000000
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -               label = "bmc";
> -               partitions {
> -                               #address-cells = < 1 >;
> -                               #size-cells = < 1 >;
> -                               compatible = "fixed-partitions";
> -                               u-boot@0 {
> -                                       reg = < 0 0x60000 >;
> -                                       label = "u-boot";
> -                               };
> -                               u-boot-env@60000 {
> -                                       reg = < 0x60000 0x20000 >;
> -                                       label = "u-boot-env";
> -                               };
> -                               kernel@80000 {
> -                                       reg = < 0x80000 0x440000 >;
> -                                       label = "kernel";
> -                               };
> -                               rofs@0c0000 {
> -                                       reg = < 0x4c0000 0x1740000 >;
> -                                       label = "rofs";
> -                               };
> -                               rwfs@1c00000 {
> -                                       reg = < 0x1c00000 0x400000 >;
> -                                       label = "rwfs";
> -                               };
> -               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 95552c8..5e30912 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -34,7 +34,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> index 833ef17..58f7884 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> @@ -96,7 +96,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index ab3fee6..b41c29a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -65,7 +65,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 060eb0c..329532a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -114,7 +114,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 68058ec..7017984 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -176,7 +176,7 @@
>                 status = "okay";
>                 m25p,fast-read;
>
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>         flash@1 {
>                 status = "okay";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 5410f58..5f6a11a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -140,7 +140,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 7ed3a77..eafd6f9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -107,7 +107,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> new file mode 100644
> index 0000000..4bcfd1b
> --- /dev/null
> +++ b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> @@ -0,0 +1,26 @@
> +               label = "bmc";
> +               partitions {
> +                               #address-cells = < 1 >;
> +                               #size-cells = < 1 >;
> +                               compatible = "fixed-partitions";
> +                               u-boot@0 {
> +                                       reg = < 0 0x60000 >;
> +                                       label = "u-boot";
> +                               };
> +                               u-boot-env@60000 {
> +                                       reg = < 0x60000 0x20000 >;
> +                                       label = "u-boot-env";
> +                               };
> +                               kernel@80000 {
> +                                       reg = < 0x80000 0x440000 >;
> +                                       label = "kernel";
> +                               };
> +                               rofs@0c0000 {
> +                                       reg = < 0x4c0000 0x1740000 >;
> +                                       label = "rofs";
> +                               };
> +                               rwfs@1c00000 {
> +                                       reg = < 0x1c00000 0x400000 >;
> +                                       label = "rwfs";
> +                               };
> +               };
> --
> 2.7.4
>
