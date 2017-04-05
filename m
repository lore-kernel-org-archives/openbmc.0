Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyY3V6T9jzDqH6
 for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2017 14:37:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O8wc2lpb"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id d191so129569ywe.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2017 21:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S04a3rogCvHZNlc6icrtD5A5/BI1FUxLFpI6232C4Fk=;
 b=O8wc2lpb1e6IqU31M49AXBUVKDpz6fAvqCcyHsSKEp39X9W4kvNEWLQ8FyW+m70CYt
 uwTS0PcWVKg/L9kvs+QDKfTDpNOQHpZZuNI4YTYjT67GrvV2mOHHwFohG3ZsCs49E4PH
 DeIcJMavJvWJ7iz6zxhFAobO4RiSR3Vmrb1pk8utOUBtw8qhEhEfQlfwiWqi4qsC+nqC
 QcZd1a8o8h2LDRqQwUkswBVJIsrzXozMp8mtFJsEh+X90jG6efr6oGLLL0hTcT4LFEAh
 MfNEeAZ2pZ2nAJm0rB8dMbDA3HndvDkim58r8Wdf70VfjzoD4Lu0pTURejGKDL8j+PTc
 66iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S04a3rogCvHZNlc6icrtD5A5/BI1FUxLFpI6232C4Fk=;
 b=NRNQ3d/By7QfQCNUSuXRUgJJNxSoI+e1Ap3WY805tyXdo6K14/iI4KPBjWiavi2iWS
 u+6PnjZkXSoq9ocB2fufOBJaJZabF+atu2jRZ60PscmWR7nQweylvYforsdIgf/aahtx
 0yNREB0yp96P5NmbgPwvMAGCdLzp5OuZq0BVu9eUWmdx3xqbOqtGoY2+9ITr42ZwEWUC
 5E0b4r6ziey8uPTvsMHCRdq4HceyPh3guEgvEJcNdzPRMev62qipDrLJNvGNj0nC1Vp2
 OqWqZIXrFnS4E+tv4Q4/zTzL3VLTPqORKwMK9CV/YL7yVvSCBk+pDEvQ1EIOV3wNHQTU
 eTeg==
X-Gm-Message-State: AFeK/H0giV2+bg+ZfikZOJ2VcJ2B1uKLb7GwBy+i0OiuIeIJH5ORR89cQGPNCsmdLDVT57gN63RboLhoOqkonw==
X-Received: by 10.129.73.65 with SMTP id w62mr17071087ywa.288.1491367044334;
 Tue, 04 Apr 2017 21:37:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.20.87 with HTTP; Tue, 4 Apr 2017 21:37:03 -0700 (PDT)
In-Reply-To: <20170404215329.14823-1-raltherr@google.com>
References: <20170404215329.14823-1-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2017 14:07:03 +0930
X-Google-Sender-Auth: ChPuojLGK-XxewpLWRJHqOZVRp4
Message-ID: <CACPK8XdzrTzMc0-bD6WgZDo+yLB=KguiWaMTp5mh4xS5vA0K-w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v1] dts: aspeed: Add hardware RNG to
 aspeed-g4 and aspeed-g5
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 04:37:27 -0000

Hi Rick,

I tried to apply this and got the following:

Applying patch #746973 using 'git am -s'
Description: [linux,dev-4.7,v1] dts: aspeed: Add hardware RNG to
aspeed-g4 and aspeed-g5
Applying: dts: aspeed: Add hardware RNG to aspeed-g4 and aspeed-g5
error: corrupt patch at line 42
Patch failed at 0001 dts: aspeed: Add hardware RNG to aspeed-g4 and aspeed-g5

Can you try sending again?

Cheers,

Joel

On Wed, Apr 5, 2017 at 7:23 AM, Rick Altherr <raltherr@google.com> wrote:
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>
>  arch/arm/boot/dts/aspeed-g4.dtsi |  6 ++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 12 ++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index e5be87076a6b..ee735e92c3d9 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -840,6 +840,12 @@
>                                 reg = <0x1e6e202c 0x4>;
>                         };
>
> +                       hwrng@1e6e2078 {
> +                               compatible = "timeriomem_rng";
> +                               reg = <0x1e6e2078 0x4>;
> +                               period = <1>;
> +                       };
> +
>                         adc: adc@1e6e9000 {
>                                 compatible = "aspeed,ast2400-adc";
>                                 reg = <0x1e6e9000 0xB0>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 48fd068251d6..4f29dcfcc134 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -1009,6 +1009,18 @@
>                                 reg = <0x1e6e202c 0x4>;
>                         };
>
> +                       hwrng@1e6e2078 {
> +                               compatible = "timeriomem_rng";
> +                               reg = <0x1e6e2078 0x4>;
> +                               period = <1>;
> +                       };
> +
>                         gfx: display@1e6e6000 {
>                                 compatible = "aspeed,ast2500-gfx", "syscon";
>                                 reg = <0x1e6e6000 0x1000>;
> --
> 2.12.2.715.g7642488e1d-goog
>
