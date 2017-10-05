Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N4m5Z8KzDrFD
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:40 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNmRn071832
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:38 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddqw6t236-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:38 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:37 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:35 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOZt265929240; Thu, 5 Oct 2017 12:24:35 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C41C136043;
 Thu,  5 Oct 2017 13:24:35 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id B6DD313603A;
 Thu,  5 Oct 2017 13:24:34 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 06/31] drivers: fsi: sbefifo: remove
 redundant function
Date: Thu,  5 Oct 2017 14:23:59 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0004-0000-0000-0000130560D5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0005-0000-0000-0000845C4785
Message-Id: <1507231464-13635-7-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:24:41 -0000
X-List-Received-Date: Thu, 05 Oct 2017 19:24:41 -0000

From: "Edward A. James" <eajames@us.ibm.com>

sbefifo_client_next_xfr function just does what list_first_entry_or_null
does.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index dbac0c3..173cd03 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -279,20 +279,12 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
 	return xfr;
 }
 
-static struct sbefifo_xfr *sbefifo_client_next_xfr(
-		struct sbefifo_client *client)
-{
-	if (list_empty(&client->xfrs))
-		return NULL;
-
-	return container_of(client->xfrs.next, struct sbefifo_xfr, client);
-}
-
 static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
 {
-	struct sbefifo_xfr *xfr;
+	struct sbefifo_xfr *xfr = list_first_entry_or_null(&client->xfrs,
+							   struct sbefifo_xfr,
+							   client);
 
-	xfr = sbefifo_client_next_xfr(client);
 	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
 		return true;
 
@@ -595,7 +587,15 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 	}
 
 	if (sbefifo_buf_readnb(&client->rbuf, n)) {
-		xfr = sbefifo_client_next_xfr(client);
+		xfr = list_first_entry_or_null(&client->xfrs,
+					       struct sbefifo_xfr, client);
+		if (!xfr) {
+			/* should be impossible to not have an xfr here */
+			WARN_ONCE(1, "no xfr in queue");
+			sbefifo_put_client(client);
+			return -EPROTO;
+		}
+
 		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
 			/*
 			 * Fill the read buffer back up.
@@ -632,7 +632,9 @@ static bool sbefifo_write_ready(struct sbefifo *sbefifo,
 				struct sbefifo_xfr *xfr,
 				struct sbefifo_client *client, size_t *n)
 {
-	struct sbefifo_xfr *next = sbefifo_client_next_xfr(client);
+	struct sbefifo_xfr *next = list_first_entry_or_null(&client->xfrs,
+							    struct sbefifo_xfr,
+							    client);
 
 	*n = sbefifo_buf_nbwriteable(&client->wbuf);
 	return READ_ONCE(sbefifo->rc) || (next == xfr && *n);
-- 
1.8.3.1
