Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ5Vd1KGlzDqC0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 08:46:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v22Lbx1X107502
 for <openbmc@lists.ozlabs.org>; Thu, 2 Mar 2017 16:46:31 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28xs8cdset-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 16:46:30 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 2 Mar 2017 14:46:30 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Mar 2017 14:46:28 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id BB4813E40044;
 Thu,  2 Mar 2017 14:46:27 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v22LkRxa11469208; Thu, 2 Mar 2017 14:46:27 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94FBA6A03B;
 Thu,  2 Mar 2017 14:46:27 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 5D7EB6A041;
 Thu,  2 Mar 2017 14:46:27 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Change hub sysfs name
Date: Thu,  2 Mar 2017 15:46:25 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030221-0016-0000-0000-0000065649D3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006711; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00829215; UDB=6.00406501; IPR=6.00606712; 
 BA=6.00005186; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014502; XFM=3.00000012;
 UTC=2017-03-02 21:46:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030221-0017-0000-0000-000037E31175
Message-Id: <20170302214625.69263-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-02_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703020186
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
X-List-Received-Date: Thu, 02 Mar 2017 21:46:33 -0000

Fix duplicate "hub@00" naming bug when two or more hubs are
detected during scan. Each hub was assigned id '00'. Duplicate
hub device names were causing kernel warnings to console on
every scan.  Create a unique name by using the upstream master's
idx field. i.e. hub@00, hub@01, ...

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2:
    Add more description for the change.
---
 drivers/fsi/fsi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 542544e..b9573c5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -437,7 +437,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 				return -ENOMEM;
 
 			device_initialize(&hub->dev);
-			dev_set_name(&hub->dev, "hub@%02x", hub->master.idx);
+			dev_set_name(&hub->dev, "hub@%02x", slave->master->idx);
 			hub->dev.release = hub_master_release;
 			rc = device_add(&hub->dev);
 			if (rc)
-- 
1.8.2.2
