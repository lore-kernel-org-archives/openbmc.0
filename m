Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hFlOiNCT"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZRG45gwjzDqHj
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 13:09:13 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id g37so344248plb.5
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 19:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G35OM2SiKfGDrG+NV28/rHm1Q89L+78sxI0Ka+a7gHI=;
 b=hFlOiNCTcpeel0RForrvh+ZPv/2XbWJBUxHqVRyT6AvTNM2MFXpDh0YJdYiLfUBqyS
 XAbEopcH8AeDoTGnD0AsB4TTt4owF0N2BZW37h3pa0Ay3J1RXOSzvsMjBIDXSpiSXkAK
 sZEEVWn8b+kOzMb7/MCy3YQMfdcntFCV9frafmADJKxoxjqWgbt/AfC/7zH1+PN2igpf
 LsepxIogVc23Mz1u+BkDBGf2t6QJFs2oH7Uo6SPegNuKpngy+l5CyfnY9CSXhBdoFis/
 NrRMZRyMNUCdNmQ1XEmdcmr6ChmdMhOTGMaTtdvrtaUQAd2fx61YgkPMeM7K+nWY9QUC
 4PXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=G35OM2SiKfGDrG+NV28/rHm1Q89L+78sxI0Ka+a7gHI=;
 b=mJVjV9hq/mIYHAeUMKKHbXRh7TV1O9POvtC18Vor/+6wUmvQe8r9J3/0C6NSnw8dIv
 AmhAeBlx7vIOf3AoMwEfiRLURPwVZmFmQQ250y2MjClzjLpSFB7lBTbNGzKPhtW/BXQz
 vR2IRvYh8VBzpPXijgmFrwLaFMpQq4B+AeZnBbG/v089NJqOUn6SL9Ow7SuJpf+2m3Lo
 P/QhZcoSZ9sQyPQ3Zbm2Z68kGwjAyh+hEHfQtLskaSmFC3pit6t9dtIrv0UhzgcBsmUd
 fpF8hEPLsrrDCb7wyHzmGDvkJhqxymani0CeJAuQeqP4mi1b0CbR996OYJqDXv75FQXB
 9A0g==
X-Gm-Message-State: APjAAAUIG1JWDhTZf+SXvxzq54VrRKlSNXMLyshXC2xd3YhYs6QrcO+i
 2xJjm+15TcGANgr/FiJy/wQcpSY6zV8=
X-Google-Smtp-Source: APXvYqxCvJkN5LdTnrSKyL5Ex22UTLpycYLwKdhPl2NIlWMi/d+ofFjouWT29GbqWEy6u8ApKeBGKQ==
X-Received: by 2002:a17:902:f81:: with SMTP id 1mr3600385plz.216.1554343750676; 
 Wed, 03 Apr 2019 19:09:10 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id j1sm2671627pgp.91.2019.04.03.19.09.07
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Apr 2019 19:09:09 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
 Thu, 04 Apr 2019 12:39:05 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.0] drm/aspeed: Synchronise driver with upstream
Date: Thu,  4 Apr 2019 12:39:04 +1030
Message-Id: <20190404020904.24208-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 04 Apr 2019 02:09:17 -0000

The aspeed_gfx driver has landed upstream. This shifts the driver to the
upstream implementation.

The debugfs code was not submitted as it was never used, even during
development.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/aspeed/Kconfig              |  5 +-
 drivers/gpu/drm/aspeed/Makefile             |  1 -
 drivers/gpu/drm/aspeed/aspeed_gfx.h         |  3 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c    | 15 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c | 77 ---------------------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c     | 58 ++++++----------
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c     | 11 +--
 7 files changed, 31 insertions(+), 139 deletions(-)
 delete mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c

diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 6f1e64c0a6ce..42b74d18a41b 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -2,14 +2,13 @@ config DRM_ASPEED_GFX
 	tristate "ASPEED BMC Display Controller"
 	depends on DRM && OF
 	select DRM_KMS_HELPER
-	select DRM_KMS_FB_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_PANEL
 	select DMA_CMA
 	select CMA
 	select MFD_SYSCON
 	help
-	  Chose this option if you have an ASPEED AST2400/AST2500
-	  SOC Display Controller (aka GFX).
+	  Chose this option if you have an ASPEED AST2500 SOC Display
+	  Controller (aka GFX).
 
 	  If M is selected this module will be called aspeed_gfx.
diff --git a/drivers/gpu/drm/aspeed/Makefile b/drivers/gpu/drm/aspeed/Makefile
index b01dd5800672..6e194cd790d8 100644
--- a/drivers/gpu/drm/aspeed/Makefile
+++ b/drivers/gpu/drm/aspeed/Makefile
@@ -1,4 +1,3 @@
 aspeed_gfx-y := aspeed_gfx_drv.o aspeed_gfx_crtc.o aspeed_gfx_out.o
-aspeed_gfx-$(CONFIG_DEBUG_FS) += aspeed_gfx_debugfs.o
 
 obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed_gfx.o
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
index c46afb3398cb..b7a986e49177 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
 
-#include <drm/drmP.h>
+#include <drm/drm_device.h>
 #include <drm/drm_simple_kms_helper.h>
 
 struct aspeed_gfx {
@@ -17,7 +17,6 @@ struct aspeed_gfx {
 
 int aspeed_gfx_create_pipe(struct drm_device *drm);
 int aspeed_gfx_create_output(struct drm_device *drm);
-int aspeed_gfx_debugfs_init(struct drm_minor *minor);
 
 #define CRT_CTRL1		0x60 /* CRT Control I */
 #define CRT_CTRL2		0x64 /* CRT Control II */
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index e2d1d7497352..15db9e426ec4 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -8,10 +8,12 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "aspeed_gfx.h"
 
@@ -166,9 +168,6 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_pending_vblank_event *event;
 	struct drm_gem_cma_object *gem;
 
-	if (!crtc)
-		return;
-
 	spin_lock_irq(&crtc->dev->event_lock);
 	event = crtc->state->event;
 	if (event) {
@@ -190,12 +189,6 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	writel(gem->paddr, priv->base + CRT_ADDR);
 }
 
-static int aspeed_gfx_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
-				 struct drm_plane_state *plane_state)
-{
-	return drm_gem_fb_prepare_fb(&pipe->plane, plane_state);
-}
-
 static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
 {
 	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
@@ -226,7 +219,7 @@ static struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
 	.enable		= aspeed_gfx_pipe_enable,
 	.disable	= aspeed_gfx_pipe_disable,
 	.update		= aspeed_gfx_pipe_update,
-	.prepare_fb	= aspeed_gfx_pipe_prepare_fb,
+	.prepare_fb	= drm_gem_fb_simple_display_pipe_prepare_fb,
 	.enable_vblank	= aspeed_gfx_enable_vblank,
 	.disable_vblank	= aspeed_gfx_disable_vblank,
 };
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c b/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
deleted file mode 100644
index 19274f188070..000000000000
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
+++ /dev/null
@@ -1,77 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright © 2017 Broadcom
-// Copyright 2018 IBM Corp
-
-#include <linux/seq_file.h>
-#include <drm/drm_debugfs.h>
-
-#include "aspeed_gfx.h"
-
-#define REGDEF(reg) { reg, #reg }
-static const struct {
-	u32 reg;
-	const char *name;
-} aspeed_gfx_reg_defs[] = {
-	REGDEF(CRT_CTRL1),
-	REGDEF(CRT_CTRL2),
-	REGDEF(CRT_STATUS),
-	REGDEF(CRT_MISC),
-	REGDEF(CRT_HORIZ0),
-	REGDEF(CRT_HORIZ1),
-	REGDEF(CRT_VERT0),
-	REGDEF(CRT_VERT1),
-	REGDEF(CRT_ADDR),
-	REGDEF(CRT_OFFSET),
-	REGDEF(CRT_THROD),
-	REGDEF(CRT_XSCALE),
-	REGDEF(CRT_CURSOR0),
-	REGDEF(CRT_CURSOR1),
-	REGDEF(CRT_CURSOR2),
-	REGDEF(CRT_9C),
-	REGDEF(CRT_OSD_H),
-	REGDEF(CRT_OSD_V),
-	REGDEF(CRT_OSD_ADDR),
-	REGDEF(CRT_OSD_DISP),
-	REGDEF(CRT_OSD_THRESH),
-	REGDEF(CRT_B4),
-	REGDEF(CRT_STS_V),
-	REGDEF(CRT_SCRATCH),
-	REGDEF(CRT_BB0_ADDR),
-	REGDEF(CRT_BB1_ADDR),
-	REGDEF(CRT_BB_COUNT),
-	REGDEF(OSD_COLOR1),
-	REGDEF(OSD_COLOR2),
-	REGDEF(OSD_COLOR3),
-	REGDEF(OSD_COLOR4),
-	REGDEF(OSD_COLOR5),
-	REGDEF(OSD_COLOR6),
-	REGDEF(OSD_COLOR7),
-	REGDEF(OSD_COLOR8),
-};
-
-static int aspeed_gfx_debugfs_regs(struct seq_file *m, void *unused)
-{
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct aspeed_gfx *priv = dev->dev_private;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aspeed_gfx_reg_defs); i++) {
-		seq_printf(m, "%15s (0x%02x): 0x%08x\n",
-			   aspeed_gfx_reg_defs[i].name, aspeed_gfx_reg_defs[i].reg,
-			   readl(priv->base + aspeed_gfx_reg_defs[i].reg));
-	}
-
-	return 0;
-}
-
-static const struct drm_info_list aspeed_gfx_debugfs_list[] = {
-	{"regs", aspeed_gfx_debugfs_regs, 0},
-};
-
-int aspeed_gfx_debugfs_init(struct drm_minor *minor)
-{
-	return drm_debugfs_create_files(aspeed_gfx_debugfs_list,
-					ARRAY_SIZE(aspeed_gfx_debugfs_list),
-					minor->debugfs_root, minor);
-}
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 92b81e39c0be..713a3975852b 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -1,14 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
 
-#include <linux/module.h>
-#include <linux/irq.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_reserved_mem.h>
-#include <linux/reset.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
+#include <linux/reset.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
@@ -18,15 +20,18 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include "aspeed_gfx.h"
 
 /**
  * DOC: ASPEED GFX Driver
  *
- * This driver is for the ASPEED BMC SoC's GFX display hardware. This
- * driver runs on the ARM based BMC systems, unlike the ast driver which
- * runs on a host CPU and is is for a PCI graphics device.
+ * This driver is for the ASPEED BMC SoC's 'GFX' display hardware, also called
+ * the 'SOC Display Controller' in the datasheet. This driver runs on the ARM
+ * based BMC systems, unlike the ast driver which runs on a host CPU and is for
+ * a PCIe graphics device.
  *
  * The AST2500 supports a total of 3 output paths:
  *
@@ -46,6 +51,9 @@
  *
  * The driver only supports a simple configuration consisting of a 40MHz
  * pixel clock, fixed by hardware limitations, and the VGA output path.
+ *
+ * The driver was written with the 'AST2500 Software Programming Guide' v17,
+ * which is available under NDA from ASPEED.
  */
 
 static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
@@ -169,22 +177,13 @@ static int aspeed_gfx_load(struct drm_device *drm)
 
 	drm_mode_config_reset(drm);
 
-	ret = drm_fb_cma_fbdev_init(drm, 32, 0);
-	if (ret) {
-		dev_err(drm->dev, "Failed to init FB CMA area\n");
-		goto err_cma;
-	}
+	drm_fbdev_generic_setup(drm, 32);
 
 	return 0;
-
-err_cma:
-	drm_irq_uninstall(drm);
-	return ret;
 }
 
 static void aspeed_gfx_unload(struct drm_device *drm)
 {
-	drm_fb_cma_fbdev_fini(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
 
@@ -195,35 +194,22 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
 
 static struct drm_driver aspeed_gfx_driver = {
 	.driver_features        = DRIVER_GEM | DRIVER_MODESET |
-				DRIVER_PRIME | DRIVER_ATOMIC |
-				DRIVER_HAVE_IRQ,
-	.lastclose              = drm_fb_helper_lastclose,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops             = &drm_gem_cma_vm_ops,
-	.dumb_create            = drm_gem_cma_dumb_create,
-	.prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
-	.gem_prime_export       = drm_gem_prime_export,
-	.gem_prime_import       = drm_gem_prime_import,
-	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
+				DRIVER_PRIME | DRIVER_ATOMIC,
+	.gem_create_object	= drm_cma_gem_create_object_default_funcs,
+	.dumb_create		= drm_gem_cma_dumb_create,
+	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
-	.gem_prime_vmap         = drm_gem_cma_prime_vmap,
-	.gem_prime_vunmap       = drm_gem_cma_prime_vunmap,
-	.gem_prime_mmap         = drm_gem_cma_prime_mmap,
+	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.fops = &fops,
 	.name = "aspeed-gfx-drm",
 	.desc = "ASPEED GFX DRM",
 	.date = "20180319",
 	.major = 1,
 	.minor = 0,
-
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = aspeed_gfx_debugfs_init,
-#endif
 };
 
 static const struct of_device_id aspeed_gfx_match[] = {
-	{ .compatible = "aspeed,ast2400-gfx" },
 	{ .compatible = "aspeed,ast2500-gfx" },
 	{ }
 };
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
index aee30ff05467..2f3115106baa 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
@@ -1,9 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0+
 // Copyright 2018 IBM Corporation
 
-#include <drm/drmP.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_crtc_helper.h>
 
 #include "aspeed_gfx.h"
@@ -18,15 +17,9 @@ drm_connector_helper_funcs aspeed_gfx_connector_helper_funcs = {
 	.get_modes = aspeed_gfx_get_modes,
 };
 
-static void aspeed_gfx_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_funcs aspeed_gfx_connector_funcs = {
 	.fill_modes		= drm_helper_probe_single_connector_modes,
-	.destroy		= aspeed_gfx_connector_destroy,
+	.destroy		= drm_connector_cleanup,
 	.reset			= drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
-- 
2.20.1
