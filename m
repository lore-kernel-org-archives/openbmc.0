Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qdftX3KK2zDqCn
 for <openbmc@lists.ozlabs.org>; Mon,  4 Apr 2016 15:00:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=PBlr19c1; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 0963B2B206A;
 Sun,  3 Apr 2016 22:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id; s=aj.id.au; bh=M/WfcjKfULiM3VqpBLp772r
 /+cs=; b=PBlr19c1+76KNcf4oW551TNGd93XUD/U+ZWMOxpx/8xzx6yP8inYWQu
 uPJBpeR8kQDpXkBZSMbrZbjwR1wyXjf0yjUFoRxg1CKpCDHN862806XVrsSy376d
 7Hf/sF+ZSNb72S5stIWmHf0u/SXg0SZQo4XDM2k65AB5n3CDCVmw=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 6B4312B2065;
 Sun,  3 Apr 2016 22:00:01 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH linux] arch/arm: Add qemupalmetto dts with Cadence GEM support
Date: Mon,  4 Apr 2016 14:29:51 +0930
Message-Id: <1459745991-22733-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2016 05:00:04 -0000

Describes a machine that is as similar to Palmetto, primarily for running under
QEMU. Relaxing the constraint of booting the exact Palmetto hardware in QEMU
allows us to integrate existing device models to expand the machine's
capability without huge effort.

In this case, the Cadence GEM controller is integrated as there was an existing
model in QEMU which was easy to integrate (both in QEMU and kernel).

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts
new file mode 100644
index 0000000..b0915cd
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-qemupalmetto.dts
@@ -0,0 +1,16 @@
+#include "aspeed-bmc-opp-palmetto.dts"
+
+/ {
+	ahb {
+		mac1: ethernet@1e680000 {
+			compatible = "cdns,gem";
+			reg = <0x1e680000 0x1000>;
+			interrupts = <3>;
+			clock-names = "pclk", "hclk", "tx_clk";
+			clocks = <&clk_apb>, <&clk_apb>, <&clk_apb>;
+			status = "okay";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
-- 
2.5.0
