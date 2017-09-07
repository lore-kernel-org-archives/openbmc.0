Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qBgZo9if"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnjyt1XhvzDrVp
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 11:48:22 +1000 (AEST)
Received: by mail-lf0-x241.google.com with SMTP id c8so3794042lfe.2
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 18:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EHa3u4K4MUyKVh+5oMD9aBjzGQ7j6d7eU000uk5DWiU=;
 b=qBgZo9ifo7uH59lvDNbhv+S+GsXMByjhSc3bjj2Mbh6foVO/pDYBNXGw8a5681v0Wz
 pn6qj6UBhOnALDxcl79uBgQLSpZhdi2Pgl/XGewGsgtoU1GknBC9o6hMV4QoidjyvbxL
 wiCqeoEHuxMLLzwJXHgvroM9xWCZg8IwUgCBbu215Kvgk5IYaDhEJJ59Kl7F41aQ6FDa
 xt2F049l53R/UuCs/t2yXNN/IXb0K3hRRLhH3hIOe8R907QoAat03bk7crlryHxrhtYL
 TiwWDmrWDydFnPwTJ+bzdgX1UIXmTNORk3EIYVO7CzFRbx2QRuAQp9tOZWYtTnL/QWAX
 tYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EHa3u4K4MUyKVh+5oMD9aBjzGQ7j6d7eU000uk5DWiU=;
 b=OQ9bS/ZcT6y12PG7AJ7KO2Vg6qhY86rKtXrJ4PeGXGSM+5VIo/brO28bWIXMulO2aP
 gpCjXvuhtjj94ebcCXgthWmMoTOicX903Y+z9YBp9M+fCdSxcIioyeyyslZ8OeKHUgLv
 GOjiu2iQxhyvnCIOSXpq/Kk5VA001OmBE3XwJWynTn/6OmQx2fd+YpMjIImdBIAhMlRT
 J7xqTQB3O7riDX5h8oWoC6wqvk/0cxO5EyQvqXqIiFFDdwM/AUZNBpeeceVK/SgeKbfn
 abjD4AJiLsKPYUMIeyp/EUZQHVCQn5KfStX6o95SXyM1UXTUslj/hDG1HxDUf6CZcyAH
 GHEQ==
X-Gm-Message-State: AHPjjUgVfqqDOPduwu8eAaMtOAGIY0fUTbvRjwC+00Q1itjgVO8FqIZq
 YQF0V/OqouuEQ8Iu1YSMpJolSEkWYubOZ2A=
X-Google-Smtp-Source: AOwi7QDzfXtb2MDVBA9ihdtTihpiaMMnVDEh5mCxlFY++2+XIpVs8f763jTz9J3G3mVDKg+7wlwByMoLAGyxreH1B5I=
X-Received: by 10.25.209.80 with SMTP id i77mr351850lfg.257.1504748899034;
 Wed, 06 Sep 2017 18:48:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Wed, 6 Sep 2017 18:47:58 -0700 (PDT)
In-Reply-To: <20170901132447.48345-1-c_mykolak@mellanox.com>
References: <20170901132447.48345-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Sep 2017 11:17:58 +0930
X-Google-Sender-Auth: NaXsxc9DqXNNmJ0Rapg6UbNj8vM
Message-ID: <CACPK8Xd9rm65DQWaBUbNUiDu0vUtm02O97FrFijzG5wzd_=YFg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] mellanox: msn: change flash layout.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Vadim Pasternak <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 07 Sep 2017 01:48:22 -0000

On Fri, Sep 1, 2017 at 10:54 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Remove mellanox-msn-flash-layout.
> And set opp-flash-layout for mellanox msn.
> We decided that it would better for compatibility.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi  | 32 ----------------------
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts      |  2 +-
>  2 files changed, 1 insertion(+), 33 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> deleted file mode 100644
> index cf8ee54f13c2..000000000000
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn-flash-layout.dtsi
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -/* This file is the label for the bmc primary flash and its partitions */
> -                               label = "bmc";
> -                               #address-cells = < 1 >;
> -                               #size-cells = < 1 >;
> -                               u-boot {
> -                                       reg = < 0 0x60000 >;
> -                                       label = "u-boot";
> -                               };
> -                               u-boot-env {
> -                                       reg = < 0x60000 0x10000>;
> -                                       label = "u-boot-env";
> -                               };
> -                               kernel  {
> -                                       reg = < 0x70000 0x280000 >;
> -                                       label = "kernel";
> -                               };
> -                               dtb  {
> -                                       reg = < 0x2f0000 0x10000 >;
> -                                       label = "dtb";
> -                               };
> -                               initramfs {
> -                                       reg = < 0x300000 0x1c0000 >;
> -                                       label = "initramfs";
> -                               };
> -                               rofs  {
> -                                       reg = < 0x4c0000 0x1740000 >;
> -                                       label = "rofs";
> -                               };
> -                               rwfs  {
> -                                       reg = < 0x1c00000 0x400000 >;
> -                                       label = "rwfs";
> -                               };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index b7854e36f052..d1dc2ef1a162 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -24,7 +24,7 @@
>         flash@0 {
>                 status = "okay";
>                 m25p,fast-read;
> -#include "aspeed-bmc-mellanox-msn-flash-layout.dtsi"
> +#include "aspeed-bmc-opp-flash-layout.dtsi"
>         };
>  };
>
> --
> 2.11.0
>
