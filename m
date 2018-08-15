Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.223.194; helo=mail-io0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
 [209.85.223.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rLgc0lkqzF1bR
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 06:30:18 +1000 (AEST)
Received: by mail-io0-f194.google.com with SMTP id x5-v6so2036713iop.13
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 13:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5IgQSkBxQZonxJguAA3ZV7mOYCPTJgHNP53D7dCfU8w=;
 b=MzN6Uk3lkmTHa9wZnho4YVTECGLSfGTcFYC7k3IDHoUS/dXVJACutl6Tua58zuKGsl
 joHESf65aZ20QISDz7tyVB/XrPrPlllZ59fAJOtEo3Xrod5RR84A7V9XwtJwA7DcDqmb
 wA03M9rb4sv/HlQNotlZnUjciKha4xb07ayddQCo/R86nR0MNvfDtVC6xzKmnG7AyUdV
 BEClixoiCcsIWitLNuK2yKop/OH9izou1YU+Zg0CQyc7mJKTlLuqU3afz4Dw4mXtODqE
 WlrKTr/5GQRoqaXyBTatqManHvtr3J5oW/wUReOrg9b2xDZWX70+ogf1YAc4hkjTSnk9
 ZyZQ==
X-Gm-Message-State: AOUpUlHx8Sr6ClbnhQQqCYk5Ysuivjnj8asskV/LjI9ykYhSRZk+MSL8
 KzqpA5Gck+tpz+TwIAn5Pg==
X-Google-Smtp-Source: AA+uWPx9UOELM7aVqg/tu7YYr+Rf1r7NM1+HZUdtvo4H6NUjggPH9QiGHBoOe7MYr5/QIupHUzCdPw==
X-Received: by 2002:a6b:9e91:: with SMTP id
 h139-v6mr23322317ioe.185.1534365016505; 
 Wed, 15 Aug 2018 13:30:16 -0700 (PDT)
Received: from localhost ([24.51.61.72])
 by smtp.gmail.com with ESMTPSA id b129-v6sm18645481ioa.75.2018.08.15.13.30.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Aug 2018 13:30:15 -0700 (PDT)
Date: Wed, 15 Aug 2018 14:30:15 -0600
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
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: npcm7xx: add binding for i2c
 controller
Message-ID: <20180815203015.GA19242@rob-hp-laptop>
References: <20180814182907.182139-1-tali.perry1@gmail.com>
 <20180814182907.182139-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180814182907.182139-2-tali.perry1@gmail.com>
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
X-List-Received-Date: Wed, 15 Aug 2018 20:30:21 -0000

On Tue, Aug 14, 2018 at 09:29:06PM +0300, Tali Perry wrote:
> 
> Nuvoton NPCM7XX I2C Controller
> NPCM7xx includes 16 I2C contollers. This driver operates the controller.

s/contollers/controllers/

> This module also includes a slave mode, which will be submitted later on.
> 
> Any feedback would be appreciated.  
> 
> v3 -> v2:
> 	- fix dt binding: compatible name: ommit "bus"
> 
> v2 -> v1:
> 	- run check patch in strict mode.
> 	- use linux crc.
> 	- define regs in constant offset without base.
> 	- remove debug prints.
> 	- no declerations for local functions.
> 	
> v1: initial version

The version info normally goes below the '---' so it is not part of the 
commit msg.

> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 
> ---
>  .../devicetree/bindings/i2c/i2c-npcm7xx.txt        | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> new file mode 100644
> index 000000000000..2a474a2a5b3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> @@ -0,0 +1,29 @@
> +Nuvoton NPCM7XX I2C bus
> +
> +The NPCM750x includes sixteen I2C bus controllers. All Conterollers support

s/Conterollers/controllers/

With those fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +both master and slave mode. Each controller has two 16 byte HW FIFO for TX and
> +RX.
> +
> +Required properties:
> +- compatible      : must be "nuvoton,npcm750-i2c"
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
> +	i2c0: i2c@80000 {
> +		compatible = "nuvoton,npcm750-i2c";
> +		reg = <0x80000 0x1000>;
> +		clocks = <&clk NPCM7XX_CLK_APB2>;
> +		bus-frequency = <100000>;
> +		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&smb0_pins>;
> +	};
> -- 
> 2.14.1
> 
