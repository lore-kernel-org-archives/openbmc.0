Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPhfG6FCPzDqBs
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:39:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kOMJRWs4"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id l16so2656587ywb.2
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 21:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DXul+l9Nbl3FPHH+JfiaErKxkKllylHXCETh4+ySStg=;
 b=kOMJRWs4Frr38eZgTH6hRIKSKpwmQgHOh/JD9Ii0+HjlRWVK4Q0zJSnzv95iMXQaPb
 X2rWCmuD4arV4y4+kYO0XjcY97LBh5U2SpzAGV6g/GPh3nfJI2mFSf6RAX6e+BIbu2ge
 32ELelklEbUOlyPsqes+XS0ajyQ46vaYXKe9fxu3V63WPYzwt8+6c7QdXmtnN8C/Bpuz
 2aYp0Vpa/Z6JlHvIHiazEZJ3WrBfhARmVkA4YZx6hZp0XYH+0VI+yoSMfsE2LRhh4GLA
 Og37Vs9FRoporyLBi4i2TvT9TmsXt0iy4nnaSoWdVGMA3i5l4DgZs8D2hPJ3KBYO2CYF
 YkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DXul+l9Nbl3FPHH+JfiaErKxkKllylHXCETh4+ySStg=;
 b=JszwK8dO9xcFMj0dLHl6Hm4/KrnRxi7ZTTee2iz/v9fsFsy/ErS5Jx7EZnPJdu4alU
 FrVbqLwo4BQ4ZFEi9IhJAGu3/p7UjwgASF5F1PqrWcWMkRRRcOHp4elDMJFP2gLWdXx2
 ce2Se2CFG6w4eF9IsV/TSHzv+yt/Yl+4P+iO6aNMRcNzS1DUdRM0orJxZ99XZKQF1ec+
 P4lZToyBXpTuRHyjhqI+TaihIOwhpjlzQ9aS2iHtYvmJetNnDBMCBE086OKY5HTcdEpK
 aUrPb6l/AdqPRNmOvXulBIWYMzMsXV5KdOFbSA+S/4THtYcYLmPdCStNiyo0ynb2h7r/
 X2qQ==
X-Gm-Message-State: AMke39nArTgXnwDQocIaif1MFZt+2fuOso7HZNnCRPPv8E4olfO7b4QZyOK4lEOYLKw5aVEvNYAjsmBH6DveYA==
X-Received: by 10.129.116.4 with SMTP id p4mr5118710ywc.268.1487309940611;
 Thu, 16 Feb 2017 21:39:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 21:38:40 -0800 (PST)
In-Reply-To: <20170217031230.12800-1-cyrilbur@gmail.com>
References: <20170217031230.12800-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 16:08:40 +1030
X-Google-Sender-Auth: Ok9g9rCGxfeW1pXk0EZjXiaSwig
Message-ID: <CACPK8Xf+zOPxWspzy+LUTnqHOW2CBpyJqeCAY9t6tRWq+q0Q=A@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Update reserved memory nodes for
 zaius and witherspoon
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Fri, 17 Feb 2017 05:39:03 -0000

On Fri, Feb 17, 2017 at 1:42 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Zaius platform doesn't use VGA so don't reserve that memory
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> v2: Drop reserving the framebuffer on Zaius
>     Both platforms have 1GB not 512MB - adjust numbers

Witherspoon has 512MB of DDR. I think Lei was trying to point out that
the memory node needed fixing.

(The pass1 BMC boards for Witherspoon did have 1GB, but it was changed
to 512MB. As far as I know we got rid of the pass1 boards so we only
need to support 512MB systems).

Cheers,

Joel


>     Add comment requested by Joel.
>
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 15 +++++++++++++--
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 12 ++++++++++--
>  2 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
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
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
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
