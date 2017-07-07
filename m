Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47SD4yXZzDr8n
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:45:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67Lhxbb078856
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:44:58 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjjb186mv-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:44:58 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 17:44:57 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 17:44:55 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67Lispf63045700; Fri, 7 Jul 2017 21:44:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EDF0AC03A;
 Fri,  7 Jul 2017 17:45:00 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 093A2AC03F;
 Fri,  7 Jul 2017 17:44:59 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 1/3] i2c: fsi: Remove ida counter
Date: Fri,  7 Jul 2017 16:44:45 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499463887-27601-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499463887-27601-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070721-0036-0000-0000-00000243032C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884325; UDB=6.00441252; IPR=6.00664512; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:44:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0037-0000-0000-000041030C06
Message-Id: <1499463887-27601-2-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 21:45:01 -0000

From: "Edward A. James" <eajames@us.ibm.com>

It's not clear what the intention is. Regardless, it is not necessary so
remove it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index b4eb102..e655ad0 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -135,7 +135,6 @@ struct fsi_i2c_master {
 	int			idx;
 	u8			fifo_size;
 	struct list_head	ports;
-	struct ida		ida;
 	wait_queue_head_t	wait;
 	struct semaphore	lock;
 };
@@ -554,7 +553,7 @@ static int fsi_i2c_probe(struct device *dev)
 	struct fsi_i2c_master *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
-	int rc, idx;
+	int rc;
 	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -565,7 +564,6 @@ static int fsi_i2c_probe(struct device *dev)
 	sema_init(&i2c->lock, 1);
 	i2c->fsi = to_fsi_dev(dev);
 	i2c->idx = ida_simple_get(&fsi_i2c_ida, 1, INT_MAX, GFP_KERNEL);
-	ida_init(&i2c->ida);
 	INIT_LIST_HEAD(&i2c->ports);
 
 	if (dev->of_node) {
@@ -575,12 +573,6 @@ static int fsi_i2c_probe(struct device *dev)
 			if (rc || port_no > 0xFFFF)
 				continue;
 
-			/* make sure we don't overlap index with a buggy dts */
-			idx = ida_simple_get(&i2c->ida, port_no,
-					     port_no + 1, GFP_KERNEL);
-			if (idx < 0)
-				continue;
-
 			port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
 			if (!port)
 				return -ENOMEM;
@@ -599,8 +591,8 @@ static int fsi_i2c_probe(struct device *dev)
 				port_no;
 
 			snprintf(port->adapter.name,
-				 sizeof(port->adapter.name),
-				 "fsi_i2c-%u", port_no);
+				 sizeof(port->adapter.name), "fsi_i2c-%u",
+				 port_no);
 
 			rc = i2c_add_numbered_adapter(&port->adapter);
 			if (rc < 0)
@@ -628,8 +620,6 @@ static int fsi_i2c_remove(struct device *dev)
 		i2c_del_adapter(&port->adapter);
 	}
 
-	ida_destroy(&i2c->ida);
-
 	ida_simple_remove(&fsi_i2c_ida, i2c->idx);
 
 	return 0;
-- 
1.8.3.1
