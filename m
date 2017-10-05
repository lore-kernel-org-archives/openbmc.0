Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7N5G4S4RzDrG1
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 06:25:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95JNnkZ016055
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 15:25:04 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddr6w8xhd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 15:25:03 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 13:25:03 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 13:25:00 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95JP0H562849112; Thu, 5 Oct 2017 12:25:00 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD3C136048;
 Thu,  5 Oct 2017 13:24:59 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id A779913603A;
 Thu,  5 Oct 2017 13:24:59 -0600 (MDT)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.10 v3 25/31] drivers: fsi: occ: Add comments for
 clarity
Date: Thu,  5 Oct 2017 14:24:18 -0500
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 17100519-0012-0000-0000-0000151ACF32
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926924; UDB=6.00466363; IPR=6.00707179; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017410; XFM=3.00000015;
 UTC=2017-10-05 19:25:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100519-0013-0000-0000-00004FC22A6E
Message-Id: <1507231464-13635-26-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:25:07 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Fixup some existing comments as well.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/occ.c | 55 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
index 561b029..29a17ed 100644
--- a/drivers/fsi/occ.c
+++ b/drivers/fsi/occ.c
@@ -39,8 +39,8 @@ struct occ {
 	int idx;
 	struct miscdevice mdev;
 	struct list_head xfrs;
-	spinlock_t list_lock;
-	struct mutex occ_lock;
+	spinlock_t list_lock;		/* lock access to the xfrs list */
+	struct mutex occ_lock;		/* lock access to the hardware */
 	struct work_struct work;
 };
 
@@ -57,17 +57,17 @@ struct occ_response {
 
 /*
  * transfer flags are NOT mutually exclusive
- * 
+ *
  * Initial flags are none; transfer is created and queued from write(). All
- * 	flags are cleared when the transfer is completed by closing the file or
- * 	reading all of the available response data.
+ *  flags are cleared when the transfer is completed by closing the file or
+ *  reading all of the available response data.
  * XFR_IN_PROGRESS is set when a transfer is started from occ_worker_putsram,
- * 	and cleared if the transfer fails or occ_worker_getsram completes.
+ *  and cleared if the transfer fails or occ_worker_getsram completes.
  * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
  * XFR_CANCELED is set when the transfer's client is released.
  * XFR_WAITING is set from read() if the transfer isn't complete and
- * 	NONBLOCKING wasn't specified. Cleared in read() when transfer completes
- * 	or fails.
+ *  O_NONBLOCK wasn't specified. Cleared in read() when transfer completes or
+ *  fails.
  */
 enum {
 	XFR_IN_PROGRESS,
@@ -89,9 +89,9 @@ struct occ_xfr {
  * client flags
  *
  * CLIENT_NONBLOCKING is set during open() if the file was opened with the
- * 	O_NONBLOCKING flag.
+ *  O_NONBLOCK flag.
  * CLIENT_XFR_PENDING is set during write() and cleared when all data has been
- * 	read.
+ *  read.
  */
 enum {
 	CLIENT_NONBLOCKING,
@@ -101,7 +101,7 @@ enum {
 struct occ_client {
 	struct occ *occ;
 	struct occ_xfr xfr;
-	spinlock_t lock;
+	spinlock_t lock;		/* lock access to the client state */
 	wait_queue_head_t wait;
 	size_t read_offset;
 	unsigned long flags;
@@ -273,10 +273,15 @@ static ssize_t occ_write_common(struct occ_client *client,
 		goto done;
 	}
 
-	/* clear out the transfer */
-	memset(xfr, 0, sizeof(*xfr));
-	xfr->buf[0] = 1;
+	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
+	xfr->buf[0] = 1;		/* occ sequence number */
 
+	/*
+	 * Assume user data follows the occ command format.
+	 * byte 0: command type
+	 * bytes 1-2: data length (msb first)
+	 * bytes 3-n: data
+	 */
 	if (ubuf) {
 		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
 			rc = -EFAULT;
@@ -354,7 +359,7 @@ static int occ_release_common(struct occ_client *client)
 		return 0;
 	}
 
-	/* operation is in progress; let worker clean up*/
+	/* operation is in progress; let worker clean up */
 	spin_unlock_irq(&occ->list_lock);
 	spin_unlock_irq(&client->lock);
 	return 0;
@@ -419,9 +424,13 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
 	int rc;
 	u8 *resp;
 	__be32 buf[5];
-	u32 data_len = ((len + 7) / 8) * 8;
+	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
 	struct sbefifo_client *client;
 
+	/*
+	 * Magic sequence to do SBE getsram command. SBE will fetch data from
+	 * specified SRAM address.
+	 */
 	buf[0] = cpu_to_be32(0x5);
 	buf[1] = cpu_to_be32(0xa403);
 	buf[2] = cpu_to_be32(1);
@@ -470,7 +479,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 {
 	int rc;
 	__be32 *buf;
-	u32 data_len = ((len + 7) / 8) * 8;
+	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
 	size_t cmd_len = data_len + 20;
 	struct sbefifo_client *client;
 
@@ -478,6 +487,10 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
 	if (!buf)
 		return -ENOMEM;
 
+	/*
+	 * Magic sequence to do SBE putsram command. SBE will transfer
+	 * data to specified SRAM address.
+	 */
 	buf[0] = cpu_to_be32(0x5 + (data_len / 4));
 	buf[1] = cpu_to_be32(0xa404);
 	buf[2] = cpu_to_be32(1);
@@ -518,11 +531,15 @@ static int occ_trigger_attn(struct device *sbefifo)
 	__be32 buf[6];
 	struct sbefifo_client *client;
 
+	/*
+	 * Magic sequence to do SBE putscom command. SBE will write 8 bytes to
+	 * specified SCOM address.
+	 */
 	buf[0] = cpu_to_be32(0x6);
 	buf[1] = cpu_to_be32(0xa202);
 	buf[2] = 0;
 	buf[3] = cpu_to_be32(0x6D035);
-	buf[4] = cpu_to_be32(0x20010000);
+	buf[4] = cpu_to_be32(0x20010000);	/* trigger occ attention */
 	buf[5] = 0;
 
 	client = sbefifo_drv_open(sbefifo, 0);
@@ -573,6 +590,7 @@ static void occ_worker(struct work_struct *work)
 	spin_unlock_irq(&occ->list_lock);
 	mutex_lock(&occ->occ_lock);
 
+	/* write occ command */
 	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
 			 xfr->cmd_data_length);
 	if (rc)
@@ -582,6 +600,7 @@ static void occ_worker(struct work_struct *work)
 	if (rc)
 		goto done;
 
+	/* read occ response */
 	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
 	if (rc)
 		goto done;
-- 
1.8.3.1
