Return-Path: <raltherr@google.com>
Received: from mail-pg0-x230.google.com (mail-pg0-x230.google.com
 [IPv6:2607:f8b0:400e:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz20373FVzDqK9
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 09:21:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GnPxvmXz"; 
 dkim-atps=neutral
Received: by mail-pg0-x230.google.com with SMTP id 81so18185192pgh.2
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 16:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+QQCEZOX5G/+vb0d9JbXR4U/aqeRo7GyKuIhpc8Z+qM=;
 b=GnPxvmXz+WRuydMAWJA3jom2S2LFNkGMUh9R2YcdjdZt8w/ZMvUYhSIEmUgtzBcSo1
 GNbAl1/4L9c7SzKrdafwrpM1ifenX4iO0Qx4f+I/Jq1jAOfevTiNYoL/7WEWikD8JiGw
 IX1bTV0e+GX8g+97+mGYds2B60vOpd5On4r0erOU9P9qIDlf8DDXbqqLgSeMB8mDtVR+
 ea2hkECczpGK1mMpTvljCcTereeLbOFchUCxFFOgtmsvcCdyMABcAmqPRrJopHtwS3Ei
 Ea8cQ/yKrMdjpCIxrjiG86f/MFcfUDtldhJZ0twNntaVEhpfyoQ7CvA43OhuKTR5rmof
 +fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+QQCEZOX5G/+vb0d9JbXR4U/aqeRo7GyKuIhpc8Z+qM=;
 b=aBgdhKmwhhJYcljy+ZydQ04MdueiwqOyZhoBWhD3qOwlvyCSlAsxrgmD6q2KmpXbOw
 dZhYB/IaSoaIFceXu5Of3oS0zv6/EMZKwvP1/Z9BDTTQsqT9o7wwbEZtHIctzbOmomVx
 GyIUOsxkSerOi0yPOaLBbkzIoRr4rEMOtzoUBBXykf68rmrt4NJzoLcsZoNeUz8CBGrJ
 e8eFsXQ3PL7LdYDPppUsinptgKw/8m/KGXVzHtjRL9DTsmCBQ2oBJiYHLxppMtfNtbos
 wV3I4zVE1x0HEDNqPwS7x9LOCwRDftJzQVH9YxutOlx6HcZSoKDfiTGNVOVFohyKrItC
 qNzA==
X-Gm-Message-State: AFeK/H1gqQ7vmGetZvqmyRCxIwREx+rXuN5ik2jOEq/M5uO/2YvzKdL9mm9TOG65TE1OfKpM
X-Received: by 10.99.167.74 with SMTP id w10mr33277820pgo.2.1491434465820;
 Wed, 05 Apr 2017 16:21:05 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id q86sm11249755pfk.43.2017.04.05.16.21.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Apr 2017 16:21:04 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: alex@digriz.org.uk
Cc: openbmc@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] hw_random: Migrate timeriomem_rng to new API
Date: Wed,  5 Apr 2017 16:20:58 -0700
Message-Id: <20170405232100.2023-2-raltherr@google.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 23:21:08 -0000

Preserves the existing behavior of only returning 32-bits per call.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v2:
- Split API migration into separate patch

 drivers/char/hw_random/timeriomem-rng.c | 60 ++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index cf37db263ecd..17574452fd35 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -20,18 +20,16 @@
  * TODO: add support for reading sizes other than 32bits and masking
  */
 
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
+#include <linux/completion.h>
 #include <linux/hw_random.h>
 #include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/timeriomem-rng.h>
-#include <linux/jiffies.h>
-#include <linux/sched.h>
 #include <linux/timer.h>
-#include <linux/completion.h>
 
 struct timeriomem_rng_private_data {
 	void __iomem		*io_base;
@@ -45,32 +43,36 @@ struct timeriomem_rng_private_data {
 	struct hwrng		timeriomem_rng_ops;
 };
 
-#define to_rng_priv(rng) \
-		((struct timeriomem_rng_private_data *)rng->priv)
-
-/*
- * have data return 1, however return 0 if we have nothing
- */
-static int timeriomem_rng_data_present(struct hwrng *rng, int wait)
+static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
+				size_t max, bool wait)
 {
-	struct timeriomem_rng_private_data *priv = to_rng_priv(rng);
+	struct timeriomem_rng_private_data *priv =
+		container_of(hwrng, struct timeriomem_rng_private_data,
+				timeriomem_rng_ops);
+	unsigned long cur;
+	s32 delay;
 
-	if (!wait || priv->present)
-		return priv->present;
+	/* The RNG provides 32-bit per read.  Ensure there is enough space. */
+	if (max < sizeof(u32))
+		return 0;
 
-	wait_for_completion(&priv->completion);
+	/*
+	 * There may not have been enough time for new data to be generated
+	 * since the last request.  If the caller doesn't want to wait, let them
+	 * bail out.  Otherwise, wait for the completion.  If the new data has
+	 * already been generated, the completion should already be available.
+	 */
+	if (!wait && !priv->present)
+		return 0;
 
-	return 1;
-}
-
-static int timeriomem_rng_data_read(struct hwrng *rng, u32 *data)
-{
-	struct timeriomem_rng_private_data *priv = to_rng_priv(rng);
-	unsigned long cur;
-	s32 delay;
+	wait_for_completion(&priv->completion);
 
-	*data = readl(priv->io_base);
+	*(u32 *)data = readl(priv->io_base);
 
+	/*
+	 * Block any new callers until the RNG has had time to generate new
+	 * data.
+	 */
 	cur = jiffies;
 
 	delay = cur - priv->expires;
@@ -154,9 +156,7 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 	setup_timer(&priv->timer, timeriomem_rng_trigger, (unsigned long)priv);
 
 	priv->timeriomem_rng_ops.name		= dev_name(&pdev->dev);
-	priv->timeriomem_rng_ops.data_present	= timeriomem_rng_data_present;
-	priv->timeriomem_rng_ops.data_read	= timeriomem_rng_data_read;
-	priv->timeriomem_rng_ops.priv		= (unsigned long)priv;
+	priv->timeriomem_rng_ops.read		= timeriomem_rng_read;
 
 	priv->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->io_base)) {
-- 
2.12.2.715.g7642488e1d-goog
