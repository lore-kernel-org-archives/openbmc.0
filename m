Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="O3ujLD3a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TfnMqA+a"; dkim-atps=neutral
X-Greylist: delayed 584 seconds by postgrey-1.36 at bilbo;
 Thu, 08 Nov 2018 11:11:50 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r3cQ6nW2zF3K3;
 Thu,  8 Nov 2018 11:11:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C2612203E;
 Wed,  7 Nov 2018 19:02:03 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 07 Nov 2018 19:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:references:date:in-reply-to; s=fm1; bh=dDv
 SQsTcLZqpq2xleHi27YsMenTY+EMjdLPPhRHj3bU=; b=O3ujLD3a3WmywcTb7MK
 6q1Q51zB+5VlKTKdEbj+gHvJp100BcgSuJstLVdITrUwrkACxDWsy67YNhlsCIKK
 G6mKzYAagvZ48OrnGCLhBnZeVm6hMU4FZPIb0GxYcWXrlc7UblvqzZb6pivpUlvm
 WyypHvxJA8Lt4Ke/YCtRTQFiOArLriXRvpCJ8tcW4i3roPKCz6YdW+owsvBNmg5j
 kPXHHVuLROD1abN7ZeSqzu7JHbw9ie/lk/8BsyrZx/taRCipU9d4NgFq4nSGnBqN
 rFXedcJU76YDUsfuo/+vUdgD0dNBpFtc7v2EaBi21bEc/cr6GHqGlFC6EDD6BT0N
 8lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=dDvSQsTcLZqpq2xleHi27YsMenTY+EMjdLPPhRHj3
 bU=; b=TfnMqA+awuULUr+PnKd6FZiXS/BDaWNNg62AX8e/TVuJf9M4KqlUxCUrc
 rr1gpp3f8/LTCdHwbuGB3C1xRMjVk0cmiaYOwf7bn1bb1ZyIGqskIrZrGhSCTzOl
 oeUs93gOBnlsaUWVpcw2pt14vPSvu+SP81MNTsmhM/OkgiRpH5VIX/ISYVRVIT1/
 TjEg98OReA7XfMTe0eAyF7UTnZquna+FSoxBBNA+DJPtzzTdSQkxrjwwvSeArm3y
 ssUjrFurfLQ8ucfmkRU1sGi2h3QIPZN37evHc/ofFgagFBIDXR1JXIRBpniHyKOL
 6uMFXFQ37qWxbr2LZLY50gfGs+W8w==
X-ME-Sender: <xms:-XzjW7lP4hdqXiqIEMJshM0rl8VeNi6vsTT5vZ8-yxY2myo4IjqYrg>
X-ME-Proxy: <xmx:-XzjWw9zX6RsgXCwoIMItC2HkTOwE6LuL9DwqynmnnI_pcgkyk8KVg>
 <xmx:-XzjW9vh7J4UuKqBRASBmv7gjoOIA5D4uOse_TYHrDXCHZiYenVJLw>
 <xmx:-XzjW945gdqrgxyxdud6QzxF4-5eJi3a8bx7YdO5NvrdPU746kKa_g>
 <xmx:-XzjW-Rrrozc7UX8AMlUP9t0nCf8fZa6S73y2YgIjjedUbacBnbgmg>
 <xmx:-XzjW_vaafqnOv56brlQ8sAj3G5s8iSX_8sTzgHktIm5nPshfdJSrg>
 <xmx:-3zjW0qzTq8pk1FOANvn-BEbPPfHUUGfkZfJnyhVjODHdq9RzCBt2w>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 09AEC9E4F3; Wed,  7 Nov 2018 19:02:01 -0500 (EST)
Message-Id: <1541635320.1462459.1569430616.0F5E4C4D@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
Subject: Re: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
References: <20181106042829.2771226-1-taoren@fb.com>
Date: Thu, 08 Nov 2018 10:32:00 +1030
In-Reply-To: <20181106042829.2771226-1-taoren@fb.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 00:11:53 -0000

Hi Tao,

On Tue, 6 Nov 2018, at 14:58, Tao Ren wrote:
> This is the layout used by Facebook BMC systems. It describes the fixed
> flash layout of a 32MB mtd device.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  Changes since v1:
>   - adding facebook copyright.
> 
>  .../boot/dts/facebook-bmc-flash-layout.dtsi   | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
> 
> diff --git a/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi b/arch/
> arm/boot/dts/facebook-bmc-flash-layout.dtsi
> new file mode 100644
> index 000000000000..94039d7b7de5
> --- /dev/null
> +++ b/arch/arm/boot/dts/facebook-bmc-flash-layout.dtsi
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Facebook Inc.
> +
> +partitions {
> +	compatible = "fixed-partitions";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	u-boot@0 {
> +		reg = <0x0 0x60000>;
> +		label = "u-boot";
> +	};
> +
> +	u-boot-env@60000 {
> +		reg = <0x60000 0x20000>;
> +		label = "env";
> +	};
> +
> +	fit@80000 {
> +		reg = <0x80000 0x1b80000>;
> +		label = "fit";
> +	};
> +
> +	data0@1c00000 {
> +		reg = <0x1c00000 0x400000>;
> +		label = "data0";
> +	};
> +
> +	flash0@0 {
> +		reg = <0x0 0x2000000>;
> +		label = "flash0";
> +	};

Is this necessary? Isn't the same thing achieved with the /dev/mtd0 device?

Cheers,

Andrew

> +};
> -- 
> 2.17.1
> 
