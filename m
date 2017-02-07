Return-Path: <xow@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHwD534pLzDqBW
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 06:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gWlgrSn9"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id u25so99734108qki.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 11:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=URdsszmVTefTU7Ogy/gqoM/fXIMto8MkaNM0p44QtKI=;
 b=gWlgrSn94TAcpaj3Guxtg2JDc5b57m7xw/Mc8vPsGNLeu47VV9HlcNDQrq5P7yEF/j
 hILueLs8lcxVIW189XRvVx6vdokYfXE6wSxbrJuxqShNwWn3RsKT047zoEv6pbI879wB
 LfKBlQsp6ywIqDoim+FuNuKUKhrfkZ+VjZzXSq0ZH+/xnc+EPrqs824HGD6HQ9A4IbhR
 w+uG4lpzI/8eLklbYckT6ARlfjwlRebzLmHtVwrNjvRZworbKAvAVDSY6i7fai5lTzHx
 TKHhECLXdlSSC0LRHpF0bWLTBwJDGq1U224asCDQ+SZ0MY4OFiN1oapvumXlCCMx4fkr
 MBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=URdsszmVTefTU7Ogy/gqoM/fXIMto8MkaNM0p44QtKI=;
 b=d/mDRWs6caTTg60+YrS/bu9slueh47VIWVcHVArg8rEUR9Mc7iwD/C3RMME8nyJrKd
 1wAret3uaaJVjyR4pxWqvVikibQltQrt2EMGHByBPX82ScmLLPobluhYGajYtquaRnPj
 3TBOrm0/43ydxX4Z41AepQUQT/wz6bWr9wnnOcuXQHnK6PcTEbzbnTGHr2jA8kTTPIRI
 fRLEnYF+jSQ+3y0p2ECMtXqDLSgo9W6Ze/Jz9wYFoRIlAQE19IgT5y28QebiziVSPmGr
 ftkh6A9IdJmleJptnPQXnLIUN3o7uX9wg3m5JcAehASuCT0pn6xTzSbur4TDbGQ0tVym
 N/vQ==
X-Gm-Message-State: AMke39n6F7TI1sRiiFH7byu9nF/G6FxX9ti6kc3A/nDys8AE+wS28iFEMMvbgvsY5BGltdIjFago8M2RGyXUUDwc
X-Received: by 10.55.192.137 with SMTP id v9mr15768112qkv.305.1486497586659;
 Tue, 07 Feb 2017 11:59:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Tue, 7 Feb 2017 11:59:46 -0800 (PST)
In-Reply-To: <20170207023737.26936-1-joel@jms.id.au>
References: <20170207023737.26936-1-joel@jms.id.au>
From: Xo Wang <xow@google.com>
Date: Tue, 7 Feb 2017 11:59:46 -0800
Message-ID: <CAPH-5w6ckMjyxn=J2deBycOexc9cCdsMXxLYq44GPQM-xG9S7g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add FSI pins to Zaius device tree
To: Joel Stanley <joel@jms.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 07 Feb 2017 19:59:50 -0000

Hi Joel,

Thanks for keeping us up to date.

On Mon, Feb 6, 2017 at 6:37 PM, Joel Stanley <joel@jms.id.au> wrote:
> Pin assignments for the EVT-2 board as described in pdbg. The status is disabled
> so this does not enable the in-kernel FSI driver yet.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Tested on zaius5 with the driver enabled and it worked.
>
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e2195a641414..e1c9b3f4fe44 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -74,6 +74,18 @@
>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       fsi-master {
> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";

Andrew's comment for Witherspoon applies here as well
("ibm,fsi-master-gpio" makes sense as the "definitive" name).

> +
> +               status = "disabled";
> +
> +               clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;

FYI, we'll return to the Norm-recommended assignments for these at the
next board spin to keep FSI pins on their own GPIO port. Not sure how
helpful that is in the context of the FSI kernel driver since it's not
poking the registers directly.

> +               trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
> +               mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
> +       };
>  };
>
>  &fmc {
> --
> 2.11.0
>

cheers
xo
