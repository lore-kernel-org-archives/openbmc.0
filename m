Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::244; helo=mail-pl0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="da8Ba0IF"; 
 dkim-atps=neutral
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQn82rJjzF222
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:22:20 +1000 (AEST)
Received: by mail-pl0-x244.google.com with SMTP id t22-v6so2442151plo.7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYd/9qfiJ32ilAyk61hLh3AqTjku8ATTuQcn31+Kmrs=;
 b=da8Ba0IFjGUJKN9DcbmzJAf6cQ19K4U9KVv9VdxEnMiX9coHMiIslRTqnoNdAG3bMO
 EjOvjBcfeHdCpYSNjLaMzmKIDMc0IkcPm4inxU4LW5ArLuE2ykf6G+UUPmdbjpwAh5Zl
 Zy9M7cuvBIOVUmetJz1MXpWjwSC0o9JNOYvFhN0Njgh5XufWOuVSNo9ZbCxdceB7ipRZ
 +eRCfXNujvIYBJGDgAzsUSAQOt4fp9iJn8d1XBWAOwKWbFduuRmh+Z1uMNkSCdsKK9In
 6EvptWvXyvwEs3kcYt1pKe2uMtErLybBfEFHzoF6DFsZpmbYcbbCw1sVNTELHiR/shWj
 Xv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sYd/9qfiJ32ilAyk61hLh3AqTjku8ATTuQcn31+Kmrs=;
 b=MbVTb3CJovmEP2qwhcsK+uvtVpa/ktAf9gXb3vLgXi7PZZT9wcKryo3JysP+6cZDZ5
 8xQP8t5xH2OeozAe8Q2GtQxIoWo2HYYdinn7wrWAc/ChAbKsClE+PFhHszNJQyq+0ctU
 wtNxLbnmyqoghgLe+/UzZF9yd3EF5ujg4KPLjqHqAXSJrQa+g+ptqvLuCBui32vDgQf9
 yaCV6Mr95HPtoIpcDmMxkZPyEibZUdHOX7HC5Tdg5TtjiQ44VBG7F9m4guHUp9TGhVTZ
 1WpKBsyDttHVOFz2cz+qTZqvNhN+MtdUYkHYOBf6a/MuswRBcAV38Q1BZ49e+dUbkK6r
 XMEg==
X-Gm-Message-State: ALQs6tD2G2eWmbqhHAFVgHfBzxJ68r19qfqZBwCoc+6UWFP7L4HAEfUT
 uPOrbq+my9r/yHNoP5lbcj8WgY/I
X-Google-Smtp-Source: AIpwx48P1NkeU6/fGBLaYXRhj7XJ0XnnYZ5nSpnd2CFf0lBzI3K4tl4FgY19ODaLcUZv1BIkXWMqxA==
X-Received: by 2002:a17:902:aa0b:: with SMTP id
 be11-v6mr4684854plb.179.1524111738122; 
 Wed, 18 Apr 2018 21:22:18 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id n4sm4487925pfn.2.2018.04.18.21.22.15
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:22:17 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:52:12 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 2/5] drm: aspeed: Debugfs interface for GFX
 registers
Date: Thu, 19 Apr 2018 13:50:01 +0930
Message-Id: <20180419042004.25168-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180419042004.25168-1-joel@jms.id.au>
References: <20180419042004.25168-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 04:22:20 -0000

This exposes the GFX registers in debugfs for debugging. The idea is
borrowed from the Broadcom driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/Makefile             |  1 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h         |  1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c | 77 +++++++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c     |  4 ++
 4 files changed, 83 insertions(+)
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c

diff --git a/drivers/gpu/drm/aspeed/Makefile b/drivers/gpu/drm/aspeed/Makefile
index 6e194cd790d8..b01dd5800672 100644
--- a/drivers/gpu/drm/aspeed/Makefile
+++ b/drivers/gpu/drm/aspeed/Makefile
@@ -1,3 +1,4 @@
 aspeed_gfx-y := aspeed_gfx_drv.o aspeed_gfx_crtc.o aspeed_gfx_out.o
+aspeed_gfx-$(CONFIG_DEBUG_FS) += aspeed_gfx_debugfs.o
 
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed_gfx.o
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index fb56e425bd48..c46afb3398cb 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -17,6 +17,7 @@ struct aspeed_gfx {
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
+int aspeed_gfx_debugfs_init(struct drm_minor *minor);
 
 #define CRT_CTRL1		0x60 /* CRT Control I */
 #define CRT_CTRL2		0x64 /* CRT Control II */
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c b/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
new file mode 100644
index 000000000000..ac47c27d8e74
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright © 2017 Broadcom
+// Copyright 2018 IBM Corp
+
+#include <linux/seq_file.h>
+#include <drm/drm_debugfs.h>
+
+#include "aspeed_gfx.h"
+
+#define REGDEF(reg) { reg, #reg }
+static const struct {
+	u32 reg;
+	const char *name;
+} aspeed_gfx_reg_defs[] = {
+	REGDEF(CRT_CTRL1),
+	REGDEF(CRT_CTRL2),
+	REGDEF(CRT_STATUS),
+	REGDEF(CRT_MISC),
+	REGDEF(CRT_HORIZ0),
+	REGDEF(CRT_HORIZ1),
+	REGDEF(CRT_VERT0),
+	REGDEF(CRT_VERT1),
+	REGDEF(CRT_ADDR),
+	REGDEF(CRT_OFFSET),
+	REGDEF(CRT_THROD),
+	REGDEF(CRT_XSCALE),
+	REGDEF(CRT_CURSOR0),
+	REGDEF(CRT_CURSOR1),
+	REGDEF(CRT_CURSOR2),
+	REGDEF(CRT_9C),
+	REGDEF(CRT_OSD_H),
+	REGDEF(CRT_OSD_V),
+	REGDEF(CRT_OSD_ADDR),
+	REGDEF(CRT_OSD_DISP),
+	REGDEF(CRT_OSD_THRESH),
+	REGDEF(CRT_B4),
+	REGDEF(CRT_STS_V),
+	REGDEF(CRT_SCRATCH),
+	REGDEF(CRT_BB0_ADDR),
+	REGDEF(CRT_BB1_ADDR),
+	REGDEF(CRT_BB_COUNT),
+	REGDEF(OSD_COLOR1),
+	REGDEF(OSD_COLOR2),
+	REGDEF(OSD_COLOR3),
+	REGDEF(OSD_COLOR4),
+	REGDEF(OSD_COLOR5),
+	REGDEF(OSD_COLOR6),
+	REGDEF(OSD_COLOR7),
+	REGDEF(OSD_COLOR8),
+};
+
+int aspeed_gfx_debugfs_regs(struct seq_file *m, void *unused)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct aspeed_gfx *priv = dev->dev_private;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(aspeed_gfx_reg_defs); i++) {
+		seq_printf(m, "%15s (0x%02x): 0x%08x\n",
+			   aspeed_gfx_reg_defs[i].name, aspeed_gfx_reg_defs[i].reg,
+			   readl(priv->base + aspeed_gfx_reg_defs[i].reg));
+	}
+
+	return 0;
+}
+
+static const struct drm_info_list aspeed_gfx_debugfs_list[] = {
+	{"regs", aspeed_gfx_debugfs_regs, 0},
+};
+
+int aspeed_gfx_debugfs_init(struct drm_minor *minor)
+{
+	return drm_debugfs_create_files(aspeed_gfx_debugfs_list,
+					ARRAY_SIZE(aspeed_gfx_debugfs_list),
+					minor->debugfs_root, minor);
+}
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index fa76ff313a73..e9377d43459d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -200,6 +200,10 @@ static struct drm_driver aspeed_gfx_driver = {
 	.date = "20180319",
 	.major = 1,
 	.minor = 0,
+
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = aspeed_gfx_debugfs_init,
+#endif
 };
 
 static const struct of_device_id aspeed_gfx_match[] = {
-- 
2.17.0
