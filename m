Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQ60b3M2PzDq5x
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 08:41:19 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1HLd5mL026131
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:41:17 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28p96j06q7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 16:41:16 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 17 Feb 2017 16:41:16 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 17 Feb 2017 16:41:14 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id D986AC90043;
 Fri, 17 Feb 2017 16:40:54 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1HLfD1155640194; Fri, 17 Feb 2017 21:41:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE0CAE03B;
 Fri, 17 Feb 2017 16:41:12 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 9CF99AE052;
 Fri, 17 Feb 2017 16:41:11 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: scom: Add reset functionality and
 sysfs interface
Date: Fri, 17 Feb 2017 15:41:11 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021721-0040-0000-0000-000002A825AF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006635; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00823422; UDB=6.00402939; IPR=6.00600868; 
 BA=6.00005148; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014329; XFM=3.00000011;
 UTC=2017-02-17 21:41:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021721-0041-0000-0000-0000069B469F
Message-Id: <1487367671-26077-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-17_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702170199
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
X-List-Received-Date: Fri, 17 Feb 2017 21:41:20 -0000

From: "Edward A. James" <eajames@us.ibm.com>

full reset only

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-scom.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index ff8267b..c73bd91 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -32,7 +32,10 @@
 #define SCOM_DATA0_REG		0x00
 #define SCOM_DATA1_REG		0x04
 #define SCOM_CMD_REG		0x08
+#define SCOM_FSI2PIB_RESET_REG	0x18
 #define SCOM_RESET_REG		0x1C
+#define SCOM_COMP_MASK_REG	0x30
+#define SCOM_TRUE_MASK_REG	0x34
 
 #define SCOM_RESET_CMD		0x80000000
 #define SCOM_WRITE_CMD		0x80000000
@@ -156,7 +159,7 @@ static ssize_t scom_write(struct file *filep, const char __user *buf,
 	if (rc)
 		dev_dbg(dev, "put_scom failed with:%d\n", rc);
 
-	return rc;
+	return rc ? rc : len;
 }
 
 static loff_t scom_llseek(struct file *file, loff_t offset, int whence)
@@ -181,6 +184,48 @@ static const struct file_operations scom_fops = {
 	.write	= scom_write,
 };
 
+static int scom_reset_fsi2pib(struct fsi_device *fsi_dev)
+{
+	int rc;
+	u32 dummy = 0xFFFFFFFF;
+
+	rc = fsi_device_write(fsi_dev, SCOM_FSI2PIB_RESET_REG, &dummy,
+			      sizeof(u32));
+	if (rc)
+		dev_dbg(&fsi_dev->dev,
+			"failed to write fsi2pib reset register rc:%d\n", rc);
+
+	return rc;
+}
+
+static int scom_full_reset(struct fsi_device *fsi_dev)
+{
+	int rc = 0;
+	u32 dummy = 0xFFFFFFFF;
+
+	rc = fsi_device_write(fsi_dev, SCOM_RESET_REG, &dummy, sizeof(u32));
+	if (rc) {
+		dev_dbg(&fsi_dev->dev,
+			"failed to write scom reset register rc:%d\n", rc);
+		return rc;
+	}
+
+	return scom_reset_fsi2pib(fsi_dev);
+}
+
+static ssize_t store_reset_register(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+
+	rc = scom_full_reset(fsi_dev);
+
+	return rc ? rc : count;
+}
+DEVICE_ATTR(reset, 0200, NULL, store_reset_register);
+
 static int scom_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
@@ -200,6 +245,8 @@ static int scom_probe(struct device *dev)
 	scom->mdev.parent = dev;
 	list_add(&scom->link, &scom_devices);
 
+	device_create_file(dev, &dev_attr_reset);
+
 	return misc_register(&scom->mdev);
 }
 
@@ -207,6 +254,8 @@ static int scom_remove(struct device *dev)
 {
 	struct scom_device *scom, *scom_tmp;
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
+
+	device_remove_file(dev, &dev_attr_reset);
 	
 	list_for_each_entry_safe(scom, scom_tmp, &scom_devices, link) {
 		if (scom->fsi_dev == fsi_dev) {
-- 
1.8.3.1
