Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNMHz4MsBzDqlH
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 09:34:23 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QMSxRE019229
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 18:34:21 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dur209b9e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 18:34:20 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 18:34:19 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 18:34:16 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QMYGEs36896962; Thu, 26 Oct 2017 22:34:16 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 986F2124044;
 Thu, 26 Oct 2017 18:31:24 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 4138B124035;
 Thu, 26 Oct 2017 18:31:24 -0400 (EDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, bradleyb@fuzziesquirrel.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v2] drivers (fsi): sbefifo: Add timeout for
 waiting for data
Date: Thu, 26 Oct 2017 17:34:14 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 17102622-0036-0000-0000-000002821B77
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007957; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936922; UDB=6.00472178; IPR=6.00717185; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017731; XFM=3.00000015;
 UTC=2017-10-26 22:34:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102622-0037-0000-0000-00004233329E
Message-Id: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710260284
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
X-List-Received-Date: Thu, 26 Oct 2017 22:34:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

During a transfer, in the event that the SBE isn't running, the driver
will wait for data to appear in the FIFO forever. This doesn't work at
BMC boot time if any transfers are attempted (by OCC driver probing, for
example), as it will just hang the boot. So add a simple timeout
mechanism when the driver reschdules waiting for data to show up in the
FIFO.

Tested on witherspoon by rebooting the BMC successfully with chassis
power on.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
Changes since v1:
 * Reset the wait_data_timeout field if we get data. If we get data, the SBE
   is running and we really shouldn't timeout.

 drivers/fsi/fsi-sbefifo.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
index f756822..41b838e 100644
--- a/drivers/fsi/fsi-sbefifo.c
+++ b/drivers/fsi/fsi-sbefifo.c
@@ -54,6 +54,7 @@
 #define SBEFIFO_EOT_ACK		0x14
 
 #define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
+#define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
 
 struct sbefifo {
 	struct timer_list poll_timer;
@@ -77,6 +78,7 @@ struct sbefifo_buf {
 };
 
 struct sbefifo_xfr {
+	unsigned long wait_data_timeout;
 	struct sbefifo_buf *rbuf;
 	struct sbefifo_buf *wbuf;
 	struct list_head client;
@@ -450,11 +452,27 @@ static void sbefifo_poll_timer(unsigned long data)
 
 		devn = sbefifo_dev_nwreadable(sts);
 		if (devn == 0) {
+			/*
+			 * Limit the maximum waiting period for data in the
+			 * FIFO. If the SBE isn't running, we will wait
+			 * forever.
+			 */
+			if (!xfr->wait_data_timeout) {
+				xfr->wait_data_timeout =
+					jiffies + SBEFIFO_MAX_RESCHDULE;
+			} else if (time_after(jiffies,
+					      xfr->wait_data_timeout)) {
+				ret = -ETIME;
+				goto out;
+			}
+
 			/* No data yet.  Reschedule. */
 			sbefifo->poll_timer.expires = jiffies +
 				SBEFIFO_RESCHEDULE;
 			add_timer(&sbefifo->poll_timer);
 			goto out_unlock;
+		} else {
+			xfr->wait_data_timeout = 0;
 		}
 
 		/* Fill.  The EOT word is discarded.  */
-- 
1.8.3.1
