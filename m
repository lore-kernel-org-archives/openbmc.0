Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz57F75B1zDr5M
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 02:42:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5TGd7CS145602
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 12:42:47 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bd1dtch73-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 12:42:47 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 29 Jun 2017 12:42:46 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 29 Jun 2017 12:42:44 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5TGghp341550034; Thu, 29 Jun 2017 16:42:43 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A41ADB204D;
 Thu, 29 Jun 2017 12:40:15 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 5CA2FB2046;
 Thu, 29 Jun 2017 12:40:15 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/2] drivers/i2c: Fix devicetree parsing in
 FSI-attached I2C master algo
Date: Thu, 29 Jun 2017 11:42:36 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17062916-0024-0000-0000-000002A2720E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007294; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880462; UDB=6.00438925; IPR=6.00660614; 
 BA=6.00005447; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016010; XFM=3.00000015;
 UTC=2017-06-29 16:42:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062916-0025-0000-0000-000044932644
Message-Id: <1498754556-21020-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706290272
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
X-List-Received-Date: Thu, 29 Jun 2017 16:42:50 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Add compatible check for the master device node. Change "port" to "reg"
for the port number property. Check that the port node is available.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index b4eb102..d5135b4 100644
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
 
@@ -600,7 +601,7 @@ static int fsi_i2c_probe(struct device *dev)
 
 			snprintf(port->adapter.name,
 				 sizeof(port->adapter.name),
-				 "fsi_i2c-%u", port_no);
+				 "fsi%d_i2c%u", i2c->idx, port_no);
 
 			rc = i2c_add_numbered_adapter(&port->adapter);
 			if (rc < 0)
@@ -643,7 +644,7 @@ static int fsi_i2c_remove(struct device *dev)
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
