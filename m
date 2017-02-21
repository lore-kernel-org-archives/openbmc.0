Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSBGB6vrXzDqBV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 18:00:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xch0ysxr"; 
 dkim-atps=neutral
Received: by mail-qk0-x241.google.com with SMTP id x71so8183558qkb.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 23:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=IFKg4baW5a9WMVBqi7Bl8qngL5WKlvpB82Tnh9wKKM4=;
 b=Xch0ysxro3Y5U9BBFI//wHOGjtu54Ee1enSife45Dyq6PQjWt44nSk1x8XVnxiV7xb
 mqJU6+3Om1zHOOehvYKzdJnnD9+taNAjiSo8OboXB+E8BgByKo4FlrkdaMDRpvi3rGWE
 8F3r8y7BmMT0m8IgD56QyHM1TKNHTrYgQEAl34ujDxNr/K5sc1Mr/W0fkDbxA/RD/NwV
 hdM0D+pfllmlXH1LnMUmMXj9iCBhhxSBr0gOlPEnCcHO4148Lqpkfp20Di7zdrASDNzt
 H2BLt1Tr32gfxX7rJfMbjaLjn8c/9gLliYDwCqNjt1BtCG0o0L2oOfHtWf00R7lMUrVV
 VY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=IFKg4baW5a9WMVBqi7Bl8qngL5WKlvpB82Tnh9wKKM4=;
 b=mLR8Oczq9AffHmi1g9kmxZpPZqe5c+jCCP/IxEyeqBufx0Ca8Pc5Im1H9laPBAPhZM
 WGe3FJROnhKqgBDjA9OmRQihjLnWGYPNCeSU+EZMoBZlXAlU2SJbhjBFuj+gJqTSzznV
 2sP1D0kVMmM16QE9M8YgdWupJt3m2HYdn9q8prtPR4VseT4mDxBjrXCP/rTZA8vbbeaW
 5PiEHE1m1zoBfNoeaXtImzMbda5AKeWaXcjRqYNLHOfClnA7ybPdOXEwJxx0lwAeNZ2B
 MgL+EfvqiCfHglLpe4iJwSQw45DgoVztDjxjn+qKnx2wsYvWCNfjYO3GpERk9bY3f4JT
 MBlg==
X-Gm-Message-State: AMke39mIXgXi3fA4NExD1YqkV5Th7tD1z04n11x0CeWq0qVPqi1Xhlhmsr+CM+xikgMmaJoJGuWvf9+zPny0TA==
X-Received: by 10.55.210.135 with SMTP id f129mr22387124qkj.184.1487660416747; 
 Mon, 20 Feb 2017 23:00:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Mon, 20 Feb 2017 23:00:16 -0800 (PST)
In-Reply-To: <20170221051259.18383-1-joel@jms.id.au>
References: <20170221051259.18383-1-joel@jms.id.au>
From: Mine <mine260309@gmail.com>
Date: Tue, 21 Feb 2017 15:00:16 +0800
Message-ID: <CAARXrt=B9UiGqNcRxhrnetRo6fAA3mYG+acOf71sovJxXVBauQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] ARM: dts: aspeed: Fix RAM size in
 Romulus and Witherspoon
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>,
 Xo Wang <xow@google.com>
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
X-List-Received-Date: Tue, 21 Feb 2017 07:00:19 -0000

Acked-by: Lei YU <mine260309@gmail.com>

I think Zaius uses 512MiB RAM as well.
Xo Wang could you help to confirm?

On Tue, Feb 21, 2017 at 1:12 PM, Joel Stanley <joel@jms.id.au> wrote:
> They both contain 512M of RAM. Early bringup Witherspoons did have 1G,
> but all machines we are using now have 512M.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 85e545110be6..58baf87454e2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -17,7 +17,7 @@
>         };
>
>         memory {
> -               reg = <0x80000000 0x40000000>;
> +               reg = <0x80000000 0x20000000>;
>         };
>
>         fsi-master {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 4b2d8aa8abb6..2cbdeba88908 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -17,7 +17,7 @@
>         };
>
>         memory {
> -               reg = <0x80000000 0x40000000>;
> +               reg = <0x80000000 0x20000000>;
>         };
>
>         reserved-memory {
> --
> 2.11.0
>
