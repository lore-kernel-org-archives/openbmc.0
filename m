Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47Wh2PlvzDr91
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:48:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67Lhuqh044888
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:47:58 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bjge4bwq5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:47:57 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 15:47:57 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 15:47:55 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LlsDX65536138; Fri, 7 Jul 2017 14:47:54 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4AC3C603E;
 Fri,  7 Jul 2017 15:47:54 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 334AAC6037;
 Fri,  7 Jul 2017 15:47:54 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 3/3] drivers/i2c: Fix devicetree parsing in
 FSI-attached I2C master algo
Date: Fri,  7 Jul 2017 16:47:37 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499464057-27830-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070721-0008-0000-0000-0000082EDBDC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884326; UDB=6.00441252; IPR=6.00664513; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:47:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0009-0000-0000-000042FA288F
Message-Id: <1499464057-27830-4-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070362
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
X-List-Received-Date: Fri, 07 Jul 2017 21:48:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add compatible check for the master device node. Change "port" to "reg"
for the port number property. Check that the port node is available. Add
the device node to the adapter device.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index adcd8cd..ce493a3 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -562,10 +562,11 @@ static int fsi_i2c_probe(struct device *dev)
 	i2c->fsi = to_fsi_dev(dev);
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
 
@@ -577,6 +578,7 @@ static int fsi_i2c_probe(struct device *dev)
 			port->port = (u16)port_no;
 
 			port->adapter.owner = THIS_MODULE;
+			port->adapter.dev.of_node = np;
 			port->adapter.dev.parent = dev;
 			port->adapter.algo = &fsi_i2c_algorithm;
 			port->adapter.bus_recovery_info =
@@ -624,7 +626,7 @@ static int fsi_i2c_remove(struct device *dev)
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
