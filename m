Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y091WS9zDqms
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:17 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v962510i115804
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:15 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddrnnet4w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:15 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:14 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:12 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626BCx65470656; Thu, 5 Oct 2017 19:06:11 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ECBDC603E;
 Thu,  5 Oct 2017 20:06:11 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 770E3C6037;
 Thu,  5 Oct 2017 20:06:10 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 06/31] drivers: fsi: sbefifo: remove
 redundant function
Date: Thu,  5 Oct 2017 21:05:28 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0008-0000-0000-000008ABCAF2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466442; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0009-0000-0000-0000443F7537
Message-Id: <1507255553-13301-7-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:17 -0000

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
