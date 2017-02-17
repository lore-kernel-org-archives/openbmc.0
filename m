Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPf2B73mYzDqHW
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:41:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jc46rIGW"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id o65so1342582ybo.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=026rKbGWsa2yuvzwJ0eeR2gJQibPPk3Ue2BNC/dp5cg=;
 b=Jc46rIGWJt4JfT6YRX/lSeUZz1/aVygWQ1VaozKS1Y+YUiokPx6CQNV/VuAH6n8c45
 TLw17Bvw2XKJKfigMV9hF03M8c1wzw918EAyXo7iyXszk6QJWN5ZjKpAPhEnJ+wJBk+F
 Ee9iLUyrxarSETVVDnQJ77hPWHpRcbe2jv9VIfxCsEVxRd6wc+nkp8DnAJaq2g4iO3Sn
 0G3bZJ0DC8KZiGeQ9uhM+BqofJLkIEfapvSWQiO80M3OqCGMYsRGnkIetCmnVf8DV4+0
 kX4hr5c55xj7RpuQhHTTkCVvWmbswpLzr9ZqXuQ1Y94uIzHzrbZd/LO1SaUWEWGZ4nN3
 VMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=026rKbGWsa2yuvzwJ0eeR2gJQibPPk3Ue2BNC/dp5cg=;
 b=Mr163YHW7o9k42jab5TB7wonavlcamzBC30SSbAtK0iFAP9at2YXz8UBKlOU0UOX6Y
 VGeDtjFyOvdWlEyiroL7+xSZWX1mvNww1ieT/ox9mhsyW4EY5HMtUxFgBECXqIz9R9in
 Ga+oSuik3HO9yl00P8PCv8GwUXqOILUMFQWkNogYA77yearRSedbIFE/IUgqmIq3mfzX
 8WxYZJWITFAXnSVTO87lf+GCqR7WcFcIlY3CS00+RYqj/qkvL6Pdz++bscIRREP74lbE
 +1fMFeWIQBVeOF80AiAP02Fb5q3O0wgZNakh2knNmoyfDKhhIh9eiEmnA0rXTZKoFGdt
 PIAg==
X-Gm-Message-State: AMke39kIunRED/lD3i9JgtXf/6VfMT0BTq9MIU08kbwvXddadR2Q1qHjs2Zi93pElrN7Ut0WB8LikQ8QKsUYoA==
X-Received: by 10.37.194.5 with SMTP id s5mr3982742ybf.136.1487302864858; Thu,
 16 Feb 2017 19:41:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 19:40:44 -0800 (PST)
In-Reply-To: <CAPLgG=kFuyyZoX=g4_sZQgMG=r+dk-AjKADYBof0mwhH8Q5JZQ@mail.gmail.com>
References: <20170217031230.12800-1-cyrilbur@gmail.com>
 <CAPLgG==cyh05UMqj3VD1cTjQX9ycuG36ECGumT84MKo5sO+MAg@mail.gmail.com>
 <CAPLgG=kMbxDs32dw6uGwabVsGevv5w7g42E+KtHERToowM5HKg@mail.gmail.com>
 <CAPLgG=kFuyyZoX=g4_sZQgMG=r+dk-AjKADYBof0mwhH8Q5JZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 14:10:44 +1030
X-Google-Sender-Auth: wTD9bNAxFqGdi7qFDx-ZMMrW-b0
Message-ID: <CACPK8XfUiToyMDdP0+SzpJrtxJg+6tnk1Jp-ZShmr2-P99VDgg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
To: Rick Altherr <raltherr@google.com>
Cc: Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 03:41:07 -0000

On Fri, Feb 17, 2017 at 2:03 PM, Rick Altherr <raltherr@google.com> wrote:
> Current Zaius and Barreleye G2 boards have AST2500 which has VGA support.
> Google hasn't tried the VGA but it is there. We plan to switch to 2520 later
> for our own designs but it's only a BOM option to switch between the two.

I think detecting the board revision GPIOs in u-boot and performing a
fixup of the device tree is a good way to handle these kind of things.

Perhaps we will end up having different device trees if the systems
end up with vastly different configurations, or configs that aren't
detectable from software.


>
> On Feb 16, 2017 7:15 PM, "Cyril Bur" <cyrilbur@gmail.com> wrote:
>
> Zaius platform doesn't use VGA so don't reserve that memory
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> v2: Drop reserving the framebuffer on Zaius
>     Both platforms have 1GB not 512MB - adjust numbers
>     Add comment requested by Joel.
>
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 15 +++++++++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 12 ++++++++++--
>  2 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4b2d8aa8abb6..b79cadb2f6d7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -25,9 +25,20 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               /*
> +                * The addreses for the flash_memory reserved range are the
> +                * highest allowable for the size of the mapping (ie, the
> +                * address has no set bits greater than the size)
> +                */
> +
> +               flash_memory: region@b8000000 {
> +                       no-map;
> +                       reg = <0xb8000000 0x04000000>; /* 64M */
> +               };
> +
> +               vga_memory: framebuffer@bc000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0xbc000000 0x04000000>; /* 64M */
>                 };
>         };
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e1c9b3f4fe44..5a06da43801b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -25,10 +25,18 @@
>                 #size-cells = <1>;
>                 ranges;
>
> -               flash_memory: region@94000000 {
> +               /*
> +                * The addreses for the flash_memory reserved range are the
> +                * highest allowable for the size of the mapping (ie, the
> +                * address has no set bits greater than the size)
> +                */
> +
> +               flash_memory: region@bc000000 {
>                         no-map;
> -                       reg = <0x94000000 0x04000000>; /* 64M */
> +                       reg = <0xbc000000 0x04000000>; /* 64M */
>                 };
> +
> +               /* Zaius doesn't use VGA so don't reserve VGA buffer */
>         };
>
>         onewire0 {
> --
> 2.11.1
>
>
