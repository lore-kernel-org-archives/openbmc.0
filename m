Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgG370z8xzDq5f
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:18 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5UANcaW014755
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:17 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23v6yecu3b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 06:28:17 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 30 Jun 2016 20:28:14 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 20:28:13 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 4E8FC2CE8056
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:13 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5UASDqM7340134
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:13 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5UASC7a008642
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 20:28:13 +1000
Received: from gwshan ([9.192.205.20])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u5UASATm008555; Thu, 30 Jun 2016 20:28:12 +1000
Received: by gwshan (Postfix, from userid 1000)
 id 60044943495; Thu, 30 Jun 2016 20:28:06 +1000 (AEST)
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: benh@kernel.crashing.org, joel@jms.id.au, gwshan@linux.vnet.ibm.com
Subject: [PATCH 09/10] net/farady: Match driver according to compatible
 property
Date: Thu, 30 Jun 2016 20:27:50 +1000
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16063010-0012-0000-0000-000001A57E22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16063010-0013-0000-0000-0000057F7250
Message-Id: <1467282471-16560-10-git-send-email-gwshan@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300099
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
X-List-Received-Date: Thu, 30 Jun 2016 10:28:19 -0000

This matches the driver with devices compatible with "faraday,ftgmac100"
declared in the device tree. Originally, device's name from device
tree for it.

Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index f2205ae..23e27f1 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1422,14 +1422,20 @@ static int __exit ftgmac100_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id ftgmac100_of_match[] = {
+	{ .compatible = "faraday,ftgmac100" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ftgmac100_of_match);
+
 static struct platform_driver ftgmac100_driver = {
-	.probe		= ftgmac100_probe,
-	.remove		= __exit_p(ftgmac100_remove),
-	.driver		= {
-		.name	= DRV_NAME,
+	.probe	= ftgmac100_probe,
+	.remove	= ftgmac100_remove,
+	.driver	= {
+		.name		= DRV_NAME,
+		.of_match_table	= ftgmac100_of_match,
 	},
 };
-
 module_platform_driver(ftgmac100_driver);
 
 MODULE_AUTHOR("Po-Yu Chuang <ratbert@faraday-tech.com>");
-- 
2.1.0
