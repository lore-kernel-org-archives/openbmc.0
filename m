Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vn1JQ4zBDzDqZY
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 03:15:34 +1100 (AEDT)
Received: by mail-oi0-f66.google.com with SMTP id a94so4266830oic.0
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 09:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wALBvqpZuqg8+qSWYDPiqUhBuyFiYnGm1feXqB6Twjc=;
 b=PXYCrNznayRAEzLDjZduKoaXWZawjlTa+SOaclZyPPIVMoXqsV8au/7BEsiIJoLbXO
 f20w/TK7c7oqyvhq5FYVNCvMEWuxo2JyjanNFL6QXSY8N+fNB2TmYopd/ofLgbK3LVzM
 WgAr0ruJ7Gi1uY3HFYEAhnyXOggllA0q7VQJtnf3NLTGeP2STu8Q9uEVDsImwRuD4gO1
 CAvXdmBxrSM4hP8VkTzXLy+sPDCQ9XWvEBryO2jGE/1ptSg/Lt4aFLmN0H7JThSZLUrH
 TQ69AUefOFTxStjcaGgUwvrLrAN0+VRZe5rPmcaHl99nlds5CGBKqQG/FQZ5EodUe/tM
 eEpw==
X-Gm-Message-State: AFeK/H3/KE3FGqHrDnw6/zr1dduPewmXT3njmFnkZttwaucTTtKw+N/fY0prjVO+evJCFw==
X-Received: by 10.202.218.134 with SMTP id r128mr13415199oig.2.1490026532466; 
 Mon, 20 Mar 2017 09:15:32 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id x133sm7632596oif.33.2017.03.20.09.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Mar 2017 09:15:31 -0700 (PDT)
Date: Mon, 20 Mar 2017 11:15:31 -0500
From: Rob Herring <robh@kernel.org>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: joel@jms.id.au, jdelvare@suse.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH linux v4 1/2] Documentation: dt-bindings: Document
 bindings for ASPEED AST2400/AST2500 PWM and Fan tach controller device
 driver
Message-ID: <20170320161531.ob65adnqch47dvyi@rob-hp-laptop>
References: <20170311015351.23092-1-jaghu@google.com>
 <20170311015351.23092-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170311015351.23092-2-jaghu@google.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Mar 2017 16:15:35 -0000

On Fri, Mar 10, 2017 at 05:53:50PM -0800, Jaghathiswari Rankappagounder Natarajan wrote:
> This binding provides interface for adding values related to ASPEED
> AST2400/2500 PWM and Fan tach controller support.
> The PWM controller can support upto 8 PWM output ports.
> The Fan tach controller can support upto 16 tachometer inputs.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  v4:
> - Used 'reg'
> 
>  v3:
> - Made the structure more common
> 
>  v2:
> - Removed '_' in node and property names
> - Gave some explanation for the properties used
> 
>  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 86 ++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> new file mode 100644
> index 000000000000..0dfd2841ace3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> @@ -0,0 +1,86 @@
> +ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> +
> +The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> +controller can support upto 16 Fan tachometer inputs.
> +
> +There can be upto 8 fans supported. Each fan can have one PWM output and
> +one/two Fan tach inputs.
> +
> +Required properties for pwm-tacho node:
> +- #address-cells : should be 1.
> +
> +- #size-cells : should be 1.
> +
> +- reg : address and length of the register set for the device.
> +
> +- pinctrl-names : a pinctrl state named "default" must be defined.
> +
> +- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
> +
> +- compatible : should be "aspeed,aspeed2400-pwm-tacho" for AST2400 or
> +	       "aspeed,aspeed2500-pwm-tacho" for AST2500.
> +
> +- clocks : a fixed clock providing input clock frequency(PWM
> +	   and Fan Tach clock)
> +
> +fan subnode format:
> +===================
> +Under fan subnode there can upto 8 child nodes, with each child node
> +representing a fan. If there are 8 fans each fan can have one PWM port and
> +one/two Fan tach inputs.
> +
> +Required properties for each child node:
> +- reg : should specify PWM source port.
> +	integer value in the range 0 to 7 with 0 indicating PWM port A and
> +	7 indicating PWM port H.
> +
> +  Atleast one tach subnode is required. Each tach subnode represents a fan
> +  tach input.
> +  tach subnode format:
> +  --------------------
> +  Required properties for each child node:
> +  - fan-ctrl-gpios : should specify the tachometer input GPIO pin on the hardware.
> +             	     Fan Tachometer function can only work when GPIO is in
> +		     ”input mode”.

As I mentioned on the last version, this sounds like pin-muxing, not 
actual GPIO usage.

> +
> +  - fan-tach-ch : should specify the Fan tach input channel.
> +	          integer value in the range 0 through 15, with 0 indicating
> +		  Fan tach channel 0 and 15 indicating Fan tach channel 15.

These 2 also need aspeed vendor prefixes.

This could become a property under the fan node as a list of tach 
channels if fan-ctrl-gpios goes away.

> +
> +Examples:
> +
> +pwmtachofixedclk: fixedclk {
> +	compatible = "fixed-clock";
> +	#clock-cells = <0>;
> +	clock-frequency = <24000000>;
> +}
> +
> +pwmtacho: pwmtachocontroller@1e786000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	reg = <0x1E786000 0x1000>;
> +	compatible = "aspeed,aspeed2500-pwm-tacho";
> +	clocks = <&pwmtachofixedclk>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +	fan0 {

fan@0

> +		reg = /bits/ 8 <0x00>;

reg is 32-bits.

> +		tach0 {
> +			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 0) GPIO_ACTIVE_HIGH>;
> +			fan-tach-ch = /bits/ 8 <0x00>;
> +		};
> +	};
> +
> +	fan1 {

fan@1

> +		reg = /bits/ 8 <0x01>;
> +		tach0 {
> +			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 1) GPIO_ACTIVE_HIGH>;
> +			fan-tach-ch = /bits/ 8 <0x01>;
> +		};
> +		tach1 {
> +			fan-ctrl-gpios = <&gpio ASPEED_GPIO(O, 2) GPIO_ACTIVE_HIGH>;
> +			fan-tach-ch = /bits/ 8 <0x02>;
> +		};
> +	};
> +};
> --
> 2.12.0.246.ga2ecc84866-goog
> 
