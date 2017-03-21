Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnFM26VGQzDq7c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 12:18:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o1Wolb64"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id h11so15681063ywa.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 18:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PJdzQCtFXntc/2wKu7ry0vRAj+9V8xDX/YRrFfpu1Dk=;
 b=o1Wolb64+48944dcPFcvIvIr4MOkOh3ha/uKPVPlMYN2CCAvTPaTqpXW011mjJb+vO
 id/M0cl1thY1ncncJvGLnOJArvqN5qIyrZXQxY1ZTfKuFHMFt68BafiNaBltRfuuuXb6
 TiU2vOM1H1lkP20zboLByKQb6QG8AvWRrTxJGBWflBb3AE95fAUy1ezLoSZ7Oo/z9Vc9
 UarkSbcXRu3aYRBxSfTwQwMlUUJkO/lxgpQUqapNljnFV4WMzWa+2TUM1Jhyc3SLYDiY
 Bnjvk6nRI1atOsBwxZBzs5WpZT6/LHFDSvwmxfi5heDXWXnfPAFlwkE+CgbVunv4ug03
 long==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PJdzQCtFXntc/2wKu7ry0vRAj+9V8xDX/YRrFfpu1Dk=;
 b=qAzjJNQhTS50Ip9qK2MWQwM7m+UC1ozt8l21qZIGGxCmpJB/Ni5/zaOSxG9nun08q7
 i/Mw9X4JZtPibnukTmg+B2kH1aoIieDDLwfSePC2vzBv37sbg5UrMpRtogiS/nRc2Nq9
 jJwztlV87w7XlSEBHD5Fc78RdPc/cteuzsxTvbB8nITna3LHSURVkNvrWzukW3+DKqAj
 W6cQfbmLZf143/bWAzBTUVXiiY/UPlkGvGo2i5KpEqJ939sRadqfzV7yanOif4jiDHFg
 /Q6eRAgQIWHyvpLa02IEKSoBA4OJ97XQ5q0TtveEUeEt6OMNO5tI7FAc4dmQo1cU0cmF
 KtRg==
X-Gm-Message-State: AFeK/H1AHYhCG+/2nDZ/vBckZco0HwQpWxlSKiOTgOeuwILLzUKXv+lpNvEkpLvOWzLVG6VqhMcAkQpmxZkgbA==
X-Received: by 10.37.165.67 with SMTP id h61mr20398547ybi.153.1490059116303;
 Mon, 20 Mar 2017 18:18:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.37.197 with HTTP; Mon, 20 Mar 2017 18:18:15 -0700 (PDT)
In-Reply-To: <CAPLgG==Ommast2gz38UXtEmLhO0EziJw6HKbU5J2NRFyh9K7uQ@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-14-maxims@google.com>
 <20170319164217.GN19897@bill-the-cat>
 <CAFR_W8qO-hP880NMdyHgGuwq_agsMXcPyfJWt9C8Hot-sW2e6w@mail.gmail.com>
 <20170320173034.GX19897@bill-the-cat>
 <CAFR_W8q_mPwTU9NH1vhf7rQuBQ1JLxdHjSS7me_QWqh1878hTg@mail.gmail.com>
 <CAPLgG==Ommast2gz38UXtEmLhO0EziJw6HKbU5J2NRFyh9K7uQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Mar 2017 11:48:15 +1030
X-Google-Sender-Auth: ilQ1gcqbxF76d7rmYI767cM7RSA
Message-ID: <CACPK8XfBp5u4L+92Moz7Uroxjd69R8y6cC3BwKpYvtn++LNT1w@mail.gmail.com>
Subject: Re: [U-Boot] [PATCH 13/17] aspeed: Add support for Clocks needed by
 MACs
To: Rick Altherr <raltherr@google.com>
Cc: Maxim Sloyko <maxims@google.com>, Tom Rini <trini@konsulko.com>, 
 U-Boot Mailing List <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Mar 2017 01:18:39 -0000

On Tue, Mar 21, 2017 at 7:13 AM, Rick Altherr <raltherr@google.com> wrote:
> +Joel
>
> On Mon, Mar 20, 2017 at 10:52 AM, Maxim Sloyko <maxims@google.com> wrote:
>> On Mon, Mar 20, 2017 at 10:30 AM, Tom Rini <trini@konsulko.com> wrote:
>>> So this applies to a lot of parts of the series here.  What we don't
>>> want to do is have places where the DTS here diverges from the Linux
>>> kernel DTS and we don't reconcile them.  If the relevant Linux drivers
>>> are not in mainline, are they at least in linux-next or otherwise
>>> submitted to the relevant subtrees?
>>
>>
>> No, as far as I know, maybe Rick (cc'ed) knows what is the plan there.
>>
>> I'm not really working on the linux driver and it's outside of my control.
>>
>
> Looks like the Aspeed SDK version of U-Boot was configuring D2PLL as
> part of platform_g5.S
> (https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/arch/arm/mach-aspeed/platform_g5.S).
> OpenBMC kernel doesn't seem to have any clock drivers for these PLLs.
> I assume that since they were enabled by U-Boot, the ftgmac100 driver
> doesn't need to do anything for it to work.  It should be
> straightforward to follow the pattern of the other clock drivers in
> https://github.com/openbmc/linux/blob/dev-4.7/arch/arm/boot/dts/aspeed-g5.dtsi
> and create a new driver for D2PLL.

We don't have clock drivers upstream. I submitted them about a year
ago, they got naked, and I haven't got around to resubmititng them.

I have reworked them in our upcoming 4.10 tree. The device tree
currently looks like this. Note that I haven't sent this version of
the patches out for review, so it may change again.

syscon: syscon@1e6e2000 {
        compatible = "aspeed,g5-scu", "syscon", "simple-mfd";
        reg = <0x1e6e2000 0x1a8>;

        #address-cells = <1>;
        #size-cells = <0>;

        clk_clkin: clk_clkin@70 {
                #clock-cells = <0>;
                compatible = "aspeed,g5-clkin-clock";
                reg = <0x70>;
        };

        clk_hpll: clk_hpll@24 {
                #clock-cells = <0>;
                compatible = "aspeed,g5-hpll-clock";
                reg = <0x24>;
                clocks = <&clk_clkin>;
        };

        clk_ahb: clk_ahb@70 {
                #clock-cells = <0>;
                compatible = "aspeed,g5-ahb-clock";
                reg = <0x70>;
                clocks = <&clk_hpll>;
        };

        clk_apb: clk_apb@08 {
                #clock-cells = <0>;
                compatible = "aspeed,g5-apb-clock";
                reg = <0x08>;
                clocks = <&clk_hpll>;
        };


We don't (yet) have anything in there for the D2PLL as Linux hasn't
needed to touch them.

I recently requested detailed clock documentation from Aspeed. I will
use this to add bindings for all of the clocks in the Aspeed SoC.

Cheers,

Joel
