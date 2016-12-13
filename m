Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td7JN6p9FzDvkV
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 16:17:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nTzGxcLD"; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id w194so5532407vkw.3
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 21:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Erkr5ZAWz2kdimDBVpMqyaKVV/GXJ3/FE5kQR2DDQqA=;
 b=nTzGxcLDFfi2WoCoVBajf8tuhTQJar9s5s3ha7B7XpYENvqVUu2455DasIyMTH7WXJ
 J4vjJdqYoLh90pMjpeHb/5Sgfiv1Z05Fqjm1JmM9pO64UuFQ/D5ra87FI4WW5PrfeHTW
 4bFXQEsCJz2WzLLohhjDnLv52ZXjA9+C0xxqefU/ZlZVRVuPjK36YOzXAiuB/mUxaXMC
 9ES51npzdu5hm+gXthVkRmc7Y4qJ1L8T4Kx2gyvMiHSfqTh1NLjno6EjaG9j5cV9Jhf7
 VYApZVz3B6e557ez2MPoeyi6PhB14HeLTANwmjA74W8EA3U/wQHwJDNDX9H4LbA7hkTY
 kN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Erkr5ZAWz2kdimDBVpMqyaKVV/GXJ3/FE5kQR2DDQqA=;
 b=TKMVsQfCPxB85YHXE7N2nj3u1ywJIQWoAoeoHNaElq7ufacwkZMWSzKU3oYbF7Ep6I
 WfZ4uR1J0oVwO5aElZgiBK9Qi4tHC6gg+0r14V84Y03y9b6o/Z33WPSJBFi+UoSDVPBA
 uVqckLbAO08CcjX5tq0MGbDyE4t5kDgf3D5FEiZIM8PxH2lwaAWFSn3fOHxhPIL8Kp9z
 ccLQQpuSP22LlHTBB99yrvP1m8nhUcqfukB+3ugSk7awACIkGdj7IyYSjVLFSQkxHQRU
 FI1zfm2QAqXisseD3R8uY8a61UXNqc3nrlKX5V+T9yWVgHCgzdC420owifWvQnFxXIKz
 RBNg==
X-Gm-Message-State: AKaTC02N65TmLMyW5gxBuWy+2avamfn95Nus00IB2wtiefTrWu7ZbdkYO55rP73mwkJJIIdch1V3fQ0FQDEi9Q==
X-Received: by 10.31.52.145 with SMTP id b139mr33475573vka.151.1481606274757; 
 Mon, 12 Dec 2016 21:17:54 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 21:17:34 -0800 (PST)
In-Reply-To: <20161213045623.1542-1-cyrilbur@gmail.com>
References: <20161213045623.1542-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 15:47:34 +1030
X-Google-Sender-Auth: 3_XAhENSpYOrcHLjxInxnP2PNcw
Message-ID: <CACPK8XeEPJQjLOktSsgR29XgxwRWV_vpwVeVxWE_rn9=Kn0jWA@mail.gmail.com>
Subject: Re: [PATCH linux 1/2] ARM: dts: aspeed: Set correct memory size for
 2400 based opp platforms
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 13 Dec 2016 05:17:57 -0000

On Tue, Dec 13, 2016 at 3:26 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> These platforms all have 512MB of memory as opposed to the previously
> thought 256MB.
>
> Update the device trees accordingly
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Thanks. I tweaked the commit message a little and applied to dev-4.7
as 580004c1267c90ff4a3c82d7c970e93609ae28ed.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts  | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 802ce95..353033b 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -17,7 +17,7 @@
>         };
>
>         memory {
> -               reg = <0x40000000 0x10000000>;
> +               reg = <0x40000000 0x20000000>;
>         };
>
>         ahb {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 005ff89..ee7b569 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -21,7 +21,7 @@
>         };
>
>         memory {
> -               reg = < 0x40000000 0x10000000 >;
> +               reg = <0x40000000 0x20000000>;
>         };
>
>         leds {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 92b29d1..3f3fd1f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -17,7 +17,7 @@
>         };
>
>         memory {
> -               reg = < 0x40000000 0x10000000 >;
> +               reg = <0x40000000 0x20000000>;
>         };
>
>         ahb {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index acaceda2..816c004 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -17,7 +17,7 @@
>         };
>
>         memory {
> -               reg = <0x40000000 0x10000000>;
> +               reg = <0x40000000 0x20000000>;
>         };
>
>          leds {
> --
> 2.10.2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
