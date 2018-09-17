Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.214.67; helo=mail-it0-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
 [209.85.214.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DFTq5QMHzF0wj;
 Mon, 17 Sep 2018 15:45:51 +1000 (AEST)
Received: by mail-it0-f67.google.com with SMTP id x79-v6so10157000ita.1;
 Sun, 16 Sep 2018 22:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to:status:date:lines;
 bh=XUv+NWK6MCu5BeWmvoodeYHpYbU5n+WvQ0JlU8sBeb8=;
 b=PMpUskD3qwvksr9LJiRGiX+fg3sr/PiOWWAZmvWGqvzJHUItzQmAX8ju4U3l6i0dYK
 +xYU09tiiYvSFM+mM9B2QsjBQH06HLyCHT1SqX3ASm0vleJyX8brDRlULflboP/TKxNg
 Xrbe43Y8pqHc1q5l8DWgnaMv9tlNmBWsuZP+dG3q3c4uLcBpZrXDH65hPEd9xL48wlaQ
 vY3oEX1LZA4lBm3z8D5d1Fs5EvV5f4oAhcTJQi296/U/8yf6GwN0u2tc8JWxcYoeqY1i
 NSq/eSpli9+ynjxrBFcXoXusEV2ipvhC77XvQ+F3pR+bTYySRArk03Xd7dLNGEgefhc8
 25sw==
X-Gm-Message-State: APzg51BRbX1YEB8RLIcje5YDs0lFlDUd8bfG88VasiId3F6beuA80u2C
 o9Qw7GlhqHEz3y2skP5j5g==
X-Google-Smtp-Source: ANB0VdaUgSi0MXWT8byouCsSigIl8rp7ox/aAH7TeE5oItMWJKV2QUQKZSQ9QVhROZsUzb+fgd/AWA==
X-Received: by 2002:a24:1c0a:: with SMTP id
 c10-v6mr11250874itc.101.1537163149110; 
 Sun, 16 Sep 2018 22:45:49 -0700 (PDT)
Received: from localhost ([209.82.80.116])
 by smtp.gmail.com with ESMTPSA id l21-v6sm4818172iom.8.2018.09.16.22.45.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Sep 2018 22:45:48 -0700 (PDT)
Message-ID: <5b9f3f8c.1c69fb81.8e0e4.d5a8@mx.google.com>
From: Rob Herring <robh@kernel.org>
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au, afaerber@suse.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Adding Facebook TioagaPass BMC
References: <20180913195751.1833227-1-vijaykhemka@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180913195751.1833227-1-vijaykhemka@fb.com>
X-Mutt-References: <20180913195751.1833227-1-vijaykhemka@fb.com>
X-Mutt-Fcc: ~/sent
Date: Sun, 16 Sep 2018 22:53:30 -0500
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
X-List-Received-Date: Mon, 17 Sep 2018 05:45:52 -0000

On Thu, Sep 13, 2018 at 12:57:51PM -0700, Vijay Khemka wrote:
> Initial introduction of Facebook TioagaPass family equipped with
> Aspeed 2500 BMC SoC. Neptune is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Facebook.
> Specifically, This adds the tiogapass platform device tree file
> including the flash layout used by the tiogapass BMC machines.
> 
> This also adds an entry of tiogapass device tree file in Makefile
> as well an entry of Facebook in Documentation for vendor prefix
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt   |   1 +
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 152 ++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c3fc512e746..733b2d523642 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -127,6 +127,7 @@ everspin	Everspin Technologies, Inc.
>  exar	Exar Corporation
>  excito	Excito
>  ezchip	EZchip Semiconductor
> +facebook  Facebook
>  fairphone	Fairphone B.V.
>  faraday	Faraday Technology Corporation
>  fastrax	Fastrax Oy
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index b5bd3de87c33..9c82c1681c38 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1206,4 +1206,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> +	aspeed-bmc-facebook-tiogapass.dtb \
>  	aspeed-bmc-quanta-q71l.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> new file mode 100644
> index 000000000000..859a00581e34
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2017 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Facebook TiogaPass BMC";
> +	compatible = "facebook,tiogapass-bmc", "aspeed,ast2500";
> +	aliases {
> +		serial0 = &uart1;
> +		serial4 = &uart5;
> +	};
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "console=ttyS4,115200 earlyprintk";
> +	};
> +
> +	memory {

This should have a unit-address (as should whatever is defined in 
aspeed-g5.dtsi).


> +		reg = <0x80000000 0x20000000>;
> +	};
