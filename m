Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vd2c84fqrzDq8g
 for <openbmc@lists.ozlabs.org>; Wed,  8 Mar 2017 03:46:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v27GiDGn028431
 for <openbmc@lists.ozlabs.org>; Tue, 7 Mar 2017 11:46:22 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2920ags46w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Mar 2017 11:46:21 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 7 Mar 2017 11:46:20 -0500
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 7 Mar 2017 11:46:19 -0500
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v27GkJjn31522918; Tue, 7 Mar 2017 16:46:19 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB3BFB2046;
 Tue,  7 Mar 2017 11:46:15 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.83.5.17])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id D0047B2054;
 Tue,  7 Mar 2017 11:46:13 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Remove hub devices during
 master unregister
Date: Tue,  7 Mar 2017 10:46:10 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
x-cbid: 17030716-0052-0000-0000-0000018D7F79
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006739; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00831290; UDB=6.00407834; IPR=6.00608882; 
 BA=6.00005194; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014544; XFM=3.00000012;
 UTC=2017-03-07 16:46:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030716-0053-0000-0000-00004EE5C6D0
Message-Id: <20170307164610.78174-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703070133
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
X-List-Received-Date: Tue, 07 Mar 2017 16:46:33 -0000

All hub devices must be removed when the primary FSI master
is being unregistered.  This ensures that the system is in
a clean state when another scan is attempted.  Failure to do so
will result in duplicate /sys device name errors.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2: Fix missing return in non void function warning
---
 drivers/fsi/fsi-core.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index bd57b41..bbdf6b8 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -84,6 +84,7 @@ struct fsi_master_hub {
 #define to_fsi_master_hub(d) container_of(d, struct fsi_master_hub, master)
 #define to_fsi_slave(d) container_of(d, struct fsi_slave, dev)
 
+static void fsi_master_unscan(struct fsi_master *master);
 static int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 		void *val, size_t size);
 static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
@@ -441,6 +442,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 			hub->dev.release = hub_master_release;
 			hub->master.dev = &hub->dev;
 			hub->master.dev->parent = &slave->dev;
+			dev_set_drvdata(&hub->dev, hub);
 			rc = device_add(&hub->dev);
 			if (rc)
 				return rc;
@@ -739,6 +741,20 @@ static int fsi_master_scan(struct fsi_master *master)
 	return 0;
 }
 
+static int fsi_unregister_hubs(struct device *dev, void *data)
+{
+	struct fsi_master_hub *hub =
+				(struct fsi_master_hub *)dev_get_drvdata(dev);
+
+	if (!hub)
+		return 0;
+
+	device_del(dev);
+	fsi_master_unscan(&hub->master);
+
+	return 0;
+}
+
 static void fsi_master_unscan(struct fsi_master *master)
 {
 	struct fsi_slave *slave, *slave_tmp;
@@ -756,6 +772,8 @@ static void fsi_master_unscan(struct fsi_master *master)
 			device_del(&fsi_dev->dev);
 			put_device(&fsi_dev->dev);
 		}
+		/* Remove any hub masters */
+		device_for_each_child(&slave->dev, NULL, fsi_unregister_hubs);
 		device_unregister(&slave->dev);
 	}
 	master->slave_list = false;
-- 
1.8.2.2
