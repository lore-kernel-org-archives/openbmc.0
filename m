Return-Path: <raltherr@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::22a; helo=mail-ua0-x22a.google.com;
 envelope-from=raltherr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="m2SsIEEX"; 
 dkim-atps=neutral
Received: from mail-ua0-x22a.google.com (mail-ua0-x22a.google.com
 [IPv6:2607:f8b0:400c:c08::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyfsW1YT5zDqT0
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 00:59:43 +1000 (AEST)
Received: by mail-ua0-x22a.google.com with SMTP id 72so3759642uas.8
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 07:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/Qs7M/GnXj9vsudJGkFPybd8AgRN1pFPvbAsk/lGfWU=;
 b=m2SsIEEXu80CSvB5dik0AYQQLF1BULnF9KvtvBbx47cNFY6jCe9B5TNjuSidjnZQPa
 xWkUj7RG/dkGZP5HnOnkpkHjwVAxGwiqMxcepLzwTROfK6I1MV25mrx+Ex5Nmdou8JhV
 5SKdqs9LZG68uHfpc9S6IrulZJvJwOy2f2+R5QKp83UIBcoTPAdC4Gze9ruhXeHItcLH
 teJ9zCepRAT6EMZjhiJmWMzXAaudL4j6MEaCPcud0zTJy3hufR9b10d3tfXPrEZTfVx+
 bs9CkWOjQP/jJosRPvRS9SR2SbaCD8p+ABuETDt1lbTRWXccLfyW1USJP7mF+CSLd6y9
 IVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/Qs7M/GnXj9vsudJGkFPybd8AgRN1pFPvbAsk/lGfWU=;
 b=DZoc7JWkgVo/jSj63CYK/E58skpz1WbYr3hdwB2DXK//mIIKl+eaorpMv9KnXrlqxa
 0j8ONO8JeuhY/yinasOyD1KtgoGFGuJZ7y6feSqPk4B6BzBfWFrd7dxZhe2Iv19fXrpN
 vrQFKbsmFF8J1xMu1AUIZZw+1hMTLWwDuAIZ36LSPwRQOeQBjRHCek7zbZLkVyvm9Cj+
 ygODVHv3mk2pTNPoUhnTzVp6dqKCMLMwsFckZoUwzpi61Jak77Wmjg6E4CF37WwYOofw
 D5Mxo08y66tyTntw77GoZ8NvyKFeA2Qtfl4Chb0cvRV/rSoxk6SLL+gWTLiGFwXnDtKn
 izkw==
X-Gm-Message-State: AHPjjUi/Kh0oDrnpyZGmlNRW10PNi18i/DtzZNapvxAmgIA2lOpO9Qx2
 N1zyzTJac5UHBXHMP/7EsQIP5coIVb0Vye8EtccHHQ==
X-Google-Smtp-Source: AOwi7QCtLftbvQBweatPAebgUu4WkJP+Q85LSDokfqmEY04How9zskTzlBH1ZpteU2/f2u+tDvmgtKwsL5iHi9XkNqs=
X-Received: by 10.176.21.136 with SMTP id i8mr2244784uae.142.1506005980452;
 Thu, 21 Sep 2017 07:59:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.135.142 with HTTP; Thu, 21 Sep 2017 07:59:39 -0700 (PDT)
In-Reply-To: <20170921062328.9256-1-joel@jms.id.au>
References: <20170921062328.9256-1-joel@jms.id.au>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 21 Sep 2017 07:59:39 -0700
Message-ID: <CAPLgG=mia_r-QnDzJsXkyaV6moqK4-bkBW_yQ=jzLnOW+F+rgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed-g4: Fix timeriomem_rng
 probing
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 14:59:43 -0000

Is this superseded by the later patch that change syscon to include a
ranges property?

On Wed, Sep 20, 2017 at 11:23 PM, Joel Stanley <joel@jms.id.au> wrote:
> When booting we see this error:
>
>  timeriomem_rng 1e6e2000.syscon:hwrng@1e6e2078: timeriomem_rng: resource is missing
>
> Moving the timeriomem_rng node outside of the syscon fixes the issue.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index a83b6a8d73d4..38aadbf09be2 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -195,18 +195,18 @@
>                                         reg = <0x2c>;
>                                 };
>
> -                               hwrng@1e6e2078 {
> -                                       compatible = "timeriomem_rng";
> -                                       reg = <0x1e6e2078 0x4>;
> -                                       period = <1>;
> -                                       quality = <100>;
> -                               };
> -
>                                 pinctrl: pinctrl@1e6e2000 {
>                                         compatible = "aspeed,g4-pinctrl";
>                                 };
>                         };
>
> +                       hwrng@1e6e2078 {
> +                               compatible = "timeriomem_rng";
> +                               reg = <0x1e6e2078 0x4>;
> +                               period = <1>;
> +                               quality = <100>;
> +                       };
> +
>                         adc: adc@1e6e9000 {
>                                 compatible = "aspeed,ast2400-adc";
>                                 reg = <0x1e6e9000 0xB0>;
> --
> 2.14.1
>
