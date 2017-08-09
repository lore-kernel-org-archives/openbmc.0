Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSLcP47KjzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 05:17:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v79JEL4f128140
 for <openbmc@lists.ozlabs.org>; Wed, 9 Aug 2017 15:17:05 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c81bwt8br-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 15:17:05 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 9 Aug 2017 15:17:05 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Aug 2017 15:17:01 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v79JH1oT59179114; Wed, 9 Aug 2017 19:17:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54E0FAC040;
 Wed,  9 Aug 2017 15:17:18 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 06A71AC03A;
 Wed,  9 Aug 2017 15:17:17 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] fsi: core: Reduce console output during normal
 scan
Date: Wed,  9 Aug 2017 14:16:59 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17080919-0024-0000-0000-000002BD10AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007514; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000219; SDB=6.00899939; UDB=6.00450499; IPR=6.00680144; 
 BA=6.00005520; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016615; XFM=3.00000015;
 UTC=2017-08-09 19:17:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080919-0025-0000-0000-0000450A9B7D
Message-Id: <20170809191659.33078-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-09_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708090300
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
X-List-Received-Date: Wed, 09 Aug 2017 19:17:10 -0000

To reduce amount of console output during boot / power up make
all good path scan related messages debug type.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c       | 4 ++--
 drivers/fsi/fsi-master-hub.c | 2 +-
 drivers/fsi/fsi-sbefifo.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 7b06b0d..0f19bd3 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -450,7 +450,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			dev->addr = engine_addr;
 			dev->size = slots * engine_page_size;
 
-			dev_info(&slave->dev,
+			dev_dbg(&slave->dev,
 			"engine[%i]: type %x, version %x, addr %x size %x\n",
 					dev->unit, dev->engine_type, version,
 					dev->addr, dev->size);
@@ -690,7 +690,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		return -EIO;
 	}
 
-	dev_info(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
+	dev_dbg(&master->dev, "fsi: found chip %08x at %02x:%02x:%02x\n",
 			chip_id, master->idx, link, id);
 
 	rc = fsi_slave_set_smode(master, link, id);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 3223a67..5e4cd31 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -254,7 +254,7 @@ static int hub_master_probe(struct device *dev)
 
 	reg = be32_to_cpu(__reg);
 	links = (reg >> 8) & 0xff;
-	dev_info(dev, "hub version %08x (%d links)\n", reg, links);
+	dev_dbg(dev, "hub version %08x (%d links)\n", reg, links);
 
 	rc = fsi_slave_claim_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
 			FSI_HUB_LINK_SIZE * links);
diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index d7dccf9..1c37ff7 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -802,7 +802,7 @@ static int sbefifo_probe(struct device *dev)
 	u32 sts;
 	int ret, child_idx = 0;
 
-	dev_info(dev, "Found sbefifo device\n");
+	dev_dbg(dev, "Found sbefifo device\n");
 	sbefifo = kzalloc(sizeof(*sbefifo), GFP_KERNEL);
 	if (!sbefifo)
 		return -ENOMEM;
-- 
1.8.2.2
