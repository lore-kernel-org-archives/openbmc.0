Return-Path: <jic23@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=jic23@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="A5s3iw2f"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43cTGC2crVzDr1Y
 for <openbmc@lists.ozlabs.org>; Sun, 13 Jan 2019 05:46:10 +1100 (AEDT)
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1C4B206B6;
 Sat, 12 Jan 2019 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547318768;
 bh=wJk1MKco9NoCtJuJwpczKYid25YeZJixg96f/ubymmk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A5s3iw2frFyRXPcnOV+vTAbdLS5r+nkhpOx3oYxwKELhRUBjhHlvDFzwwNBw+udKQ
 lbiBtKTyPvcJ9e8fn4LP6jza5p7XYSubH7XCtCimEJkHrShRFKnWCW/1EERBugmrvQ
 77BVKX02n3o9BirhxvdiP4Wik5bxdeQyzMmYtqEc=
Date: Sat, 12 Jan 2019 18:46:02 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au,
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
Message-ID: <20190112184602.3d3dc364@archlinux>
In-Reply-To: <20190109164343.164205-2-tmaimon77@gmail.com>
References: <20190109164343.164205-1-tmaimon77@gmail.com>
 <20190109164343.164205-2-tmaimon77@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sat, 12 Jan 2019 18:46:12 -0000

On Wed,  9 Jan 2019 18:43:42 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Added device tree binding documentation for Nuvoton BMC
> NPCM Analog-to-Digital Converter(ADC).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
This looks fine to me, but I would like Rob's confirmation that
he is happy with the reset part in particular.

Thanks,

Jonathan

> ---
>  .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> new file mode 100644
> index 000000000000..1b8132cd9060
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> @@ -0,0 +1,35 @@
> +Nuvoton NPCM Analog to Digital Converter (ADC)
> +
> +The NPCM ADC is a 10-bit converter for eight channel inputs.
> +
> +Required properties:
> +- compatible: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
> +- reg: specifies physical base address and size of the registers.
> +- interrupts: Contain the ADC interrupt with flags for falling edge.
> +
> +Optional properties:
> +- clocks: phandle of ADC reference clock, in case the clock is not
> +		  added the ADC will use the default ADC sample rate.
> +- vref-supply: The regulator supply ADC reference voltage, in case the
> +			   vref-supply is not added the ADC will use internal voltage
> +			   reference.
> +
> +Required Node in the NPCM7xx BMC:
> +An additional register is present in the NPCM7xx SOC which is
> +assumed to be in the same device tree, with and marked as
> +compatible with "nuvoton,npcm750-rst".
> +
> +Example:
> +
> +adc: adc@f000c000 {
> +	compatible = "nuvoton,npcm750-adc";
> +	reg = <0xf000c000 0x8>;
> +	interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&clk NPCM7XX_CLK_ADC>;
> +};
> +
> +rst: rst@f0801000 {
> +	compatible = "nuvoton,npcm750-rst", "syscon",
> +	"simple-mfd";
> +	reg = <0xf0801000 0x6C>;
> +};
