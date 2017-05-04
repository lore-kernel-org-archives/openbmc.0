Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJmLl09FqzDqFT
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 06:08:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v44K3ShN077246
 for <openbmc@lists.ozlabs.org>; Thu, 4 May 2017 16:08:39 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a89t4ugjy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 May 2017 16:08:38 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 4 May 2017 16:08:37 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 4 May 2017 16:08:34 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v44K8YZL64749586; Thu, 4 May 2017 20:08:34 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37AB3124047;
 Thu,  4 May 2017 16:08:29 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id D2535124044;
 Thu,  4 May 2017 16:08:28 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: cbostic@linux.vnet.ibm.com, joel@jms.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 2/6] drivers: i2c: Add port structure to FSI
 algorithm
Date: Thu,  4 May 2017 15:08:21 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1493928505-30816-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17050420-0036-0000-0000-000001FB57EA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007022; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000209; SDB=6.00856257; UDB=6.00423875; IPR=6.00635441; 
 BA=6.00005326; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015308; XFM=3.00000014;
 UTC=2017-05-04 20:08:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050420-0037-0000-0000-000040354A77
Message-Id: <1493928505-30816-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-04_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705040290
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
X-List-Received-Date: Thu, 04 May 2017 20:08:47 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add and initialize I2C adapters for each port on the FSI-attached I2C
master. Ports are defined in the devicetree.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 112 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index bb12fa9..c81e255 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -30,6 +30,7 @@
 #define SETFIELD(m, v, val)	\
 	(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
 
+#define I2C_MASTER_NR_OFFSET	100
 #define I2C_DEFAULT_CLK_DIV	6
 #define I2C_DEFAULT_CLK		333333
 
@@ -132,10 +133,22 @@
 
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
+	int			idx;
 	u8			fifo_size;
 	unsigned long		clk;
+	struct list_head	ports;
+	struct ida		ida;
 };
 
+struct fsi_i2c_port {
+	struct list_head	list;
+	struct i2c_adapter	adapter;
+	struct fsi_i2c_master	*master;
+	u16			port;
+};
+
+static DEFINE_IDA(fsi_i2c_ida);
+
 static int fsi_i2c_read_reg(struct fsi_device *fsi, unsigned int reg,
 			    u32 *data)
 {
@@ -199,9 +212,44 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
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
 	return -ENOSYS;
 }
 
@@ -218,20 +266,63 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
-	int rc;
-	u32 clk;
+	struct fsi_i2c_port *port;
+	struct device_node *np;
+	int rc, idx;
+	u32 clk, port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
 	i2c->fsi = to_fsi_dev(dev);
+	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
 	i2c->clk = I2C_DEFAULT_CLK;
+	ida_init(&i2c->ida);
+	INIT_LIST_HEAD(&i2c->ports);
 
 	if (dev->of_node) {
 		if (!of_property_read_u32(dev->of_node, "clock-frequency",
 					  &clk))
 			i2c->clk = clk;
+
+		/* add adapter for each i2c port of the master */
+		for_each_child_of_node(dev->of_node, np) {
+			rc = of_property_read_u32(np, "port", &port_no);
+			if (rc || port_no > 0xFFFF)
+				continue;
+
+			/* make sure we don't overlap index with a buggy dts */
+			idx = ida_simple_get(&i2c->ida, port_no,
+					     port_no + 1, GFP_KERNEL);
+			if (idx < 0)
+				continue;
+
+			port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+			if (!port)
+				return -ENOMEM;
+
+			port->master = i2c;
+			port->port = (u16)port_no;
+
+			port->adapter.owner = THIS_MODULE;
+			port->adapter.dev.parent = dev;
+			port->adapter.algo = &fsi_i2c_algorithm;
+			port->adapter.algo_data = port;
+			/* number ports uniquely */
+			port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
+				port_no;
+
+			snprintf(port->adapter.name,
+				 sizeof(port->adapter.name),
+				 "fsi_i2c-%u", port_no);
+
+			rc = i2c_add_numbered_adapter(&port->adapter);
+			if (rc < 0)
+				return rc;
+
+			list_add(&port->list, &i2c->ports);
+		}
 	}
 
 	rc = fsi_i2c_dev_init(i2c);
@@ -243,6 +334,22 @@ static int fsi_i2c_probe(struct device *dev)
 	return 0;
 }
 
+static int fsi_i2c_remove(struct device *dev)
+{
+	struct fsi_i2c_master *i2c = dev_get_drvdata(dev);
+	struct fsi_i2c_port *port;
+
+	list_for_each_entry(port, &i2c->ports, list) {
+		i2c_del_adapter(&port->adapter);
+	}
+
+	ida_destroy(&i2c->ida);
+
+	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
+
+	return 0;
+}
+
 static const struct fsi_device_id fsi_i2c_ids[] = {
 	{ FSI_ENGID_I2C_FSI, FSI_VERSION_ANY },
 	{ 0 }
@@ -254,6 +361,7 @@ static int fsi_i2c_probe(struct device *dev)
 		.name = "i2c_master_fsi",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
+		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
1.8.3.1
