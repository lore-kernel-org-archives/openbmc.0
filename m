Return-Path: <prvs=9281b6405=Samuel.Jiang@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9281b6405=samuel.jiang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 43rVtW6Yg7zDqfM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 19:40:51 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 01 Feb 2019 16:40:49 +0800
Received: from samueljiang-System-Product-Name.dhcpserver.local
 (10.243.91.252) by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1531.3; Fri, 1 Feb 2019 16:40:41 +0800
From: <Samuel.Jiang@quantatw.com>
To: <KWLIU@nuvoton.com>, <joel@jms.id.au>, <tomer.maimon@nuvoton.com>,
 <fran.hsu@quantatw.com>
CC: <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 2/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: add jtag
 and led nodes
Date: Fri, 1 Feb 2019 16:40:23 +0800
Message-ID: <20190201084027.19501-2-Samuel.Jiang@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
References: <20190201084027.19501-1-Samuel.Jiang@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx07.quanta.corp (10.243.91.102) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24402.003
X-TM-AS-Result: No-1.542600-0.000000-31
X-TM-AS-MatchedID: 704421-700918-701016-188019-702609-702898-700648-702829-1
 48004-148036-42000-42003-63
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
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
X-List-Received-Date: Fri, 01 Feb 2019 08:40:52 -0000

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

Add leds setting which on RunBMC Module and add jtag node

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 7ab03add7f9c..5a56181af25c 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -329,7 +329,47 @@
 		pinctrl-names = "default";
 
 	};
+	
+	jtag {
+		compatible = "nuvoton,npcm750-jtag";
+		enable_pspi_jtag = <1>;
+		pspi-index = <2>;
+		tck {
+			label = "tck";
+			gpios = <&gpio0 19 0>;
+			regbase = <0xf0010000 0x1000>;
+		};
+
+		tdi {
+			label = "tdi";
+			gpios = <&gpio0 18 0>;
+			regbase = <0xf0010000 0x1000>;
+		};
+
+		tdo {
+			label = "tdo";
+			gpios = <&gpio0 17 0>;
+			regbase = <0xf0010000 0x1000>;
+		};
+
+		tms {
+			label = "tms";
+			gpios = <&gpio0 16 0>;
+			regbase = <0xf0010000 0x1000>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio110ol_pins>;
 
+		led {
+		label = "led-green-arm";
+			gpios = <&gpio3 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &gcr {
-- 
2.17.1
