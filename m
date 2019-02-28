Return-Path: <prvs=95537dfa2=Fran.Hsu@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=95537dfa2=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4497bW2WbgzDqKT
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 21:10:29 +1100 (AEDT)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx02.quantatw.com with ESMTP; 28 Feb 2019 18:10:27 +0800
Received: from localhost.localdomain (10.243.91.252) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Thu, 28 Feb
 2019 18:10:26 +0800
From: <fran.hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, Benjamin Fair <benjaminfair@google.com>,
 Emily Shaffer <emilyshaffer@google.com>
CC: <openbmc@lists.ozlabs.org>, FranHsu <Fran.Hsu@quantatw.com>
Subject: [PATCH dev-4.19 v2] Fix the typo of the include file name.
Date: Thu, 28 Feb 2019 18:10:19 +0800
Message-ID: <20190228101019.14559-1-fran.hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.243.91.252]
X-ClientProxiedBy: mailbx06.quanta.corp (10.243.91.101) To
 mailbx06.quanta.corp (10.243.91.101)
X-TM-AS-Product-Ver: SMEX-12.0.0.1727-8.200.1013-24460.000
X-TM-AS-Result: No--3.924800-0.000000-31
X-TM-AS-MatchedID: 712203-701236-701016-700270-188019-863519-711871-708712-1
 48004-148036-10019-41000-42000-42003-63
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
X-List-Received-Date: Thu, 28 Feb 2019 10:10:32 -0000

From: FranHsu <Fran.Hsu@quantatw.com>

Change the name of the include file.

Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 411387ee2f62..998a7d451b7d 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -3,7 +3,7 @@
 
 /dts-v1/;
 #include "nuvoton-npcm730.dtsi"
-#include "nuvoton-npcm733-gsj-gpio.dtsi"
+#include "nuvoton-npcm730-gsj-gpio.dtsi"
 / {
 	model = "Quanta GSJ Board (Device Tree v2))";
 	compatible = "nuvoton,npcm750";
-- 
2.21.0
