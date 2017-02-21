Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSYJ25VMCzDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:18:09 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LL8u3s003269
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:18:05 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28rqk8rd37-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:18:05 -0500
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 16:18:04 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 16:18:01 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 134D46E8040;
 Tue, 21 Feb 2017 16:17:32 -0500 (EST)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLI0r928311594; Tue, 21 Feb 2017 21:18:00 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACDB2B204D;
 Tue, 21 Feb 2017 16:17:59 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id 5C212B2050;
 Tue, 21 Feb 2017 16:17:59 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: Fix FSI core size checking user
 interfaces
Date: Tue, 21 Feb 2017 15:17:59 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0044-0000-0000-0000029DA4AF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006658; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825180; UDB=6.00404009; IPR=6.00602635; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:18:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0045-0000-0000-000006CAA8A8
Message-Id: <1487711879-15542-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210196
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
X-List-Received-Date: Tue, 21 Feb 2017 21:18:11 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Some potential for integer overflow and not checking signed offsets.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index d63a892..e13774f 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -90,10 +90,7 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 int fsi_device_read(struct fsi_device *dev, uint32_t addr, void *val,
 		size_t size)
 {
-	if (addr > dev->size)
-		return -EINVAL;
-
-	if (addr + size > dev->size)
+	if (addr > dev->size || size > dev->size || addr > dev->size - size)
 		return -EINVAL;
 
 	return fsi_slave_read(dev->slave, dev->addr + addr, val, size);
@@ -103,10 +100,7 @@ EXPORT_SYMBOL_GPL(fsi_device_read);
 int fsi_device_write(struct fsi_device *dev, uint32_t addr, const void *val,
 		size_t size)
 {
-	if (addr > dev->size)
-		return -EINVAL;
-
-	if (addr + size > dev->size)
+	if (addr > dev->size || size > dev->size || addr > dev->size - size)
 		return -EINVAL;
 
 	return fsi_slave_write(dev->slave, dev->addr + addr, val, size);
@@ -328,7 +322,7 @@ static ssize_t fsi_slave_sysfs_raw_read(struct file *file,
 	if (count != 4 || off & 0x3)
 		return -EINVAL;
 
-	if (off > 0xffffffff)
+	if (off > 0xfffffffc || off < 0)
 		return -EINVAL;
 
 	rc = fsi_slave_read(slave, off, buf, 4);
@@ -346,7 +340,7 @@ static ssize_t fsi_slave_sysfs_raw_write(struct file *file,
 	if (count != 4 || off & 0x3)
 		return -EINVAL;
 
-	if (off > 0xffffffff)
+	if (off > 0xfffffffc || off < 0)
 		return -EINVAL;
 
 	rc = fsi_slave_write(slave, off, buf, 4);
-- 
1.8.3.1
