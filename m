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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gZKB4R52zF22N
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 08:43:41 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48MdvuS049874
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 18:43:37 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hum30250h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 18:43:37 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 8 May 2018 18:43:36 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 18:43:34 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48MhYro50790592; Tue, 8 May 2018 22:43:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F401112047;
 Tue,  8 May 2018 18:43:28 -0400 (EDT)
Received: from talon7.ibm.com (unknown [9.41.241.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id A7962112034;
 Tue,  8 May 2018 18:43:27 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH linux dev-4.13] fsi: scom: Remove PIB reset during probe
Date: Tue,  8 May 2018 17:43:32 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 18050822-0008-0000-0000-00000304A3A6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008995; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029489; UDB=6.00526053; IPR=6.00808622; 
 MB=3.00021003; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 22:43:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050822-0009-0000-0000-0000392E224D
Message-Id: <1525819412-21308-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080209
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
X-List-Received-Date: Tue, 08 May 2018 22:43:43 -0000

The PIB reset causes problems for the running P9 chip. The reset
shouldn't be performed by this driver.

Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-scom.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index e13353a..c8eb5e5 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -26,15 +26,11 @@
 
 #define FSI_ENGID_SCOM		0x5
 
-#define SCOM_FSI2PIB_DELAY	50
-
 /* SCOM engine register set */
 #define SCOM_DATA0_REG		0x00
 #define SCOM_DATA1_REG		0x04
 #define SCOM_CMD_REG		0x08
-#define SCOM_RESET_REG		0x1C
 
-#define SCOM_RESET_CMD		0x80000000
 #define SCOM_WRITE_CMD		0x80000000
 
 struct scom_device {
@@ -180,7 +176,6 @@ static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
 
 static int scom_probe(struct device *dev)
 {
-	uint32_t data;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct scom_device *scom;
 
@@ -197,9 +192,6 @@ static int scom_probe(struct device *dev)
 	scom->mdev.parent = dev;
 	list_add(&scom->link, &scom_devices);
 
-	data = cpu_to_be32(SCOM_RESET_CMD);
-	fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(uint32_t));
-
 	return misc_register(&scom->mdev);
 }
 
-- 
1.8.3.1
