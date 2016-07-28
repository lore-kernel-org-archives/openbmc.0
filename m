Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0GGm674ZzDrHM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 12:37:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6S2XPGR085006
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 22:37:18 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 24e5we6cta-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 22:37:17 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 28 Jul 2016 12:37:15 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 28 Jul 2016 12:37:13 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 91F132CE805E
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 12:37:12 +1000 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6S2bCIU24772858
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 12:37:12 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6S2bC4e007666
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 12:37:12 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u6S2bBYa007652; Thu, 28 Jul 2016 12:37:12 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id E9B79A01C3;
 Thu, 28 Jul 2016 12:37:10 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id BC4AFE3BAA;
 Thu, 28 Jul 2016 12:37:10 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id A6F68942255; Thu, 28 Jul 2016 12:37:10 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: [PATCH dev-4.7] net/faraday: Switch to use-ncsi device node property
Date: Thu, 28 Jul 2016 12:37:09 +1000
X-Mailer: git-send-email 2.1.0
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16072802-0004-0000-0000-0000017F6D8D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16072802-0005-0000-0000-000008590678
Message-Id: <1469673429-29042-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-28_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607280026
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 02:37:21 -0000

This uses "use-ncsi" device node property to enable NCSI interface
as we do in upstream kernel. No functional change introduced.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts    | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
 drivers/net/ethernet/faraday/ftgmac100.c         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 41ee12a..310a4ef 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -71,7 +71,7 @@
 &mac0 {
 	status = "okay";
 
-	use-nc-si;
+	use-ncsi;
 };
 
 &i2c0 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
index 63b039c..d97f216 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
@@ -56,7 +56,7 @@
 &mac0 {
 	status = "okay";
 
-	use-nc-si;
+	use-ncsi;
 };
 
 &i2c4 {
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 1ae3983..bd76100 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -70,7 +70,7 @@
 &mac0 {
 	status = "okay";
 
-	use-nc-si;
+	use-ncsi;
 	no-hw-checksum;
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index bb5ec59..d5b9af9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -28,7 +28,7 @@
 &mac0 {
 	status = "okay";
 
-	use-nc-si;
+	use-ncsi;
 	no-hw-checksum;
 };
 
diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index fc2852f..c67b670 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1352,7 +1352,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	priv = netdev_priv(netdev);
 	SET_NETDEV_DEV(netdev, &pdev->dev);
 	if (pdev->dev.of_node &&
-	    of_get_property(pdev->dev.of_node, "use-nc-si", NULL)) {
+	    of_get_property(pdev->dev.of_node, "use-ncsi", NULL)) {
 		dev_info(&pdev->dev, "Using NCSI interface\n");
 		netdev->phydev = NULL;
 		priv->use_ncsi = true;
-- 
2.1.0
