Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vq0TF2mKczDqZP
 for <openbmc@lists.ozlabs.org>; Fri, 24 Mar 2017 08:45:05 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2NLhj8X064614
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:52 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29cpeu05y4-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 17:44:52 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 23 Mar 2017 15:44:51 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 23 Mar 2017 15:44:48 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2NLimYR11141566; Thu, 23 Mar 2017 14:44:48 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED4E678037;
 Thu, 23 Mar 2017 15:44:47 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id A7E4078038;
 Thu, 23 Mar 2017 15:44:47 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [RFC linux dev-4.7 3/7] drivers: i2c: Add port structure to FSI
 algorithm
Date: Thu, 23 Mar 2017 16:44:35 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1490305479-17065-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17032321-0004-0000-0000-000011D548C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006837; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00837962; UDB=6.00412009; IPR=6.00615725; 
 BA=6.00005234; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014782; XFM=3.00000013;
 UTC=2017-03-23 21:44:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032321-0005-0000-0000-00007E0E2D60
Message-Id: <1490305479-17065-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-23_19:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703230184
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
X-List-Received-Date: Thu, 23 Mar 2017 21:45:05 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add and initialize I2C adapters for each port on the FSI-attached I2C
master. Ports are defined in the devicetree.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 94 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 11ab2e8..ad9159e 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -134,6 +134,14 @@ struct fsi_i2c_master {
 	struct fsi_device	*fsi;
 	u8			fifo_size;
 	unsigned long		clk;
+	struct list_head	ports;
+};
+
+struct fsi_i2c_port {
+	struct list_head	list;
+	struct i2c_adapter	adapter;
+	struct fsi_i2c_master	*master;
+	u16			port;
 };
 
 static unsigned long fsi_i2c_get_clk_div(struct fsi_i2c_master *i2c)
@@ -183,9 +191,46 @@ static int fsi_i2c_dev_init(struct fsi_i2c_master *i2c)
 	return rc;
 }
 
+static int fsi_i2c_set_port(struct fsi_i2c_port *port)
+{
+	int rc;
+	struct fsi_device *fsi = port->master->fsi;
+	u32 mode, dummy = 0;
+	u16 old_port;
+
+	rc = fsi_device_read(fsi, I2C_FSI_MODE, &mode, sizeof(mode));
+	if (rc)
+		return rc;
+
+	old_port = GETFIELD(I2C_MODE_PORT, mode);
+
+	if (old_port != port->port) {
+		mode = SETFIELD(I2C_MODE_PORT, mode, port->port);
+		rc = fsi_device_write(fsi, I2C_FSI_MODE, &mode,
+				      sizeof(mode));
+		if (rc)
+			return rc;
+
+		/* reset engine when port is changed */
+		rc = fsi_device_write(fsi, I2C_FSI_RESET_ERR, &dummy,
+				      sizeof(dummy));
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
 
@@ -207,9 +252,10 @@ static const char *compatible_strings[] = {
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
+	struct fsi_i2c_port *port;
 	int rc, i;
 	struct device_node *np, *node = NULL;
-	u32 addr, clk;
+	u32 addr, clk, bus;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -217,6 +263,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 	i2c->fsi = to_fsi_dev(dev);
 	i2c->clk = I2C_DEFAULT_CLK;
+	INIT_LIST_HEAD(&i2c->ports);
 
 	/* find node that matches FSI address */
 	for (i = 0; i < ARRAY_SIZE(compatible_strings) && !node; ++i) {
@@ -235,17 +282,61 @@ static int fsi_i2c_probe(struct device *dev)
 	if (node) {
 		if (!of_property_read_u32(node, "clock-frequency", &clk))
 			i2c->clk = clk;
+
+		/* add adapter for each i2c port of the master */
+		for_each_child_of_node(node, np) {
+			rc = of_property_read_u32(np, "reg", &bus);
+			if (rc || bus > 0xFFFF)
+				continue;
+
+			port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
+			if (!port)
+				return -ENOMEM;
+
+			port->master = i2c;
+			port->port = bus;
+
+			port->adapter.owner = THIS_MODULE;
+			port->adapter.dev.parent = dev;
+			port->adapter.algo = &fsi_i2c_algorithm;
+			port->adapter.algo_data = port;
+
+			snprintf(port->adapter.name,
+				 sizeof(port->adapter.name),
+				 "fsi_i2c-%u", bus);
+
+			rc = i2c_add_adapter(&port->adapter);
+			if (rc < 0) {
+				devm_kfree(dev, port);
+				return rc;
+			}
+
+			list_add(&port->list, &i2c->ports);
+		}
 	}
 
 	rc = fsi_i2c_dev_init(i2c);
 	if (rc)
 		return rc;
 
+
 	dev_set_drvdata(dev, i2c);
 
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
+	return 0;
+}
+
 static const struct fsi_device_id fsi_i2c_ids[] = {
 	{ FSI_ENGID_I2C_FSI, FSI_VERSION_ANY },
 	{ 0 }
@@ -257,6 +348,7 @@ static struct fsi_driver fsi_i2c_driver = {
 		.name = "power_i2cm",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
+		.remove = fsi_i2c_remove,
 	},
 };
 
-- 
1.8.3.1
