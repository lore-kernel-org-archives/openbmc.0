Return-Path: <clg@kaod.org>
X-Greylist: delayed 14862 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Mar 2017 23:24:55 AEDT
Received: from 16.mo7.mail-out.ovh.net (16.mo7.mail-out.ovh.net
 [46.105.72.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vqN0R65fkzDq95
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 23:24:55 +1100 (AEDT)
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3A99848F09
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 13:17:35 +0100 (CET)
Received: from zorba.kaod.org.com (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 4830818008D;
 Fri, 24 Mar 2017 13:17:32 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] clk: aspeed: fix APB and AHB clock rates
Date: Fri, 24 Mar 2017 13:17:24 +0100
Message-Id: <1490357844-30007-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1035546443466443522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrjeehgdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 24 Mar 2017 12:24:57 -0000

The masking is one bit too generous which generates really low clock
rates.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/clk/aspeed/clk-g4.c | 2 +-
 drivers/clk/aspeed/clk-g5.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/aspeed/clk-g4.c b/drivers/clk/aspeed/clk-g4.c
index bf61919ead52..50117ec16909 100644
--- a/drivers/clk/aspeed/clk-g4.c
+++ b/drivers/clk/aspeed/clk-g4.c
@@ -94,7 +94,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(struct clk_hw *hw,
 		return ret;
 	}
 
-	reg = (reg >> 23) & GENMASK(2, 0);
+	reg = (reg >> 23) & 0x3;
 
 	return hpll_rate / (2 + 2 * reg);
 }
diff --git a/drivers/clk/aspeed/clk-g5.c b/drivers/clk/aspeed/clk-g5.c
index 6eb0004f894d..8f8f7f796cee 100644
--- a/drivers/clk/aspeed/clk-g5.c
+++ b/drivers/clk/aspeed/clk-g5.c
@@ -84,7 +84,7 @@ static unsigned long aspeed_clk_ahb_recalc_rate(struct clk_hw *hw,
 	}
 
 	/* Bits 11:9 define the AXI/AHB clock frequency ratio */
-	reg = (reg >> 9) & GENMASK(3, 0);
+	reg = (reg >> 9) & 0x7;
 
 	/* A value of zero is undefined */
 	WARN_ON(reg == 0);
@@ -108,7 +108,7 @@ static unsigned long aspeed_clk_apb_recalc_rate(struct clk_hw *hw,
 		return ret;
 	}
 
-	reg = (reg >> 23) & GENMASK(3, 0);
+	reg = (reg >> 23) & 0x7;
 
 	rate = hpll_rate / (4 * (reg + 1));
 
-- 
2.7.4
