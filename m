Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Y0C60ywzDqhg
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 13:06:19 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9624lMZ009058
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 22:06:18 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddugtw1q2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 22:06:18 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:06:17 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:06:14 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9626DmW8454632; Thu, 5 Oct 2017 19:06:13 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99504C603E;
 Thu,  5 Oct 2017 20:06:13 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id BE89AC6037;
 Thu,  5 Oct 2017 20:06:12 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v4 07/31] drivers: fsi: sbefifo: Use goto to
 reduce put statements
Date: Thu,  5 Oct 2017 21:05:29 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507255553-13301-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100602-0024-0000-0000-0000174C1026
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927057; UDB=6.00466442; IPR=6.00707311; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017415; XFM=3.00000015;
 UTC=2017-10-06 02:06:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100602-0025-0000-0000-00004CFDEA6E
Message-Id: <1507255553-13301-8-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 06 Oct 2017 02:06:20 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Use a goto in the read() and write() functions so that we can just have
one get_client and put_client statement.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
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
