Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwpCw0mDLzF1dZ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 07:24:43 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w26KORWB101075
 for <openbmc@lists.ozlabs.org>; Tue, 6 Mar 2018 15:24:41 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gj0tstyr8-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 15:24:41 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 6 Mar 2018 15:24:39 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 6 Mar 2018 15:24:36 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w26KOZA956754212; Tue, 6 Mar 2018 20:24:35 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA983B2046;
 Tue,  6 Mar 2018 16:26:50 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 9ABD2B204D;
 Tue,  6 Mar 2018 16:26:50 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13] clk: aspeed: Prevent reset and enable if clock
 is already enabled
Date: Tue,  6 Mar 2018 14:24:32 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18030620-0048-0000-0000-0000024532B5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008628; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00999336; UDB=6.00508293; IPR=6.00778655; 
 MB=3.00019880; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-06 20:24:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030620-0049-0000-0000-000044598B29
Message-Id: <1520367872-32101-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-06_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803060220
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2018 20:24:44 -0000

Systems are seeing some issues where the LPC clock gets into a bad state
when the ASPEED clock driver resets and enables the clock during
startup. The LPC clock (according to AST2500 spec) is enabled by default,
so resetting and re-enabling is not desired. Add a simple check before the
enable procedure to see if the clock is already enabled.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/clk/clk-aspeed.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index b67ba14..3d12f7a 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -221,27 +221,33 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	u32 clk = BIT(gate->clock_idx);
 	u32 rst = BIT(gate->reset_idx);
 	u32 enval;
+	u32 reg;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-	if (gate->reset_idx >= 0) {
-		/* Put IP in reset */
-		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, rst);
-
-		/* Delay 100us */
-		udelay(100);
-	}
-
-	/* Enable clock */
-	enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
-	regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
-
-	if (gate->reset_idx >= 0) {
-		/* A delay of 10ms is specified by the ASPEED docs */
-		mdelay(10);
-
-		/* Take IP out of reset */
-		regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst, 0);
+	/* Only reset/enable/unreset if clock isn't already enabled */
+	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
+	if (reg & clk) {
+		if (gate->reset_idx >= 0) {
+			/* Put IP in reset */
+			regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,
+					   rst);
+
+			/* Delay 100us */
+			udelay(100);
+		}
+
+		/* Enable clock */
+		enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
+		regmap_update_bits(gate->map, ASPEED_CLK_STOP_CTRL, clk, enval);
+
+		if (gate->reset_idx >= 0) {
+			/* A delay of 10ms is specified by the ASPEED docs */
+			mdelay(10);
+
+			/* Take IP out of reset */
+			regmap_update_bits(gate->map, ASPEED_RESET_CTRL, rst,						   0);
+		}
 	}
 
 	spin_unlock_irqrestore(gate->lock, flags);
-- 
1.8.3.1
