Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ofhHE1ir"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nbcjyj82"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WgTM1J2TzDqyL
 for <openbmc@lists.ozlabs.org>; Thu, 26 Apr 2018 12:08:22 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id s2-v6so29568227qti.2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 19:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wp8KV3TkQNkvR75l2N6B2eB+IiIHpXofIMehHmdCx0c=;
 b=ofhHE1irsc2WNZUeF/lbYlYU+kloGc4dPMAvTrsHsiC5dNIgHuCjryqiIWEO85y07U
 sxwZB40imKNfyms+qIxyF+KdChpSiZtQWzXmRIV1m8fWxba4RTKgyNEyroyJq1NmTs1+
 kZkzzjUsxPkoVoKrykAiNZ5pwEfouPW488PYH87sHcYTOWZXaq5jmSHZ4TAfGEq3qZbt
 CzjZaA2Fqi44HqzDFgRaTj5RF/5+QxeuIwwott2oh8dwvy7GLOh+smPiOxsTpw9tjlbA
 vvFYFkm54DRSakOpJo/IlBll3v9be++uEH6XyR0c3iMDEkVk3qx+O3bAdn/nV/NfoIe9
 tREg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wp8KV3TkQNkvR75l2N6B2eB+IiIHpXofIMehHmdCx0c=;
 b=nbcjyj82NEpkxZMvekinSSlO1qL6SPK6Q/YUV9hgiQfajmmduzLmOW/qcbo3hHmT4W
 k2gq8QcxYwwkN/YAUrRpgMbn4k3lAY4Y2LCiBsnEUV2eGTDRLHlo7c8uWgVJFSMWJTVS
 uVs99gPASL7urWiBNYKJx0pZhP36giVrEOVdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=wp8KV3TkQNkvR75l2N6B2eB+IiIHpXofIMehHmdCx0c=;
 b=RDC2qlBgddid8pqeRXmXpb9OgV53nov6W3dLd25lv2qBg6T0Ep292HNukHRQLMVp8A
 doUPyecvHLNVYWc86eIYrylKTbhS1HEtYZJniYI6OwIZWQW5w0qB0Dgn/6O1dp129e1y
 b+vO6mLF91vLyJwonWgp/h9AhFP82qhWbhAnNn6bOb6jmTCBCp3lBjbcSVdPvs1BK4Ki
 MbMzupbBsjtEvYF9oBb1KCEvKb1fvS8/vUAhhIZ5TnoKkf7BaXFekbzy265zyvGVKH+6
 MODvU6GlFGcxQT/DqmMOyoIRboRRIvpwsqnpZb0Juc4uuFU+fD7QJo+ZTg54yETX9IGb
 RyHA==
X-Gm-Message-State: ALQs6tDTfm1M2OSZ89AB45rRGAvk1qrNSdTnwM0Q6HbyvstmHHtuLGbj
 /c8jt2SgSi1J6A4jADeV/is1A2gKowfwmLLFj4Pm1w==
X-Google-Smtp-Source: AB8JxZoW1uePuGkJLHNg/Exm0mOuiXetxIOmGt/Biw7xr0ousJRkhPpOKe3hkgLg+X34DfyXvu763oC5ZQlDj5hO6c8=
X-Received: by 2002:aed:3031:: with SMTP id
 46-v6mr5047073qte.340.1524708499444; 
 Wed, 25 Apr 2018 19:08:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 25 Apr 2018 19:07:59 -0700 (PDT)
In-Reply-To: <20180426013746.27256-1-joel@jms.id.au>
References: <20180426013746.27256-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Apr 2018 11:37:59 +0930
X-Google-Sender-Auth: 8fJXPL5qKnpE7MWO-6Y3d20q6ug
Message-ID: <CACPK8Xet68CF+kRD=_pJ+L=0WtGasmUJQXFhddFHfCvyKUrLqQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] ARM: dts: romulus: Enable the GFX IP
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2018 02:08:23 -0000

On 26 April 2018 at 11:07, Joel Stanley <joel@jms.id.au> wrote:
> The GFX controller is the internal graphics device used by the SoC
> (opposed to the one connected via the PCIe device and used by the host).
>
> This configures it with a framebuffer region and adds it to the command
> line so kernel boot messages appear on the display.

This commit message is incorrect; it does not add the command line option.

I'll send a v2.

Cheers,

Joel

>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 00812a2fecf0..d746e562e8fd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -30,6 +30,13 @@
>                         no-map;
>                         reg = <0x98000000 0x04000000>; /* 64M */
>                 };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
>         };
>
>         leds {
> @@ -280,3 +287,8 @@
>  &ibt {
>         status = "okay";
>  };
> +
> +&gfx {
> +     status = "okay";
> +     memory-region = <&gfx_memory>;
> +};
> --
> 2.17.0
>
