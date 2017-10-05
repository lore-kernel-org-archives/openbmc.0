Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N4s6XzWzDrG1
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JOWFe096571
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:43 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddrnd7f5p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:43 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:42 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:39 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOdqs30605490; Thu, 5 Oct 2017 12:24:39 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC1B2136044;
 Thu,  5 Oct 2017 13:24:38 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id ACD9D136040;
 Thu,  5 Oct 2017 13:24:38 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 09/31] drivers: fsi: sbefifo: Remove warning
 and user data access check
Date: Thu,  5 Oct 2017 14:24:02 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0020-0000-0000-00000CCED0EE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0021-0000-0000-00005E662BCB
Message-Id: <1507231464-13635-10-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050269
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Oct 2017 19:24:46 -0000

From: "Edward A. James" <eajames@us.ibm.com>

We check for user buffer access when we copy the data. No reason to
throw a kernel warning if there is an offset provided; just ignore it.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 5efba30..60b133d 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -621,11 +621,6 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 {
 	struct sbefifo_client *client = file->private_data;
 
-	WARN_ON(*offset);
-
-	if (!access_ok(VERIFY_WRITE, buf, len))
-		return -EFAULT;
-
 	return sbefifo_read_common(client, buf, NULL, len);
 }
 
@@ -748,11 +743,6 @@ static ssize_t sbefifo_write(struct file *file, const char __user *buf,
 {
 	struct sbefifo_client *client = file->private_data;
 
-	WARN_ON(*offset);
-
-	if (!access_ok(VERIFY_READ, buf, len))
-		return -EFAULT;
-
 	return sbefifo_write_common(client, buf, NULL, len);
 }
 
-- 
1.8.3.1
