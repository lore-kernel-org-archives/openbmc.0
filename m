Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vV14h2gRZzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 17:13:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/Fx+Jb9"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r90so1719569qki.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 22:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MDOMj1k7+aQttMc408Aq9CxxhbmMpGRZ/4/kfxgdU3I=;
 b=O/Fx+Jb9lB7WoXxJCEXYCCvipxvspTMN8wZdaBlr318HVuG25z/7qcyLsWi4jKTCS/
 ZbNt0mD49kFvn4WW790yBY6xvGMqeCEdcAoGVZcaQYh3Z5YGTWuunqPyR4HXJIDcThLG
 w/oDHnVpFWdpa8b8h4sGRsW/gJ0sP1VErPAXv+3VTUA2XoK3vShODcLlrDU6Bg0eP5TO
 hyyW6+qKaDqKXM22vpTAZg4u5X0sggGhCZOhNI4kuCNotasI7B2bfRppRMgP9/oOQKlw
 yFy6N6WSWfojSHddGhfoVupMLxk55ov+h4lEmK7t4cDypz7IsIfYbPyqxFw5uTgZqTE0
 N7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MDOMj1k7+aQttMc408Aq9CxxhbmMpGRZ/4/kfxgdU3I=;
 b=dHh2/c3DDBsCXDbVumsU3ypL8onkK5Tgghj8SfeUzmmx3WIzCCztMsd9GBXUmFVBVc
 jtJHTOduHhpL+Gct0oZU9ZOTDpS1mn5/PzhBXOsMn2VJ0AiZzKsIrjELb6Y3a1EDpBX8
 pjK2g2idypxIPGmrzhD0TKdO3zn9aUCs82NVS32UGEGjm7okK9jIXUxaUQox7LIk8wk8
 XeIFHMPX8VqX5HUwEGkkq2Z62x4I3BSm4KZM+Y7p2/rFqofx7vTNHhcPperuV57m72pq
 IQDDRfBhRJ3ffxnfEK0l2fd+Tjogk9I4I+hxERUrGnVGX35AMZuscU7R5pOcDtJ/uESw
 OZWA==
X-Gm-Message-State: AMke39k+fVuuoemMBClxxlxDcqfygFKwb/dG/uAMEk66Ii+/MMgn7Lmep3w4GxXgDX5Fw4kos1U8dxVF9jfLuw==
X-Received: by 10.233.235.86 with SMTP id b83mr923371qkg.61.1487916802295;
 Thu, 23 Feb 2017 22:13:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Thu, 23 Feb 2017 22:13:21 -0800 (PST)
In-Reply-To: <20170224061000.7066-1-joel@jms.id.au>
References: <20170224061000.7066-1-joel@jms.id.au>
From: Mine <mine260309@gmail.com>
Date: Fri, 24 Feb 2017 14:13:21 +0800
Message-ID: <CAARXrt=eTFWFr8T8HQz-9ttJU770U=dLa6soUKLO4M5TGLUsxw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Enable FSI for P9 systems
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A . James" <eajames@linux.vnet.ibm.com>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Feb 2017 06:13:25 -0000

Reviewed-by: Lei YU <mine260309@gmail.com>

On Fri, Feb 24, 2017 at 2:10 PM, Joel Stanley <joel@jms.id.au> wrote:
> The kernel driver is now stable enough to boot the host CPUs in P9
> machines.
>
> Note that this grabs control of the FSI mux, so to peform external FSI
> operations eg. to use a Cronus box, the driver must be unbound:
>
>  echo 1 > /sys/bus/platform/drivers/fsi-master-gpio/unbind
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index bef3afa24623..39c0b8f5fb83 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -34,7 +34,7 @@
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> -               status = "disabled";
> +               status = "okay";
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 0769507f1126..4d26d4702a34 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -50,7 +50,7 @@
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> -               status = "disabled";
> +               status = "okay";
>
>                 clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index c2af9ffa89bf..548ef1e939fe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -78,7 +78,7 @@
>         fsi-master {
>                 compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> -               status = "disabled";
> +               status = "okay";
>
>                 clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
>                 data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
> --
> 2.11.0
>
