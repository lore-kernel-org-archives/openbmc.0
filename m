Return-Path: <clg@kaod.org>
Received: from 8.mo69.mail-out.ovh.net (8.mo69.mail-out.ovh.net
 [46.105.56.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNWY31LYmzDvrr
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 03:45:10 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id DC634B545
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 17:45:06 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id A57DD540087;
 Tue, 22 Nov 2016 17:45:01 +0100 (CET)
Subject: Re: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <20161118081221.19651-1-andrew@aj.id.au>
Cc: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <16ff25a6-dabf-0075-684b-37799ed5abab@kaod.org>
Date: Tue, 22 Nov 2016 17:45:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161118081221.19651-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8507862648956750594
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdehgdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 22 Nov 2016 16:45:11 -0000

On 11/18/2016 09:12 AM, Andrew Jeffery wrote:
> This is a work-around that attempts to emulate the GPIO state originally
> written by the mach-aspeed board file.
> 
> It isn't entirely analogous: Whilst values might be set in the GPIO
> data/direction registers, this doesn't mean the GPIO IP was in control
> of the pins affected by the bits in question. However, the content of
> the patch is derived directly from the data and direction values that
> Steve Faure reported[1] from a Palmetto running the OpenBMC stable branch.
> 
> Secondly, the patch pays no regard to the prescribed active state of the lines
> and assumes active high for all pins. This is not a reflection of the
> description in the schematic, and neither do the configured GPIO values
> necessarily reflect the prescribed initial values from the schematic.
> 
> A starting point for the patch was generated from the following Python script:
> 
> 	 #!/usr/bin/python3
> 	 import sys
> 
> 	 from collections import namedtuple
> 
> 	 GpioRegsetConfig = namedtuple("GpioRegsetConfig", "banks value direction")
> 	 banks = ( "ABCD", "EFGH" )
> 
> 	 broken = (
> 		 GpioRegsetConfig(banks[0], 0x130F8CE3, 0x01706074),
> 		 GpioRegsetConfig(banks[1], 0x9F48F7FF, 0x00004002)
> 	 )
> 
> 	 working = (
> 		 GpioRegsetConfig(banks[0], 0x130F8CE3, 0x0370E677),
> 		 GpioRegsetConfig(banks[1], 0x0370E677, 0xC738F202)
> 	 )
> 
> 	 GpioConfig = namedtuple("GpioConfig", "bank index direction state active")
> 
> 	 def gpio_dt(name, config):
> 	     fmt = "pin_gpio_{} {{\n\tgpio-hog;\n\tgpios = <ASPEED_GPIO({}, {}) {}>;\n\t{};\n\tline-name = \"{}\";\n}};"
> 	     if "output" == config.direction:
> 		 state = "{}-{}".format(config.direction, config.state)
> 	     else:
> 		 state = config.direction
> 	     return fmt.format(
> 		 name.lower(),
> 		 config.bank,
> 		 config.index,
> 		 "GPIO_ACTIVE_HIGH",
> 		 state,
> 		 name)
> 
> 	 def tell_gpios(config, change):
> 	     for i, bank in enumerate(config.banks):
> 		 for j in range(0, 8):
> 		     bi = i * 8 + j;
> 		     if ((1 << bi) & change) > 0:
> 			 gpio = "{}{}".format(bank, j)
> 			 if (bi & config.direction) > 0:
> 			     sd = "output"
> 			     value = "high" if (bi & config.value) > 0 else "low"
> 			 else:
> 			     sd = "input"
> 			     value = None
> 			 dtconfig = GpioConfig(bank, j, sd, value, "GPIO_ACTIVE_HIGH")
> 			 print(gpio_dt(gpio, dtconfig))
> 			 print()
> 
> 	 def main():
> 	     for b, w in zip(broken, working):
> 		 cd = b.direction ^ w.direction
> 		 tell_gpios(w, cd)
> 
> 	 if __name__ == "__main__":
> 	     main()
> 
> The generated patch was tested on a Pass 2 Palmetto. It was found that with the
> patch and an OpenBMC userspace generated at v1.99.0-60-g2b717d8489c1, the host
> could:

The palmetto I use runs v1.99.0-275 and I could not boot the system. Unfortunately,
pdbg does not see the P8 chip so I really don't know what it is up to. Here 
are the GPIO status :

GPIO	DIR	VALUE	PIN	NAME
----------------------------------------------------
326	out	0	A6	CRONUS_SEL
432	-	-	O0	MEZZ0_PRESENT
433	-	-	O1	MEZZ1_PRESENT
324	out	0	A4	FSI_CLK
334	out	0	B6	USB_RESET
428	-	-	N4	SLOT1_PRESENT
352	in	1	E0	POWER_BUTTON
333	out	0	B5	PCIE_RESET
455	out	0	Q7	IDBTN
325	out	1	A5	FSI_DATA
343	in	1	C7	PGOOD
426	-	-	N2	SLOT2_RISER_PRESENT
425	-	-	N1	SLOT1_RISER_PRESENT
424	-	-	N0	SLOT0_RISER_PRESENT
353	out	0	E1	POWER_PIN
427	-	-	N3	SLOT0_PRESENT
445	-	-	P5	CHECKSTOP
395	out	1	J3	BMC_THROTTLE
344	out	1	D0	FSI_ENABLE
429	-	-	N5	SLOT2_PRESENT

Cheers,

C.


> * Boot to Petitboot
> * Reboot to Petitboot
> * Survive a reboot of the BMC (remain functional at the Petitboot shell)
> * Be powered off by the BMC after reboot
> 
> Reports from Andrew Geissler[2] and Cédric Le Goater[3] suggest mixed results
> across the Palmetto fleet, but this patch at least represents a step forwards.
>
> For the above reasons and those below, this patch is a temporary work-around:
> 
> * GPIOs configured as hogs cannot have their line state changed once initialised
> * GPIOs configured as hogs will not be exposed to userspace even if requested
> 
> These two issues combined deny capabilities such as Cronus. The ultimate
> solution is userspace daemon(s) requesting and controlling the GPIOs as
> desired.
> 
> [1] https://github.com/openbmc/openbmc/issues/527#issuecomment-244239595
> [2] https://github.com/openbmc/openbmc/issues/513#issuecomment-244454018
> [3] https://github.com/openbmc/openbmc/issues/513#issuecomment-244414523
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> 
> Including this in the OpenBMC repository is increasingly looks like the idea of
> a troll and not something that's practical. Lets stop wasting people's time and
> include it in our kernel tree; anyone testing custom kernels can feel free to
> comment out the hogs in the devicetree.
> 
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 127 ++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 21619fd8cd8d..5c689613e5bd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -167,6 +167,133 @@
>  		output-low;
>  		line-name = "func_mode2";
>  	};
> +
> +	pin_gpio_a0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "A0";
> +	};
> +
> +	pin_gpio_a1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "A1";
> +	};
> +
> +	pin_gpio_b1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "B1";
> +	};
> +
> +	pin_gpio_b2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "B2";
> +	};
> +
> +	pin_gpio_b7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "B7";
> +	};
> +
> +	pin_gpio_d1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "D1";
> +	};
> +
> +	pin_gpio_f1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "F1";
> +	};
> +
> +	pin_gpio_f4 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "F4";
> +	};
> +
> +	pin_gpio_f5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "F5";
> +	};
> +
> +	pin_gpio_f7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "F7";
> +	};
> +
> +	pin_gpio_g3 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "G3";
> +	};
> +
> +	pin_gpio_g4 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "G4";
> +	};
> +
> +	pin_gpio_g5 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "G5";
> +	};
> +
> +	pin_gpio_h0 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "H0";
> +	};
> +
> +	pin_gpio_h1 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
> +		input;
> +		line-name = "H1";
> +	};
> +
> +	pin_gpio_h2 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "H2";
> +	};
> +
> +	pin_gpio_h6 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "H6";
> +	};
> +
> +	pin_gpio_h7 {
> +		gpio-hog;
> +		gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "H7";
> +	};
> +
>  };
>  
>  &vuart {
> 
