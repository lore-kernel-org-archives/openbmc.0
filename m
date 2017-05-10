Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNLNl0M4NzDqBH
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 01:52:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4AFn2EK021495
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:52 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2abp5t70xu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 11:52:52 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 10 May 2017 09:52:51 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 10 May 2017 09:52:49 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4AFqniV14614826; Wed, 10 May 2017 08:52:49 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32A7B13603A;
 Wed, 10 May 2017 09:52:49 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id D9385136046;
 Wed, 10 May 2017 09:52:48 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/6] drivers: i2c: Add port structure to FSI
 algorithm
Date: Wed, 10 May 2017 10:52:38 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17051015-0004-0000-0000-0000121E7447
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007043; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000210; SDB=6.00858721; UDB=6.00425519; IPR=6.00638195; 
 BA=6.00005342; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015397; XFM=3.00000015;
 UTC=2017-05-10 15:52:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051015-0005-0000-0000-00007F393515
Message-Id: <1494431562-25101-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-10_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705100107
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
X-List-Received-Date: Wed, 10 May 2017 15:52:55 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add and initialize I2C adapters for each port on the FSI-attached I2C
master. Ports are defined in the devicetree.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 113 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 3c1087d..cdebc99 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -30,6 +30,7 @@
 #define SETFIELD(m, v, val)	\
 	(((v) & ~(m)) | ((((typeof(v))(val)) << MASK_TO_LSH(m)) & (m)))
 
+#define I2C_MASTER_NR_OFFSET	100
 #define I2C_DEFAULT_CLK_DIV	6
 
 /* i2c registers */
@@ -131,9 +132,21 @@
 
 struct fsi_i2c_master {
 	struct fsi_device	*fsi;
+	int			idx;
 	u8			fifo_size;
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
@@ -188,9 +201,44 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
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
 
@@ -207,13 +255,59 @@ static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
-	int rc;
+	struct fsi_i2c_port *port;
+	struct device_node *np;
+	int rc, idx;
+	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
 	i2c->fsi = to_fsi_dev(dev);
+	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
+	ida_init(&i2c->ida);
+	INIT_LIST_HEAD(&i2c->ports);
+
+	if (dev->of_node) {
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
+	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
@@ -224,6 +318,22 @@ static int fsi_i2c_probe(struct device *dev)
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
@@ -235,6 +345,7 @@ static int fsi_i2c_probe(struct device *dev)
 		.name = "i2c_master_fsi",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
+		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
1.8.3.1
