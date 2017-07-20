Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCxfd6fCzzDrFh
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 00:51:05 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6KEnTDR070257
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 10:51:03 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2btx37sqpj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 10:51:02 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 20 Jul 2017 10:51:02 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 20 Jul 2017 10:51:01 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6KEp00622216896; Thu, 20 Jul 2017 14:51:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DA1A112057;
 Thu, 20 Jul 2017 10:50:57 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id D4DB7112051;
 Thu, 20 Jul 2017 10:50:56 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/fsi/scom: Remove reset before every
 putscom
Date: Thu, 20 Jul 2017 09:50:58 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17072014-0036-0000-0000-0000024C4F14
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007393; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00890324; UDB=6.00444808; IPR=6.00670491; 
 BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016299; XFM=3.00000015;
 UTC=2017-07-20 14:51:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072014-0037-0000-0000-00004128A6FE
Message-Id: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-20_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707200231
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
X-List-Received-Date: Thu, 20 Jul 2017 14:51:06 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Reset causes problems for operations requiring multiple scoms (e.g. i2c
over scom). Instead, reset scom engine during probe.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-scom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 98d062f..e13353a 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -57,12 +57,6 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
 	int rc;
 	uint32_t data;
 
-	data = cpu_to_be32(SCOM_RESET_CMD);
-	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_RESET_REG, &data,
-				sizeof(uint32_t));
-	if (rc)
-		return rc;
-
 	data = cpu_to_be32((value >> 32) & 0xffffffff);
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA0_REG, &data,
 				sizeof(uint32_t));
@@ -186,6 +180,7 @@ static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
 
 static int scom_probe(struct device *dev)
 {
+	uint32_t data;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct scom_device *scom;
 
@@ -202,6 +197,9 @@ static int scom_probe(struct device *dev)
 	scom->mdev.parent = dev;
 	list_add(&scom->link, &scom_devices);
 
+	data = cpu_to_be32(SCOM_RESET_CMD);
+	fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(uint32_t));
+
 	return misc_register(&scom->mdev);
 }
 
-- 
1.8.3.1
