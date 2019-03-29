Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WDzs0402zDqQZ
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 08:15:52 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2TL3iwV026563
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:50 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rhq2xb7w7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:15:50 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Fri, 29 Mar 2019 21:15:49 -0000
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Mar 2019 21:15:46 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2TLFjB924445052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Mar 2019 21:15:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A15E1112062;
 Fri, 29 Mar 2019 21:15:45 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F1A7112061;
 Fri, 29 Mar 2019 21:15:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 29 Mar 2019 21:15:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.0 v2 1/5] media: platform: Aspeed: Remove use of reset
 line
Date: Fri, 29 Mar 2019 21:15:39 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19032921-0072-0000-0000-000004126203
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010836; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01181526; UDB=6.00618413; IPR=6.00962247; 
 MB=3.00026214; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-29 21:15:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032921-0073-0000-0000-00004BA5A24C
Message-Id: <1553894143-559-2-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903290145
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2019 21:15:53 -0000

The reset line is toggled by enabling the clocks, so it's not necessary
to manually toggle the reset as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/media/platform/aspeed-video.c | 39 ++++++++++++++---------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 692e08e..9df38ad 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -14,7 +14,6 @@
 #include <linux/of_irq.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -46,9 +45,9 @@
 #define NUM_POLARITY_CHECKS		10
 #define INVALID_RESOLUTION_RETRIES	2
 #define INVALID_RESOLUTION_DELAY	msecs_to_jiffies(250)
-#define RESOLUTION_CHANGE_DELAY		msecs_to_jiffies(500)
-#define MODE_DETECT_TIMEOUT		msecs_to_jiffies(500)
-#define STOP_TIMEOUT			msecs_to_jiffies(1000)
+#define RESOLUTION_CHANGE_DELAY		msecs_to_jiffies(750)
+#define MODE_DETECT_TIMEOUT		msecs_to_jiffies(1000)
+#define STOP_TIMEOUT			msecs_to_jiffies(1500)
 #define DIRECT_FETCH_THRESHOLD		0x0c0000 /* 1024 * 768 */
 
 #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
@@ -208,7 +207,6 @@ struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
-	struct reset_control *rst;
 
 	struct device *dev;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -483,19 +481,10 @@ static void aspeed_video_enable_mode_detect(struct aspeed_video *video)
 	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_TRIG_MODE_DET);
 }
 
-static void aspeed_video_reset(struct aspeed_video *video)
-{
-	/* Reset the engine */
-	reset_control_assert(video->rst);
-
-	/* Don't usleep here; function may be called in interrupt context */
-	udelay(100);
-	reset_control_deassert(video->rst);
-}
-
 static void aspeed_video_off(struct aspeed_video *video)
 {
-	aspeed_video_reset(video);
+	/* Disable interrupts */
+	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
 
 	/* Turn off the relevant clocks */
 	clk_disable_unprepare(video->vclk);
@@ -508,7 +497,13 @@ static void aspeed_video_on(struct aspeed_video *video)
 	clk_prepare_enable(video->eclk);
 	clk_prepare_enable(video->vclk);
 
-	aspeed_video_reset(video);
+	/*
+	 * Delay (and don't sleep in case in interrupt context) to let the
+	 * clocks stabilize. Without this, mode detection sometimes fails.
+	 * Possibly the registers don't update too soon after clocks are
+	 * enabled.
+	 */
+	udelay(100);
 }
 
 static void aspeed_video_bufs_done(struct aspeed_video *video,
@@ -1464,7 +1459,9 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 		 * Need to force stop any DMA and try and get HW into a good
 		 * state for future calls to start streaming again.
 		 */
-		aspeed_video_reset(video);
+		aspeed_video_off(video);
+		aspeed_video_on(video);
+
 		aspeed_video_init_regs(video);
 
 		aspeed_video_get_resolution(video);
@@ -1619,12 +1616,6 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return PTR_ERR(video->vclk);
 	}
 
-	video->rst = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(video->rst)) {
-		dev_err(dev, "Unable to get VE reset\n");
-		return PTR_ERR(video->rst);
-	}
-
 	rc = of_reserved_mem_device_init(dev);
 	if (rc) {
 		dev_err(dev, "Unable to reserve memory\n");
-- 
1.8.3.1
