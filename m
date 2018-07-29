Return-Path: <Tali.Perry@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41dcWy70JLzF10h
 for <openbmc@lists.ozlabs.org>; Sun, 29 Jul 2018 19:16:27 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w6T8jC9q010351;
 Sun, 29 Jul 2018 11:45:12 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 629666312A; Sun, 29 Jul 2018 12:15:11 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: tali.perry1@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com, brendanhiggins@google.com,
 robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net,
 mchehab+samsung@kernel.org, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, arnd@arndb.de, wsa@the-dreams.de,
 andriy.shevchenko@linux.intel.com, pierre-yves.mordret@st.com,
 cedric.madianga@gmail.com, baolin.wang@spreadtrum.com,
 jarkko.nikula@linux.intel.com, hdegoede@redhat.com,
 rmk+kernel@armlinux.org.uk, ard.biesheuvel@linaro.org,
 thor.thayer@linux.intel.com, geert@linux-m68k.org,
 heikki.krogerus@linux.intel.com, tglx@linutronix.de
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-binding: i2c: npcm7xx: add binding for i2c
Date: Sun, 29 Jul 2018 12:14:48 +0300
Message-Id: <20180729091449.385951-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180729091449.385951-1-tali.perry1@gmail.com>
References: <20180729091449.385951-1-tali.perry1@gmail.com>
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:13 +1000
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
X-List-Received-Date: Sun, 29 Jul 2018 09:16:31 -0000

Nuvoton NPCM7XX I2C Controller
NPCM7xx includes 16 I2C contollers. This driver operates the controller.
This module also includes a slave mode, which will be submitted later on.

Any feedback would be appreciated.  


Signed-off-by: Tali Perry <tali.perry1@gmail.com>

---
 .../devicetree/bindings/i2c/i2c-npcm7xx.txt        | 27 ++++++++++++++++++++++
 MAINTAINERS                                        |  9 ++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
new file mode 100644
index 000000000000..e2ee45d7a41e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
@@ -0,0 +1,27 @@
+Nuvoton NPCM7XX I2C bus
+
+The NPCM750x includes sixteen I2C busses
+
+Required properties:
+- compatible      : must be "nuvoton,npcm750-i2c-bus"
+- reg             : Offset and length of the register set for the device.
+- interrupts      : Contain the I2C interrupt with flags for falling edge.
+- clocks          : phandle of I2C reference clock.
+
+Optional:
+- bus-frequency   : Contain the I2C bus frequency,
+			the default I2C bus frequency is 100000.
+- pinctrl-0       : must be <&smbX_pins>, X is module number
+			(on NPCM7XX it's 0 to 15)
+- pinctrl-names   : should be set to "default"
+Example:
+
+	i2c0: i2c-bus@80000 {
+		compatible = "nuvoton,npcm750-i2c-bus";
+		reg = <0x80000 0x1000>;
+		clocks = <&clk NPCM7XX_CLK_APB2>;
+		bus-frequency = <100000>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&smb0_pins>;
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 192d7f73fd01..a28edc9daabb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1735,6 +1735,15 @@ F:	drivers/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 
+ARM/NUVOTON I2C DRIVER
+M:	Tali Perry <tali.perry1@gmail.com>
+M:	Avi Fishman <avifishman70@gmail.com>
+L:	linux-i2c@vger.kernel.org
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	drivers/i2c/busses/i2c-npcm7xx.c
+F:	Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
+
 ARM/NUVOTON W90X900 ARM ARCHITECTURE
 M:	Wan ZongShun <mcuos.com@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.14.1
