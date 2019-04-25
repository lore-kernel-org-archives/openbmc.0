Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qs8V0QRVzDqdr
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:20:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Apr 2019 15:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,394,1549958400"; d="scan'208";a="168006805"
Received: from maru.jf.intel.com ([10.54.51.75])
 by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2019 15:20:57 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH dev-5.0 4/4] media: aspeed: clear interrupt status flags
 immediately
Date: Thu, 25 Apr 2019 15:20:40 -0700
Message-Id: <20190425222040.2413-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 25 Apr 2019 22:20:58 -0000

Interrupt status flags should be cleared immediately otherwise
interrupt handler will be called again and again until the flag
is cleared, but this driver clears some flags through a 500ms
delayed work which is a bad idea in interrupt handling, so this
commit makes the interrupt handler clear the status flags
immediately.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 77c209a472ca..e218f375b9f5 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -546,17 +546,18 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	 * re-initialize
 	 */
 	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
+		aspeed_video_write(video, VE_INTERRUPT_STATUS,
+				   VE_INTERRUPT_MODE_DETECT_WD);
 		aspeed_video_irq_res_change(video);
 		return IRQ_HANDLED;
 	}
 
 	if (sts & VE_INTERRUPT_MODE_DETECT) {
+		aspeed_video_write(video, VE_INTERRUPT_STATUS,
+				   VE_INTERRUPT_MODE_DETECT);
 		if (test_bit(VIDEO_RES_DETECT, &video->flags)) {
 			aspeed_video_update(video, VE_INTERRUPT_CTRL,
 					    VE_INTERRUPT_MODE_DETECT, 0);
-			aspeed_video_write(video, VE_INTERRUPT_STATUS,
-					   VE_INTERRUPT_MODE_DETECT);
-
 			set_bit(VIDEO_MODE_DETECT_DONE, &video->flags);
 			wake_up_interruptible_all(&video->wait);
 		} else {
@@ -574,6 +575,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		u32 frame_size = aspeed_video_read(video,
 						   VE_OFFSET_COMP_STREAM);
 
+		aspeed_video_write(video, VE_INTERRUPT_STATUS,
+				   VE_INTERRUPT_COMP_COMPLETE);
+
 		spin_lock(&video->lock);
 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
 		buf = list_first_entry_or_null(&video->buffers,
@@ -599,8 +603,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 				    VE_SEQ_CTRL_TRIG_COMP, 0);
 		aspeed_video_update(video, VE_INTERRUPT_CTRL,
 				    VE_INTERRUPT_COMP_COMPLETE, 0);
-		aspeed_video_write(video, VE_INTERRUPT_STATUS,
-				   VE_INTERRUPT_COMP_COMPLETE);
 
 		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
 			aspeed_video_start_frame(video);
-- 
2.21.0
