Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wy9hm06RjzDr3R
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 15:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CjqM29lt"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id 84so2183896ybe.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2+WFTHHUvausNU+fR4VTpfzjdM/6szfSfNa7P5hOhmQ=;
 b=CjqM29ltHggrCuPBb4i8LvTQYoEZ5JSo6zvtBb5PnPpaoiAL968XgoTu4MOsR2253K
 Ja7eH8paPNYQvk8iS7jZiXQ6JGpMnT+Lzsol9AB8Ugva8gz1PjYXsWreUE2HZ4ijTukH
 NORXGo/Jq/ZdogA/vbjozLEKCROKzrvIIcbDVQw/VjHRTlN91oswE7UgVhcLGeGLGSdt
 j4d6pfaPp+D1R3yladHN6nJ7g+sSyIiv6TYrKZdrQcm8Ly5kbvK4cVyBp5GvJm/XwpXU
 rzPU3GGLg90u5GBMl42CGRxOvCra4xr1P+dOGGELzNRHuZ9BmfoA5Kj1w2PjVl+ZGjXm
 Dgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2+WFTHHUvausNU+fR4VTpfzjdM/6szfSfNa7P5hOhmQ=;
 b=bHWRIJxsIKkfAmn1iwyQLyP6erZnGMGF9ENJAJIU9T9waDC4OeEHinelcbQaibuyM/
 TPihF8z6xY/mSdR9EkmfiQ7y6rrEvMDMGky4hyuvHDcejuDHVTkbJDARIe05sQ/Ryo5o
 cAfCYUlXIIHRzbqqc9haMd93ik1Et4nIRyMEfmneCHw6rm4hTRyNqTmbBmyqmDCcsyCb
 /9RhJb6qIL2ijxwQwpBHP7PM4Ff/BMN4eWuMrpxAbyme9O8BslgVMNAPCF9vWGa+nzGi
 +jy9pvuUmGvn5woOu+sngbiZzGS2OSTrjJlx/k3jE1bgAfQipLsjxjhEDj++ikgG/0fe
 J8ZQ==
X-Gm-Message-State: AKS2vOx8P2VMPIykx2DBs1beaT/rGgeBLa6uSgdfIcjZLuy7y0TEYCwL
 RlAwdtHxVG5q6lRhHtRkgmhLZPNxZQ==
X-Received: by 10.37.183.6 with SMTP id t6mr6443635ybj.221.1498626309688; Tue,
 27 Jun 2017 22:05:09 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Tue, 27 Jun 2017 22:04:49 -0700 (PDT)
In-Reply-To: <20170627005550.59771-1-xow@google.com>
References: <20170627005550.59771-1-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Jun 2017 14:34:49 +0930
X-Google-Sender-Auth: 6DoMaef7wQQfhDG7-KOVXXZjIYk
Message-ID: <CACPK8XeM7HyHqyQkO6Sdt-808H0LBjj=PhmMzKE_1dQunf_p8g@mail.gmail.com>
Subject: Re: [linux,4.10] ARM: aspeed: zaius: Fix FSI GPIO mapping matching
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 28 Jun 2017 05:05:12 -0000

Hi Xo,

On Tue, Jun 27, 2017 at 10:25 AM, Xo Wang <xow@google.com> wrote:
> Zaius changes FSI GPIO mappings dynamically based on board revision
> fuses. The GPIO lookup tables used matches the FSI device tree node name
> that is used prior to a3f0f300d74d05977a21a6941979414a78360d89. Now they
> no longer work as intended to configure the FSI driver.

Owch. It's unfortunate that it can't be done based on the compatible,
but I guess that could go wrong where there are multiple nodes with
the same string.

>
> Update the lookup table device name match string.
>
> Signed-off-by: Xo Wang <xow@google.com>

Doh, this didn't make it to my inbox :( Found the patch in patchwork
and applied to dev-4.10.

Please ping me on irc if you think I'm missing any of your mail.

Cheers,

Joel

> ---
>  arch/arm/mach-aspeed/aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 32eb36183e92..420a8d0344da 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -138,7 +138,7 @@ static void __init do_zaius_setup(void)
>         /* EVT boards have different FSI pin mappings */
>         if (board_rev < 0x08) {
>                 static struct gpiod_lookup_table fsi_evt_gpio_lookup = {
> -                       .dev_id = "fsi-master",
> +                       .dev_id = "gpio-fsi",
>                         .table = {
>                                 GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 3),
>                                             "clock", GPIO_ACTIVE_HIGH),
> @@ -150,7 +150,7 @@ static void __init do_zaius_setup(void)
>                 gpiod_add_lookup_table(&fsi_evt_gpio_lookup);
>         } else {
>                 static struct gpiod_lookup_table fsi_gpio_lookup = {
> -                       .dev_id = "fsi-master",
> +                       .dev_id = "gpio-fsi",
>                         .table = {
>                                 GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 0),
>                                             "clock", GPIO_ACTIVE_HIGH),
