Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNfMn44CvzDqJM
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 04:53:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73Ioe7V137864
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 14:53:23 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c43n9e1hy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 14:53:23 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 14:53:21 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 14:53:19 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73IrJPB31719504; Thu, 3 Aug 2017 18:53:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0C5BAE043;
 Thu,  3 Aug 2017 14:53:33 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.232])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 7D74DAE03B;
 Thu,  3 Aug 2017 14:53:31 -0400 (EDT)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 1/2] drivers/fsi: Defer hub master scan on probe
Date: Thu,  3 Aug 2017 13:53:05 -0500
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
In-Reply-To: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
References: <20170803185306.85007-1-cbostic@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17080318-0008-0000-0000-0000026934A7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007478; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00897081; UDB=6.00448831; IPR=6.00677264; 
 BA=6.00005509; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016519; XFM=3.00000015;
 UTC=2017-08-03 18:53:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080318-0009-0000-0000-000036412633
Message-Id: <20170803185306.85007-2-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030288
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
X-List-Received-Date: Thu, 03 Aug 2017 18:53:26 -0000

Prevent hub master from scanning its connected links/slaves
at probe time.  Needed to keep from creating arbitration
conflicts on the hub connected links during host boot
FSI bus accesses.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c        | 3 +++
 drivers/fsi/fsi-master-gpio.c | 1 +
 drivers/fsi/fsi-master-hub.c  | 7 +++++++
 drivers/fsi/fsi-master.h      | 1 +
 4 files changed, 12 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9b83f1a..3e00398 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -927,6 +927,9 @@ int fsi_master_register(struct fsi_master *master)
 		return rc;
 	}
 
+	if (master->no_scan_on_probe)
+		return 0;
+
 	fsi_master_scan(master);
 
 	return 0;
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 9e7a2ed..4e07b64 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -650,6 +650,7 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 	master->master.term = fsi_master_gpio_term;
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
+	master->master.no_scan_on_probe = false;
 	platform_set_drvdata(pdev, master);
 
 	fsi_master_gpio_init(master);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index 3223a67..94a61fc 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -244,6 +244,7 @@ static int hub_master_probe(struct device *dev)
 {
 	struct fsi_device *fsi_dev = to_fsi_dev(dev);
 	struct fsi_master_hub *hub;
+	struct device_node *np;
 	uint32_t reg, links;
 	__be32 __reg;
 	int rc;
@@ -283,6 +284,12 @@ static int hub_master_probe(struct device *dev)
 	hub->master.send_break = hub_master_break;
 	hub->master.link_enable = hub_master_link_enable;
 
+	np = dev->of_node;
+	if (of_property_read_bool(np, "no-scan-on-probe"))
+		hub->master.no_scan_on_probe = true;
+	else
+		hub->master.no_scan_on_probe = false;
+
 	dev_set_drvdata(dev, hub);
 
 	hub_master_init(hub);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 546257d..7f8e288 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -26,6 +26,7 @@ struct fsi_master {
 	int		idx;
 	int		n_links;
 	int		flags;
+	bool		no_scan_on_probe;
 	int		(*read)(struct fsi_master *, int link, uint8_t id,
 				uint32_t addr, void *val, size_t size);
 	int		(*write)(struct fsi_master *, int link, uint8_t id,
-- 
1.8.2.2
