Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jIPubaWb"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DbI1vzKH"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zXc7d6jBPzDqD6
 for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2018 10:41:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A759208D8;
 Thu,  1 Feb 2018 18:40:56 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Thu, 01 Feb 2018 18:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=SmbX0zZOAHAtI+LD4X+Se4setUhdu
 GKjqLiqem5O4Ao=; b=jIPubaWbZJnFxmDhrhtpdb+4MlWBFwxFq3CJXxpBEo4rc
 Bxo6fwHi5p9rqsrcMnCXARti7mQOFDVEa1Byh4jsAQp/ZiKpCr0qdrV3LzB6tG3c
 clPIL9/Rcnu+uhU/D8y/MfDy3dH+FvZBdCxdk8Hrtv1ke3d0HTekY3hAXP1xnDUh
 hrqJ/MWKOfkefr+ryLZyPszFJPnuKBMCMNYlI91bMth4knHcc6sWKAF0oNtKao7D
 U9zKT+a9E1BQ0dF/9Cjgg94E4xUH33kz0OAtYA06ZJhnktffiss6XUIMyHIUO33M
 6KXgco+8TuHWL29A4gOI3KiDW4qTfYkZn6E4mNvag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SmbX0z
 ZOAHAtI+LD4X+Se4setUhduGKjqLiqem5O4Ao=; b=DbI1vzKHtp6+XVgoftAS0+
 /I3F9tzA9l2JKm8YbpGIF4ZDM8Expq3GWgEerQ1VcNuNK99vdWNkUqye5Zyk15T0
 Dkxm55WPh0G9uM1nWXm4L+Xy2hMs3t2kTmiQZIyY0l4YStI9BAb21Rp6nnmzRyq1
 YBD+kUDxkiMazA/qWnZE6sFmzRyeKAWat6HZRQdty/003ebqxXxrO8U3A1CAddhD
 472H9XWvwzO30zmOiq3FGC5siYHTylhu8PFiVgY60HdwRArE1Q9lD5XmCxIWfTxr
 atrfadPvESoOmhYxl0ZO1LOOrhenAyzRTvbY44992FUAqHPEhxF662NSsITEVBvQ
 ==
X-ME-Sender: <xms:iKVzWhVa90GBGt4lJE0wg5I1LuR2HOWDrKD5f3eykAktYYSLtVbUSA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 638589E47F; Thu,  1 Feb 2018 18:40:56 -0500 (EST)
Message-Id: <1517528456.2204329.1256582544.54596B19@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Ken Chen <chen.kenyy@inventec.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fde26eb3
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add ARM system BMC device
 tree
In-Reply-To: <CACPK8XeHFZrCJuFb33i3+xvCvfTLNEXbKcW11eFLjRtm8V5LXQ@mail.gmail.com>
Date: Fri, 02 Feb 2018 10:10:56 +1030
References: <20180108030013.20873-1-chen.kenyy@inventec.com>
 <CACPK8XeHFZrCJuFb33i3+xvCvfTLNEXbKcW11eFLjRtm8V5LXQ@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Feb 2018 23:41:04 -0000

On Wed, 17 Jan 2018, at 10:47, Joel Stanley wrote:
> > +                        max31790@20 {
> > +                                compatible = "max31790";
> > +                                reg = <0x20>;
> > +                                #address-cells = <1>;
> > +                                #size-cells = <0>;
> > +                               fan-mode = "pwm";
> > +                                fanconfig1 = <0x08>;
> > +                                fanconfig2 = <0x09>;
> > +                                fanconfig3 = <0x08>;
> > +                                fanconfig4 = <0x08>;
> > +                                fanconfig5 = <0x09>;
> > +                                fanconfig6 = <0x08>;
> > +                        };
> 
> Andrew, can you please review the max parts?

This is for the max31790, which is a different part to the max31785 that I have worked on. However, there's no bindings document upstream for the max31790, let alone one that describes the fanconfigX properties.

Looks like we'll need to see some bindings and driver patches before we accept this node as is.

> > +
> > +static void __init do_centriq2400rep_setup(void)
> > +{
> > +       u32 reg;
> > +
> > +       do_common_setup();
> > +       writel(0x00000010, AST_IO(AST_BASE_WDT | 0x2c));
> 
> We have a watchdog driver for modifying the watchdog. Please use that
> instead of this line.
> 
> > +
> > +       writel(0xff000000, AST_IO(AST_BASE_SCU | 0x88));
> 
> This appears to be modifying the multi function pin control. What are
> you trying to do?
> 
> We should be able to use the pinctrl driver to modify these settings.

Right - this is muxing MDIO pins for MAC#1, SPI pins for SPI2, and the FWSPICS#x functions. This can all be done in the respective devicetree nodes via the existing pinmux support as Joel suggests. See [1] and then [2] for the relevant pinctrl configuration nodes. You'll need something like:

&fmc {
    pinctrl-names = "default";
    pinctrl-names = <pinctrl_&pinctrl_fwspics1_default &pinctrl_fwspics2_default>;
};

&spi2 {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_spi2ck_default &pinctrl_spi2miso_default &pinctrl_spi2mosi_default &pinctrl_spi2cs0_default>;
};

&mac0 {
    pinctrl-names = "default";
    pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
};

[1] Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
[2] arch/arm/boot/dts/aspeed-g5.dtsi

Cheers,

Andrew
