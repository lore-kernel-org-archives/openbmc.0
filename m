Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tKrMz62lxzDvnK
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 19:13:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="F4c6KKfS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QNNko7Di"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D95A6205F4;
 Fri, 18 Nov 2016 03:13:00 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 18 Nov 2016 03:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=iv0FoqBpWEkDfocx+1krk7sWCPY=; b=F4c6KK
 fSff1Prlpt2YZEBNYqfZTAIzaTx+G6LIxVxCKNwTEuXyWpRzRcY5gW0eDu3Xbb6w
 Fs+vhbIH/t9/RbEvF5Nv7/SiW+n/e0lBjzJ0NyARXJzGmIMdBd07ZYSjcir/EQKz
 2+8+YPx5qyDM0K25HGbFldAfQ4Dy480I4okI0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=iv0FoqBpWEkDfo
 cx+1krk7sWCPY=; b=QNNko7DiAFv9/GAhK9Hdo1JFRPwNOfi+daa38z8fTllfST
 MQd7Sd4ot/afDYbMRfo4W+tkyhygLlvBiEUyLNEii/p05qUrdT127tkqLqL+P5fC
 0DIGgV46CeX5AGEGSz0q4vm7qLHY/rASWAV3DJWuQBiLeHpwSidiAcCvGlW0g=
X-ME-Sender: <xms:DLguWLC0G_hqbH5xpVy6Kw3dxwy2oPsXDtYGXkgHile2J-graZ6hLA>
X-Sasl-enc: KOKtVljOBuAA5gAwAL7TksdrYQ9PNA/f2PvyaHCYsdpQ 1479456780
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C9047E7E6;
 Fri, 18 Nov 2016 03:12:58 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
Date: Fri, 18 Nov 2016 18:42:21 +1030
Message-Id: <20161118081221.19651-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 18 Nov 2016 08:13:04 -0000

This is a work-around that attempts to emulate the GPIO state originally
written by the mach-aspeed board file.

It isn't entirely analogous: Whilst values might be set in the GPIO
data/direction registers, this doesn't mean the GPIO IP was in control
of the pins affected by the bits in question. However, the content of
the patch is derived directly from the data and direction values that
Steve Faure reported[1] from a Palmetto running the OpenBMC stable branch.

Secondly, the patch pays no regard to the prescribed active state of the lines
and assumes active high for all pins. This is not a reflection of the
description in the schematic, and neither do the configured GPIO values
necessarily reflect the prescribed initial values from the schematic.

A starting point for the patch was generated from the following Python script:

	 #!/usr/bin/python3
	 import sys

	 from collections import namedtuple

	 GpioRegsetConfig = namedtuple("GpioRegsetConfig", "banks value direction")
	 banks = ( "ABCD", "EFGH" )

	 broken = (
		 GpioRegsetConfig(banks[0], 0x130F8CE3, 0x01706074),
		 GpioRegsetConfig(banks[1], 0x9F48F7FF, 0x00004002)
	 )

	 working = (
		 GpioRegsetConfig(banks[0], 0x130F8CE3, 0x0370E677),
		 GpioRegsetConfig(banks[1], 0x0370E677, 0xC738F202)
	 )

	 GpioConfig = namedtuple("GpioConfig", "bank index direction state active")

	 def gpio_dt(name, config):
	     fmt = "pin_gpio_{} {{\n\tgpio-hog;\n\tgpios = <ASPEED_GPIO({}, {}) {}>;\n\t{};\n\tline-name = \"{}\";\n}};"
	     if "output" == config.direction:
		 state = "{}-{}".format(config.direction, config.state)
	     else:
		 state = config.direction
	     return fmt.format(
		 name.lower(),
		 config.bank,
		 config.index,
		 "GPIO_ACTIVE_HIGH",
		 state,
		 name)

	 def tell_gpios(config, change):
	     for i, bank in enumerate(config.banks):
		 for j in range(0, 8):
		     bi = i * 8 + j;
		     if ((1 << bi) & change) > 0:
			 gpio = "{}{}".format(bank, j)
			 if (bi & config.direction) > 0:
			     sd = "output"
			     value = "high" if (bi & config.value) > 0 else "low"
			 else:
			     sd = "input"
			     value = None
			 dtconfig = GpioConfig(bank, j, sd, value, "GPIO_ACTIVE_HIGH")
			 print(gpio_dt(gpio, dtconfig))
			 print()

	 def main():
	     for b, w in zip(broken, working):
		 cd = b.direction ^ w.direction
		 tell_gpios(w, cd)

	 if __name__ == "__main__":
	     main()

The generated patch was tested on a Pass 2 Palmetto. It was found that with the
patch and an OpenBMC userspace generated at v1.99.0-60-g2b717d8489c1, the host
could:

* Boot to Petitboot
* Reboot to Petitboot
* Survive a reboot of the BMC (remain functional at the Petitboot shell)
* Be powered off by the BMC after reboot

Reports from Andrew Geissler[2] and Cédric Le Goater[3] suggest mixed results
across the Palmetto fleet, but this patch at least represents a step forwards.

For the above reasons and those below, this patch is a temporary work-around:

* GPIOs configured as hogs cannot have their line state changed once initialised
* GPIOs configured as hogs will not be exposed to userspace even if requested

These two issues combined deny capabilities such as Cronus. The ultimate
solution is userspace daemon(s) requesting and controlling the GPIOs as
desired.

[1] https://github.com/openbmc/openbmc/issues/527#issuecomment-244239595
[2] https://github.com/openbmc/openbmc/issues/513#issuecomment-244454018
[3] https://github.com/openbmc/openbmc/issues/513#issuecomment-244414523

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

Including this in the OpenBMC repository is increasingly looks like the idea of
a troll and not something that's practical. Lets stop wasting people's time and
include it in our kernel tree; anyone testing custom kernels can feel free to
comment out the hogs in the devicetree.

 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 127 ++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 21619fd8cd8d..5c689613e5bd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -167,6 +167,133 @@
 		output-low;
 		line-name = "func_mode2";
 	};
+
+	pin_gpio_a0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "A0";
+	};
+
+	pin_gpio_a1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "A1";
+	};
+
+	pin_gpio_b1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "B1";
+	};
+
+	pin_gpio_b2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "B2";
+	};
+
+	pin_gpio_b7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "B7";
+	};
+
+	pin_gpio_d1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "D1";
+	};
+
+	pin_gpio_f1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "F1";
+	};
+
+	pin_gpio_f4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "F4";
+	};
+
+	pin_gpio_f5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "F5";
+	};
+
+	pin_gpio_f7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "F7";
+	};
+
+	pin_gpio_g3 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "G3";
+	};
+
+	pin_gpio_g4 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "G4";
+	};
+
+	pin_gpio_g5 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "G5";
+	};
+
+	pin_gpio_h0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "H0";
+	};
+
+	pin_gpio_h1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+		input;
+		line-name = "H1";
+	};
+
+	pin_gpio_h2 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "H2";
+	};
+
+	pin_gpio_h6 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "H6";
+	};
+
+	pin_gpio_h7 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "H7";
+	};
+
 };
 
 &vuart {
-- 
2.7.4
