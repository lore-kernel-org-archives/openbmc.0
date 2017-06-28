Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyc7361p8zDr46
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 07:55:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5SLrqrP046737
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 17:55:56 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bckf32pys-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 17:55:56 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 28 Jun 2017 15:55:55 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 28 Jun 2017 15:55:52 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5SLtqWi66257042; Wed, 28 Jun 2017 14:55:52 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AF6A6E044;
 Wed, 28 Jun 2017 15:55:52 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 169FE6E03A;
 Wed, 28 Jun 2017 15:55:52 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10] drivers/fsi: Fix SBEFIFO write() race condition
Date: Wed, 28 Jun 2017 16:55:49 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17062821-0012-0000-0000-0000148ED07B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007291; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880087; UDB=6.00438699; IPR=6.00660241; 
 BA=6.00005445; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015995; XFM=3.00000015;
 UTC=2017-06-28 21:55:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062821-0013-0000-0000-00004E5A8D69
Message-Id: <1498686949-15084-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-28_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706280351
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
X-List-Received-Date: Wed, 28 Jun 2017 21:56:00 -0000

From: "Edward A. James" <eajames@us.ibm.com>

There was a race condition with the XFR_WRITE_DONE flag between write()
and the worker thread. Occasionally the worker wrote all the data and
checked the flag before write() could set it.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index f1bc144..d7dccf9 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -688,6 +688,12 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 		len -= n;
 		ret += n;
 
+		/* set flag before starting the worker, as it may run through
+		 * and check the flag before we exit this loop!
+		 */
+		if (!len)
+			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
+
 		/*
 		 * Drain the write buffer.
 		 */
@@ -696,7 +702,6 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			sbefifo_put(sbefifo);
 	}
 
-	set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
 	sbefifo_put_client(client);
 
 	return ret;
-- 
1.8.3.1
