Return-Path: <clg@kaod.org>
Received: from 4.mo7.mail-out.ovh.net (4.mo7.mail-out.ovh.net [178.32.122.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0mJ757mzDvwq
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:31:12 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 9087B207AA
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:25:20 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 4974048009B;
 Fri, 18 Nov 2016 15:25:17 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 09/38] aspeed/scu: fix SCU region size
Date: Fri, 18 Nov 2016 15:21:49 +0100
Message-Id: <1479478938-13267-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1103381911605250818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:31:13 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 34e86385d837..95022d3607ad 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -86,7 +86,7 @@
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
 #define PROT_KEY_UNLOCK 0x1688A8A8
-#define SCU_IO_REGION_SIZE 0x20000
+#define SCU_IO_REGION_SIZE 0x1000
 
 static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
      [SYS_RST_CTRL]    = 0xFFCFFEDCU,
-- 
2.7.4
