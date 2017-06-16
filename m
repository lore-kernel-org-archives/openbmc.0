Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpqCX0cMjzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 15:47:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SFdBfPbK"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id p198so1300760yba.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 22:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=y0zQvRRKS9nVJkvVRjBN2IZV+4SuAAx8pR4asVdvVLE=;
 b=SFdBfPbKiGc0br2J/d2NlElMTpHhbimRk+tXI34+u1w2iXbGmyzFXVrl1svs5BGdNL
 k2bXNFAldPNXxgBZnn13pzVVoqqOXGIeMWnQWze000aGP2XKN+UJ69gmK4l+ADdnDtjS
 bFPAgC/aknWmRHJRMGh2TDj1XyicpZaH8+ky9ZUwBwsaHdxQ9UL4k7Eek80tC2AVPKw+
 fcNNehvZbPtr/zIhQAr1P4ixqCO43/xBjC9pUtvIPW94z50+inj/KOJCbOs4p0CVNkVV
 CTietmvGomzJdP7pEp+hvIktNEBkk118ii/hoYXaLUwBmRZJClitNMhDne2BvBHj0K/B
 zgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=y0zQvRRKS9nVJkvVRjBN2IZV+4SuAAx8pR4asVdvVLE=;
 b=YsCgfSxwinML/jMvDdfg3QtmmrUNUrg52/C4MBjNlgIfpyyWc/r3pn/a1in+jELatL
 FFK7bfFxWtkPzq/pLQzxLQVU/xb8rA/qSkh+/g2O6wXuAYWaCkChg25S3s4HD7ppCLz7
 A57rzIUO24Vp/Akq9D5YrN8Zy+pqsAimxnc8WV0TydanCSeerGU5qUIq5toGBl4RkNea
 6fsbETG/YK7lr1rJFVesC/P6G9ptfUCFl2ERl+w3FhqBtmjxV6yNoKYu1/WS7U12M8IJ
 e9KXbqsRagwTOKq8JBu8uO1z0qzGT7D6nNtP+tEbYN39gREZUwq53ZvAiSuMlJnyTdD4
 Uakw==
X-Gm-Message-State: AKS2vOwgzAZXFcN/zZPnZTvvSrtF99DjABNlu+f6XrDdtc42GqDuMIld
 x3cUOXVWYL4J8IWbdXcwl2GTx1z9mA==
X-Received: by 10.37.88.193 with SMTP id m184mr6867875ybb.39.1497592070073;
 Thu, 15 Jun 2017 22:47:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 22:47:29 -0700 (PDT)
In-Reply-To: <20170607173400.46762-1-xow@google.com>
References: <20170607173400.46762-1-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:17:29 +0930
X-Google-Sender-Auth: Jv9_qp2AdX5quBTdY8sad4LNT0U
Message-ID: <CACPK8XdVmM8p6zkv=+6SpC5b3SLXSyLg=4HeqGkMBQX0yNTOJg@mail.gmail.com>
Subject: Re: [linux] ARM: dts: aspeed: zaius: Add aliases for I2C buses
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
X-List-Received-Date: Fri, 16 Jun 2017 05:47:52 -0000

Hey Xo,

For some reason I didn't get this mail from you. Luckily I saw it in patchwork.

On Thu, Jun 8, 2017 at 3:04 AM, Xo Wang <xow@google.com> wrote:
> Make numbering for I2C buses consistent across boots by assigning
> aliases to all the bus blocks in the peripheral, including the ones that
> are currently disabled. This way, Linux reserves bus numbers for buses
> that are disabled, instead of filling in those number gaps with logical
> I2C buses from muxes.

Thanks for the change. We already set these aliases in aspeed-g5.dtsi,
so you shouldn't need this patch.

Cheers,

Joel

>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 68baf3288263..353613344ea9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -9,6 +9,20 @@
>
>         aliases {
>                 serial4 = &uart5;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
>         };
>
>         chosen {
