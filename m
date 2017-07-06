Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3WVN2M3xzDr6L
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 07:44:44 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66LiJtF089022
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 17:44:42 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bhvfqsuhu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 17:44:42 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 17:44:40 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 17:44:38 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66Libjh57147424; Thu, 6 Jul 2017 21:44:37 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7CCB112047;
 Thu,  6 Jul 2017 17:44:37 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 5DE50112034;
 Thu,  6 Jul 2017 17:44:37 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 3/3] drivers/i2c: Fix devicetree parsing in
 FSI-attached I2C master algo
Date: Thu,  6 Jul 2017 16:44:29 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070621-0048-0000-0000-000001BCEFBB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007332; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883845; UDB=6.00440963; IPR=6.00664032; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016117; XFM=3.00000015;
 UTC=2017-07-06 21:44:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070621-0049-0000-0000-000041CAA6FD
Message-Id: <1499377469-30625-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060372
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
X-List-Received-Date: Thu, 06 Jul 2017 21:44:45 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add compatible check for the master device node. Change "port" to "reg"
for the port number property. Check that the port node is available. Add
the device node to the adapter device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index b4eb102..79a6985 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -568,10 +568,11 @@ static int fsi_i2c_probe(struct device *dev)
 	ida_init(&i2c->ida);
 	INIT_LIST_HEAD(&i2c->ports);
 
-	if (dev->of_node) {
+	if (dev->of_node &&
+	    of_device_is_compatible(dev->of_node, "ibm,fsi-i2c-master")) {
 		/* add adapter for each i2c port of the master */
-		for_each_child_of_node(dev->of_node, np) {
-			rc = of_property_read_u32(np, "port", &port_no);
+		for_each_available_child_of_node(dev->of_node, np) {
+			rc = of_property_read_u32(np, "reg", &port_no);
 			if (rc || port_no > 0xFFFF)
 				continue;
 
@@ -589,6 +590,7 @@ static int fsi_i2c_probe(struct device *dev)
 			port->port = (u16)port_no;
 
 			port->adapter.owner = THIS_MODULE;
+			port->adapter.dev.of_node = np;
 			port->adapter.dev.parent = dev;
 			port->adapter.algo = &fsi_i2c_algorithm;
 			port->adapter.bus_recovery_info =
@@ -600,7 +602,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 			snprintf(port->adapter.name,
 				 sizeof(port->adapter.name),
-				 "fsi_i2c-%u", port_no);
+				 "fsi%d_i2c%u", i2c->idx, port_no);
 
 			rc = i2c_add_numbered_adapter(&port->adapter);
 			if (rc < 0)
@@ -643,7 +645,7 @@ static int fsi_i2c_remove(struct device *dev)
 static struct fsi_driver fsi_i2c_driver = {
 	.id_table = fsi_i2c_ids,
 	.drv = {
-		.name = "i2c_master_fsi",
+		.name = "fsi_i2c_master",
 		.bus = &fsi_bus_type,
 		.probe = fsi_i2c_probe,
 		.remove = fsi_i2c_remove,
-- 
1.8.3.1
