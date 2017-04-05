Return-Path: <raltherr@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz2073frkzDqKs
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 09:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WipjVIFr"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id x125so18160242pgb.0
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 16:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dHdjqS1jUYz2CvwapXPFlES6ROAeajy0uMWlPeaESNw=;
 b=WipjVIFrAKUFhGpImsGLu3EYHlfEff0hJhUg4oi7F5a1xD+jAHs5DfyuvbTK1+vfK6
 BLxxQOVee1Pwu/KdlEiQCg2hD0MhHxBifCdHv5y726otI7OdY4gMaJ/kVWgJBHgbBTMK
 MTZigmGekbVOyOH4TVr8JTnQd0F71790N2G66/mvCtC3yQw1nCIWKXC0Wjr83iSOtwaQ
 3SGrwMzKhPe7j5XOchvXKIXLDoXk0JEiVbY+/NXsy7uonOoXK86X5sLB3LzYKj3Iilx6
 lzRJ9LRoMtomQrKdow4pxucW+duFXexiFPXowtJY54WT8xcmMtob5JY8X7FVOHJOTPYn
 OKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dHdjqS1jUYz2CvwapXPFlES6ROAeajy0uMWlPeaESNw=;
 b=GVyq1YRakY3dNWLNfrBH6330HntZB/kbnhLozedofO8ln9qnxamfN/vpXY0Nu0w+m/
 Gd8YFDg3jLUrHQriHsr7gzUr8oU4ujYvZpX8tybnu4bvCw63AOlex/eIX2Fc7NrW88p3
 V1EPS8N5iNUTPFVWkXOvkJOId8be1Z4PhLB93k/F+Rui+SxM9sfjBL4MrCIQLAMUiw+T
 ne/ycDi7B2qIrYeRsETZDjdWNovqLMblsYAI0RrZcDeEV+6UdX5hjx7jtLCyfTawxyyD
 yx9neoYMJ28A0ceYu0ZPdZSErYENn7gCtYH6VF8FkIAmROh6yC8Vg/vnswdvnmRUfh/1
 ArQA==
X-Gm-Message-State: AFeK/H0Nle7OEpyjqYMeL6/Zqu49b8OGnuU/nh6jihieyv5gZ8SEHAOCD3THjppIzXVIT7HT
X-Received: by 10.99.114.89 with SMTP id c25mr33266264pgn.163.1491434469335;
 Wed, 05 Apr 2017 16:21:09 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id q86sm11249755pfk.43.2017.04.05.16.21.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Apr 2017 16:21:07 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: alex@digriz.org.uk
Cc: openbmc@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hw_random: timeriomem_rng: Improve performance for
 sub-jiffie update periods
Date: Wed,  5 Apr 2017 16:21:00 -0700
Message-Id: <20170405232100.2023-4-raltherr@google.com>
X-Mailer: git-send-email 2.12.2.715.g7642488e1d-goog
In-Reply-To: <20170405232100.2023-1-raltherr@google.com>
References: <20170405232100.2023-1-raltherr@google.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2017 23:21:11 -0000

Some hardware RNGs provide a single register for obtaining random data.
Instead of signaling when new data is available, the reader must wait a
fixed amount of time between reads for new data to be generated.
timeriomem_rng implements this scheme with the period specified in
platform data or device tree.  While the period is specified in
microseconds, the implementation used a standard timer which has a
minimum delay of 1 jiffie and caused a significant bottleneck for
devices that can update at 1us.  By switching to an hrtimer, 1us periods
now only delay at most 2us per read.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v2:
- Split performance improvements into separate patch

 drivers/char/hw_random/timeriomem-rng.c | 86 +++++++++++++++++----------------
 1 file changed, 45 insertions(+), 41 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index 024bdff7999f..a0faa5f05deb 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -21,23 +21,24 @@
  */
 
 #include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/hrtimer.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
-#include <linux/jiffies.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/time.h>
 #include <linux/timeriomem-rng.h>
-#include <linux/timer.h>
 
 struct timeriomem_rng_private {
 	void __iomem		*io_base;
-	unsigned int		expires;
-	unsigned int		period;
+	ktime_t			period;
 	unsigned int		present:1;
 
-	struct timer_list	timer;
+	struct hrtimer		timer;
 	struct completion	completion;
 
 	struct hwrng		rng_ops;
@@ -48,10 +49,13 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 {
 	struct timeriomem_rng_private *priv =
 		container_of(hwrng, struct timeriomem_rng_private, rng_ops);
-	unsigned long cur;
-	s32 delay;
+	int retval = 0;
+	int period_us = ktime_to_us(priv->period);
 
-	/* The RNG provides 32-bit per read.  Ensure there is enough space. */
+	/*
+	 * The RNG provides 32-bits per read.  Ensure there is enough space for
+	 * at minimum one read.
+	 */
 	if (max < sizeof(u32))
 		return 0;
 
@@ -66,33 +70,44 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 
 	wait_for_completion(&priv->completion);
 
-	*(u32 *)data = readl(priv->io_base);
+	do {
+		/*
+		 * After the first read, all additional reads will need to wait
+		 * for the RNG to generate new data.  Since the period can have
+		 * a wide range of values (1us to 1s have been observed), allow
+		 * for 1% tolerance in the sleep time rather than a fixed value.
+		 */
+		if (retval > 0)
+			usleep_range(period_us,
+					period_us + min(1, period_us / 100));
+
+		*(u32 *)data = readl(priv->io_base);
+		retval += sizeof(u32);
+		data += sizeof(u32);
+		max -= sizeof(u32);
+	} while (wait && max > sizeof(u32));
 
 	/*
 	 * Block any new callers until the RNG has had time to generate new
 	 * data.
 	 */
-	cur = jiffies;
-
-	delay = cur - priv->expires;
-	delay = priv->period - (delay % priv->period);
-
-	priv->expires = cur + delay;
 	priv->present = 0;
-
 	reinit_completion(&priv->completion);
-	mod_timer(&priv->timer, priv->expires);
+	hrtimer_forward_now(&priv->timer, priv->period);
+	hrtimer_restart(&priv->timer);
 
-	return 4;
+	return retval;
 }
 
-static void timeriomem_rng_trigger(unsigned long data)
+static enum hrtimer_restart timeriomem_rng_trigger(struct hrtimer *timer)
 {
 	struct timeriomem_rng_private *priv
-			= (struct timeriomem_rng_private *)data;
+		= container_of(timer, struct timeriomem_rng_private, timer);
 
 	priv->present = 1;
 	complete(&priv->completion);
+
+	return HRTIMER_NORESTART;
 }
 
 static int timeriomem_rng_probe(struct platform_device *pdev)
@@ -140,43 +155,33 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		period = pdata->period;
 	}
 
-	priv->period = usecs_to_jiffies(period);
-	if (priv->period < 1) {
-		dev_err(&pdev->dev, "period is less than one jiffy\n");
-		return -EINVAL;
-	}
-
-	priv->expires	= jiffies;
-	priv->present	= 1;
-
+	priv->period = ns_to_ktime(period * NSEC_PER_USEC);
 	init_completion(&priv->completion);
-	complete(&priv->completion);
-
-	setup_timer(&priv->timer, timeriomem_rng_trigger, (unsigned long)priv);
+	hrtimer_init(&priv->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
+	priv->timer.function = timeriomem_rng_trigger;
 
 	priv->rng_ops.name = dev_name(&pdev->dev);
 	priv->rng_ops.read = timeriomem_rng_read;
 
 	priv->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->io_base)) {
-		err = PTR_ERR(priv->io_base);
-		goto out_timer;
+		return PTR_ERR(priv->io_base);
 	}
 
+	/* Assume random data is already available. */
+	priv->present = 1;
+	complete(&priv->completion);
+
 	err = hwrng_register(&priv->rng_ops);
 	if (err) {
 		dev_err(&pdev->dev, "problem registering\n");
-		goto out_timer;
+		return err;
 	}
 
 	dev_info(&pdev->dev, "32bits from 0x%p @ %dus\n",
 			priv->io_base, period);
 
 	return 0;
-
-out_timer:
-	del_timer_sync(&priv->timer);
-	return err;
 }
 
 static int timeriomem_rng_remove(struct platform_device *pdev)
@@ -184,8 +189,7 @@ static int timeriomem_rng_remove(struct platform_device *pdev)
 	struct timeriomem_rng_private *priv = platform_get_drvdata(pdev);
 
 	hwrng_unregister(&priv->rng_ops);
-
-	del_timer_sync(&priv->timer);
+	hrtimer_cancel(&priv->timer);
 
 	return 0;
 }
-- 
2.12.2.715.g7642488e1d-goog
