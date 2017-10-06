Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0N6RY8zDqls
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:28 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9625A8a137432
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:26 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddtx7pxx3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:26 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:25 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:22 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626Mug2163080; Thu, 5 Oct 2017 19:06:22 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241F4C6043;
 Thu,  5 Oct 2017 20:06:22 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 53277C603C;
 Thu,  5 Oct 2017 20:06:21 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 11/31] drivers: fsi: sbefifo: Fix module
 authors and comments
Date: Thu,  5 Oct 2017 21:05:33 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0012-0000-0000-0000151B2800
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466443; IPR=6.00707312; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0013-0000-0000-00004FC30CD5
Message-Id: <1507255553-13301-12-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-06_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060029
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:29 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Clarify the xfr situation in write() and fix module authors

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/fsi/fsi-sbefifo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 0ff5209..a2acf76 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -655,7 +655,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	n = sbefifo_buf_nbwriteable(&client->wbuf);
 
 	spin_lock_irq(&sbefifo->lock);
-	xfr = sbefifo_next_xfr(sbefifo);
+	xfr = sbefifo_next_xfr(sbefifo);	/* next xfr to be executed */
 
 	if ((client->f_flags & O_NONBLOCK) && xfr && n < len) {
 		spin_unlock_irq(&sbefifo->lock);
@@ -663,7 +663,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 		goto out;
 	}
 
-	xfr = sbefifo_enq_xfr(client);
+	xfr = sbefifo_enq_xfr(client);		/* this xfr queued up */
 	if (!xfr) {
 		spin_unlock_irq(&sbefifo->lock);
 		ret = -ENOMEM;
@@ -719,8 +719,9 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 		len -= n;
 		ret += n;
 
-		/* set flag before starting the worker, as it may run through
-		 * and check the flag before we exit this loop!
+		/*
+		 * Set this before starting timer to avoid race condition on
+		 * this flag with the timer function writer.
 		 */
 		if (!len)
 			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
@@ -955,4 +956,5 @@ static void sbefifo_exit(void)
 module_exit(sbefifo_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Brad Bishop <bradleyb@fuzziesquirrel.com>");
-MODULE_DESCRIPTION("Linux device interface to the POWER self boot engine");
+MODULE_AUTHOR("Eddie James <eajames@linux.vnet.ibm.com>");
+MODULE_DESCRIPTION("Linux device interface to the POWER Self Boot Engine");
-- 
1.8.3.1
