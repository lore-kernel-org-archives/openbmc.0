Return-Path: <raltherr@google.com>
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vz2054KCvzDqKg
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 09:21:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EZuFVqZm"; 
 dkim-atps=neutral
Received: by mail-pg0-x233.google.com with SMTP id g2so17988976pge.3
 for <openbmc@lists.ozlabs.org>; Wed, 05 Apr 2017 16:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=E+fSbfnEq46wAD5r3KB7nAMtq1bTpSd7hEFmylDSZgA=;
 b=EZuFVqZmLmZk20jvKTyNH9a//LN4fVD9SGoqA78jjkWlPsLjFVEOP1ZYgqFkGl7CEA
 RABk6ye6hFMEa2Z7c3dqwYpaYsrSM4ps6izh6TKszGYgm0e+iFGLh6j69YUAPb7wVON3
 4g1FrmBj48S9lDUXzpKwu7e8K+L9xinKgL5gDJa0L/DPS4tn34PVLi+bese27YMCo2cM
 Ikm688UF8m6kbjEsIA2IdYO9h8n6iYhdn0b7mrsP8L1nUk4RX7jJkr1JNKmHBEGHZSod
 SzKHEN1W5H0enV+zoSRnceUletfmIUa+TCFf5hFSWtXq56+Hq0TDJBxRKn+1svRdjirS
 CdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=E+fSbfnEq46wAD5r3KB7nAMtq1bTpSd7hEFmylDSZgA=;
 b=a3wIufLXHe8pNMkW70otvBdbBgonsjyRrloh0BbhkRazEb86/mb1WFjQ0mv0a3qnwt
 ieBtcOLfenBRTgA2vgTGZfhULc3xZ7b1fwQ6HgFqZTkvKE2EFAujU0S2ZIcPiUbAFgUh
 PQUYEiB2gc2+UMweYMa3xoWbLwi8qVRibqAL/9Yk9ofnkQQcqIA8USygGbiGyFAP+v+U
 Su//HGH1OUEAI4k2kgcWj2sBUfGg2naHhRapbh18WX/qEWruaCR/P5Z0zAnBd5NbSbvd
 eKiFYKhYzkmX6nxxDzOf5wVB/JElXqmVZ78nF78O0CyVlSEWxS20sOcGDKe2iH2IrUys
 CT9A==
X-Gm-Message-State: AFeK/H1n4tcYYYTA5ZxS4y1yaIwRWVtog7j5lN04fIjW57uwlB8tsX9t6P6sHyRuk2WsxRw0
X-Received: by 10.98.48.66 with SMTP id w63mr18304579pfw.132.1491434467451;
 Wed, 05 Apr 2017 16:21:07 -0700 (PDT)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
 by smtp.gmail.com with ESMTPSA id q86sm11249755pfk.43.2017.04.05.16.21.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Apr 2017 16:21:06 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
To: alex@digriz.org.uk
Cc: openbmc@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Matt Mackall <mpm@selenic.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] hw_random: timeriomem_rng: Shorten verbose type and
 variable names
Date: Wed,  5 Apr 2017 16:20:59 -0700
Message-Id: <20170405232100.2023-3-raltherr@google.com>
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
X-List-Received-Date: Wed, 05 Apr 2017 23:21:10 -0000

No functional changes.

Signed-off-by: Rick Altherr <raltherr@google.com>
---

Changes in v2:
- Split type and variable renames into separate patch

 drivers/char/hw_random/timeriomem-rng.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index 17574452fd35..024bdff7999f 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -31,7 +31,7 @@
 #include <linux/timeriomem-rng.h>
 #include <linux/timer.h>
 
-struct timeriomem_rng_private_data {
+struct timeriomem_rng_private {
 	void __iomem		*io_base;
 	unsigned int		expires;
 	unsigned int		period;
@@ -40,15 +40,14 @@ struct timeriomem_rng_private_data {
 	struct timer_list	timer;
 	struct completion	completion;
 
-	struct hwrng		timeriomem_rng_ops;
+	struct hwrng		rng_ops;
 };
 
 static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 				size_t max, bool wait)
 {
-	struct timeriomem_rng_private_data *priv =
-		container_of(hwrng, struct timeriomem_rng_private_data,
-				timeriomem_rng_ops);
+	struct timeriomem_rng_private *priv =
+		container_of(hwrng, struct timeriomem_rng_private, rng_ops);
 	unsigned long cur;
 	s32 delay;
 
@@ -89,8 +88,8 @@ static int timeriomem_rng_read(struct hwrng *hwrng, void *data,
 
 static void timeriomem_rng_trigger(unsigned long data)
 {
-	struct timeriomem_rng_private_data *priv
-			= (struct timeriomem_rng_private_data *)data;
+	struct timeriomem_rng_private *priv
+			= (struct timeriomem_rng_private *)data;
 
 	priv->present = 1;
 	complete(&priv->completion);
@@ -99,7 +98,7 @@ static void timeriomem_rng_trigger(unsigned long data)
 static int timeriomem_rng_probe(struct platform_device *pdev)
 {
 	struct timeriomem_rng_data *pdata = pdev->dev.platform_data;
-	struct timeriomem_rng_private_data *priv;
+	struct timeriomem_rng_private *priv;
 	struct resource *res;
 	int err = 0;
 	int period;
@@ -121,7 +120,7 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 
 	/* Allocate memory for the device structure (and zero it) */
 	priv = devm_kzalloc(&pdev->dev,
-			sizeof(struct timeriomem_rng_private_data), GFP_KERNEL);
+			sizeof(struct timeriomem_rng_private), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -155,8 +154,8 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 
 	setup_timer(&priv->timer, timeriomem_rng_trigger, (unsigned long)priv);
 
-	priv->timeriomem_rng_ops.name		= dev_name(&pdev->dev);
-	priv->timeriomem_rng_ops.read		= timeriomem_rng_read;
+	priv->rng_ops.name = dev_name(&pdev->dev);
+	priv->rng_ops.read = timeriomem_rng_read;
 
 	priv->io_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(priv->io_base)) {
@@ -164,7 +163,7 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 		goto out_timer;
 	}
 
-	err = hwrng_register(&priv->timeriomem_rng_ops);
+	err = hwrng_register(&priv->rng_ops);
 	if (err) {
 		dev_err(&pdev->dev, "problem registering\n");
 		goto out_timer;
@@ -182,9 +181,9 @@ static int timeriomem_rng_probe(struct platform_device *pdev)
 
 static int timeriomem_rng_remove(struct platform_device *pdev)
 {
-	struct timeriomem_rng_private_data *priv = platform_get_drvdata(pdev);
+	struct timeriomem_rng_private *priv = platform_get_drvdata(pdev);
 
-	hwrng_unregister(&priv->timeriomem_rng_ops);
+	hwrng_unregister(&priv->rng_ops);
 
 	del_timer_sync(&priv->timer);
 
-- 
2.12.2.715.g7642488e1d-goog
