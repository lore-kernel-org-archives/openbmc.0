Return-Path: <clg@kaod.org>
X-Greylist: delayed 998 seconds by postgrey-1.36 at bilbo;
 Fri, 07 Oct 2016 08:44:09 AEDT
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqmPj2bXszDrSJ
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 08:44:08 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 1B49711CFA
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 23:27:18 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id E20DF2A0067;
 Thu,  6 Oct 2016 23:27:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 06/12] aspeed: timer cleanups
Date: Thu,  6 Oct 2016 23:26:39 +0200
Message-Id: <1475789205-19618-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475789205-19618-1-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13958344095162206978
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
X-List-Received-Date: Thu, 06 Oct 2016 21:44:09 -0000

The code should not use static as it is relocated at init time. Also
add some definitions on the bits used to configure timer 1.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/arm/mach-aspeed/timer.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
index 3755238f173c..9ab4b3fa125d 100644
--- a/arch/arm/mach-aspeed/timer.c
+++ b/arch/arm/mach-aspeed/timer.c
@@ -27,17 +27,30 @@
 #define TIMER_LOAD_VAL 0xffffffff
 #define CLK_PER_HZ (CONFIG_TIMER_CLK_FREQ / CONFIG_SYS_HZ)
 
+/* Clock selection for Timer/Counter #1
+ * Counter is base on the selected clock to count down
+ *
+ * 0: APB clock (PCLK)
+ * 1: External clock (1 MHz)
+ */
+#define TIMER_CLK_SELECT	0x2
+/* Timer enable for Timer/Counter #1 */
+#define TIMER_ENABLE		0x1
+
 /* macro to read the 32 bit timer */
 #define READ_CLK (*(volatile ulong *)(AST_TIMER_BASE + 0))
 #define READ_TIMER (READ_CLK / CLK_PER_HZ)
 
-static ulong timestamp;
-static ulong lastdec;
+DECLARE_GLOBAL_DATA_PTR;
+
+#define timestamp	(gd->arch.tbl)
+#define lastdec		(gd->arch.lastinc)
 
 int timer_init (void)
 {
 	*(volatile ulong *)(AST_TIMER_BASE + 4)    = TIMER_LOAD_VAL;
-	*(volatile ulong *)(AST_TIMER_BASE + 0x30) = 0x3; /* enable timer1 */
+	*(volatile ulong *)(AST_TIMER_BASE + 0x30) =
+		TIMER_ENABLE|TIMER_CLK_SELECT;
 
 	/* init the timestamp and lastdec value */
 	reset_timer_masked();
@@ -118,7 +131,7 @@ ulong get_timer_masked (void)
 /* waits specified delay value and resets timestamp */
 void udelay_masked (unsigned long usec)
 {
-  __udelay(usec);
+	__udelay(usec);
 }
 
 /*
-- 
2.7.4
