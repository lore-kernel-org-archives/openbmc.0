Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YD5V6b7dzDqKP
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 13:42:38 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x322YE08021640
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 22:42:36 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rktuatnh1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 22:42:36 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Tue, 2 Apr 2019 03:42:35 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Apr 2019 03:42:34 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x322gXSH56885320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Apr 2019 02:42:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF7006E050;
 Tue,  2 Apr 2019 02:42:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A11D26E04E;
 Tue,  2 Apr 2019 02:42:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.3.116.186])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Apr 2019 02:42:32 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, jae.hyun.yoo@linux.intel.com
Subject: [PATCH dev-5.0 v4 1/7] media: platform: Aspeed: Remove use of reset
 line
Date: Tue,  2 Apr 2019 02:42:24 +0000
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
References: <1554172950-2072-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19040202-0004-0000-0000-000014F738D8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010858; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01183052; UDB=6.00619336; IPR=6.00963797; 
 MB=3.00026252; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-02 02:42:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040202-0005-0000-0000-00008B1C607E
Message-Id: <1554172950-2072-2-git-send-email-eajames@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-02_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=832 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904020017
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
X-List-Received-Date: Tue, 02 Apr 2019 02:42:39 -0000

The reset line is toggled by enabling the clocks, so it's not necessary
to manually toggle the reset as well.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/media/platform/aspeed-video.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 692e08e..55c55a6 100644
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
@@ -507,8 +496,6 @@ static void aspeed_video_on(struct aspeed_video *video)
 	/* Turn on the relevant clocks */
 	clk_prepare_enable(video->eclk);
 	clk_prepare_enable(video->vclk);
-
-	aspeed_video_reset(video);
 }
 
 static void aspeed_video_bufs_done(struct aspeed_video *video,
@@ -1464,7 +1451,9 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 		 * Need to force stop any DMA and try and get HW into a good
 		 * state for future calls to start streaming again.
 		 */
-		aspeed_video_reset(video);
+		aspeed_video_off(video);
+		aspeed_video_on(video);
+
 		aspeed_video_init_regs(video);
 
 		aspeed_video_get_resolution(video);
@@ -1619,12 +1608,6 @@ static int aspeed_video_init(struct aspeed_video *video)
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
