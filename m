Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N4n51vkzDrFR
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:24:41 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNkRe088551
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:24:39 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddsanmyv7-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:24:39 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:24:38 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:24:36 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JOaLm60031192; Thu, 5 Oct 2017 12:24:36 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56745136043;
 Thu,  5 Oct 2017 13:24:36 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 1740713603A;
 Thu,  5 Oct 2017 13:24:36 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 07/31] drivers: fsi: sbefifo: Use goto to
 reduce put statements
Date: Thu,  5 Oct 2017 14:24:00 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0016-0000-0000-0000079D6CD6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707180; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:24:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0017-0000-0000-00003BBD83EE
Message-Id: <1507231464-13635-8-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:24:42 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Use a goto in the read() and write() functions so that we can just have
one get_client and put_client statement.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/fsi-sbefifo.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index 173cd03..a5bdc75 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -565,22 +565,21 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 	if (wait_event_interruptible(sbefifo->wait,
 				     sbefifo_read_ready(sbefifo, client, &n,
 							&ret))) {
-		sbefifo_put_client(client);
-		return -ERESTARTSYS;
+		ret = -ERESTARTSYS;
+		goto out;
 	}
 
 	if (ret) {
 		INIT_LIST_HEAD(&client->xfrs);
-		sbefifo_put_client(client);
-		return ret;
+		goto out;
 	}
 
 	n = min_t(size_t, n, len);
 
 	if (ubuf) {
 		if (copy_to_user(ubuf, READ_ONCE(client->rbuf.rpos), n)) {
-			sbefifo_put_client(client);
-			return -EFAULT;
+			ret = -EFAULT;
+			goto out;
 		}
 	} else {
 		memcpy(kbuf, READ_ONCE(client->rbuf.rpos), n);
@@ -592,8 +591,8 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		if (!xfr) {
 			/* should be impossible to not have an xfr here */
 			WARN_ONCE(1, "no xfr in queue");
-			sbefifo_put_client(client);
-			return -EPROTO;
+			ret = -EPROTO;
+			goto out;
 		}
 
 		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
@@ -610,9 +609,11 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
 		}
 	}
 
-	sbefifo_put_client(client);
+	ret = n;
 
-	return n;
+out:
+	sbefifo_put_client(client);
+	return ret;
 }
 
 static ssize_t sbefifo_read(struct file *file, char __user *buf, size_t len,
@@ -689,14 +690,14 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			if (mod_timer(&sbefifo->poll_timer, jiffies))
 				sbefifo_put(sbefifo);
 
-			sbefifo_put_client(client);
-			return -ERESTARTSYS;
+			ret = -ERESTARTSYS;
+			goto out;
 		}
 
 		if (sbefifo->rc) {
 			INIT_LIST_HEAD(&client->xfrs);
-			sbefifo_put_client(client);
-			return sbefifo->rc;
+			ret = sbefifo->rc;
+			goto out;
 		}
 
 		n = min_t(size_t, n, len);
@@ -708,8 +709,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 				sbefifo_get(sbefifo);
 				if (mod_timer(&sbefifo->poll_timer, jiffies))
 					sbefifo_put(sbefifo);
-				sbefifo_put_client(client);
-				return -EFAULT;
+				ret = -EFAULT;
+				goto out;
 			}
 
 			ubuf += n;
@@ -736,8 +737,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
 			sbefifo_put(sbefifo);
 	}
 
+out:
 	sbefifo_put_client(client);
-
 	return ret;
 }
 
-- 
1.8.3.1
