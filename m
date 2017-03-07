Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcdWg1klrzDq5x
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 11:56:14 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v270rdGw070449
 for <openbmc@lists.ozlabs.org>; Mon, 6 Mar 2017 19:56:01 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 291dch5432-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 19:56:01 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 6 Mar 2017 17:56:00 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 6 Mar 2017 17:55:58 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 508133E4004C;
 Mon,  6 Mar 2017 17:55:58 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v270tw7p12648778; Mon, 6 Mar 2017 17:55:58 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280D7136044;
 Mon,  6 Mar 2017 17:55:58 -0700 (MST)
Received: from Christophers-MacBook-Pro.local.com (unknown [9.83.5.17])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5E2B913603A;
 Mon,  6 Mar 2017 17:55:56 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Remove hub devices during master
 unregister
Date: Mon,  6 Mar 2017 18:55:51 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030700-0016-0000-0000-0000065E0686
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006735; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00830974; UDB=6.00407644; IPR=6.00608565; 
 BA=6.00005190; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014533; XFM=3.00000012;
 UTC=2017-03-07 00:55:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030700-0017-0000-0000-000037FE0B29
Message-Id: <20170307005551.33957-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-06_24:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703070006
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
X-List-Received-Date: Tue, 07 Mar 2017 00:56:15 -0000

All hub devices must be removed when the primary FSI master
is being unregistered.  This ensures that the system is in
a clean state when another scan is attempted.  Failure to do so
will result in duplicate /sys device name errors.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index bd57b41..cc1689e 100644
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
@@ -739,6 +741,18 @@ static int fsi_master_scan(struct fsi_master *master)
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
+}
+
 static void fsi_master_unscan(struct fsi_master *master)
 {
 	struct fsi_slave *slave, *slave_tmp;
@@ -756,6 +770,8 @@ static void fsi_master_unscan(struct fsi_master *master)
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
