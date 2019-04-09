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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dxwt5lfnzDqJM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 05:21:34 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2019 12:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,330,1549958400"; d="scan'208";a="290119485"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga004.jf.intel.com with ESMTP; 09 Apr 2019 12:21:31 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH dev-5.0 2/3] media: platform: aspeed: refine clock control
 logic
Date: Tue,  9 Apr 2019 12:20:58 -0700
Message-Id: <20190409192059.1160-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
References: <20190409192059.1160-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 09 Apr 2019 19:21:35 -0000

Currently, this driver calls clk_prepare and clk_unprepare from
interrupt context too but these should be called from sleepable
context only. To fix this issue, this commit splits out
clk_enable/disable and clk_prepare/unprepare, and it places
clk_prepare/unprepare calls into the module probe/remove function.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 38 ++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index e70be8fdbde5..75b43488ae8e 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -491,8 +491,8 @@ static void aspeed_video_off(struct aspeed_video *video)
 	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
 
 	/* Turn off the relevant clocks */
-	clk_disable_unprepare(video->vclk);
-	clk_disable_unprepare(video->eclk);
+	clk_disable(video->vclk);
+	clk_disable(video->eclk);
 
 	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -503,8 +503,8 @@ static void aspeed_video_on(struct aspeed_video *video)
 		return;
 
 	/* Turn on the relevant clocks */
-	clk_prepare_enable(video->eclk);
-	clk_prepare_enable(video->vclk);
+	clk_enable(video->eclk);
+	clk_enable(video->vclk);
 
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -1628,31 +1628,46 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return PTR_ERR(video->eclk);
 	}
 
+	rc = clk_prepare(video->eclk);
+	if (rc)
+		return rc;
+
 	video->vclk = devm_clk_get(dev, "vclk");
 	if (IS_ERR(video->vclk)) {
 		dev_err(dev, "Unable to get VCLK\n");
-		return PTR_ERR(video->vclk);
+		rc = PTR_ERR(video->vclk);
+		goto err_unprepare_eclk;
 	}
 
+	rc = clk_prepare(video->vclk);
+	if (rc)
+		goto err_unprepare_eclk;
+
 	of_reserved_mem_device_init(dev);
 
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
-		return rc;
+		goto err_release_reserved_mem;
 	}
 
 	if (!aspeed_video_alloc_buf(video, &video->jpeg,
 				    VE_JPEG_HEADER_SIZE)) {
 		dev_err(dev, "Failed to allocate DMA for JPEG header\n");
-		of_reserved_mem_device_release(dev);
-		return rc;
+		goto err_release_reserved_mem;
 	}
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
 	return 0;
+
+err_release_reserved_mem:
+	of_reserved_mem_device_release(dev);
+	clk_unprepare(video->vclk);
+err_unprepare_eclk:
+	clk_unprepare(video->eclk);
+
+	return rc;
 }
 
 static int aspeed_video_probe(struct platform_device *pdev)
@@ -1696,6 +1711,11 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	aspeed_video_off(video);
+
+	clk_unprepare(video->vclk);
+	clk_unprepare(video->eclk);
+
 	video_unregister_device(&video->vdev);
 
 	vb2_queue_release(&video->queue);
-- 
2.21.0
