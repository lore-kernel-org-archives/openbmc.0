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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4096RN1225zF25L
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 08:17:19 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2QLFH0d038206
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 17:17:17 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gy8689294-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 26 Mar 2018 17:17:16 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 26 Mar 2018 17:17:15 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 26 Mar 2018 17:17:11 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2QLHBZu58196196; Mon, 26 Mar 2018 21:17:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96AB62803A;
 Mon, 26 Mar 2018 17:16:34 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.85.181.180])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id EF9E42803D;
 Mon, 26 Mar 2018 17:16:33 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net, wim@linux-watchdog.org, 
 joel@jms.id.au, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH] aspeed: watchdog: Add status function
Date: Mon, 26 Mar 2018 16:17:08 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18032621-0056-0000-0000-000004332A0A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008749; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01008834; UDB=6.00513863; IPR=6.00788116; 
 MB=3.00020256; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-26 21:17:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032621-0057-0000-0000-0000087535E9
Message-Id: <1522099028-20347-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803260214
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
X-List-Received-Date: Mon, 26 Mar 2018 21:17:20 -0000

Populate the status watchdog operation to return the "timeout status"
register of the ASPEED watchdog.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index a5b8eb2..d6dd5c9 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -55,6 +55,7 @@ struct aspeed_wdt_config {
 #define   WDT_CTRL_WDT_INTR		BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
+#define WDT_TIMEOUT_STATUS	0x10
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -138,6 +139,13 @@ static int aspeed_wdt_ping(struct watchdog_device *wdd)
 	return 0;
 }
 
+static unsigned int aspeed_wdt_status(struct watchdog_device *wdd)
+{
+	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
+
+	return readl(wdt->base + WDT_TIMEOUT_STATUS);
+}
+
 static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
@@ -171,6 +179,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
 	.start		= aspeed_wdt_start,
 	.stop		= aspeed_wdt_stop,
 	.ping		= aspeed_wdt_ping,
+	.status		= aspeed_wdt_status,
 	.set_timeout	= aspeed_wdt_set_timeout,
 	.restart	= aspeed_wdt_restart,
 	.owner		= THIS_MODULE,
-- 
1.8.3.1
