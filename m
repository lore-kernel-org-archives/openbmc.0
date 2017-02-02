Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2y4TlwzDqBZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NIdpP078850
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:32 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28c8w1uxv4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:32 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:31 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:28 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 47D1719D801C;
 Thu,  2 Feb 2017 16:25:42 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQRBX10682772; Thu, 2 Feb 2017 16:26:27 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE30778056;
 Thu,  2 Feb 2017 16:26:27 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6776478038;
 Thu,  2 Feb 2017 16:26:27 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames@us.ibm.com>
Subject: [PATCH v2 3/3] drivers/fsi: Add sysfs file to adjust i-poll period
Date: Thu,  2 Feb 2017 17:26:04 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0012-0000-0000-0000138A647C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816379; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0013-0000-0000-00004B1545B3
Message-Id: <1486077964-11346-9-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:35 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Create a sysfs file that can read and modify the period for
interrupt polling of connected CFAMs.

Signed-off-by: Eddie James <eajames@us.ibm.com>
Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2f6fde9..1e9c5a2 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -569,6 +569,30 @@ done:
 	return 0;
 }
 
+static ssize_t fsi_ipoll_period_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", fsi_ipoll_period_ms);
+}
+
+static ssize_t fsi_ipoll_period_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	int rc;
+	unsigned long val = 0;
+
+	rc = kstrtoul(buf, 0, &val);
+
+	if (val > 1 && val < 10000)
+	fsi_ipoll_period_ms = val;
+
+	return count;
+}
+
+DEVICE_ATTR(fsi_ipoll_period, S_IRUGO | S_IWUSR, fsi_ipoll_period_show,
+		fsi_ipoll_period_store);
+
 int fsi_master_register(struct fsi_master *master)
 {
 	if (!master || !master->dev)
@@ -578,12 +602,14 @@ int fsi_master_register(struct fsi_master *master)
 	master->slave_list = false;
 	get_device(master->dev);
 	fsi_master_scan(master);
+	device_create_file(master->dev, &dev_attr_fsi_ipoll_period);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_master_register);
 
 void fsi_master_unregister(struct fsi_master *master)
 {
+	device_remove_file(master->dev, &dev_attr_fsi_ipoll_period);
 	fsi_master_unscan(master);
 	put_device(master->dev);
 	if (master_ipoll) {
-- 
1.8.2.2
