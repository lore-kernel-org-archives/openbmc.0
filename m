Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5H35gKzDrJ7
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:07 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JOxTR099719
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:05 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsapvyt6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:56 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:37 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:34 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOXs06947086; Thu, 5 Oct 2017 12:24:33 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABA5013603A;
 Thu,  5 Oct 2017 13:24:33 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 654B2136040;
 Thu,  5 Oct 2017 13:24:33 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 05/31] drivers: fsi: sbefifo: replace
 awkward wait_event expression
Date: Thu,  5 Oct 2017 14:23:58 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0004-0000-0000-0000130560D4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0005-0000-0000-0000845C4782
Message-Id: <1507231464-13635-6-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:08 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Use ready() functions to replace awkward boolean expressions in the
wait_event_interruptible calls.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 561a7f6..dbac0c3 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -545,6 +545,16 @@ static unsigned int sbefifo_poll(struct file *file, poll_table *wait)
 	return mask;
 }
 
+static bool sbefifo_read_ready(struct sbefifo *sbefifo,
+			       struct sbefifo_client *client, size_t *n,
+			       size_t *ret)
+{
+	*n = sbefifo_buf_nbreadable(&client->rbuf);
+	*ret = READ_ONCE(sbefifo->rc);
+
+	return *ret || *n;
+}
+
 static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 				   char __user *ubuf, char *kbuf, size_t len)
 {
@@ -561,9 +571,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 
 	sbefifo_get_client(client);
 	if (wait_event_interruptible(sbefifo->wait,
-				     (ret = READ_ONCE(sbefifo->rc)) ||
-				     (n = sbefifo_buf_nbreadable(
-					&client->rbuf)))) {
+				     sbefifo_read_ready(sbefifo, client, &n,
+							&ret))) {
 		sbefifo_put_client(client);
 		return -ERESTARTSYS;
 	}
@@ -619,6 +628,16 @@ static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
 	return sbefifo_read_common(client, buf, NULL, len);
 }
 
+static bool sbefifo_write_ready(struct sbefifo *sbefifo,
+				struct sbefifo_xfr *xfr,
+				struct sbefifo_client *client, size_t *n)
+{
+	struct sbefifo_xfr *next = sbefifo_client_next_xfr(client);
+
+	*n = sbefifo_buf_nbwriteable(&client->wbuf);
+	return READ_ONCE(sbefifo->rc) || (next == xfr && *n);
+}
+
 static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 				    const char __user *ubuf, const char *kbuf,
 				    size_t len)
@@ -660,10 +679,9 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 	 */
 	while (len) {
 		if (wait_event_interruptible(sbefifo->wait,
-				READ_ONCE(sbefifo->rc) ||
-				(sbefifo_client_next_xfr(client) == xfr &&
-				 (n = sbefifo_buf_nbwriteable(
-							&client->wbuf))))) {
+					     sbefifo_write_ready(sbefifo, xfr,
+								 client,
+								 &n))) {
 			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
 			sbefifo_get(sbefifo);
 			if (mod_timer(&sbefifo->poll_timer, jiffies))
-- 
1.8.3.1
