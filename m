Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yGpQv3hZmzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 08:36:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9HLZ6Rn118632
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:05 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dnsu686ck-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2017 17:36:05 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 17 Oct 2017 15:36:04 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 17 Oct 2017 15:36:02 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9HLa1OJ59375760; Tue, 17 Oct 2017 14:36:02 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F7726A03D;
 Tue, 17 Oct 2017 15:36:02 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 2040B6A03B;
 Tue, 17 Oct 2017 15:36:02 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 3/3] drivers: fsi: sbefifo: Attempt reset
 request during probe
Date: Tue, 17 Oct 2017 16:35:53 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17101721-0016-0000-0000-000007AC0B49
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007908; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000237; SDB=6.00932594; UDB=6.00469652; IPR=6.00712884; 
 BA=6.00005643; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017581; XFM=3.00000015;
 UTC=2017-10-17 21:36:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101721-0017-0000-0000-00003BE63503
Message-Id: <1508276153-3779-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-17_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710170300
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 21:36:07 -0000

From: "Edward A. James" <eajames@us.ibm.com>

If data is found in the FIFO, the driver currently immediately fails
the probe. Instead, try a reset request and poll for it's completion for
a while (this protocol is defined in the SBE FIFO spec, though the
timeout lengths are my own invention).

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 53 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 764d8f3..f756822 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -47,8 +47,10 @@
 
 #define SBEFIFO_STS		0x04
 #define   SBEFIFO_EMPTY			BIT(20)
+#define   SBEFIFO_STS_RESET_REQ		BIT(25)
 #define SBEFIFO_EOT_RAISE	0x08
 #define   SBEFIFO_EOT_MAGIC		0xffffffff
+#define SBEFIFO_REQ_RESET	0x0C
 #define SBEFIFO_EOT_ACK		0x14
 
 #define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
@@ -831,6 +833,36 @@ static int sbefifo_unregister_child(struct device *dev, void *data)
 	return 0;
 }
 
+static int sbefifo_request_reset(struct sbefifo *sbefifo)
+{
+	int ret;
+	u32 status;
+	unsigned long start;
+	const unsigned int wait_time = 5;	/* jiffies */
+	const unsigned long timeout = msecs_to_jiffies(250);
+
+	ret = sbefifo_outw(sbefifo, SBEFIFO_UP | SBEFIFO_REQ_RESET, 1);
+	if (ret)
+		return ret;
+
+	start = jiffies;
+
+	do {
+		ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &status);
+		if (ret)
+			return ret;
+
+		if (!(status & SBEFIFO_STS_RESET_REQ))
+			return 0;
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (schedule_timeout(wait_time) > 0)
+			return -EINTR;
+	} while (time_after(start + timeout, jiffies));
+
+	return -ETIME;
+}
+
 static int sbefifo_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
@@ -838,7 +870,7 @@ static int sbefifo_probe(struct device *dev)
 	struct device_node *np;
 	struct platform_device *child;
 	char child_name[32];
-	u32 sts;
+	u32 up, down;
 	int ret, child_idx = 0;
 
 	dev_dbg(dev, "Found sbefifo device\n");
@@ -848,22 +880,21 @@ static int sbefifo_probe(struct device *dev)
 
 	sbefifo->fsi_dev = fsi_dev;
 
-	ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &sts);
+	ret = sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS, &up);
 	if (ret)
 		return ret;
 
-	if (!(sts & SBEFIFO_EMPTY)) {
-		dev_err(dev, "Found data in upstream fifo\n");
-		return -EIO;
-	}
-
-	ret = sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &sts);
+	ret = sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &down);
 	if (ret)
 		return ret;
 
-	if (!(sts & SBEFIFO_EMPTY)) {
-		dev_err(dev, "Found data in downstream fifo\n");
-		return -EIO;
+	if (!(up & SBEFIFO_EMPTY) || !(down & SBEFIFO_EMPTY)) {
+		ret = sbefifo_request_reset(sbefifo);
+		if (ret) {
+			dev_err(dev,
+				"fifos weren't empty and failed the reset\n");
+			return ret;
+		}
 	}
 
 	spin_lock_init(&sbefifo->lock);
-- 
1.8.3.1
