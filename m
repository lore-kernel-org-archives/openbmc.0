Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47SH48DmzDr8s
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:45:03 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67LhsRu132146
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:45:01 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjhw3h007-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:45:01 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 17:45:00 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 17:44:57 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LivAj27001066; Fri, 7 Jul 2017 21:44:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB5AAC03F;
 Fri,  7 Jul 2017 17:45:02 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 5735EAC03A;
 Fri,  7 Jul 2017 17:45:02 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2 2/3] i2c: fsi: Dynamically allocate port
 numbers
Date: Fri,  7 Jul 2017 16:44:46 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1499463887-27601-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499463887-27601-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17070721-0024-0000-0000-000002A9FE85
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884325; UDB=6.00441252; IPR=6.00664512; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:44:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0025-0000-0000-000044ABF2F3
Message-Id: <1499463887-27601-3-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 21:45:03 -0000

From: "Edward A. James" <eajames@us.ibm.com>

The static allocation can collide if there are already devices
registered at the adapter number. Dynamic allocation is safer.

Users who wish to ensure a port appears at a specific number can use the
device tree alias feature.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/i2c/busses/i2c-fsi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index e655ad0..7e03f3a 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -586,15 +586,12 @@ static int fsi_i2c_probe(struct device *dev)
 			port->adapter.bus_recovery_info =
 				&fsi_i2c_bus_recovery_info;
 			port->adapter.algo_data = port;
-			/* number ports uniquely */
-			port->adapter.nr = (i2c->idx * I2C_MASTER_NR_OFFSET) +
-				port_no;
 
 			snprintf(port->adapter.name,
 				 sizeof(port->adapter.name), "fsi_i2c-%u",
 				 port_no);
 
-			rc = i2c_add_numbered_adapter(&port->adapter);
+			rc = i2c_add_adapter(&port->adapter);
 			if (rc < 0)
 				return rc;
 
-- 
1.8.3.1
