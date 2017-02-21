Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSZ1Z2b4xzDqBv
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 08:50:42 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1LLnCVB131730
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:39 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28rv2rv92k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 16:50:39 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 21 Feb 2017 14:50:38 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Feb 2017 14:50:36 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 1A6331FF0025;
 Tue, 21 Feb 2017 14:50:13 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1LLoZdf16318732; Tue, 21 Feb 2017 14:50:35 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91E996A042;
 Tue, 21 Feb 2017 14:50:35 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 62D476A03C;
 Tue, 21 Feb 2017 14:50:35 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2 1/7] drivers/fsi: Add hub master scan detect
Date: Tue, 21 Feb 2017 15:50:26 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022121-0004-0000-0000-000011A6C4BF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006659; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00825191; UDB=6.00404016; IPR=6.00602646; 
 BA=6.00005161; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014381; XFM=3.00000011;
 UTC=2017-02-21 21:50:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022121-0005-0000-0000-00007D4384D8
Message-Id: <20170221215032.79282-2-cbostic@linux.vnet.ibm.com>
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

On detect of hub master engine in config space set up a master
device and register it with the core.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

---

Changes in V2:

- Refactor structures for hub master. Previously hub master engine
  was considered a slave engine.
---
 drivers/fsi/fsi-core.c | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index d63a892..646bb43 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -43,6 +43,11 @@
 
 #define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
 
+#define	FSI_ENGID_HUB_MASTER		0x1c
+#define	FSI_ENGID_HUB_LINK		0x1d
+#define	FSI_HUB_LINK_OFFSET		0x80000
+#define	FSI_HUB_MASTER_MAX_LINKS	8
+
 static const int engine_page_size = 0x400;
 static struct task_struct *master_ipoll;
 static unsigned int fsi_ipoll_period_ms = 100;
@@ -58,6 +63,14 @@ struct fsi_slave {
 	uint8_t			id;
 };
 
+struct fsi_master_hub {
+	struct fsi_master	master;
+	struct fsi_slave	*slave;
+	uint32_t		control_regs;	/* slave-relative addr regs */
+	uint32_t		base;		/* slave-relative addr of */
+						/* master address space */
+};
+
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
@@ -203,12 +216,18 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 			slave->id, addr, val, size);
 }
 
+static int hub_master_init(struct fsi_master_hub *hub)
+{
+	return 0;
+}
+
 static int fsi_slave_scan(struct fsi_slave *slave)
 {
 	uint32_t engine_addr;
 	uint32_t conf;
 	int rc, i;
 	uint8_t si1s_bit = 1;
+	struct fsi_master_hub *hub;
 
 	INIT_LIST_HEAD(&slave->my_engines);
 
@@ -252,7 +271,31 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 		 * Unused address areas are marked by a zero type value; this
 		 * skips the defined address areas
 		 */
-		if (type != 0 && slots != 0) {
+		if (type != 0) {
+
+			if (type == FSI_ENGID_HUB_MASTER) {
+				hub = kzalloc(sizeof(*hub), GFP_KERNEL);
+				if (!hub)
+					return -ENOMEM;
+
+				hub->base = FSI_HUB_LINK_OFFSET;
+				hub->control_regs = engine_addr;
+				hub->slave = slave;
+				rc = hub_master_init(hub);
+
+				continue;
+			}
+			if (type == FSI_ENGID_HUB_LINK) {
+				if (!hub)
+					continue;
+
+				hub->master.n_links++;
+				if (hub->master.n_links ==
+						(FSI_HUB_MASTER_MAX_LINKS * 2))
+					rc = fsi_master_register(&hub->master);
+
+				continue;
+			}
 
 			/* create device */
 			dev = fsi_create_device(slave);
@@ -597,7 +640,7 @@ DEVICE_ATTR(fsi_ipoll_period, S_IRUGO | S_IWUSR, fsi_ipoll_period_show,
 
 int fsi_master_register(struct fsi_master *master)
 {
-	if (!master || !master->dev)
+	if (!master)
 		return -EINVAL;
 
 	master->idx = ida_simple_get(&master_ida, 0, INT_MAX, GFP_KERNEL);
-- 
1.8.2.2
