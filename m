Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.166.195; helo=mail-it1-f195.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W0zx12SwzDqK5
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 08:14:51 +1100 (AEDT)
Received: by mail-it1-f195.google.com with SMTP id z7so47223298iti.0
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 13:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RFJv2pEtzMnCmHqpwbHFcL8CG7J04WnCqNMgo/+qLPk=;
 b=rudfvHGM/gH8trlllwFYLDnRX/sUzxz0eJMLAsQePtRu7Z9MlUqtXKU5JkwHlv/o4D
 z7Buihno8iBsETWXK4vXige0viFJNGIAjPTFWcSyRmgpl1rj0LxNhFyv7UN6+5pV96HQ
 8RSwXHDfXRKcPUhlxcJVgMCXze6v18sBIJ5vtumpGCWBKeZ5qSbETBJoJ4voS8Fqbvfo
 SHXMqLqQLAwHyyPlGhIIIDpC5aJouzC//SWlH3KBHu1rU9dFabxcJtR1da7BA52Euwvv
 ql8eTLbpse/50ZgpEVxU3uu/5TSxUCp8udaUpQbgKRKgGAWU3XxFjy580eS50DwkYEe1
 V0iw==
X-Gm-Message-State: AA+aEWZjk2wto4LTMoJXB8tOkhkEcIN3Pwc2+DQGSdcw4imKZbC5G/Bd
 6uD0jNulpcMRUdIltj4mOQ==
X-Google-Smtp-Source: AFSGD/UCiBXdQyBzaX30++tCxEnw5Oh61kbQIcMtaE22/WZG+KWgHmzQwzOsJa5YAxDjoZNpxMFPIA==
X-Received: by 2002:a02:910a:: with SMTP id a10mr34057589jag.116.1546550089548; 
 Thu, 03 Jan 2019 13:14:49 -0800 (PST)
Received: from localhost ([24.51.61.172])
 by smtp.gmail.com with ESMTPSA id f13sm25041184iol.82.2019.01.03.13.14.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Jan 2019 13:14:48 -0800 (PST)
Date: Thu, 3 Jan 2019 15:14:47 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au,
 linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-binding: iio: add NPCM ADC documentation
Message-ID: <20190103211447.GA4618@bogus>
References: <20181224164755.286932-1-tmaimon77@gmail.com>
 <20181224164755.286932-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181224164755.286932-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Thu, 03 Jan 2019 21:14:53 -0000

On Mon, Dec 24, 2018 at 06:47:54PM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Analog-to-Digital Converter(ADC).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> new file mode 100644
> index 000000000000..6f0843d837cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> @@ -0,0 +1,35 @@
> +Nuvoton NPCM Analog to Digital Converter (ADC)
> +
> +The NPCM ADC is a 10-bit converter for eight channel inputs.
> +
> +Required properties:
> +- compatible	: "nuvoton,npcm750-adc" for the NPCM7XX BMC.
> +- reg			: specifies physical base address and size of the registers.
> +- interrupts	: Contain the ADC interrupt with flags for falling edge.
> +
> +Optional properties:
> +- clocks		: phandle of ADC reference clock, in case the clock is not
> +				  added the ADC will use the default ADC sample rate.
> +- vref-supply	: The regulator supply ADC reference voltage, in case the
> +				  vref-supply is not added the ADC will use internal voltage
> +				  reference.
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

Why is this node here?

> +	compatible = "nuvoton,npcm750-rst", "syscon",
> +	"simple-mfd";
> +	reg = <0xf0801000 0x6C>;
> +};
> -- 
> 2.14.1
> 
