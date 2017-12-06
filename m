Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gNcZYOb6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hI0flxDY"; dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Dec 2017 08:47:27 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ysXJv1VYMzDsGT
 for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2017 08:47:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE36120E8E;
 Wed,  6 Dec 2017 16:42:09 -0500 (EST)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Dec 2017 16:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=kjX43aReOY8uN9SRN+w8WwqumuiK9
 T3od2uKNCdGSdQ=; b=gNcZYOb6ZgbenX3yy5f/4aE4y3+M4jd5IMwm32yVOrpUP
 nw8d11babczVGHCXiS1eI4xnnO9trRmK/niEGU3i+w642TPR9y7UF/rEmMZPmyNx
 LK3SoAy8KDN2cpPymkHttM53m7xypARofIA1u6mTVasnocFKAZqfg5ORkJAzGr+s
 TvlJfnFwjCTM6qN54ytu3P+DX/4ZGnR2u93fjOmsCLjAptKrXwR4lNL/iJjdO7Od
 lfUTF+eh4DEE2G7q6fOafqqiK0imx0MBo6h0i4LnY+CV8XCEuXBCp5whwjpQzoPM
 zi5BsVpXV05ZHn3K5xeZxhq1pMekDgpepKvWdfo3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kjX43a
 ReOY8uN9SRN+w8WwqumuiK9T3od2uKNCdGSdQ=; b=hI0flxDYbsTxPtc9+dL/Hl
 89Pxrqum826El8y9qWbcXKOLqEYqR6ARPQLchOeuQgEOEH2RLSmJgi50/CpM5PB+
 Fc/kL2OcM+Y7m5O9t2HPUPvfBc2tnQPiRbeoplhYjHqAOdVOWyvhhDzuNk3Cu0+a
 0Sjq4fHwpJXP9ASZdvVf+3nnA88JdxLHfKVAyQ0Cvsv9mMOGZ2wvTUWDlP26dZwY
 5sNklL7IvL87A/DE4+sKg7PXtxv+G/MCUFNoj+Hwv1SrfxBtIXz93GfYZ4i4lgIP
 6TBYl2x1FnD4p1teLLL/fhrdrr/HCvL3DWHZmdMpGqgiOzOq0K/H+Dx7zFRCiLVg
 ==
X-ME-Sender: <xms:MWQoWmw_XGdKB1Asw54OyB6ILl98pzvAzovtu1cLB30Dr2ngnYbS1g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8BF19BA1A8; Wed,  6 Dec 2017 16:42:09 -0500 (EST)
Message-Id: <1512596529.2031041.1196482120.33305149@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1b87d328
Subject: Re: [PATCH 1/6] Documentation: dt-bindings: Add Aspeed PECI
Date: Thu, 07 Dec 2017 08:12:09 +1030
References: <20171206210240.6996-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20171206210240.6996-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 06 Dec 2017 21:47:30 -0000

Hi Jae Hun Yoo,

Nice work! Some comments below

On Thu, 7 Dec 2017, at 07:32, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document for Aspeed PECI.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  .../devicetree/bindings/misc/aspeed-peci.txt       | 52
>  ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644
>  Documentation/devicetree/bindings/misc/aspeed-peci.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/aspeed-peci.txt
> b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
> new file mode 100644
> index 000000000000..af950d72a48c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed-peci.txt
> @@ -0,0 +1,52 @@
> +* ASPEED PECI (Platform Environment Control Interface) misc driver.
> +
> +Hardware Interfaces:
> +- This driver implements support for the ASPEED AST2400/2500 PECI which
> has the
> +  following features:
> +       - Directly connected to APB bus
> +       - Intel PECI 3.1 compliant (PECI 3.0 for AST2400)
> +       - Maximum packet length is 256 bytes (Baseline transmission unit)
> +       - Support up to 8 CPUs and 2 domains per CPU
> +       - Integrate PECI compliant I/O buffers, can connect to PECI bus
> directly
> +       - Transmit buffer 32 bytes and receive buffer 32 bytes
> +
> +Required properties:
> +- compatible: "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
> +       - aspeed,ast2400-peci: Aspeed AST2400 family PECI control
> interface
> +       - aspeed,ast2500-peci: Aspeed AST2500 family PECI control
> interface
> +- reg: Should contain PECI registers location and length
> +- interrupts: Should contain PECI interrupt
> +
> +Optional properties:
> +- msg_timing_nego: Message timing negotiation period

Typically we use '-' rather than '_' as a separator in property names. I
notice your example uses '-'; please change the documentation.

Separately, what unit is this property working with? Clock cycles? It's
not clear what picking any particular value means.

The two problems apply to the next few properties as well:

> +       0 ~ 255 (default: 1)
> +- addr_timing_nego: Address timing negotiation period
> +       0 ~ 255 (default: 1)
> +- rd_sampling_point: Read sampling point selection
> +       0 ~ 15 (default: 8)

> +- clk_div: Clock divider for 24MHz clock source
> +       0: Divide by 1   <- default
> +       1: Divide by 2
> +       2: Divide by 4
> +       3: Divide by 8
> +       4: Divide by 16
> +       5: Divide by 32
> +       6: Divide by 64
> +       7: Divide by 128

What is the purpose of the clock divider? To derive the peci bus
frequency? If so, you should instead use the generic 'bus-frequency'
property, and implement support in the driver to derive the described
frequency from the upstream clock rate and the value of bus-frequency
specified in the devicetree node. That is, derive the divisor value and
program it into the hardware. You should also document the 'clocks' and
'clock-names' properties here in order to describe the upstream clock

> +- cmd_timeout_ms: Command timeout in units of ms
> +       1 ~ 60000 (default: 1000)

This is a contrast to your properties above in the the unit is clear,
which is good.

> +
> +Example:
> +       peci: peci@1e78b000 {
> +               compatible = "aspeed,ast2500-peci", "syscon",
> "simple-mfd";

If you need it to be a syscon you should say so in the documentation as
well as the example. But:  

Do you actually need a syscon here? why? Do we need to share these
registers across multiple drivers? I'd be surprised if this controller
fits the syscon description.

If you want a regmap you can create one inside the driver without
affecting the devicetree. But I'd also question why you want one - they
introduce overhead where you probably don't need it.

Cheers,

Andrew

> +               reg = <0x1e78b000 0x60>;
> +               reg-io-width = <4>;
> +               interrupt-controller;
> +               interrupts = <15>;
> +               msg-timing-nego = <1>;
> +               addr-timing-nego = <1>;
> +               rd-sampling-point = <8>;
> +               clk-div = <0>;
> +               cmd-timeout-ms = <1000>;
> +       };
> +
> -- 
> 2.15.1
> 
