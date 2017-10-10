Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.74.227; helo=8.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 2397 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Oct 2017 00:17:54 AEDT
Received: from 8.mo178.mail-out.ovh.net (8.mo178.mail-out.ovh.net
 [46.105.74.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBHjG53zczDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 00:17:54 +1100 (AEDT)
Received: from player728.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 2F9D55A286
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 15:09:35 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice3n7.emea.ibm.com
 [195.212.29.177]) (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 97BC85400A7;
 Tue, 10 Oct 2017 15:09:32 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot] aspeed/timer: move static variables under
 arch_global_data
Date: Tue, 10 Oct 2017 15:09:25 +0200
Message-Id: <20171010130925.19345-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14307654541739723522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrtddtgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 13:17:55 -0000

The timestamp and lastdec variables are under BSS which is a problem
as the timer_init() routine is called in the early init phase. Move
them under arch_global_data.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 Tested on AST2500 EVB

 arch/arm/mach-aspeed/timer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-aspeed/timer.c b/arch/arm/mach-aspeed/timer.c
index 626f992429b6..d4a85116e80b 100644
--- a/arch/arm/mach-aspeed/timer.c
+++ b/arch/arm/mach-aspeed/timer.c
@@ -31,8 +31,10 @@
 #define READ_CLK (*(volatile ulong *)(AST_TIMER_BASE + 0))
 #define READ_TIMER (READ_CLK / CLK_PER_HZ)
 
-static ulong timestamp;
-static ulong lastdec;
+DECLARE_GLOBAL_DATA_PTR;
+
+#define timestamp gd->arch.tbl
+#define lastdec gd->arch.lastinc
 
 int timer_init (void)
 {
-- 
2.13.6
