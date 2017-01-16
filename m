Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v22c83wgCzDqSM
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="juWBEnYd"; 
 dkim-atps=neutral
Received: by mail-ot0-x241.google.com with SMTP id 65so5672002otq.2
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 21:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UzydSNRPTYOzVX7AW4G5LfUT8PDeTCiGjIMZV9ffRpY=;
 b=juWBEnYdv5g89k/cfbSt/FdZrMisMWTigzr6vREztOXBZajcPChhCNITtnXRJczIli
 mHENDiYW4dlLmbvVscsQuXH/7MCjqzf1w/sxLZwVTDPt7C5KH1+N631VCfn7pzDL/sdz
 2JMEjQ2g24I9QtbmrMGW/0aFXMjZaJTra1vt7pzjquHeF0aVSF1zSzRZehVqgUr3ULts
 WBSSgap+EpIRbDpRtKms+NEthZi3+GeGRVk1XLZ0rb3EcUyX6nL6+AwVtymm/OlWIhhp
 uMj+u4g+qgc4j3esrdlJPg4f5bFF/QgbZhzHPYC+9SUxe3Uq6mhJunC6SDHFfMilxwzH
 YR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UzydSNRPTYOzVX7AW4G5LfUT8PDeTCiGjIMZV9ffRpY=;
 b=qkBqP/846gkOaBBNlWYecprfr8g09CbRAM5St0igkS/1z4cetVeSgvK7GTwZHkmyxh
 q4Sv1k5twvmCE3HAfxkhwLC8Gq7qUUzFmlba0t3wtkfDtda1x6sy/mrq4mcqaXi8Api6
 IqT2GQLZTDmNiPZQixr11OopIKdgwt9pcbo5JFzTrYR2WR1NJCOUj3Py1zlbQEV6znt5
 bjwURQCJENfh1C4oilxyxQI7K7PTJN75RAZd8XY8hM0xMCrvKiVtlwdWywA63fJoWL4+
 TYl1BnbGJBeaFugzSSl+384o3T/Uh7lHIjKBJTf3v19PKwuMt/tno+abTcW+07fJu9Ai
 ixBw==
X-Gm-Message-State: AIkVDXKLVflFiUdi4DJZ7OjJ8aRSSapsvjP48Erggyk3+xuyWggmVAHTRoK5PIdtI6+AwO2PbaP9GacIp9oemg==
X-Received: by 10.157.22.156 with SMTP id c28mr14413840ote.263.1484546342160; 
 Sun, 15 Jan 2017 21:59:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Sun, 15 Jan 2017 21:58:41 -0800 (PST)
In-Reply-To: <20170116053740.15299-1-cyrilbur@gmail.com>
References: <20170116053740.15299-1-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Jan 2017 16:58:41 +1100
X-Google-Sender-Auth: E-iGcV0ZlsYZj-ScHTxfu9Xz4F8
Message-ID: <CACPK8Xd2wjT1QpS+SyP7ubFt2XFSJdwBQ7b-JO-8VG=YrK-FPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed-g5: Add mailbox and LPC control
 node
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
X-List-Received-Date: Mon, 16 Jan 2017 05:59:05 -0000

On Mon, Jan 16, 2017 at 4:37 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Both these devices exist on the LPC bus these nodes are children of a
> new LPC bus node.
>
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

Applied to dev4-.7.

Cheers,

Joel

> ---
> v2:
>         Add the core to to the dtsi
>         Enable them in the platforms that want them in subsequent patches
>         Remove the compatible property for the reserved-memory nodes
>           All my understanding seems to indicate that this is how it
>           should be. However i've had problems with drivers probing on
>           other systems, hopefully these problems will turn out to have
>           been unrelated.
>
>  arch/arm/boot/dts/aspeed-g5.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index d6ff41ee6c58..1ce07d0ed431 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -89,6 +89,44 @@
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
> +                               lpc_ctrl: lpc-ctrl@0 {
> +                                       compatible = "aspeed,ast2500-lpc-ctrl";
> +                                       reg = <0x0 0x80>;
> +                                       status = "disabled"
> +                               };
> +
> +                               mbox: mbox@180 {
> +                                       compatible = "aspeed,ast2500-mbox";
> +                                       reg = <0x180 0x5c>;
> +                                       interrupts = <46>;
> +                                       #mbox-cells = <1>;
> +                                       status = "disabled"
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
