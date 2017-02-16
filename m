Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPW3D0pxQzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 09:26:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GMOALX095710
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:26:29 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nfhu57pf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 17:26:29 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 17:26:28 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 17:26:26 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 198496E8048;
 Thu, 16 Feb 2017 17:25:57 -0500 (EST)
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GMQPIL43188390; Thu, 16 Feb 2017 22:26:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DDD5AC048;
 Thu, 16 Feb 2017 17:26:24 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id C2FF7AC043;
 Thu, 16 Feb 2017 17:26:23 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: i2c: Change fsi irq enable
 behavior
Date: Thu, 16 Feb 2017 16:26:23 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021622-0044-0000-0000-000002950874
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006629; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822957; UDB=6.00402661; IPR=6.00600403; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014312; XFM=3.00000011;
 UTC=2017-02-16 22:26:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021622-0045-0000-0000-000006C20A41
Message-Id: <1487283983-23024-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160209
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
X-List-Received-Date: Thu, 16 Feb 2017 22:26:32 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Only enable fsi interrupt polling during an i2c operation. This will
help with busy FSI bus.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/iic-fsi.c  | 30 +++++++++++++++++-------------
 drivers/fsi/i2c/iic-int.h  |  2 ++
 drivers/fsi/i2c/iic-mstr.c | 10 ++++++++++
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 9c70e38..97c8939 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -127,6 +127,20 @@ int writew_wrap(iic_eng_t* eng, unsigned int addr, unsigned long val,
 	return rc;
 };
 
+int iic_enable_irq(iic_eng_t *eng)
+{
+	struct fsi_device *dev = to_fsi_dev(eng->dev);
+
+	return fsi_enable_irq(dev);
+}
+
+void iic_disable_irq(iic_eng_t *eng)
+{
+	struct fsi_device *dev = to_fsi_dev(eng->dev);
+
+	fsi_disable_irq(dev);
+}
+
 struct iic_reg_access fsi_reg_access =
 {
 	.bus_readb = readb_wrap,
@@ -135,6 +149,8 @@ struct iic_reg_access fsi_reg_access =
 	.bus_writeb = writeb_wrap,
 	.bus_writeh = writeh_wrap,
 	.bus_writew = writew_wrap,
+	.bus_enable_irq = iic_enable_irq,
+	.bus_disable_irq = iic_disable_irq,
 };
 
 static const struct fsi_device_id i2c_ids[] = {
@@ -450,10 +466,7 @@ int iic_fsi_suspend(struct device *dev)
 	set_bit(IIC_NO_ACCESS, &eng->flags);
 	
 	/* disable interrupt handler if not already done */
-	if(test_and_clear_bit(IIC_ENG_RESUMED, &eng->flags))
-	{
-		fsi_disable_irq(to_fsi_dev(dev)); 
-	}
+	fsi_disable_irq(to_fsi_dev(dev));
 
 error:	
 	IEXIT(rc);
@@ -505,15 +518,6 @@ int iic_fsi_resume(struct device *dev)
 		goto error;
 	}
 
-	/* Enable interrupt handler in the kernel */	
-	IDBGd(0, "enabling irq\n");
-	rc = fsi_enable_irq(dp);
-	if(rc)
-	{
-		IFLDe(1, "fsi_enable_irq failed rc=%d\n", rc);
-		goto error;
-	}
-
 	set_bit(IIC_ENG_RESUMED, &eng->flags);
 
 	/* allow operations to be submitted */
diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
index b29ece6..65b336f 100644
--- a/drivers/fsi/i2c/iic-int.h
+++ b/drivers/fsi/i2c/iic-int.h
@@ -171,6 +171,8 @@ struct iic_reg_access
     int (*bus_writeb)(iic_eng_t*, unsigned int, unsigned char, iic_ffdc_t**);
     int (*bus_writeh)(iic_eng_t*, unsigned int, unsigned short, iic_ffdc_t**);
     int (*bus_writew)(iic_eng_t*, unsigned int, unsigned long, iic_ffdc_t**);
+    int (*bus_enable_irq)(iic_eng_t *);
+    void (*bus_disable_irq)(iic_eng_t *);
 };
 
 struct iic_eng_ops
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
index 5501b22..a12cf7fc 100644
--- a/drivers/fsi/i2c/iic-mstr.c
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -1079,6 +1079,7 @@ ssize_t iic_common_read(iic_client_t * client, void * buf, size_t count,
 {
 	ssize_t rc = count;
 	iic_xfr_t *xfr;
+	iic_eng_t *eng = client->bus->eng;
 
 	IENTER();
 
@@ -1103,6 +1104,8 @@ ssize_t iic_common_read(iic_client_t * client, void * buf, size_t count,
 		goto exit;
 	}
 
+	rc = eng->ra->bus_enable_irq(eng);
+
 	/* enqueue or start the xfr */
 	rc = iic_enq_xfr(xfr);
 	if(rc != -EIOCBQUEUED)
@@ -1113,6 +1116,8 @@ ssize_t iic_common_read(iic_client_t * client, void * buf, size_t count,
 	/* wait for xfr to complete */
 	iic_wait_xfr(xfr);
 
+	eng->ra->bus_disable_irq(eng);
+
 	/* set rc appropriately */
 	if(xfr->status)
 	{
@@ -1200,6 +1205,7 @@ ssize_t iic_common_write(iic_client_t * client, void * buf, size_t count,
 {
 	ssize_t rc = count;
 	iic_xfr_t *xfr;
+	iic_eng_t *eng = client->bus->eng;
 
 	IENTER();
 
@@ -1223,6 +1229,8 @@ ssize_t iic_common_write(iic_client_t * client, void * buf, size_t count,
 		goto exit;
 	}
 
+	rc = eng->ra->bus_enable_irq(eng);
+
 	/* enqueue or start the xfr */
 	rc = iic_enq_xfr(xfr);
 	if(rc != -EIOCBQUEUED)
@@ -1233,6 +1241,8 @@ ssize_t iic_common_write(iic_client_t * client, void * buf, size_t count,
 	/* wait for xfr to complete */
 	iic_wait_xfr(xfr);
 
+	eng->ra->bus_disable_irq(eng);
+
 	/* set rc appropriately */
 	if(xfr->status)
 	{
-- 
1.8.3.1
