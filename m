Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmBD09swzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:34:12 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id DA8011073B
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:14 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id AE04B2A0067;
 Thu,  6 Oct 2016 23:27:11 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 05/12] aspeed: replace CONFIG_ASPEED_TIMER_CLK with
 CONFIG_TIMER_CLK_FREQ
Date: Thu,  6 Oct 2016 23:26:38 +0200
Message-Id: <1475789205-19618-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13957218196905495298
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeefgddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 06 Oct 2016 21:34:12 -0000

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/mach-aspeed/timer.c | 6 +++---
 include/configs/ast-common.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
index 626f992429b6..3755238f173c 100644
--- a/arch/arm/mach-aspeed/timer.c
+++ b/arch/arm/mach-aspeed/timer.c
@@ -20,12 +20,12 @@
 
 #include <common.h>
 
-#if CONFIG_ASPEED_TIMER_CLK < CONFIG_SYS_HZ
-#error "CONFIG_ASPEED_TIMER_CLK must be as large as CONFIG_SYS_HZ"
+#if CONFIG_TIMER_CLK_FREQ < CONFIG_SYS_HZ
+#error "CONFIG_TIMER_CLK_FREQ must be as large as CONFIG_SYS_HZ"
 #endif
 
 #define TIMER_LOAD_VAL 0xffffffff
-#define CLK_PER_HZ (CONFIG_ASPEED_TIMER_CLK / CONFIG_SYS_HZ)
+#define CLK_PER_HZ (CONFIG_TIMER_CLK_FREQ / CONFIG_SYS_HZ)
 
 /* macro to read the 32 bit timer */
 #define READ_CLK (*(volatile ulong *)(AST_TIMER_BASE + 0))
diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
index a93dc61f3730..a663d76407cb 100644
--- a/include/configs/ast-common.h
+++ b/include/configs/ast-common.h
@@ -43,7 +43,7 @@
 
 #define CONFIG_SYS_MALLOC_LEN   	(0x1000 + 4*1024*1024) /* malloc() len */
 
-#define CONFIG_ASPEED_TIMER_CLK		(1*1000*1000)	/* use external clk (1M) */
+#define CONFIG_TIMER_CLK_FREQ		(1*1000*1000)	/* use external clk (1M) */
 
 /*
  * NS16550 Configuration
-- 
2.7.4
