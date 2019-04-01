Return-Path: <prvs=9877b4cea=George.Hung@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=9877b4cea=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Xkc46Y6SzDqLH
 for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2019 18:33:56 +1100 (AEDT)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 01 Apr 2019 15:33:52 +0800
Received: from george-Quanta.com.com (10.243.91.252) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 1 Apr 2019
 15:33:51 +0800
From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>, <emilyshaffer@google.com>,
 <benjaminfair@google.com>, <Avi.Fishman@nuvoton.com>,
 <ofer.eilon@nuvoton.com>, <tomer.maimon@nuvoton.com>
Subject: [PATCH dev-5.0 v2 2/2] EDAC: Add Nuvoton NPCM7xx EDAC driver
Date: Mon, 1 Apr 2019 15:30:32 +0800
Message-ID: <20190401073032.46316-2-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401073032.46316-1-george.hung@quantatw.com>
References: <20190401073032.46316-1-george.hung@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx05.quanta.corp (10.243.91.100) To
 mailbx05.quanta.corp (10.243.91.100)
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
X-List-Received-Date: Mon, 01 Apr 2019 07:33:57 -0000

Add device tree document for Nuvoton NPCM7xx EDAC

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
new file mode 100644
index 000000000000..dd4dac59a5bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
@@ -0,0 +1,17 @@
+Nuvoton NPCM7xx SoC EDAC device driver
+
+The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
+uses the EDAC framework to implement the ECC detection and corrtection.
+
+Required properties:
+- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
+- reg:		Memory controller register set should be <0xf0824000 0x1000>
+- interrupts:	should be MC interrupt #25
+
+Example:
+
+	mc: memory-controller@f0824000 {
+		compatible = "nuvoton,npcm7xx-sdram-edac";
+		reg = <0xf0824000 0x1000>;
+		interrupts = <0 25 4>;
+	};
-- 
2.21.0
