Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYVQq03HLzDqLT
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 09:26:10 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v21MOLLO118058
 for <openbmc@lists.ozlabs.org>; Wed, 1 Mar 2017 17:26:07 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28x3jgr74f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 17:26:07 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 1 Mar 2017 17:26:07 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 1 Mar 2017 17:26:05 -0500
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 16A8538C8039;
 Wed,  1 Mar 2017 17:26:06 -0500 (EST)
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v21MQ4PZ25755822; Wed, 1 Mar 2017 22:26:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72E7AAE04E;
 Wed,  1 Mar 2017 17:26:00 -0500 (EST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id 267CCAE043;
 Wed,  1 Mar 2017 17:26:00 -0500 (EST)
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: joel@jms.id.au
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers/fsi: Don't scan after fsi-gpio-master
 unbound
Date: Wed,  1 Mar 2017 16:26:02 -0600
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030122-0056-0000-0000-000002E7E632
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006705; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00828749; UDB=6.00406221; IPR=6.00606266; 
 BA=6.00005182; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014490; XFM=3.00000011;
 UTC=2017-03-01 22:26:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030122-0057-0000-0000-0000071DE787
Message-Id: <20170301222602.43438-1-cbostic@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-01_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1703010200
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
X-List-Received-Date: Wed, 01 Mar 2017 22:26:11 -0000

Check pointers prior to scanning master in the sysfs scan
file.  These get invalidated after an unbind operation.

Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index c5f4f9c..67f0d9d 100644
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
+		return count;
+
+	master = dev_get_drvdata(dev);
+	if (!master)
+		return count;
 
 	fsi_master_gpio_init(master);
 
-- 
1.8.2.2
