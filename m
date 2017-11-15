Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::243; helo=mail-lf0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KajtxNFy"; 
 dkim-atps=neutral
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yc5B911ytzDqjB
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 11:40:00 +1100 (AEDT)
Received: by mail-lf0-x243.google.com with SMTP id f134so16020466lfg.8
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 16:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=pUwQFlrCLoR/6LF2kBsetJyiMIbdXb+PfR9EQ04wPPY=;
 b=KajtxNFyrPlMvs0qU+EjxnhIYjGG0lqtKouUMvJiqv5MbAK9nivc2g0PQ6b9+YOXB8
 mipp7DY1CfwLqBzwRhULaU3tWL4r5M4ggsI5SK6TxXU7HIFHMAu9oGSMzdZW1qMH3a4L
 mKFFULxqpJiYkYvXIpF6Fo94OdqqVZxr392+nRjVeLks1tUwEeBMoG9sG2SX5cc68w1c
 rRX5Gy7Qkwru7EqKuTxjHYzOuJFzIgksIUz8Q5SRyExXXrvgXpqkRaEtyDVzmdiuElR6
 eNoM+uX+VgSnwAuyTI2MqCqS21uqAQDJ/n/UwRBirBjufdp+qPeLJMeH2/dXSVf/xSuV
 0RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=pUwQFlrCLoR/6LF2kBsetJyiMIbdXb+PfR9EQ04wPPY=;
 b=GCcHaBDj8OIhtXd3BHOPFEsqTWR7ovGkPF5+o62yLx8y3rtO4mi2zH6Om7X3sRtupt
 lNgVpub4+qtBHmqpScya397FQkbnZ9ECbt+EAEkLtDAHk++5srlHpW2hB/4nHD3skfii
 RTZGORGlsNZkCE6zL4SqUAjj3mHYxOBXqTCuZG4gV7V0iwtB2bbVP2RkL1gG69s0lcFg
 CUsEnUgsKeDVqSfUOFAHjwRb9Z9NYR1fNudZ1wzpEnfOlD0jdSNntILxLyYhDfeO3rHh
 jysgwjPMkVreIL5bLeKrzqsSnBQyw/A0l0TTkeOS4X6Kov5aaf7bW4PeVIUoMxIt0Uc9
 Y5yw==
X-Gm-Message-State: AJaThX6OB6Ilg9QMyN4PpaxNn/eI3j3By6Zh3SR71b+cU6V3qQuBBfMh
 9Mj7AGvGv6qEubMRO/bjHNKx6TkRb3aM3iGLb3c=
X-Google-Smtp-Source: AGs4zMYMEoeXBsV/7gPmM7tuXxjbdy3wdaOd4IiYt8Cc74yMm/CQDkfLuscSqsYxCxSXNZWDhvBE3+NvavdTLBEktZ4=
X-Received: by 10.25.87.12 with SMTP id l12mr4848198lfb.111.1510706396964;
 Tue, 14 Nov 2017 16:39:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Tue, 14 Nov 2017 16:39:36 -0800 (PST)
In-Reply-To: <595016cc-32ac-c0fb-43fb-ecfc5cd45989@linux.intel.com>
References: <595016cc-32ac-c0fb-43fb-ecfc5cd45989@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 15 Nov 2017 11:09:36 +1030
X-Google-Sender-Auth: BCvN0_0m9GBO75jaOvKCxXxLxEY
Message-ID: <CACPK8XdCXhaZ3gsX3V5PMu1OHD1AtbZHe+C-a4+qrSxZiufang@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] Rename aspeed-bmc-opp-flash-layout.dtsi
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
X-List-Received-Date: Wed, 15 Nov 2017 00:40:03 -0000

On Wed, Nov 15, 2017 at 6:04 AM, James Feist
<james.feist@linux.intel.com> wrote:
> Rename aspeed-bmc-opp-flash-layout.dtsi to openbmc-flash-layout.dtsi
> as this file is not open power specific.

Looks good to me! I'll give others a chance to comment before merging.

>
> Signed-off-by: Feist, James <james.feist@linux.intel.com>

Hrm, why does it put your name like that? Can you correct your gitconfig?

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts     |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts     |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi | 26
> ----------------------
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts       |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts       |  2 +-
>  arch/arm/boot/dts/openbmc-flash-layout.dtsi        | 26
> ++++++++++++++++++++++
>  13 files changed, 37 insertions(+), 37 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
>  create mode 100644 arch/arm/boot/dts/openbmc-flash-layout.dtsi
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
> b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout.dtsi
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
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 68058ec..7017984 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -176,7 +176,7 @@
>                 status = "okay";
>                 m25p,fast-read;
>  -#include "aspeed-bmc-opp-flash-layout.dtsi"
> +#include "openbmc-flash-layout.dtsi"
>         };
>         flash@1 {
>                 status = "okay";
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
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
>  diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
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
>  diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
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
>
