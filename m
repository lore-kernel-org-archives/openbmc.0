Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WDzs0M5JzDqQm
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 08:15:52 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2TL3llD026923
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:51 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rhq2xb7wf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:50 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Fri, 29 Mar 2019 21:15:49 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Mar 2019 21:15:48 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2TLFlHC25755728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Mar 2019 21:15:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01C76112061;
 Fri, 29 Mar 2019 21:15:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEE36112062;
 Fri, 29 Mar 2019 21:15:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 29 Mar 2019 21:15:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.0 v2 2/5] clk: Aspeed: Setup video engine clocking
Date: Fri, 29 Mar 2019 21:15:40 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19032921-0060-0000-0000-0000032416F6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010836; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01181526; UDB=6.00618413; IPR=6.00962247; 
 MB=3.00026214; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-29 21:15:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032921-0061-0000-0000-000048C51DA8
Message-Id: <1553894143-559-3-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=824 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903290145
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
X-List-Received-Date: Fri, 29 Mar 2019 21:15:53 -0000

Add eclk mux and clock divider table.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/clk/clk-aspeed.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 5961367..133e80c 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -87,7 +87,7 @@ struct aspeed_clk_gate {
 /* TODO: ask Aspeed about the actual parent data */
 static const struct aspeed_gate_data aspeed_gates[] = {
 	/*				 clk rst   name			parent	flags */
-	[ASPEED_CLK_GATE_ECLK] =	{  0, -1, "eclk-gate",		"eclk",	0 }, /* Video Engine */
+	[ASPEED_CLK_GATE_ECLK] =	{  0,  6, "eclk-gate",		"eclk",	0 }, /* Video Engine */
 	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
 	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
 	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */
@@ -113,6 +113,24 @@ struct aspeed_clk_gate {
 	[ASPEED_CLK_GATE_LHCCLK] =	{ 28, -1, "lhclk-gate",		"lhclk", 0 }, /* LPC master/LPC+ */
 };
 
+static const char * const eclk_parent_names[] = {
+	"mpll",
+	"hpll",
+	"dpll",
+};
+
+static const struct clk_div_table ast2500_eclk_div_table[] = {
+	{ 0x0, 2 },
+	{ 0x1, 2 },
+	{ 0x2, 3 },
+	{ 0x3, 4 },
+	{ 0x4, 5 },
+	{ 0x5, 6 },
+	{ 0x6, 7 },
+	{ 0x7, 8 },
+	{ 0 }
+};
+
 static const struct clk_div_table ast2500_mac_div_table[] = {
 	{ 0x0, 4 }, /* Yep, really. Aspeed confirmed this is correct */
 	{ 0x1, 4 },
@@ -192,18 +210,21 @@ static struct clk_hw *aspeed_ast2500_calc_pll(const char *name, u32 val)
 
 struct aspeed_clk_soc_data {
 	const struct clk_div_table *div_table;
+	const struct clk_div_table *eclk_div_table;
 	const struct clk_div_table *mac_div_table;
 	struct clk_hw *(*calc_pll)(const char *name, u32 val);
 };
 
 static const struct aspeed_clk_soc_data ast2500_data = {
 	.div_table = ast2500_div_table,
+	.eclk_div_table = ast2500_eclk_div_table,
 	.mac_div_table = ast2500_mac_div_table,
 	.calc_pll = aspeed_ast2500_calc_pll,
 };
 
 static const struct aspeed_clk_soc_data ast2400_data = {
 	.div_table = ast2400_div_table,
+	.eclk_div_table = ast2400_div_table,
 	.mac_div_table = ast2400_div_table,
 	.calc_pll = aspeed_ast2400_calc_pll,
 };
@@ -522,6 +543,22 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_clk_data->hws[ASPEED_CLK_24M] = hw;
 
+	hw = clk_hw_register_mux(dev, "eclk-mux", eclk_parent_names,
+				 ARRAY_SIZE(eclk_parent_names), 0,
+				 scu_base + ASPEED_CLK_SELECTION, 2, 0x3, 0,
+				 &aspeed_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_clk_data->hws[ASPEED_CLK_ECLK_MUX] = hw;
+
+	hw = clk_hw_register_divider_table(dev, "eclk", "eclk-mux", 0,
+					   scu_base + ASPEED_CLK_SELECTION, 28,
+					   3, 0, soc_data->eclk_div_table,
+					   &aspeed_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_clk_data->hws[ASPEED_CLK_ECLK] = hw;
+
 	/*
 	 * TODO: There are a number of clocks that not included in this driver
 	 * as more information is required:
@@ -531,7 +568,6 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 	 *   RGMII
 	 *   RMII
 	 *   UART[1..5] clock source mux
-	 *   Video Engine (ECLK) mux and clock divider
 	 */
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
-- 
1.8.3.1
