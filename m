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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41q4kf4KnrzF0Vv
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 04:58:34 +1000 (AEST)
Received: by mail-it0-f67.google.com with SMTP id g141-v6so15718882ita.4
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 11:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kXFZPFsQxi2b90JOi4z4hcsFfMnZ/H6g/J1Zgk0O934=;
 b=jaJVVcqaMvBDzmFdiB8Bx9m8ISOuaD22Kd922xlZ3Co+72FRzF5Ri+kBYAKiCGNMAc
 1S6tS3/R+SWoDksygb0xon8PkZT7qaajA2due45eEfVsi+9Pmi9JpjhyHF6xT/yN0qH4
 a/5p0mjaMROMqfeQM8zHaE7BMFbbGmFFZ3Ej7POY3R1fRrs8h2qku3DQq1mse3zQ0Vw7
 p9jI5Krg3H6lDPVucPci6LgqJsnhyrQgURu8/6fcPLYebNwmWI4TuZS8E6w7299GAp2H
 cZuag/a1pQnEv6SInKWXE0b12d51VZlqd00uUMPiugEhfrhZDzyqlG9MZouDvnOJ0/uX
 5mtg==
X-Gm-Message-State: AOUpUlEmAY3UxYp2s0BIQDNmbvJiJ55in+Wp85NqkRP4m+ZDzJrHwXUR
 CZQ7OwjwDn49SeBdNrI5UQ==
X-Google-Smtp-Source: AA+uWPzAzIgi+EimhacLpyqlKzDjI6U0kcfS6CTg/AVtxCan3RZOWq2X830PmKJbL5UIZRybm7T3mg==
X-Received: by 2002:a02:b4a4:: with SMTP id
 k33-v6mr15644308jaj.53.1534186712110; 
 Mon, 13 Aug 2018 11:58:32 -0700 (PDT)
Received: from localhost ([24.51.61.72])
 by smtp.gmail.com with ESMTPSA id w64-v6sm2164032ita.7.2018.08.13.11.58.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Aug 2018 11:58:31 -0700 (PDT)
Date: Mon, 13 Aug 2018 12:58:30 -0600
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com, mark.rutland@arm.com,
 davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org, akpm@linux-foundation.org,
 arnd@arndb.de, wsa@the-dreams.de, andriy.shevchenko@linux.intel.com,
 pierre-yves.mordret@st.com, cedric.madianga@gmail.com,
 baolin.wang@spreadtrum.com, jarkko.nikula@linux.intel.com,
 hdegoede@redhat.com, rmk+kernel@armlinux.org.uk,
 ard.biesheuvel@linaro.org, thor.thayer@linux.intel.com,
 geert@linux-m68k.org, heikki.krogerus@linux.intel.com,
 tglx@linutronix.de, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: i2c: npcm7xx: add binding for i2c
 controller
Message-ID: <20180813185830.GA18453@rob-hp-laptop>
References: <20180807110709.31847-1-tali.perry1@gmail.com>
 <20180807110709.31847-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180807110709.31847-2-tali.perry1@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 18:58:35 -0000

On Tue, Aug 07, 2018 at 02:07:08PM +0300, Tali Perry wrote:
> Nuvoton NPCM7XX I2C Controller
> NPCM7xx includes 16 I2C contollers. THis driver operates the controller.
> This module also includes a slave mode, which will be submitted later on.
> 
> Any feedback would be appreciated.  
> 
> v2 -> v1:
> 	- run check patch in strict mode.
> 	- use linux crc.
> 	- define regs in constant offset without base.
> 	- remove debug prints.
> 	- no declerations for local functions.
> 	
> v1: initial version
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 
> ---
>  .../devicetree/bindings/i2c/i2c-npcm7xx.txt        | 27 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> new file mode 100644
> index 000000000000..e2ee45d7a41e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> @@ -0,0 +1,27 @@
> +Nuvoton NPCM7XX I2C bus
> +
> +The NPCM750x includes sixteen I2C busses
> +
> +Required properties:
> +- compatible      : must be "nuvoton,npcm750-i2c-bus"

Is 'bus' how the datasheet calls it? If not, I'd drop the '-bus' part as 
it is really a controller.

> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the I2C interrupt with flags for falling edge.
> +- clocks          : phandle of I2C reference clock.
> +
> +Optional:
> +- bus-frequency   : Contain the I2C bus frequency,
> +			the default I2C bus frequency is 100000.
> +- pinctrl-0       : must be <&smbX_pins>, X is module number
> +			(on NPCM7XX it's 0 to 15)
> +- pinctrl-names   : should be set to "default"
> +Example:
> +
> +	i2c0: i2c-bus@80000 {

Should be 'i2c@80000'

> +		compatible = "nuvoton,npcm750-i2c-bus";
> +		reg = <0x80000 0x1000>;
> +		clocks = <&clk NPCM7XX_CLK_APB2>;
> +		bus-frequency = <100000>;
> +		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&smb0_pins>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 192d7f73fd01..13bac916d21d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1244,6 +1244,14 @@ F:	drivers/i2c/busses/i2c-aspeed.c
>  F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
>  F:	Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>  
> +ARM/NUVOTON I2C DRIVER
> +M:	Tali Perry <tali.perry1@gmail.com>
> +L:	linux-i2c@vger.kernel.org
> +L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-npcm7xx.c
> +F:	Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> +
>  ARM/ASPEED MACHINE SUPPORT
>  M:	Joel Stanley <joel@jms.id.au>
>  R:	Andrew Jeffery <andrew@aj.id.au>
> -- 
> 2.14.1
> 
