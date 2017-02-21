Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1b3VytzDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:43 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnp4m094411
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:41 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ruxymmyt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:41 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:40 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:38 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id AF3011FF001F;
 Tue, 21 Feb 2017 14:50:15 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLocPM10617330; Tue, 21 Feb 2017 14:50:38 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31DD66A03F;
 Tue, 21 Feb 2017 14:50:38 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 03A326A04A;
 Tue, 21 Feb 2017 14:50:37 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 3/7] drivers/fsi: Define hub master callbacks
Date: Tue, 21 Feb 2017 15:50:28 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0004-0000-0000-000011A6C4CF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0005-0000-0000-00007D4384FD
Message-Id: <20170221215032.79282-4-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-21_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702210201
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
X-List-Received-Date: Tue, 21 Feb 2017 21:50:43 -0000

Define hub master read, write, link enable, and break ops.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 36 ++++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 4199188..360c02a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -27,6 +27,7 @@
 #define DEBUG
 
 #define FSI_N_SLAVES	4
+#define FSI_BREAK	0xc0de0000
 
 #define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
 #define FSI_SLAVE_CONF_SLOTS_MASK	0x00ff0000
@@ -47,6 +48,7 @@
 #define	FSI_ENGID_HUB_MASTER		0x1c
 #define	FSI_ENGID_HUB_LINK		0x1d
 #define	FSI_HUB_LINK_OFFSET		0x80000
+#define	FSI_MASTER_HUB_LINK_SIZE	0x80000
 #define	FSI_HUB_MASTER_MAX_LINKS	8
 
 static const int engine_page_size = 0x400;
@@ -72,6 +74,7 @@ struct fsi_master_hub {
 						/* master address space */
 };
 
+#define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
@@ -230,23 +233,47 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 int hub_master_read(struct fsi_master *master, int linkno, uint8_t slave,
 			uint32_t addr, void *val, size_t size)
 {
-	return 0;
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+
+	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_read(hub->slave, addr, val, size);
 }
 
 int hub_master_write(struct fsi_master *master, int linkno, uint8_t slave,
 			uint32_t addr, const void *val, size_t size)
 {
-	return 0;
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+
+	addr += (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_write(hub->slave, addr, val, size);
 }
 
 int hub_master_break(struct fsi_master *master, int linkno)
 {
-	return 0;
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	uint32_t command;
+	uint32_t break_offset = 0x4; /* hw workaround */
+	uint32_t addr;
+
+	command = FSI_BREAK;
+	addr = (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
+	return fsi_slave_write(hub->slave, addr + break_offset, &command,
+			sizeof(command));
 }
 
 int hub_master_link_enable(struct fsi_master *master, int linkno)
 {
-	return 0;
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	uint32_t menp = L_MSB_MASK(linkno);
+	int rc;
+
+	rc = fsi_slave_write(hub->slave, hub->control_regs + FSI_MSENP0, &menp,
+				sizeof(menp));
+
+	/* Wait for hw to finish enable */
+	mdelay(10);
+
+	return rc;
 }
 
 static int hub_master_init(struct fsi_master_hub *hub)
@@ -571,6 +598,7 @@ static int fsi_slave_init(struct fsi_master *master,
 	slave->id = slave_id;
 	slave->dev.parent = master->dev;
 	slave->dev.release = fsi_slave_release;
+	slave->link = link;
 
 	dev_set_name(&slave->dev, "slave@%02x:%02x", link, slave_id);
 	rc = device_register(&slave->dev);
-- 
1.8.2.2
