Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsM9S4763zDqC4
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 04:54:36 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2RHrkQn066012
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 13:54:29 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 29f2u97b7y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 13:54:28 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 27 Mar 2017 11:54:27 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 27 Mar 2017 11:54:25 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2RHsIBH10944972; Mon, 27 Mar 2017 10:54:18 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B37866A04F;
 Mon, 27 Mar 2017 11:54:18 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 640216A043;
 Mon, 27 Mar 2017 11:54:18 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: scom: Remove scom reset before
 every putscom
Date: Mon, 27 Mar 2017 12:54:16 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17032717-0028-0000-0000-0000074B0BC8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006860; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00839548; UDB=6.00413065; IPR=6.00617451; 
 BA=6.00005241; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014824; XFM=3.00000013;
 UTC=2017-03-27 17:54:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032717-0029-0000-0000-0000349EA40A
Message-Id: <1490637256-10584-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-27_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703270150
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
X-List-Received-Date: Mon, 27 Mar 2017 17:54:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Reset was causing PIB I2C master issues.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-scom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index 9216467..57eab1d4 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -55,12 +55,7 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
 			uint32_t addr)
 {
 	int rc;
-	uint32_t data = SCOM_RESET_CMD;
-
-	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_RESET_REG, &data,
-				sizeof(uint32_t));
-	if (rc)
-		return rc;
+	uint32_t data;
 
 	data = (value >> 32) & 0xffffffff;
 	rc = fsi_device_write(scom_dev->fsi_dev, SCOM_DATA0_REG, &data,
@@ -185,6 +180,7 @@ static const struct file_operations scom_fops = {
 
 static int scom_probe(struct device *dev)
 {
+	u32 data = SCOM_RESET_CMD;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct scom_device *scom;
 
@@ -202,6 +198,8 @@ static int scom_probe(struct device *dev)
 	scom->mdev.parent = dev;
 	list_add(&scom->link, &scom_devices);
 
+	fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(u32));
+
 	return misc_register(&scom->mdev);
 }
 
-- 
1.8.3.1
