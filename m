Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLyPs448DzDsQS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 10:49:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v710ml3F060173
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:20 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c28y506p9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:49:19 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 31 Jul 2017 20:49:18 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 31 Jul 2017 20:49:17 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v710nGaX54657202; Tue, 1 Aug 2017 00:49:16 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11BB0112034;
 Mon, 31 Jul 2017 20:49:10 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.136.69])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id AE542112051;
 Mon, 31 Jul 2017 20:49:09 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.12 2/6] drivers/i2c: Add port structure to FSI
 algorithm
Date: Mon, 31 Jul 2017 19:49:02 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1501548546-21096-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1501548546-21096-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080100-0008-0000-0000-0000026796A5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007462; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00895760; UDB=6.00448039; IPR=6.00675947; 
 BA=6.00005503; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016472; XFM=3.00000015;
 UTC=2017-08-01 00:49:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080100-0009-0000-0000-00003638D2B6
Message-Id: <1501548546-21096-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-31_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708010009
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
X-List-Received-Date: Tue, 01 Aug 2017 00:49:21 -0000
X-List-Received-Date: Tue, 01 Aug 2017 00:49:21 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add and initialize I2C adapters for each port on the FSI-attached I2C
master. Ports for each master are defined in the devicetree.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 96 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 79475f8..4ad5d68 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -14,7 +14,9 @@
 #include <linux/fsi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 #define FSI_ENGID_I2C		0x7
 
@@ -130,6 +132,14 @@
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
+	struct list_head	ports;
+};
+
+struct fsi_i2c_port {
+	struct list_head	list;
+	struct i2c_adapter	adapter;
+	struct fsi_i2c_master	*master;
+	u16			port;
 };
 
 static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
@@ -186,9 +196,44 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	return rc;
 }
 
+static int fsi_i2c_set_port(struct fsi_i2c_port *port)
+{
+	int rc;
+	struct fsi_device *fsi = port->master->fsi;
+	u32 mode, dummy = 0;
+	u16 old_port;
+
+	rc = fsi_i2c_read_reg(fsi, I2C_FSI_MODE, &mode);
+	if (rc)
+		return rc;
+
+	old_port = GETFIELD(I2C_MODE_PORT, mode);
+
+	if (old_port != port->port) {
+		mode = SETFIELD(I2C_MODE_PORT, mode, port->port);
+		rc = fsi_i2c_write_reg(fsi, I2C_FSI_MODE, &mode);
+		if (rc)
+			return rc;
+
+		/* reset engine when port is changed */
+		rc = fsi_i2c_write_reg(fsi, I2C_FSI_RESET_ERR, &dummy);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
 static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			int num)
 {
+	int rc;
+	struct fsi_i2c_port *port = adap->algo_data;
+
+	rc = fsi_i2c_set_port(port);
+	if (rc)
+		return rc;
+
 	return -EOPNOTSUPP;
 }
 
@@ -206,23 +251,73 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
+	struct fsi_i2c_port *port;
+	struct device_node *np;
 	int rc;
+	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
 	i2c->fsi = to_fsi_dev(dev);
+	INIT_LIST_HEAD(&i2c->ports);
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
 		return rc;
 
+	/* Add adapter for each i2c port of the master. */
+	for_each_available_child_of_node(dev->of_node, np) {
+		rc = of_property_read_u32(np, "reg", &port_no);
+		if (rc || port_no > USHRT_MAX)
+			continue;
+
+		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+		if (!port)
+			break;
+
+		port->master = i2c;
+		port->port = port_no;
+
+		port->adapter.owner = THIS_MODULE;
+		port->adapter.dev.of_node = np;
+		port->adapter.dev.parent = dev;
+		port->adapter.algo = &fsi_i2c_algorithm;
+		port->adapter.algo_data = port;
+
+		snprintf(port->adapter.name, sizeof(port->adapter.name),
+			 "i2c_bus-%u", port_no);
+
+		rc = i2c_add_adapter(&port->adapter);
+		if (rc < 0) {
+			dev_err(dev, "Failed to register adapter: %d\n", rc);
+			devm_kfree(dev, port);
+			continue;
+		}
+
+		list_add(&port->list, &i2c->ports);
+	}
+
 	dev_set_drvdata(dev, i2c);
 
 	return 0;
 }
 
+static int fsi_i2c_remove(struct device *dev)
+{
+	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_port *port;
+
+	if (!list_empty(&i2c->ports)) {
+		list_for_each_entry(port, &i2c->ports, list) {
+			i2c_del_adapter(&port->adapter);
+		}
+	}
+
+	return 0;
+}
+
 static const struct fsi_device_id fsi_i2c_ids[] = {
 	{ FSI_ENGID_I2C, FSI_VERSION_ANY },
 	{ 0 }
@@ -234,6 +329,7 @@ static int fsi_i2c_probe(struct device *dev)
 		.name = "i2c-fsi",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
+		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
1.8.3.1
