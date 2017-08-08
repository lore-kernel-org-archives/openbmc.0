Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRK1W2r3mzDqkp
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 13:01:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7831Ols022801
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 23:01:49 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c6usqxwvt-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 23:01:48 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 7 Aug 2017 23:01:47 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 7 Aug 2017 23:01:45 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7831j3132833728; Tue, 8 Aug 2017 03:01:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C01682803F;
 Mon,  7 Aug 2017 23:01:38 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.166.253])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 4FA212803E;
 Mon,  7 Aug 2017 23:01:38 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jk@ozlabs.org, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/i2c: FSI: Fix bug on remove() and
 reset to upstream state
Date: Mon,  7 Aug 2017 22:01:42 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17080803-0008-0000-0000-0000026B21A7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007504; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899134; UDB=6.00450016; IPR=6.00679339; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016585; XFM=3.00000015;
 UTC=2017-08-08 03:01:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080803-0009-0000-0000-0000364CE47F
Message-Id: <1502161302-23286-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-08_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708080048
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
X-List-Received-Date: Tue, 08 Aug 2017 03:01:51 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Deleting entries in list on remove() even if the list was empty...
Also a few other fixes just to get it in line with what I've sent
upstream.

Resolves openbmc/linux#138

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 57 +++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 7f59ec0..1af9c01 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -9,16 +9,20 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
 #include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/sched.h>
 #include <linux/semaphore.h>
 #include <linux/wait.h>
 
-#define FSI_ENGID_I2C_FSI	0x7
+#define FSI_ENGID_I2C		0x7
 
 /* Find left shift from first set bit in m */
 #define MASK_TO_LSH(m)		(__builtin_ffsll(m) - 1ULL)
@@ -30,7 +34,6 @@
 #define SETFIELD(m, v, val)	\
 	(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
 
-#define I2C_MASTER_NR_OFFSET	100
 #define I2C_DEFAULT_CLK_DIV	6
 
 /* i2c registers */
@@ -150,13 +153,13 @@ static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 			    u32 *data)
 {
 	int rc;
-	u32 raw_data;
+	__be32 data_be;
 
-	rc = fsi_device_read(fsi, reg, &raw_data, sizeof(raw_data));
+	rc = fsi_device_read(fsi, reg, &data_be, sizeof(data_be));
 	if (rc)
 		return rc;
 
-	*data = be32_to_cpu(raw_data);
+	*data = be32_to_cpu(data_be);
 
 	return 0;
 }
@@ -164,9 +167,9 @@ static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 static int fsi_i2c_write_reg(struct fsi_device *fsi, unsigned int reg,
 			     u32 *data)
 {
-	u32 raw_data = cpu_to_be32(*data);
+	__be32 data_be = cpu_to_be32(*data);
 
-	return fsi_device_write(fsi, reg, &raw_data, sizeof(raw_data));
+	return fsi_device_write(fsi, reg, &data_be, sizeof(data_be));
 }
 
 static int fsi_i2c_lock_master(struct fsi_i2c_master *i2c, int timeout)
@@ -351,12 +354,12 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
 static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 				 struct i2c_msg *msg, u32 status)
 {
-	struct fsi_i2c_master *i2c = port->master;
-	u8 fifo_count;
 	int rc;
+	u8 fifo_count;
+	struct fsi_i2c_master *i2c = port->master;
+	u32 dummy = 0;
 
 	if (status & I2C_STAT_ERR) {
-		u32 dummy = 0;
 		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
 		if (rc)
 			return rc;
@@ -383,11 +386,10 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
 			rc = -ENODATA;
 		else
 			rc = msg->len;
+
 		return rc;
 	}
 
-	dev_warn(&port->adapter.dev, "no status to handle\n");
-
 	return 0;
 }
 
@@ -563,7 +565,11 @@ static int fsi_i2c_probe(struct device *dev)
 	i2c->fsi = to_fsi_dev(dev);
 	INIT_LIST_HEAD(&i2c->ports);
 
-	/* Add adapter for each i2c port of the master */
+	rc = fsi_i2c_dev_init(i2c);
+	if (rc)
+		return rc;
+
+	/* Add adapter for each i2c port of the master. */
 	for_each_available_child_of_node(dev->of_node, np) {
 		rc = of_property_read_u32(np, "reg", &port_no);
 		if (rc || port_no > USHRT_MAX)
@@ -571,7 +577,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 		if (!port)
-			return -ENOMEM;
+			break;
 
 		port->master = i2c;
 		port->port = port_no;
@@ -584,19 +590,18 @@ static int fsi_i2c_probe(struct device *dev)
 		port->adapter.algo_data = port;
 
 		snprintf(port->adapter.name, sizeof(port->adapter.name),
-				"fsi_i2c-%u", port_no);
+			 "i2c_bus-%u", port_no);
 
 		rc = i2c_add_adapter(&port->adapter);
-		if (rc < 0)
-			return rc;
+		if (rc < 0) {
+			dev_err(dev, "Failed to register adapter: %d\n", rc);
+			devm_kfree(dev, port);
+			continue;
+		}
 
 		list_add(&port->list, &i2c->ports);
 	}
 
-	rc = fsi_i2c_dev_init(i2c);
-	if (rc)
-		return rc;
-
 	dev_set_drvdata(dev, i2c);
 
 	return 0;
@@ -607,22 +612,24 @@ static int fsi_i2c_remove(struct device *dev)
 	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
 	struct fsi_i2c_port *port;
 
-	list_for_each_entry(port, &i2c->ports, list) {
-		i2c_del_adapter(&port->adapter);
+	if (!list_empty(&i2c->ports)) {
+		list_for_each_entry(port, &i2c->ports, list) {
+			i2c_del_adapter(&port->adapter);
+		}
 	}
 
 	return 0;
 }
 
 static const struct fsi_device_id fsi_i2c_ids[] = {
-	{ FSI_ENGID_I2C_FSI, FSI_VERSION_ANY },
+	{ FSI_ENGID_I2C, FSI_VERSION_ANY },
 	{ 0 }
 };
 
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
-		.name = "fsi_i2c_master",
+		.name = "i2c-fsi",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
-- 
1.8.3.1
