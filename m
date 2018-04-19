Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oufcAgHA"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQn30xnczDqyp
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:22:14 +1000 (AEST)
Received: by mail-pf0-x242.google.com with SMTP id z9so1988061pfe.6
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=C/ZLU7OJnvikO/7tSOYj1DKWkVin6SBgD3L2lxQ+ns4=;
 b=oufcAgHA0A2qRIKIcb4theUttk/ASAkoSVgLn9CiwMmq+7MgS17soxlyjEnmKRyRHs
 CZh9Z1CAtaDoiuOXiBeTU7g/cLTdu6ryMC//CM6EKFhcU7R8e+TlizYsDxV4QvcGIY4v
 CJdX4Ld/qpAoXnggnX1wMHIKxSCVex6PZ1GuGiA60G8Eprzyx0eGs5jmhWqtu+EVCA/B
 clEm9eNLB2bhBcAr+dPKmbKgt2qeeR2wn10gSg/rAt+1PlsXHUqdmxmBF2bVTiHAy16F
 3kSMz1GWCkrVWCeTZKKhKc/yVYxv2uRR4HotVXqi5fWIPQpxFtHIaB8BsBfTtlQDdTOn
 pjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=C/ZLU7OJnvikO/7tSOYj1DKWkVin6SBgD3L2lxQ+ns4=;
 b=oY77YD35MGL4QIilzKPxHC8lX16SHnxqM2CcqUs2rTk2OV02zPRHJaQNtxgr/zj/yo
 pr4iIOGdLovQhMZGMdDE/ejGB2/Kd0lIrUrI8TCOF5tYjveLo8aTiPtnxFQhCEOF4WCD
 TH8Ha1l9CKbHjzQJveCfZdKorMzI3SpZhFASx8fi9F4lVTSip9ON9OjuxTWxJNyLugg7
 Qkas0uVGzb5ADcVYq1kM8E/5nv/rMYKep2Sw+Aa1zw8j6nVuZDBd1CSJWJ73qKdiHWqh
 IsoeiM6ma8ikfI8tl2d7vpJTYkXHO5TqVhd3prRsQuOt9A50cPFW1oHHyU4o32Qetf63
 CHww==
X-Gm-Message-State: ALQs6tCWWxgo/X/Wryj47vx/x4DuRC3qNGlf/3+H3lCCBR/3wmcF7F6T
 e0Ojw0FwcfRELkpXiX33pvk4J7Fv
X-Google-Smtp-Source: AIpwx4+9qlZ6IzoX6ceb4a8jQ4UoeRpJrh0uJon/12pOMNkJhmoYK/3WfLOPd4bmILtSw7weJ26DUQ==
X-Received: by 10.98.14.198 with SMTP id 67mr116166pfo.36.1524111732460;
 Wed, 18 Apr 2018 21:22:12 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id l8sm4213131pff.126.2018.04.18.21.22.09
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:22:11 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:52:06 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 1/5] drm: Add ASPEED GFX driver
Date: Thu, 19 Apr 2018 13:50:00 +0930
Message-Id: <20180419042004.25168-2-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180419042004.25168-1-joel@jms.id.au>
References: <20180419042004.25168-1-joel@jms.id.au>
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
X-List-Received-Date: Thu, 19 Apr 2018 04:22:15 -0000

This driver is for the ASPEED BMC SoC's GFX display hardware. This
driver runs on the ARM based BMC systems, unlike the ast driver which
runs on a host CPU and is is for a PCI graphics device.

The AST2500 supports a total of 3 output paths:

  1. VGA output, the output target can choose either or both to the DAC
  or DVO interface.

  2. Graphics CRT output, the output target can choose either or both to
  the DAC or DVO interface.

  3. Video input from DVO, the video input can be used for video engine
  capture or DAC display output.

Output options are selected in SCU2C.

The "VGA mode" device is the PCI attached controller. The "Graphics CRT"
is the ARM's internal display controller.

The driver only supports a simple configuration consisting of a 40MHz
pixel clock, fixed by hardware limitations, and the VGA output path.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/gpu/drm/Kconfig                  |   2 +
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/aspeed/Kconfig           |  15 ++
 drivers/gpu/drm/aspeed/Makefile          |   3 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h      | 104 +++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 247 +++++++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 262 +++++++++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c  |  48 +++++
 8 files changed, 682 insertions(+)
 create mode 100644 drivers/gpu/drm/aspeed/Kconfig
 create mode 100644 drivers/gpu/drm/aspeed/Makefile
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx.h
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_out.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 83cb2a88c204..0a7032fac731 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -278,6 +278,8 @@ source "drivers/gpu/drm/tinydrm/Kconfig"
 
 source "drivers/gpu/drm/pl111/Kconfig"
 
+source "drivers/gpu/drm/aspeed/Kconfig"
+
 # Keep legacy drivers last
 
 menuconfig DRM_LEGACY
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a8acc197dec3..d192c000888d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -100,3 +100,4 @@ obj-$(CONFIG_DRM_ZTE)	+= zte/
 obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
 obj-$(CONFIG_DRM_TINYDRM) += tinydrm/
 obj-$(CONFIG_DRM_PL111) += pl111/
+obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
new file mode 100644
index 000000000000..6f1e64c0a6ce
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -0,0 +1,15 @@
+config DRM_ASPEED_GFX
+	tristate "ASPEED BMC Display Controller"
+	depends on DRM && OF
+	select DRM_KMS_HELPER
+	select DRM_KMS_FB_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_PANEL
+	select DMA_CMA
+	select CMA
+	select MFD_SYSCON
+	help
+	  Chose this option if you have an ASPEED AST2400/AST2500
+	  SOC Display Controller (aka GFX).
+
+	  If M is selected this module will be called aspeed_gfx.
diff --git a/drivers/gpu/drm/aspeed/Makefile b/drivers/gpu/drm/aspeed/Makefile
new file mode 100644
index 000000000000..6e194cd790d8
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/Makefile
@@ -0,0 +1,3 @@
+aspeed_gfx-y := aspeed_gfx_drv.o aspeed_gfx_crtc.o aspeed_gfx_out.o
+
+obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed_gfx.o
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h b/drivers/gpu/drm/aspeed/aspeed_gfx.h
new file mode 100644
index 000000000000..fb56e425bd48
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corporation
+
+#include <drm/drmP.h>
+#include <drm/drm_simple_kms_helper.h>
+
+struct aspeed_gfx {
+	void __iomem			*base;
+	struct clk			*clk;
+	struct reset_control		*rst;
+	struct regmap			*scu;
+
+	struct drm_simple_display_pipe	pipe;
+	struct drm_connector		connector;
+	struct drm_fbdev_cma		*fbdev;
+};
+
+int aspeed_gfx_create_pipe(struct drm_device *drm);
+int aspeed_gfx_create_output(struct drm_device *drm);
+
+#define CRT_CTRL1		0x60 /* CRT Control I */
+#define CRT_CTRL2		0x64 /* CRT Control II */
+#define CRT_STATUS		0x68 /* CRT Status */
+#define CRT_MISC		0x6c /* CRT Misc Setting */
+#define CRT_HORIZ0		0x70 /* CRT Horizontal Total & Display Enable End */
+#define CRT_HORIZ1		0x74 /* CRT Horizontal Retrace Start & End */
+#define CRT_VERT0		0x78 /* CRT Vertical Total & Display Enable End */
+#define CRT_VERT1		0x7C /* CRT Vertical Retrace Start & End */
+#define CRT_ADDR		0x80 /* CRT Display Starting Address */
+#define CRT_OFFSET		0x84 /* CRT Display Offset & Terminal Count */
+#define CRT_THROD		0x88 /* CRT Threshold */
+#define CRT_XSCALE		0x8C /* CRT Scaling-Up Factor */
+#define CRT_CURSOR0		0x90 /* CRT Hardware Cursor X & Y Offset */
+#define CRT_CURSOR1		0x94 /* CRT Hardware Cursor X & Y Position */
+#define CRT_CURSOR2		0x98 /* CRT Hardware Cursor Pattern Address */
+#define CRT_9C			0x9C
+#define CRT_OSD_H		0xA0 /* CRT OSD Horizontal Start/End */
+#define CRT_OSD_V		0xA4 /* CRT OSD Vertical Start/End */
+#define CRT_OSD_ADDR		0xA8 /* CRT OSD Pattern Address */
+#define CRT_OSD_DISP		0xAC /* CRT OSD Offset */
+#define CRT_OSD_THRESH		0xB0 /* CRT OSD Threshold & Alpha */
+#define CRT_B4			0xB4
+#define CRT_STS_V		0xB8 /* CRT Status V */
+#define CRT_SCRATCH		0xBC /* Scratchpad */
+#define CRT_BB0_ADDR		0xD0 /* CRT Display BB0 Starting Address */
+#define CRT_BB1_ADDR		0xD4 /* CRT Display BB1 Starting Address */
+#define CRT_BB_COUNT		0xD8 /* CRT Display BB Terminal Count */
+#define OSD_COLOR1		0xE0 /* OSD Color Palette Index 1 & 0 */
+#define OSD_COLOR2		0xE4 /* OSD Color Palette Index 3 & 2 */
+#define OSD_COLOR3		0xE8 /* OSD Color Palette Index 5 & 4 */
+#define OSD_COLOR4		0xEC /* OSD Color Palette Index 7 & 6 */
+#define OSD_COLOR5		0xF0 /* OSD Color Palette Index 9 & 8 */
+#define OSD_COLOR6		0xF4 /* OSD Color Palette Index 11 & 10 */
+#define OSD_COLOR7		0xF8 /* OSD Color Palette Index 13 & 12 */
+#define OSD_COLOR8		0xFC /* OSD Color Palette Index 15 & 14 */
+
+/* CTRL1 */
+#define CRT_CTRL_EN			BIT(0)
+#define CRT_CTRL_HW_CURSOR_EN		BIT(1)
+#define CRT_CTRL_OSD_EN			BIT(2)
+#define CRT_CTRL_INTERLACED		BIT(3)
+#define CRT_CTRL_COLOR_RGB565		(0 << 7)
+#define CRT_CTRL_COLOR_YUV444		(1 << 7)
+#define CRT_CTRL_COLOR_XRGB8888		(2 << 7)
+#define CRT_CTRL_COLOR_RGB888		(3 << 7)
+#define CRT_CTRL_COLOR_YUV444_2RGB	(5 << 7)
+#define CRT_CTRL_COLOR_YUV422		(7 << 7)
+#define CRT_CTRL_COLOR_MASK		GENMASK(9, 7)
+#define CRT_CTRL_HSYNC_NEGATIVE		BIT(16)
+#define CRT_CTRL_VSYNC_NEGATIVE		BIT(17)
+#define CRT_CTRL_VERTICAL_INTR_EN	BIT(30)
+#define CRT_CTRL_VERTICAL_INTR_STS	BIT(31)
+
+/* CTRL2 */
+#define CRT_CTRL_DAC_EN			BIT(0)
+#define CRT_CTRL_VBLANK_LINE(x)		(((x) << 20) & CRT_CTRL_VBLANK_LINE_MASK)
+#define CRT_CTRL_VBLANK_LINE_MASK	GENMASK(20, 31)
+
+/* CRT_HORIZ0 */
+#define CRT_H_TOTAL(x)			(x)
+#define CRT_H_DE(x)			((x) << 16)
+
+/* CRT_HORIZ1 */
+#define CRT_H_RS_START(x)		(x)
+#define CRT_H_RS_END(x)			((x) << 16)
+
+/* CRT_VIRT0 */
+#define CRT_V_TOTAL(x)			(x)
+#define CRT_V_DE(x)			((x) << 16)
+
+/* CRT_VIRT1 */
+#define CRT_V_RS_START(x)		(x)
+#define CRT_V_RS_END(x)			((x) << 16)
+
+/* CRT_OFFSET */
+#define CRT_DISP_OFFSET(x)		(x)
+#define CRT_TERM_COUNT(x)		((x) << 16)
+
+/* CRT_THROD */
+#define CRT_THROD_LOW(x)		(x)
+#define CRT_THROD_HIGH(x)		((x) << 8)
+
+/* Default Threshold Seting */
+#define G5_CRT_THROD_VAL	(CRT_THROD_LOW(0x24) | CRT_THROD_HIGH(0x3C))
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
new file mode 100644
index 000000000000..088f40a66628
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corporation
+
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panel.h>
+
+#include "aspeed_gfx.h"
+
+static struct aspeed_gfx *
+drm_pipe_to_aspeed_gfx(struct drm_simple_display_pipe *pipe)
+{
+	return container_of(pipe, struct aspeed_gfx, pipe);
+}
+
+static int aspeed_gfx_set_pixel_fmt(struct aspeed_gfx *priv, u32 *bpp)
+{
+	struct drm_crtc *crtc = &priv->pipe.crtc;
+	struct drm_device *drm = crtc->dev;
+	const u32 format = crtc->primary->state->fb->format->format;
+	u32 ctrl1;
+
+	ctrl1 = readl(priv->base + CRT_CTRL1);
+	ctrl1 &= ~CRT_CTRL_COLOR_MASK;
+
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		dev_dbg(drm->dev, "Setting up RGB565 mode\n");
+		ctrl1 |= CRT_CTRL_COLOR_RGB565;
+		*bpp = 16;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		dev_dbg(drm->dev, "Setting up XRGB8888 mode\n");
+		ctrl1 |= CRT_CTRL_COLOR_XRGB8888;
+		*bpp = 32;
+		break;
+	default:
+		dev_err(drm->dev, "Unhandled pixel format %08x\n", format);
+		return -EINVAL;
+	}
+
+	writel(ctrl1, priv->base + CRT_CTRL1);
+
+	return 0;
+}
+
+static void aspeed_gfx_enable_controller(struct aspeed_gfx *priv)
+{
+	u32 ctrl1 = readl(priv->base + CRT_CTRL1);
+	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
+
+	/* SCU2C: set DAC source for display output to Graphics CRT (GFX) */
+	regmap_update_bits(priv->scu, 0x2c, BIT(16), BIT(16));
+
+	writel(ctrl1 | CRT_CTRL_EN, priv->base + CRT_CTRL1);
+	writel(ctrl2 | CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
+
+	ctrl1 = readl(priv->base + CRT_CTRL1);
+	ctrl2 = readl(priv->base + CRT_CTRL2);
+}
+
+static void aspeed_gfx_disable_controller(struct aspeed_gfx *priv)
+{
+	u32 ctrl1 = readl(priv->base + CRT_CTRL1);
+	u32 ctrl2 = readl(priv->base + CRT_CTRL2);
+
+	writel(ctrl1 & ~CRT_CTRL_EN, priv->base + CRT_CTRL1);
+	writel(ctrl2 & ~CRT_CTRL_DAC_EN, priv->base + CRT_CTRL2);
+}
+
+static void aspeed_gfx_crtc_mode_set_nofb(struct aspeed_gfx *priv)
+{
+	struct drm_display_mode *m = &priv->pipe.crtc.state->adjusted_mode;
+	u32 ctrl1, d_offset, t_count, bpp;
+	int err;
+
+	err = aspeed_gfx_set_pixel_fmt(priv, &bpp);
+	if (err)
+		return;
+
+#if 0
+	/* TODO */
+	clk_set_rate(priv->pixel_clk, m->crtc_clock * 1000);
+#endif
+
+	ctrl1 = readl(priv->base + CRT_CTRL1);
+	ctrl1 &= ~(CRT_CTRL_INTERLACED |
+			CRT_CTRL_HSYNC_NEGATIVE |
+			CRT_CTRL_VSYNC_NEGATIVE);
+
+	if (m->flags & DRM_MODE_FLAG_INTERLACE)
+		ctrl1 |= CRT_CTRL_INTERLACED;
+
+	if (!(m->flags & DRM_MODE_FLAG_PHSYNC))
+		ctrl1 |= CRT_CTRL_HSYNC_NEGATIVE;
+
+	if (!(m->flags & DRM_MODE_FLAG_PVSYNC))
+		ctrl1 |= CRT_CTRL_VSYNC_NEGATIVE;
+
+	writel(ctrl1, priv->base + CRT_CTRL1);
+
+	/* Horizontal timing */
+	writel(CRT_H_TOTAL(m->htotal - 1) | CRT_H_DE(m->hdisplay - 1),
+			priv->base + CRT_HORIZ0);
+	writel(CRT_H_RS_START(m->hsync_start - 1) | CRT_H_RS_END(m->hsync_end),
+			priv->base + CRT_HORIZ1);
+
+
+	/* Vertical timing */
+	writel(CRT_V_TOTAL(m->vtotal - 1) | CRT_V_DE(m->vdisplay - 1),
+			priv->base + CRT_VERT0);
+	writel(CRT_V_RS_START(m->vsync_start) | CRT_V_RS_END(m->vsync_end),
+			priv->base + CRT_VERT1);
+
+	/*
+	 * Display Offset: address difference between consecutive scan lines
+	 * Terminal Count: memory size of one scan line
+	 */
+	d_offset = m->hdisplay * bpp / 8;
+	t_count = (m->hdisplay * bpp + 127) / 128;
+	writel(CRT_DISP_OFFSET(d_offset) | CRT_TERM_COUNT(t_count),
+			priv->base + CRT_OFFSET);
+
+	/*
+	 * Threshold: FIFO thresholds of refill and stop (16 byte chunks
+	 * per line, rounded up)
+	 */
+	writel(G5_CRT_THROD_VAL, priv->base + CRT_THROD);
+}
+
+static void aspeed_gfx_pipe_enable(struct drm_simple_display_pipe *pipe,
+			      struct drm_crtc_state *crtc_state)
+{
+	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+
+	aspeed_gfx_crtc_mode_set_nofb(priv);
+	aspeed_gfx_enable_controller(priv);
+}
+
+static void aspeed_gfx_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+
+	aspeed_gfx_disable_controller(priv);
+}
+
+static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
+				   struct drm_plane_state *plane_state)
+{
+	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	struct drm_crtc *crtc = &pipe->crtc;
+	struct drm_framebuffer *fb = pipe->plane.state->fb;
+	struct drm_pending_vblank_event *event;
+	struct drm_gem_cma_object *gem;
+
+	if (!crtc)
+		return;
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	event = crtc->state->event;
+	if (event) {
+		crtc->state->event = NULL;
+
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+
+	if (!fb)
+		return;
+
+	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	if (!gem)
+		return;
+	writel(gem->paddr, priv->base + CRT_ADDR);
+}
+
+static int aspeed_gfx_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
+				 struct drm_plane_state *plane_state)
+{
+	return drm_gem_fb_prepare_fb(&pipe->plane, plane_state);
+}
+
+static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
+{
+	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	u32 reg = readl(priv->base + CRT_CTRL1);
+
+	/* Clear pending VBLANK IRQ */
+	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
+
+	reg |= CRT_CTRL_VERTICAL_INTR_EN;
+	writel(reg, priv->base + CRT_CTRL1);
+
+	reg = readl(priv->base + CRT_CTRL1);
+
+	return 0;
+}
+
+static void aspeed_gfx_disable_vblank(struct drm_simple_display_pipe *pipe)
+{
+	struct aspeed_gfx *priv = drm_pipe_to_aspeed_gfx(pipe);
+	u32 reg = readl(priv->base + CRT_CTRL1);
+
+	reg &= ~CRT_CTRL_VERTICAL_INTR_EN;
+	writel(reg, priv->base + CRT_CTRL1);
+
+	/* Clear pending VBLANK IRQ */
+	writel(reg | CRT_CTRL_VERTICAL_INTR_STS, priv->base + CRT_CTRL1);
+
+	reg = readl(priv->base + CRT_CTRL1);
+}
+
+static struct drm_simple_display_pipe_funcs aspeed_gfx_funcs = {
+	.enable		= aspeed_gfx_pipe_enable,
+	.disable	= aspeed_gfx_pipe_disable,
+	.update		= aspeed_gfx_pipe_update,
+	.prepare_fb	= aspeed_gfx_pipe_prepare_fb,
+	.enable_vblank	= aspeed_gfx_enable_vblank,
+	.disable_vblank	= aspeed_gfx_disable_vblank,
+};
+
+static const uint32_t aspeed_gfx_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGB565,
+};
+
+int aspeed_gfx_create_pipe(struct drm_device *drm)
+{
+	struct aspeed_gfx *priv = drm->dev_private;
+
+	return drm_simple_display_pipe_init(drm, &priv->pipe, &aspeed_gfx_funcs,
+					    aspeed_gfx_formats,
+					    ARRAY_SIZE(aspeed_gfx_formats),
+					    NULL,
+					    &priv->connector);
+}
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
new file mode 100644
index 000000000000..fa76ff313a73
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corporation
+
+#include <linux/module.h>
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/reset.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_atomic_helper.h>
+
+#include "aspeed_gfx.h"
+
+static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+};
+
+static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
+{
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width = 0;
+	drm->mode_config.min_height = 0;
+	drm->mode_config.max_width = 800;
+	drm->mode_config.max_height = 600;
+	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
+}
+
+static int aspeed_gfx_load(struct drm_device *drm)
+{
+	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct aspeed_gfx *priv;
+	struct resource *res;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	drm->dev_private = priv;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap_resource(drm->dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->scu = syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");
+	if (IS_ERR(priv->scu)) {
+		dev_err(&pdev->dev, "failed to find SCU regmap\n");
+		return PTR_ERR(priv->scu);
+	}
+
+	ret = of_reserved_mem_device_init(drm->dev);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"failed to initialize reserved mem: %d\n", ret);
+		return ret;
+	}
+
+	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(priv->rst)) {
+		dev_err(&pdev->dev,
+			"missing or invalid reset controller device tree entry");
+		return PTR_ERR(priv->rst);
+	}
+	reset_control_deassert(priv->rst);
+
+	priv->clk = devm_clk_get(drm->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(&pdev->dev,
+			"missing or invalid clk device tree entry");
+		return PTR_ERR(priv->clk);
+	}
+	clk_prepare_enable(priv->clk);
+
+	/* Sanitize control registers */
+	writel(0, priv->base + CRT_CTRL1);
+	writel(0, priv->base + CRT_CTRL2);
+
+	aspeed_gfx_setup_mode_config(drm);
+
+	ret = drm_vblank_init(drm, 1);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to initialise vblank\n");
+		return ret;
+	}
+
+	ret = aspeed_gfx_create_output(drm);
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to create outputs\n");
+		return ret;
+	}
+
+	ret = aspeed_gfx_create_pipe(drm);
+	if (ret < 0) {
+		dev_err(drm->dev, "Cannot setup simple display pipe\n");
+		return ret;
+	}
+
+	ret = drm_irq_install(drm, platform_get_irq(pdev, 0));
+	if (ret < 0) {
+		dev_err(drm->dev, "Failed to install IRQ handler\n");
+		return ret;
+	}
+
+	drm_mode_config_reset(drm);
+
+	priv->fbdev = drm_fbdev_cma_init(drm, 32, 1);
+	if (IS_ERR(priv->fbdev)) {
+		ret = PTR_ERR(priv->fbdev);
+		dev_err(drm->dev, "Failed to init FB CMA area\n");
+		goto err_cma;
+	}
+
+	return 0;
+
+err_cma:
+	drm_irq_uninstall(drm);
+	return ret;
+}
+
+static void aspeed_gfx_unload(struct drm_device *drm)
+{
+	struct aspeed_gfx *priv = drm->dev_private;
+
+	if (priv->fbdev)
+		drm_fbdev_cma_fini(priv->fbdev);
+
+	drm_kms_helper_poll_fini(drm);
+	drm_mode_config_cleanup(drm);
+
+	drm_irq_uninstall(drm);
+
+	drm->dev_private = NULL;
+}
+
+static void aspeed_gfx_lastclose(struct drm_device *drm)
+{
+	struct aspeed_gfx *priv = drm->dev_private;
+
+	drm_fbdev_cma_restore_mode(priv->fbdev);
+}
+
+static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
+{
+	struct drm_device *drm = data;
+	struct aspeed_gfx *priv = drm->dev_private;
+	u32 reg;
+
+	reg = readl(priv->base + CRT_CTRL1);
+
+	if (reg & CRT_CTRL_VERTICAL_INTR_STS) {
+		drm_crtc_handle_vblank(&priv->pipe.crtc);
+		writel(reg, priv->base + CRT_CTRL1);
+		return IRQ_HANDLED;
+	};
+
+	return IRQ_NONE;
+}
+
+DEFINE_DRM_GEM_CMA_FOPS(fops);
+
+static struct drm_driver aspeed_gfx_driver = {
+	.driver_features        = DRIVER_GEM | DRIVER_MODESET |
+				DRIVER_PRIME | DRIVER_ATOMIC |
+				DRIVER_HAVE_IRQ,
+	.lastclose              = aspeed_gfx_lastclose,
+	.irq_handler            = aspeed_gfx_irq_handler,
+	.gem_free_object_unlocked = drm_gem_cma_free_object,
+	.gem_vm_ops             = &drm_gem_cma_vm_ops,
+	.dumb_create            = drm_gem_cma_dumb_create,
+	.prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
+	.gem_prime_export       = drm_gem_prime_export,
+	.gem_prime_import       = drm_gem_prime_import,
+	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
+	.gem_prime_vmap         = drm_gem_cma_prime_vmap,
+	.gem_prime_vunmap       = drm_gem_cma_prime_vunmap,
+	.gem_prime_mmap         = drm_gem_cma_prime_mmap,
+	.fops = &fops,
+	.name = "aspeed-gfx-drm",
+	.desc = "ASPEED GFX DRM",
+	.date = "20180319",
+	.major = 1,
+	.minor = 0,
+};
+
+static const struct of_device_id aspeed_gfx_match[] = {
+	{ .compatible = "aspeed,ast2400-gfx" },
+	{ .compatible = "aspeed,ast2500-gfx" },
+	{ }
+};
+
+static int aspeed_gfx_probe(struct platform_device *pdev)
+{
+	struct drm_device *drm;
+	int ret;
+
+	drm = drm_dev_alloc(&aspeed_gfx_driver, &pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	ret = aspeed_gfx_load(drm);
+	if (ret)
+		goto err_free;
+
+	ret = drm_dev_register(drm, 0);
+	if (ret)
+		goto err_unload;
+
+	return 0;
+
+err_unload:
+	aspeed_gfx_unload(drm);
+err_free:
+	drm_dev_put(drm);
+
+	return ret;
+}
+
+static int aspeed_gfx_remove(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	drm_dev_unregister(drm);
+	aspeed_gfx_unload(drm);
+	drm_dev_put(drm);
+
+	return 0;
+}
+
+static struct platform_driver aspeed_gfx_platform_driver = {
+	.probe		= aspeed_gfx_probe,
+	.remove		= aspeed_gfx_remove,
+	.driver = {
+		.name = "aspeed_gfx",
+		.of_match_table = aspeed_gfx_match,
+	},
+};
+
+module_platform_driver(aspeed_gfx_platform_driver);
+
+MODULE_AUTHOR("Joel Stanley <joel@jms.id.au>");
+MODULE_DESCRIPTION("ASPEED BMC DRM/KMS driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
new file mode 100644
index 000000000000..aee30ff05467
--- /dev/null
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2018 IBM Corporation
+
+#include <drm/drmP.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "aspeed_gfx.h"
+
+static int aspeed_gfx_get_modes(struct drm_connector *connector)
+{
+	return drm_add_modes_noedid(connector, 800, 600);
+}
+
+static const struct
+drm_connector_helper_funcs aspeed_gfx_connector_helper_funcs = {
+	.get_modes = aspeed_gfx_get_modes,
+};
+
+static void aspeed_gfx_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+static const struct drm_connector_funcs aspeed_gfx_connector_funcs = {
+	.fill_modes		= drm_helper_probe_single_connector_modes,
+	.destroy		= aspeed_gfx_connector_destroy,
+	.reset			= drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
+};
+
+int aspeed_gfx_create_output(struct drm_device *drm)
+{
+	struct aspeed_gfx *priv = drm->dev_private;
+	int ret;
+
+	priv->connector.dpms = DRM_MODE_DPMS_OFF;
+	priv->connector.polled = 0;
+	drm_connector_helper_add(&priv->connector,
+				 &aspeed_gfx_connector_helper_funcs);
+	ret = drm_connector_init(drm, &priv->connector,
+				 &aspeed_gfx_connector_funcs,
+				 DRM_MODE_CONNECTOR_Unknown);
+	return ret;
+}
-- 
2.17.0
