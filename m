Return-Path: <openbmc+bounces-2418-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3C2C5DF7D
	for <openbmc@archiver.kernel.org>; Fri, 21 Aug 2026 07:41:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hRC0y4vrkz2xyh;
	Fri, 21 Aug 2026 17:41:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787298082;
	cv=none; b=evdmxEccpWonieswnpEPNM+hss7pw3BbhipA7SXUKrAh4mGBKSY5cnjd4QwrUpN/wJs63Tjf38NeIcqrnfkJRy/ZOF0QnfTtwJcmAa5VOfOqYhDpcj/YyOFhE1bkj+xCwb4Uz7TZK9xI8w4mltVu6lNqXNTqOY7CiY9f2zt8/StYJlMSfD3xBWv3xmnO7mXDo09k+PEZY5Llfa3l0T4mlbCr8V8CRs5gpAxKQo+FuhuAm34cGT4NeUGfporMP0aJtaT0T4z4TxBquzWxDfhfVnBI8bie+bNaiFEkgjKcSvAwY6T5gATWumaHhrf6+75+f16+yV3N7HLElXCYRc4Iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787298082; c=relaxed/relaxed;
	bh=ei+B8ocDD8dYcFQzb2AT0WGx2IPkB//7Ko8mka3Bc/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxYXcZWdrtCAkDKhzZVqtARh62VPxgWJqTpGh/g/ojSXqhyFRQrUJknWKoSHWK5ZZrQ4fDOnrfXx8d66Ryj76Sm/0jzkKdNHly9t3s9FpqcbmeeYqVal1atGB7ItjaGFpLq1wS1/pA2LZfJGzGyTvFE0A/QGvGg7Rff6wjAipCcFKf6FCjUamlCpBA29PXHAcxK8VzLZGhyn03frb13hYqg1PwEGC24AXPJxF1R8C4+UHHhwq5L6LIQz88vEXD+lA0SYDkuh5WSnA1RjP7agdX0dOVkFiY15yMSBe8vRJfM0/ePkaG9UcPVYYggxYKR8V8tN3jnJC7Oe+FArsUbhUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZc6U6O2; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jZc6U6O2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hRC0x12TQz2xLd
	for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2026 17:41:21 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 985974141B;
	Fri, 21 Aug 2026 07:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C7F1F00A3A;
	Fri, 21 Aug 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298077;
	bh=ei+B8ocDD8dYcFQzb2AT0WGx2IPkB//7Ko8mka3Bc/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZc6U6O2lQzWmS5s+LLmj/Gi/1BmdrFqSe5tbnWw3zjZJeqwfUXu8ymjBpDaS62wP
	 t8wonbpR8B4UK08unCgqNsjyV0Y6TSA/84NeEVE/b3PRRpaWisweinjBKE+JwIs0+0
	 6BL243QSHh+mALBxe3+shcHOOvwGdQ8YatAfRZ+Jk2y9qhMAdL4QzYPQ/sCu7Hym6i
	 sf2u8F5S1t0iBQNHvExFkWQWqA9mAwAbJn+eRjcgTqZFzO66tkzQchUXqcw+TNUNUL
	 EXgT4NicoPCIORRz2BRR8HDKk0oiRq7jhmBr/fc+5DRWL1ucyr612bZREAk0e79MtM
	 j3xPUGe3KBc0w==
Date: Fri, 21 Aug 2026 09:41:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Cc: Krutik Shah <krutikshah@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Message-ID: <20260821-woodoo-enlightened-bobcat-9315cb@quoll>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>

On Mon, Aug 17, 2026 at 10:57:13PM -0700, Naveen Kumar Rajgiri Bassappa wrote:
> +title: Axiado AX3000/AX3005 USB Device Controller
> +
> +maintainers:
> +  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +  - Krutik Shah <krutikshah@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description:
> +  Axiado USB Device Controller (UDC) is used on the AX3000 and AX3005
> +  SoCs. This controller is based on a Corigine USB IP core and provides
> +  SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, selected by the
> +  maximum-speed property. It supports control, bulk, interrupt, and
> +  isochronous transfer types across multiple configurable endpoints. The
> +  node describes the memory-mapped register region, interrupt line, and
> +  other required properties for the UDC hardware.

Did you implement my comment?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: axiado,ax3000-udc
> +      - items:
> +          - const: axiado,ax3005-udc
> +          - const: axiado,ax3000-udc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  maximum-speed:
> +    enum: [super-speed, high-speed]

You miss referencing proper schema to get such property or you should
not come with own generic properties. IOW, look at other bindings how
they define a proper UDC device schema.


I also do not see a need for this, compatible defines max speed.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        usb@81200000 {
> +            compatible = "axiado,ax3000-udc";
> +            reg = <0x0 0x81200000 0x0 0x00100000>;
> +            interrupt-parent = <&gic500>;
> +            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;

resets, phys. Make example complete.

> +            maximum-speed = "high-speed";
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a674e36529f7..36af69fb965b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4468,6 +4468,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
>  F:	drivers/spi/spi-axiado.c
>  F:	drivers/spi/spi-axiado.h
>  
> +AXIADO USB UDC DRIVER
> +M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> +M:	Krutik Shah <krutikshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +L:	linux-usb@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
> +
>  AYANEO PLATFORM EC DRIVER
>  M:	Antheas Kapenekakis <lkml@antheas.dev>
>  L:	platform-driver-x86@vger.kernel.org
> 
> -- 
> 2.34.1
> 

