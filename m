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
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxK7J091lzF1nr
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 03:37:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w27GalsZ070817
 for <openbmc@lists.ozlabs.org>; Wed, 7 Mar 2018 11:37:29 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gjet7e3jm-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 11:37:29 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 7 Mar 2018 11:37:27 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 7 Mar 2018 11:37:24 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w27GbOoN61800636; Wed, 7 Mar 2018 16:37:24 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9054112047;
 Wed,  7 Mar 2018 11:35:51 -0500 (EST)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 714BC112051;
 Wed,  7 Mar 2018 11:35:51 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, mine260309@gmail.com,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13 v2] clk: aspeed: Prevent reset if clock is
 enabled
Date: Wed,  7 Mar 2018 10:37:22 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18030716-0048-0000-0000-000002462BD5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008629; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00999644; UDB=6.00508487; IPR=6.00779050; 
 MB=3.00019895; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-07 16:37:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18030716-0049-0000-0000-0000445D0DAD
Message-Id: <1520440642-25531-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-07_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803070190
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
X-List-Received-Date: Wed, 07 Mar 2018 16:37:32 -0000

According to the Aspeed specification, the reset and enable sequence
should be done when the clock is stopped. The specification doesn't
define behavior if the reset is done while the clock is enabled.

From testing on the AST2500, the LPC Controller has problems if the
clock is reset while enabled.

Therefore, check whether the clock is enabled or not before performing
the reset and enable sequence in the Aspeed clock driver.

Fixes: 9871469d2c6f ("clk: aspeed: Register gated clocks")
Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---

Changes since v1:
 - Check and return before the spinlock

 drivers/clk/clk-aspeed.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index b67ba14..a26a94f 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -221,6 +221,12 @@ static int aspeed_clk_enable(struct clk_hw *hw)
 	u32 clk = BIT(gate->clock_idx);
 	u32 rst = BIT(gate->reset_idx);
 	u32 enval;
+	u32 reg;
+
+	/* Only reset/enable/unreset if clock is stopped */
+	regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
+	if (!(reg & clk))
+		return 0;
 
 	spin_lock_irqsave(gate->lock, flags);
 
-- 
1.8.3.1
