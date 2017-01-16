Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v1zvR0YqYzDqQH
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 14:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ecpuym5H"; 
 dkim-atps=neutral
Received: by mail-ot0-x242.google.com with SMTP id 36so5511317otx.3
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 19:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=41xwqwEuUO6kIoETZ+fBPMzcmxHGoEMIzJKdQ/N08tY=;
 b=Ecpuym5H2UVlqP9RDAI36OEyWp80Ogezolmjkl32sGFxLfYt8g7ChNym/2jExSBdaK
 /V4NfY4ZDP5c3OCqhN1UbJFw/SAdMGT3vFOXNODBLXw+2GMdINmext0RmJbCygUadWP8
 PWbTGIM76mpeIgDK88Q5sK58MtPOiee8fapx+/XxKsOKPrZb0j4UdvMCw6mTmZXbV2az
 P2kF43R3uOTTCoPZIXoYl8nv8G162m1F5IlngaJdccNedkXHzP2o0/gynHWl2XexDsde
 47U3KAUwmOeM0l9l7nlY4gvTt1tBBsDNEO81HhL+4b+yLFGl9xHWtyeRCDH18spluB6f
 xkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=41xwqwEuUO6kIoETZ+fBPMzcmxHGoEMIzJKdQ/N08tY=;
 b=iknA2e0FvnRBk40Abbta9JeC1SJueJkr0QrmN0TCa7YKbRYG87dgxeTOz7dtan4WM2
 f5zbhRL7wWVy8lcd8+HwlGZPdCNQUE/MfwXXPKcuXVc1s4TgU5CR0hm0szgS+zCC3Iui
 66mMuubwCB6L+uG9whpqGXAmozpK7XsLhkpPZ8GIOoOzBVUVIICvZ1aInZ3vmGT2Db9o
 cD7RCSP33MAppXDzEpK+gD/eEAkAkHUKKAD2C6+bAwFXCueB6xa7jpySpJ/BQjVtjRnE
 YHUxIYwM6hNMSOfizbndd5W97B1qcnqm8l85aikRIkmCAyiHRWZf2nPXvD3Gn+K2vEma
 HXEg==
X-Gm-Message-State: AIkVDXIa1nVzNvV6igAIY4u3RAyAgQofctA6FKfmtlBfyKqv1OfzDmyAuA6N0c3tKos+WG1q7ZrR+aHBEHK6gA==
X-Received: by 10.157.49.38 with SMTP id e35mr14263100otc.196.1484539024802;
 Sun, 15 Jan 2017 19:57:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 19:56:44 -0800 (PST)
In-Reply-To: <20170116010646.8057-1-cyrilbur@gmail.com>
References: <20170116010646.8057-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 14:56:44 +1100
X-Google-Sender-Auth: pHtPxauv54hVBB5wSmJ7vUiLKf8
Message-ID: <CACPK8XfDVKQtO6d6sN8e=dUmE=F-MDMpWrsxDoEkeVU3h+WzSA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g5: Add mailbox and LPC Control nodes
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 16 Jan 2017 03:57:07 -0000

On Mon, Jan 16, 2017 at 12:06 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> This reserves BMC ram for host to BMC communication required by the
> LPC control driver.
>
> As both these devices exist on the LPC bus these nodes are children
> of a new LPC node.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 50 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi


> index d6ff41ee6c58..51c339b46740 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -18,6 +18,18 @@
>                 };
>         };
>
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               flash_memory: region@94000000 {
> +                       compatible = "aspeed,ast2500-lpc-ctrl";

That doesn't make sense, the RAM isn't a LPC Host Controller.

> +                       no-map;
> +                       reg = <0x94000000 0x04000000>; /* 64M */

We don't want this in the dtsi, as there are platforms that don't use
LPC buses that lose 64 MB of ram. Put this node in the dts. We might
decide to have an aspeed-bmc-opp.dtsi with common snippets, but for
now cut and paste.

Have you investigated reserving this memory when the driver probes
instead of hardcoding it?

> +               };
> +       };
> +
>         ahb {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
> @@ -89,6 +101,44 @@
>                         };
>                 };
>
> +               lpc: lpc@1e789000 {
> +                       compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +                       reg = <0x1e789000 0x1000>;
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0x0 0x1e789000 0x1000>;
> +
> +                       lpc_bmc: lpc-bmc@0 {
> +                               compatible = "aspeed,ast2500-lpc-bmc";
> +                               reg = <0x0 0x80>;
> +                       };
> +
> +                       lpc_host: lpc-host@80 {
> +                               compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> +                               reg = <0x80 0x1e0>;
> +                               reg-io-width = <4>;
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               ranges = <0x0 0x80 0x1e0>;
> +
> +                               lpc-ctrl@0 {

This needs to have a label.

> +                                       compatible = "aspeed,ast2500-lpc-ctrl";
> +                                       memory-region = <&flash_memory>;
> +                                       flash = <&spi1>;

Make this node status = "disabled" in the dtsi, and omit the flash phandle.

I also suggest we have your phandle links for memory and flash in the dts too.

> +                                       reg = <0x0 0x80>;
> +                               };
> +
> +                               mbox: mbox@180 {
> +                                       compatible = "aspeed,ast2500-mbox";
> +                                       reg = <0x180 0x5c>;
> +                                       interrupts = <46>;
> +                                       #mbox-cells = <1>;

Make this node status = "disabled" in the dtsi.

Cheers,

Joel

> +                               };
> +                       };
> +               };
> +
>                 vic: interrupt-controller@1e6c0080 {
>                         compatible = "aspeed,ast2400-vic";
>                         interrupt-controller;
> --
> 2.11.0
>
