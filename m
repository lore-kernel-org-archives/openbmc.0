Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfHSL0jNqzDqLR
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 18:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bOwYokEd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="e1HDMb6Z"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A77F2090D;
 Fri,  2 Jun 2017 04:29:19 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 02 Jun 2017 04:29:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=wzOuFn
 mR9jIlXjW0u6EejZ/IC2lZTul2mLUYnnY45ag=; b=bOwYokEdbhvmXf9PWdqAw8
 Fa8mpcBlvSxaDVj5isMCzJ0Smd4E7kK7aGwRVYzhE032a1VgANVnTKIUABriZgDp
 w39X+HoGsVsMK1PCuifxh0sXI3CQtgCWIP4hrcZtdhul6Gvy5KwXTbhDA58ETPAa
 ++5BuRBgOA/ckC6ZJxL7N5RsEaVprHQxPo7vABbhIM0e5ksw0YM1qPRdy9PG6bsZ
 6ec33UIB85HQz5F9plOAsXfGdOcmbcBqImN74b+wU20JKClu7Dl+kor0JVZFx3Hs
 8AH/lmn6f1HiluKuHMmA7T2JAhjz+CqIvMwBzxtrXGvlBGlbNPDLI4dYbcx/Ak4w
 ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=wzOuFnmR9jIlXjW0u6EejZ/IC2lZTul2mLUYnnY45
 ag=; b=e1HDMb6ZrhVfk+rI3MyvwCmMQfQhYfjBhGMi2bg8hLdCHZgIfp0arQeZv
 o4FwQ94kJANV3Wma+Yqm5ObhVzvxxvvdyUCw4B0wKjVNtaJDaW/f/ENNELxfrzsS
 8+wQB3AI1KAh35tAoHKLFf1zFzDFkiDIANrKuMCvy9ruSllwwoGRVgpyWAZC+a19
 5RX1vHbygEzrZTspV+bYfUf3v4RsHM5A4ai5F7GR6mb4wAfWNUpZsuOCmRF3xpk9
 x9e/6ULUy5Fq0PV+z0VbQyxiBhp1906c69/+l2DsUTKv0zXE7pC4TSNy+gpCOmWe
 wPfDXFGEn5BTw3yaF9b1uIJUjMM7Q==
X-ME-Sender: <xms:3yExWY7-6SMaRIGeOsItf5wopaJjyUU8A3WSG6sDhocm02gGtG62bg>
X-Sasl-enc: MwEvUfQUApX32COZN95tzATrBNMR3yHUcUaJYhs8FsUk 1496392158
Received: from keelia.base64.com.au (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 492A17E84B;
 Fri,  2 Jun 2017 04:29:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Cc: Andrew Jeffery <andrew@aj.id.au>, anoo@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH linux dev-4.10 1/3] mfd: dt: Add Aspeed Low Pin Count
 Controller bindings
Date: Fri,  2 Jun 2017 17:58:42 +0930
Message-Id: <20170602082844.7370-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170602082844.7370-1-andrew@aj.id.au>
References: <20170602082844.7370-1-andrew@aj.id.au>
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
X-List-Received-Date: Fri, 02 Jun 2017 08:29:22 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
(cherry picked from commit 3bca0e552f693a7d815d24d8fda1196f2c668074)
---
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
new file mode 100644
index 000000000000..a97131aba446
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
@@ -0,0 +1,111 @@
+======================================================================
+Device tree bindings for the Aspeed Low Pin Count (LPC) Bus Controller
+======================================================================
+
+The LPC bus is a means to bridge a host CPU to a number of low-bandwidth
+peripheral devices, replacing the use of the ISA bus in the age of PCI[0]. The
+primary use case of the Aspeed LPC controller is as a slave on the bus
+(typically in a Baseboard Management Controller SoC), but under certain
+conditions it can also take the role of bus master.
+
+The LPC controller is represented as a multi-function device to account for the
+mix of functionality it provides. The principle split is between the register
+layout at the start of the I/O space which is, to quote the Aspeed datasheet,
+"basically compatible with the [LPC registers from the] popular BMC controller
+H8S/2168[1]", and everything else, where everything else is an eclectic
+collection of functions with a esoteric register layout. "Everything else",
+here labeled the "host" portion of the controller, includes, but is not limited
+to:
+
+* An IPMI Block Transfer[2] Controller
+
+* An LPC Host Controller: Manages LPC functions such as host vs slave mode, the
+  physical properties of some LPC pins, configuration of serial IRQs, and
+  APB-to-LPC bridging amonst other functions.
+
+* An LPC Host Interface Controller: Manages functions exposed to the host such
+  as LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
+  management and bus snoop configuration.
+
+* A set of SuperIO[3] scratch registers: Enables implementation of e.g. custom
+  hardware management protocols for handover between the host and baseboard
+  management controller.
+
+Additionally the state of the LPC controller influences the pinmux
+configuration, therefore the host portion of the controller is exposed as a
+syscon as a means to arbitrate access.
+
+[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
+[1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2168.pdf?key=7c88837454702128622bee53acbda8f4
+[2] http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
+[3] https://en.wikipedia.org/wiki/Super_I/O
+
+Required properties
+===================
+
+- compatible:	One of:
+		"aspeed,ast2400-lpc", "simple-mfd"
+		"aspeed,ast2500-lpc", "simple-mfd"
+
+- reg:		contains the physical address and length values of the Aspeed
+                LPC memory region.
+
+- #address-cells: <1>
+- #size-cells:	<1>
+- ranges: 	Maps 0 to the physical address and length of the LPC memory
+                region
+
+Required LPC Child nodes
+========================
+
+BMC Node
+--------
+
+- compatible:	One of:
+		"aspeed,ast2400-lpc-bmc"
+		"aspeed,ast2500-lpc-bmc"
+
+- reg:		contains the physical address and length values of the
+                H8S/2168-compatible LPC controller memory region
+
+Host Node
+---------
+
+- compatible:   One of:
+		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
+		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
+
+- reg:		contains the address and length values of the host-related
+                register space for the Aspeed LPC controller
+
+- #address-cells: <1>
+- #size-cells:	<1>
+- ranges: 	Maps 0 to the address and length of the host-related LPC memory
+                region
+
+Example:
+
+lpc: lpc@1e789000 {
+	compatible = "aspeed,ast2500-lpc", "simple-mfd";
+	reg = <0x1e789000 0x1000>;
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x0 0x1e789000 0x1000>;
+
+	lpc_bmc: lpc-bmc@0 {
+		compatible = "aspeed,ast2500-lpc-bmc";
+		reg = <0x0 0x80>;
+	};
+
+	lpc_host: lpc-host@80 {
+		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
+		reg = <0x80 0x1e0>;
+		reg-io-width = <4>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x80 0x1e0>;
+	};
+};
+
-- 
2.11.0
