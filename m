Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KfZt3lyjzDqmY
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 02:54:13 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id a11so19475915otr.10
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 07:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EEwldNevxLDYjjxjiSSpC0uMqnUBZ0IgTSi2MFIV1jk=;
 b=FpI6pxh+dtz1MuzZFe6FFZOTp537wEC/p0a5E/9Gj2+9l0f3i8Yx9R6lYJ25ZUr77h
 vUsVtL8FIX6J7jFFvDrZku4FpqL2GMIyfjUlYTfUzpg6jHqzutr6dWZAnUsJziFl7KV7
 KpbXpToLjTd6Q1NaoN0iCuWTk0WyxIWxaLaFYopYsAu9QEX9j+kSRFFVSPYLSzv8WUUX
 s23bC5/vFDwn2WBeoEqRCHTOpgptzhww7W9KSwqC433clAMOx9n+DEBQmByZsMK7L78G
 +FqVgDBMuD8MnV2p6qb+InXpj3eUZCjmpKXGWaXt/2D7q/N7tjMosy4IHfK5yKaH3UXN
 U6VA==
X-Gm-Message-State: AA+aEWZ0i4nuYTr2iYlOMIwBTFQuDKHsePMPw/GJ+DPSGfXa09MsuvFi
 UyGJD4ut5n5XgtP5pvfuxQ==
X-Google-Smtp-Source: AFSGD/W23mjMN1Bqu4JohAJG1izcWAs+BhvvTr+cQr6ATG3n37tDNMzoD6nYfw4YHGuRb7FNNptMyQ==
X-Received: by 2002:a9d:635a:: with SMTP id y26mr14474004otk.27.1545234851597; 
 Wed, 19 Dec 2018 07:54:11 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b128sm10395295oif.7.2018.12.19.07.54.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Dec 2018 07:54:10 -0800 (PST)
Date: Wed, 19 Dec 2018 09:54:10 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, marek.vasut@gmail.com, richard@nod.at,
 mark.rutland@arm.com, yuenn@google.com, venture@google.com,
 brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au,
 linux-mtd@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-binding: mtd: add NPCM FIU controller
Message-ID: <20181219155410.GA3925@bogus>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
 <20181203091456.454030-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203091456.454030-2-tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 19 Dec 2018 15:54:15 -0000

On Mon, Dec 03, 2018 at 11:14:55AM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Flash Interface Unit(FIU) SPI-NOR controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/npcm-fiu.txt | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/npcm-fiu.txt b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> new file mode 100644
> index 000000000000..9746cb5b1ced
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/npcm-fiu.txt
> @@ -0,0 +1,64 @@
> +* Nuvoton FLASH Interface Unit (FIU) SPI Controller
> +
> +NPCM FIU supports single, dual and quad communication interface.
> +
> +The NPCM7XX supports three FIU modules,
> +FIU0 and FIUx supports two chip selects,
> +FIU3 support four chip select.
> +
> +Required properties:
> +  - compatible : "nuvoton,npcm750-fiu" for the NPCM7XX BMC
> +  - #address-cells : should be 1.
> +  - #size-cells : should be 0.
> +  - reg : the first contains the register location and length,
> +          the second contains the memory mapping address and length
> +  - reg-names: Should contain the reg names "control" and "memory"
> +  - clocks : phandle of F reference clock.
> +
> +Required properties in case the pins can be muxed:
> +  - pinctrl-names : a pinctrl state named "default" must be defined.
> +  - pinctrl-0 : phandle referencing pin configuration of the device.
> +
> +Optional property:
> +  - spix-mode: enable spix-mode for an expansion bus to an ASIC or CPLD.

Needs a vendor prefix. Unless this is some standard SPI thing (which 
I've never heard of).

> +
> +The SPI device must be a child of the FIU node and must have a
> +compatible property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Required property:
> +- reg: chip select number.
> +
> +Optional property:
> +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description.
> +
> +Aliases:
> +- All the FIU controller nodes should be represented in the aliases node using
> +  the following format 'fiu{n}' where n is a unique number for the alias.
> +  In the NPCM7XX BMC:
> +  		fiu0 represent fiu 0 controller
> +  		fiu1 represent fiu 3 controller
> +  		fiu2 represent fiu x controller

Please don't make up your own aliases. Use 'spiX' if anything, but 
really, why do you need aliases in the first place?

> +
> +Example:
> +fiu3: fiu@c00000000 {

spi@...

> +	compatible = "nuvoton,npcm750-fiu";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
> +	reg-names = "control", "memory";
> +	clocks = <&clk NPCM7XX_CLK_AHB>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi3_pins>;
> +	spi-nor@0 {
> +		compatible = "jedec,spi-nor";
> +		spi-rx-bus-width = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0>;
> +		partition@0 {
> +			label = "flash_data";
> +			reg = <0x0 0x800000>;
> +		};
> +	};
> +};
> +
> -- 
> 2.14.1
> 
