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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qs8K4qtxzDqdM
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 08:20:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Apr 2019 15:20:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,394,1549958400"; d="scan'208";a="168006783"
Received: from maru.jf.intel.com ([10.54.51.75])
 by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2019 15:20:47 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH dev-5.0 1/4] media: aspeed: remove IRQF_SHARED flag
Date: Thu, 25 Apr 2019 15:20:37 -0700
Message-Id: <20190425222040.2413-2-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Thu, 25 Apr 2019 22:20:50 -0000

Video Engine has a dedicated interrupt line so this driver doesn't
need to use IRQF_SHARED flag so remove it. Also, it'd be good for
following what Thomas recommended in the IRQF_ONESHOT support
patch like below:

"Note that for now IRQF_ONESHOT cannot be used with IRQF_SHARED to
avoid complex accounting mechanisms."

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 9da61beeef52..4475c6e6d0ae 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1616,8 +1616,7 @@ static int aspeed_video_init(struct aspeed_video *video)
 	}
 
 	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
-				       video);
+				       IRQF_ONESHOT, DEVICE_NAME, video);
 	if (rc < 0) {
 		dev_err(dev, "Unable to request IRQ %d\n", irq);
 		return rc;
-- 
2.21.0
