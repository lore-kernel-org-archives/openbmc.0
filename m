Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.161.196; helo=mail-yw0-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
 [209.85.161.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Kqjd2NHTzF1Mm
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 02:45:08 +1000 (AEST)
Received: by mail-yw0-f196.google.com with SMTP id y203-v6so924110ywd.9
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 09:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QwifxOs+z0bbOD30neLcaVfeEjxXWfUWFikiYksd6OU=;
 b=iwxmNsip59ZSoFdiDu1dpna40J8HYAetG02m14K7pHKsuenUw0DzV5I3ikLoLGW0CZ
 ozXoTIGWAsxBslPzJ2amNykOGQ3kpi0DAVT0wm1jncJH0dHWvktQaL2jJ+Rl1nXTWkCH
 wINigcoaXqHLdalLldkN4B/d/LfPG/CnDv+97iy/VtsmXRtIPe9OK8xHUtQrg/RDU2ds
 Jq/RvHtuNyTPI81/4VgIpLE8+KQ8rao/fydJXLdzvP+eQhnbiawin5N9YLL3ARYR4H7R
 mulEGCOoQacdUNp5nXEB1xdCvzK7JHEbZP/RoMfW5DGsvezIUHMHJ26BL8DYsVnmcKiz
 FzMg==
X-Gm-Message-State: APt69E2EqiWKXY8SUm0U+lAYMLM8K4663EglzIdxd59xUPB4H7BArbeZ
 L7prhUPkrVrhPhajryLkUQ==
X-Google-Smtp-Source: AAOMgpeSSidBsCwflqmP1JRPg/26ftUCLl7WTZ/z+h8VF0mXIKMS+LepT/p81PLdmCB6xmaqNoxqCQ==
X-Received: by 2002:a81:a9c6:: with SMTP id
 g189-v6mr14561712ywh.72.1530636306380; 
 Tue, 03 Jul 2018 09:45:06 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id k64-v6sm607431ywb.7.2018.07.03.09.45.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 09:45:05 -0700 (PDT)
Date: Tue, 3 Jul 2018 10:45:03 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, jdelvare@suse.com, linux@roeck-us.net,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 1/2] dt-binding: hwmon: Add NPCM7xx PWM and Fan
 controller documentation
Message-ID: <20180703164503.GA25357@rob-hp-laptop>
References: <20180703094701.255662-1-tmaimon77@gmail.com>
 <20180703094701.255662-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703094701.255662-2-tmaimon77@gmail.com>
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
X-List-Received-Date: Tue, 03 Jul 2018 16:45:09 -0000

On Tue, Jul 03, 2018 at 12:47:00PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM7xx Pulse Width Modulation (PWM)  and Fan tach controller.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/npcm750-pwm-fan.txt  | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> new file mode 100644
> index 000000000000..c56d72d03717
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
> @@ -0,0 +1,87 @@
> +Nuvoton NPCM7xx PWM and Fan Tacho controller device
> +
> +The NPCM7xx has two identical Pulse-width modulation (PWM) controller modules,
> +Each PWM module has four PWM controller outputs, Totally 8 PWM controller outputs.

Kind of sounds like this should be 2 nodes then?

> +
> +The NPCM7xx has eight identical Fan tachometer controller modules,
> +Each Fan module has two Fan controller inputs, Totally 16 Fan controller inputs.
> +
> +Required properties for pwm-fan node
> +- #address-cells : should be 1.
> +- #size-cells 	: should be 0.
> +- compatible	: "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
> +- reg 			: specifies physical base address and size of the registers.
> +- reg-names 	: must contain:
> +					* "pwm" for the PWM registers.
> + 					* "fan" for the Fan registers.
> +- clocks		: phandle of reference clocks.
> +- clock-names	: must contain
> +					* "clk_apb3" for clock of PWM controller.
> + 					* "clk_apb4" for clock of Fan controller.

The "clk_" part is redundant.

Also, this should be the names of the clocks in the module, not the name 
of the source clocks. It seems like these may be the latter?

> +- interrupts	: contain the Fan interrupts with flags for falling edge.
> +- pinctrl-names	: a pinctrl state named "default" must be defined.
> +- pinctrl-0 	: phandle referencing pin configuration of the PWM and Fan
> +					controller ports.
> +
> +fan subnode format:
> +===================
> +Under fan subnode can be upto 8 child nodes, each child node representing a fan.
> +Each fan subnode must have one PWM channel and atleast one Fan tach channel.
> +
> +For PWM channel can be configured cooling-levels to create cooling device.
> +Cooling device could be bound to a thermal zone for the thermal control.
> +
> +Required properties for each child node:
> +- reg : specify the PWM output channel.
> +	integer value in the range 0 through 7, that represent
> +	the PWM channel number that used.
> +
> +- fan-tach-ch : specify the Fan tach input channel.
> +		integer value in the range 0 through 15, that represent
> +		the fan tach channel number that used.
> +
> +		At least one Fan tach input channel is required
> +
> +Optional property for each child node:
> +- cooling-levels: PWM duty cycle values in a range from 0 to 255
> +                  which correspond to thermal cooling states.
> +
> +Examples:
> +
> +pwm_fan:pwm-fan-controller@103000 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "nuvoton,npcm750-pwm-fan";
> +	reg = <0x103000 0x2000>,
> +		<0x180000 0x8000>;
> +	reg-names = "pwm", "fan";
> +	clocks = <&clk NPCM7XX_CLK_APB3>,
> +		<&clk NPCM7XX_CLK_APB4>;
> +	clock-names = "clk_apb3","clk_apb4";
> +	interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
> +			&fanin0_pins &fanin1_pins &fanin2_pins
> +			&fanin3_pins &fanin4_pins>;
> +	fan@0 {
> +		reg = <0x00>;
> +		fan-ch = /bits/ 8 <0x00 0x01>;

Doesn't match the doc.

> +		cooling-levels = <127 255>;
> +	};
> +	fan@1 {
> +		reg = <0x01>;
> +		fan-ch = /bits/ 8 <0x02 0x03>;
> +	};
> +	fan@2 {
> +		reg = <0x02>;
> +		fan-ch = /bits/ 8 <0x04>;
> +	};
> +
> +};
> \ No newline at end of file
> -- 
> 2.14.1
> 
