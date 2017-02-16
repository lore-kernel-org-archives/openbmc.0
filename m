Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPQxF1h1lzDq60
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 06:21:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1GJIm4E128620
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:21:02 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28nctgq81m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:21:02 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 16 Feb 2017 12:21:01 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 16 Feb 2017 12:20:59 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 9273219D8041;
 Thu, 16 Feb 2017 12:20:11 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1GJKwQR16908596; Thu, 16 Feb 2017 12:20:58 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB7B78038;
 Thu, 16 Feb 2017 12:20:58 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6D5847804D;
 Thu, 16 Feb 2017 12:20:58 -0700 (MST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7] drivers: fsi: Fix incremeting dev nums
Date: Thu, 16 Feb 2017 13:20:56 -0600
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021619-0008-0000-0000-0000073FB82B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006628; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00822895; UDB=6.00402624; IPR=6.00600341; 
 BA=6.00005146; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014311; XFM=3.00000011;
 UTC=2017-02-16 19:21:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021619-0009-0000-0000-00003FF8764E
Message-Id: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-16_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702160182
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
X-List-Received-Date: Thu, 16 Feb 2017 19:21:05 -0000

From: "Edward A. James" <eajames@us.ibm.com>

both for FSI master and scom client

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-core.c | 4 +++-
 drivers/fsi/fsi-scom.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index e8a3618..7816482 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -46,7 +46,7 @@ static const int engine_page_size = 0x400;
 static struct task_struct *master_ipoll;
 static unsigned int fsi_ipoll_period_ms = 100;
 
-static atomic_t master_idx = ATOMIC_INIT(-1);
+static atomic_t master_idx = ATOMIC_INIT(0);
 
 struct fsi_slave {
 	struct list_head	list_link;	/* Master's list of slaves */
@@ -617,6 +617,8 @@ void fsi_master_unregister(struct fsi_master *master)
 		kthread_stop(master_ipoll);
 		master_ipoll = NULL;
 	}
+
+	atomic_dec(&master_idx);
 }
 EXPORT_SYMBOL_GPL(fsi_master_unregister);
 
diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
index a439a5e..62d3482 100644
--- a/drivers/fsi/fsi-scom.c
+++ b/drivers/fsi/fsi-scom.c
@@ -211,6 +211,8 @@ static int scom_remove(struct device *dev)
 		}
 	}
 
+	atomic_dec(&scom_idx);
+
 	return 0;
 }
 
-- 
1.8.3.1
