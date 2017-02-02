Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2t2F7WzDqBg
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NJm54076219
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:28 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ccstty9x-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:28 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:27 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:25 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id E498919D8026;
 Thu,  2 Feb 2017 16:25:38 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQOd914156072; Thu, 2 Feb 2017 16:26:24 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7592C78038;
 Thu,  2 Feb 2017 16:26:24 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 0E53D78041;
 Thu,  2 Feb 2017 16:26:24 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames@us.ibm.com>
Subject: [PATCH v2 2/3] drivers/fsi: Add Client IRQ Enable / Disable
Date: Thu,  2 Feb 2017 17:26:03 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0012-0000-0000-0000138A6473
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816379; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0013-0000-0000-00004B154592
Message-Id: <1486077964-11346-8-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2
 spamscore=2 suspectscore=1
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:30 -0000

From: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Allow FSI client drivers to enable and disable their engine
IRQ's via the exported interfaces fsi_enable_irq and fsi_disable_irq

Signed-off-by: Eddie James <eajames@us.ibm.com>
Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4df7218..2f6fde9 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -657,12 +657,57 @@ EXPORT_SYMBOL_GPL(fsi_driver_unregister);
 
 int fsi_enable_irq(struct fsi_device *dev)
 {
+	int rc;
+	u32 si1m;
+	u32 bit = 0x80000000 >> dev->si1s_bit;
+	struct fsi_master *master = dev->slave->master;
+
+	if (!dev->irq_handler)
+		return -EINVAL;
+
+	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+			sizeof(u32));
+	if (rc) {
+		dev_err(master->dev, "couldn't read si1m:%d\n", rc);
+		return rc;
+	}
+
+	si1m |= bit;
+	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+			sizeof(u32));
+	if (rc) {
+		dev_err(master->dev, "couldn't write si1m:%d\n", rc);
+		return rc;
+	}
+
+	master->ipoll |= bit;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(fsi_enable_irq);
 
 void fsi_disable_irq(struct fsi_device *dev)
 {
+	int rc;
+	u32 si1m;
+	u32 bits = ~(0x80000000 >> dev->si1s_bit);
+	struct fsi_master *master = dev->slave->master;
+
+	master->ipoll &= bits;
+
+	rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+			sizeof(u32));
+	if (rc) {
+		dev_err(master->dev, "couldn't read si1m:%d\n", rc);
+		return;
+	}
+
+	si1m &= bits;
+	rc = master->write(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1M, &si1m,
+			sizeof(u32));
+	if (rc) {
+		dev_err(master->dev, "couldn't write si1m:%d\n", rc);
+		return;
+	}
 }
 
 struct bus_type fsi_bus_type = {
-- 
1.8.2.2
