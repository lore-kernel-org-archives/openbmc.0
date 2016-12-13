Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td1FQ30yMzDvhs
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 11:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="xmAQeCpJ"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 12so10305734uas.3
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=izRAnR0L9bFxyfTuhbFdlqQtPLZfT87K5PFZ0H5g0SE=;
 b=xmAQeCpJ1i+dExZwo8Ngjz5wsvts43iAIy674uWoa3p0P8rtBSLSgr14iltOnTflDf
 YRz4o3Swsblero9D/Kg8OZe9rR4+M1CfjeLIRGy2fzE9mVty0XEAUdf1OAGtDlzegJF+
 vkIYxYLtA4Kkex7U0EaIeejWVW22+c0po+Q+HWmtK3et0CEfKc8v3i7kX+ge7Vam2rMb
 co5y1weaBSC1Eu8RJZ135NVXZx3BSkjfjOiaFkDR0WWhlFgv349ThRNvo49mhUF227H2
 USz4p+Ybmhbzvs1+mKx4pQ+e8DSQ959lgs6lxrAdx6wuxH4Xv4M2QekZqS54RI0VFVE1
 gMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=izRAnR0L9bFxyfTuhbFdlqQtPLZfT87K5PFZ0H5g0SE=;
 b=fgAjJI979J4JCIt0ISRVO4LENjeWjwQ4pYIwJLYcncoT7e9VEW/PQwNt9eAEuscdqw
 FrYxQOJrTBMhjDpW9F5gQBm9ZkJ05utwKF99sUIv2enOJCgAb4YeRa6yl4Q6OjoDJEn6
 DGzBhKWpkQ/0rGigeTbADoheRr/ZSSGSct8y8zgYow7ch7wMQnA+qasEQZFl6X8U95/B
 ViL1/WRC9NNEUh6bBCYwjGKYNvWSSZtyzl4A8OBW97tUo/1hDRFcPF7Dw6qFFKYa1mee
 x0gk0AoIFd4EXHMsDXM19c7mqoTyRW66HDOT85sR7wyKLyyj8m9Kwv6r3zY6OpxAHSra
 88ow==
X-Gm-Message-State: AKaTC01heVZY/ytxwdjHV4vnGyTtyChjRQ6qlMwLg6+fXDy924JQOVBXVGKyWfYTv+gCLdx75gtwMq7tLH9IAg==
X-Received: by 10.176.82.118 with SMTP id j51mr75661997uaa.161.1481589896266; 
 Mon, 12 Dec 2016 16:44:56 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Mon, 12 Dec 2016 16:44:35 -0800 (PST)
In-Reply-To: <20161209054323.7320-2-cyrilbur@gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-2-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 11:44:35 +1100
X-Google-Sender-Auth: SF2I7qXmN1vbAREoMCS7ddMzVHU
Message-ID: <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
Subject: Re: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
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
X-List-Received-Date: Tue, 13 Dec 2016 00:44:59 -0000

Hi Cyril,

On Fri, Dec 9, 2016 at 4:43 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Palmettos have 512mb of ram. There is always framebuffer memory at the
> top of ram.
>
> This patch also reserves BMC ram for host to BMC communication.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 25 ++++++++++++++++++++++++-
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  6 ++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index acaceda2..e810ae7 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -17,7 +17,30 @@
>         };
>
>         memory {
> -               reg = <0x40000000 0x10000000>;
> +               reg = <0x40000000 0x20000000>;
> +       };

Can you send this in a separate patch? It should go into the tree now.

> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells= <1>;
> +               ranges;
> +
> +               flash_mem: region@52000000 {
> +                       compatible = "aspeed,lpc-ctrl";
> +                       no-map;
> +                       reg = <0x54000000 0x04000000>; /* 64m */
> +               };
> +
> +               fb_mem: framebuffer@5f000000 {
> +                       no-map;
> +                       reg = <0x5f000000 0x01000000>; /* 16m */
> +               };

This should be a separate patch too, which we can take straight away.

> +       };
> +
> +       flash_buffer {

It's convention to put the reg value after @ in the node name:

  flash_buffer@1e789000

> +               compatible = "aspeed,lpc-ctrl";

Upstream demands we put the SoC in the compatible string

 aspeed,ast2400-lpc-ctrl.

> +               memory-region = <&flash_mem>;
> +               reg = <0x1e789000 8>;

Make the second cell be 0x8 for consistency.

>         };

> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -870,6 +870,12 @@
>                                 interrupts = <8>;
>                         };
>
> +                       mbox: mbox@1e789200 {
> +                               compatible = "aspeed,mbox-host";

aspeed,ast2400-mbox-host

Not sure on the name here.

> +                               reg = <0x1e789200 0x5c>;
> +                               interrupts = <46>;
> +                       };
> +
>                         wdt1: wdt@1e785000 {
>                                 compatible = "aspeed,ast2400-wdt";
>                                 reg = <0x1e785000 0x1c>;
> --
> 2.10.2
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
