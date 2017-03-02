Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ4q65ypnzDqC0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 08:15:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v22L8S00072958
 for <openbmc@lists.ozlabs.org>; Thu, 2 Mar 2017 16:15:43 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28xs8dmsu3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 16:15:43 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 2 Mar 2017 14:15:42 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Mar 2017 14:15:40 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id D85DD1FF002E;
 Thu,  2 Mar 2017 14:15:16 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v22LFd7J14811644; Thu, 2 Mar 2017 14:15:39 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A01D66A042;
 Thu,  2 Mar 2017 14:15:39 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 6B2DA6A03F;
 Thu,  2 Mar 2017 14:15:39 -0700 (MST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7 v2] drivers/fsi: Don't scan after
 fsi-gpio_master unbound
Date: Thu,  2 Mar 2017 15:15:37 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030221-0012-0000-0000-000013D539C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006711; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00829204; UDB=6.00406495; IPR=6.00606702; 
 BA=6.00005186; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014502; XFM=3.00000012;
 UTC=2017-03-02 21:15:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030221-0013-0000-0000-00004BE8E09E
Message-Id: <20170302211537.67380-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-02_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703020184
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
X-List-Received-Date: Thu, 02 Mar 2017 21:15:47 -0000

Check pointers prior to scanning master in the sysfs scan
file.  These get invalidated after an unbind operation.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
v2:
    Return error if invalid pointers passed in.
---
 drivers/fsi/fsi-master-gpio.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index c5f4f9c..49f3399 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -476,7 +476,14 @@ static ssize_t store_scan(struct device *dev,
 				const char *buf,
 				size_t count)
 {
-	struct fsi_master_gpio *master = dev_get_drvdata(dev);
+	struct fsi_master_gpio *master;
+
+	if (!dev)
+		return -EINVAL;
+
+	master = dev_get_drvdata(dev);
+	if (!master)
+		return -EINVAL;
 
 	fsi_master_gpio_init(master);
 
-- 
1.8.2.2
