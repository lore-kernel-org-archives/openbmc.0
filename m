Return-Path: <prvs=998d34902=Fran.Hsu@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=998d34902=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44gfhY1csMzDqRx
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 00:01:44 +1000 (AEST)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 12 Apr 2019 22:01:41 +0800
Received: from localhost.localdomain (10.243.91.252) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 12 Apr
 2019 22:01:40 +0800
From: <fran.hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
CC: <openbmc@lists.ozlabs.org>, <benjaminfair@google.com>, FranHsu
 <Fran.Hsu@quantatw.com>
Subject: [PATCH dev-5.0 v2 3/4] ARM: dts: nuvoton: Add Quanta GSJ BMC machine.
Date: Fri, 12 Apr 2019 22:01:31 +0800
Message-ID: <20190412140132.39764-3-fran.hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412140132.39764-1-fran.hsu@quantatw.com>
References: <20190412140132.39764-1-fran.hsu@quantatw.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx05.quanta.corp (10.243.91.100) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24544.006
X-TM-AS-Result: No--10.400300-0.000000-31
X-TM-AS-MatchedID: 712203-704421-780016-863519-188019-703529-701016-704425-7
 00324-121336-700624-700264-703523-700838-148004-148036-42000-42003-63
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
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000
X-List-Received-Date: Fri, 12 Apr 2019 14:01:50 -0000

From: FranHsu <Fran.Hsu@quantatw.com>

Add a flash layout dtsi file for Quanta GSJ BMC.

Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
---
 .../dts/nuvoton-npcm730-gsj-flash-layout.dtsi | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi
new file mode 100644
index 000000000000..6c406fb8504c
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+partitions@80000000 {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		bmc@0{
+			label = "bmc";
+			reg = <0x000000 0x2000000>;
+		};
+		u-boot@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x80000>;
+			read-only;
+		};
+		u-boot-env@100000{
+			label = "u-boot-env";
+			reg = <0x00100000 0x40000>;
+		};
+		kernel@200000 {
+			label = "kernel";
+			reg = <0x0200000 0x600000>;
+		};
+		rofs@800000 {
+			label = "rofs";
+			reg = <0x800000 0x1400000>;
+		};
+		rwfs@1c00000 {
+			label = "rwfs";
+			reg = <0x1c00000 0x300000>;
+		};
+		reserved@1f00000 {
+			label = "reserved";
+			reg = <0x1f00000 0x100000>;
+		};
+};
-- 
2.21.0
