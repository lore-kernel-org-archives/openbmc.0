Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="qdbCzuUa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="owCrOkpP"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZVhW6knwzDqJP
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 15:43:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8678D45AC;
 Thu,  4 Apr 2019 00:43:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 04 Apr 2019 00:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=S3nsg
 uiGMd/ChznA7ESqZcNoudUXcLRxvO3xlnvjjLo=; b=qdbCzuUaNRGyZq+sPyAij
 T7Va7E827UsZuFEYkLR/8hJ03kFUxYW35Fy49HD21rY+CvJ+h0tOAnZ+BhmfwG3t
 n8kFX1q9Sz0igXuzZGyGZHg6GFItrsiCuFktfMfUPY/esmB3yUxE+sQNrdxhv0K5
 VNPB1o1EFVzEOn6TRGKjWPS0rMyrxYXoruHJ1l2upiO37rhirj6eGe5Hxk19Undp
 d1DQmOfLRdB5fhkscoJK897Vw7jycKR3l1F0Tiu4x+8XN+ab7j0pChbZigWJZxjf
 bFwjpKYdczgRLbFoXxH4sMMQOcAQl5hSREfIcIrKOBk/G+u9a8VVfZudzaUDWSfo
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=S3nsguiGMd/ChznA7ESqZcNoudUXcLRxvO3xlnvjj
 Lo=; b=owCrOkpPxIKKio59xEDde7hI4w9ZZyMrit6Qc5LTuj9nlXSTzJZXQr5Mm
 9b7Ha3+dASdhdTdz2XCuyEqkhJvRN4+/vmwvhUMHaePD3orYjBEdTquk//p9SQj/
 GL9+hccVczIEmG/uALuRPqa1WabN8Vd48cxrEBuk1/j3IUFMI2NwhHOxw/l7GCwt
 k+N1GjECAjqhHZuBYTqWMLzwX67TeTBV6P/LE69nx/OYUyl7MGKmEBjsgjJrOJ0F
 a/zy5MmnFuwoBAk0p371+nmwBJw2ixH0Q2fSL33+8S1M8AuG5uX3jUxkT7mnHkE/
 xUreNvHbzcoxD0+nRlUdIYitcwccQ==
X-ME-Sender: <xms:houlXPWup46Kou63gQi1_6wVYftbTyO1R81qNa3Q_EDBEuvab0oPTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtdeggdekgeculddtuddrgedutddrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreer
 jeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:houlXL2RlsWH61qzDO4G4ghbyL-khdiWYZ2vur_AdlwOALXF_ncSgA>
 <xmx:houlXGbI8mlKakWA5hna7FG2WAfjbrrbifQmqudFn3VSveUvPFGFBA>
 <xmx:houlXOoAcn2GRUfpnYN3JfznNfHTlbkPe02BFRwbve8LYKmv0dR7_g>
 <xmx:h4ulXGjWVd-3b3zNJnKugPnvkik8kREqo5LkIj8oYci9232dRvNztg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 559C87C411; Thu,  4 Apr 2019 00:43:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <08443490-be8d-4d24-9b89-bffb72c967e7@www.fastmail.com>
In-Reply-To: <20190404020904.24208-1-joel@jms.id.au>
References: <20190404020904.24208-1-joel@jms.id.au>
Date: Thu, 04 Apr 2019 00:43:49 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.0]_drm/aspeed:_Synchronise_driver_with_?=
 =?UTF-8?Q?upstream?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 04 Apr 2019 04:43:59 -0000



On Thu, 4 Apr 2019, at 12:40, Joel Stanley wrote:
> The aspeed_gfx driver has landed upstream. This shifts the driver to t=
he
> upstream implementation.
>=20
> The debugfs code was not submitted as it was never used, even during
> development.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/gpu/drm/aspeed/Kconfig              |  5 +-
>  drivers/gpu/drm/aspeed/Makefile             |  1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx.h         |  3 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c    | 15 ++--
>  drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c | 77 --------------------=
-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c     | 58 ++++++----------
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c     | 11 +--
>  7 files changed, 31 insertions(+), 139 deletions(-)
>  delete mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
>=20
> diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/K=
config
> index 6f1e64c0a6ce..42b74d18a41b 100644
> --- a/drivers/gpu/drm/aspeed/Kconfig
> +++ b/drivers/gpu/drm/aspeed/Kconfig
> @@ -2,14 +2,13 @@ config DRM_ASPEED_GFX
>  	tristate "ASPEED BMC Display Controller"
>  	depends on DRM && OF
>  	select DRM_KMS_HELPER
> -	select DRM_KMS_FB_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_PANEL
>  	select DMA_CMA
>  	select CMA
>  	select MFD_SYSCON
>  	help
> -	  Chose this option if you have an ASPEED AST2400/AST2500
> -	  SOC Display Controller (aka GFX).
> +	  Chose this option if you have an ASPEED AST2500 SOC Display
> +	  Controller (aka GFX).
> =20
>  	  If M is selected this module will be called aspeed_gfx.
> diff --git a/drivers/gpu/drm/aspeed/Makefile b/drivers/gpu/drm/aspeed/=
Makefile
> index b01dd5800672..6e194cd790d8 100644
> --- a/drivers/gpu/drm/aspeed/Makefile
> +++ b/drivers/gpu/drm/aspeed/Makefile
> @@ -1,4 +1,3 @@
>  aspeed_gfx-y :=3D aspeed_gfx_drv.o aspeed_gfx_crtc.o aspeed_gfx_out.o=

> -aspeed_gfx-$(CONFIG_DEBUG_FS) +=3D aspeed_gfx_debugfs.o
> =20
>  obj-$(CONFIG_DRM_ASPEED_GFX) +=3D aspeed_gfx.o
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx.h=20
> b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> index c46afb3398cb..b7a986e49177 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx.h
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx.h
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> =20
> -#include <drm/drmP.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_simple_kms_helper.h>
> =20
>  struct aspeed_gfx {
> @@ -17,7 +17,6 @@ struct aspeed_gfx {
> =20
>  int aspeed_gfx_create_pipe(struct drm_device *drm);
>  int aspeed_gfx_create_output(struct drm_device *drm);
> -int aspeed_gfx_debugfs_init(struct drm_minor *minor);
> =20
>  #define CRT_CTRL1		0x60 /* CRT Control I */
>  #define CRT_CTRL2		0x64 /* CRT Control II */
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c=20
> b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index e2d1d7497352..15db9e426ec4 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -8,10 +8,12 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_panel.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>
> =20
>  #include "aspeed_gfx.h"
> =20
> @@ -166,9 +168,6 @@ static void aspeed_gfx_pipe_update(struct=20
> drm_simple_display_pipe *pipe,
>  	struct drm_pending_vblank_event *event;
>  	struct drm_gem_cma_object *gem;
> =20
> -	if (!crtc)
> -		return;
> -
>  	spin_lock_irq(&crtc->dev->event_lock);
>  	event =3D crtc->state->event;
>  	if (event) {
> @@ -190,12 +189,6 @@ static void aspeed_gfx_pipe_update(struct=20
> drm_simple_display_pipe *pipe,
>  	writel(gem->paddr, priv->base + CRT_ADDR);
>  }
> =20
> -static int aspeed_gfx_pipe_prepare_fb(struct drm_simple_display_pipe=20=

> *pipe,
> -				 struct drm_plane_state *plane_state)
> -{
> -	return drm_gem_fb_prepare_fb(&pipe->plane, plane_state);
> -}
> -
>  static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe=20=

> *pipe)
>  {
>  	struct aspeed_gfx *priv =3D drm_pipe_to_aspeed_gfx(pipe);
> @@ -226,7 +219,7 @@ static struct drm_simple_display_pipe_funcs=20
> aspeed_gfx_funcs =3D {
>  	.enable		=3D aspeed_gfx_pipe_enable,
>  	.disable	=3D aspeed_gfx_pipe_disable,
>  	.update		=3D aspeed_gfx_pipe_update,
> -	.prepare_fb	=3D aspeed_gfx_pipe_prepare_fb,
> +	.prepare_fb	=3D drm_gem_fb_simple_display_pipe_prepare_fb,
>  	.enable_vblank	=3D aspeed_gfx_enable_vblank,
>  	.disable_vblank	=3D aspeed_gfx_disable_vblank,
>  };
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c=20
> b/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
> deleted file mode 100644
> index 19274f188070..000000000000
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -// Copyright =C2=A9 2017 Broadcom
> -// Copyright 2018 IBM Corp
> -
> -#include <linux/seq_file.h>
> -#include <drm/drm_debugfs.h>
> -
> -#include "aspeed_gfx.h"
> -
> -#define REGDEF(reg) { reg, #reg }
> -static const struct {
> -	u32 reg;
> -	const char *name;
> -} aspeed_gfx_reg_defs[] =3D {
> -	REGDEF(CRT_CTRL1),
> -	REGDEF(CRT_CTRL2),
> -	REGDEF(CRT_STATUS),
> -	REGDEF(CRT_MISC),
> -	REGDEF(CRT_HORIZ0),
> -	REGDEF(CRT_HORIZ1),
> -	REGDEF(CRT_VERT0),
> -	REGDEF(CRT_VERT1),
> -	REGDEF(CRT_ADDR),
> -	REGDEF(CRT_OFFSET),
> -	REGDEF(CRT_THROD),
> -	REGDEF(CRT_XSCALE),
> -	REGDEF(CRT_CURSOR0),
> -	REGDEF(CRT_CURSOR1),
> -	REGDEF(CRT_CURSOR2),
> -	REGDEF(CRT_9C),
> -	REGDEF(CRT_OSD_H),
> -	REGDEF(CRT_OSD_V),
> -	REGDEF(CRT_OSD_ADDR),
> -	REGDEF(CRT_OSD_DISP),
> -	REGDEF(CRT_OSD_THRESH),
> -	REGDEF(CRT_B4),
> -	REGDEF(CRT_STS_V),
> -	REGDEF(CRT_SCRATCH),
> -	REGDEF(CRT_BB0_ADDR),
> -	REGDEF(CRT_BB1_ADDR),
> -	REGDEF(CRT_BB_COUNT),
> -	REGDEF(OSD_COLOR1),
> -	REGDEF(OSD_COLOR2),
> -	REGDEF(OSD_COLOR3),
> -	REGDEF(OSD_COLOR4),
> -	REGDEF(OSD_COLOR5),
> -	REGDEF(OSD_COLOR6),
> -	REGDEF(OSD_COLOR7),
> -	REGDEF(OSD_COLOR8),
> -};
> -
> -static int aspeed_gfx_debugfs_regs(struct seq_file *m, void *unused)
> -{
> -	struct drm_info_node *node =3D (struct drm_info_node *)m->private;
> -	struct drm_device *dev =3D node->minor->dev;
> -	struct aspeed_gfx *priv =3D dev->dev_private;
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(aspeed_gfx_reg_defs); i++) {
> -		seq_printf(m, "%15s (0x%02x): 0x%08x\n",
> -			   aspeed_gfx_reg_defs[i].name, aspeed_gfx_reg_defs[i].reg,
> -			   readl(priv->base + aspeed_gfx_reg_defs[i].reg));
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct drm_info_list aspeed_gfx_debugfs_list[] =3D {
> -	{"regs", aspeed_gfx_debugfs_regs, 0},
> -};
> -
> -int aspeed_gfx_debugfs_init(struct drm_minor *minor)
> -{
> -	return drm_debugfs_create_files(aspeed_gfx_debugfs_list,
> -					ARRAY_SIZE(aspeed_gfx_debugfs_list),
> -					minor->debugfs_root, minor);
> -}
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c=20
> b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 92b81e39c0be..713a3975852b 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -1,14 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> =20
> -#include <linux/module.h>
> -#include <linux/irq.h>
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
> -#include <linux/reset.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/mfd/syscon.h>
> +#include <linux/reset.h>
> =20
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc_helper.h>
> @@ -18,15 +20,18 @@
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_drv.h>
> =20
>  #include "aspeed_gfx.h"
> =20
>  /**
>   * DOC: ASPEED GFX Driver
>   *
> - * This driver is for the ASPEED BMC SoC's GFX display hardware. This=

> - * driver runs on the ARM based BMC systems, unlike the ast driver wh=
ich
> - * runs on a host CPU and is is for a PCI graphics device.
> + * This driver is for the ASPEED BMC SoC's 'GFX' display hardware, al=
so called
> + * the 'SOC Display Controller' in the datasheet. This driver runs on=
 the ARM
> + * based BMC systems, unlike the ast driver which runs on a host CPU =
and is for
> + * a PCIe graphics device.
>   *
>   * The AST2500 supports a total of 3 output paths:
>   *
> @@ -46,6 +51,9 @@
>   *
>   * The driver only supports a simple configuration consisting of a 40=
MHz
>   * pixel clock, fixed by hardware limitations, and the VGA output pat=
h.
> + *
> + * The driver was written with the 'AST2500 Software Programming Guid=
e' v17,
> + * which is available under NDA from ASPEED.
>   */
> =20
>  static const struct drm_mode_config_funcs aspeed_gfx_mode_config_func=
s =3D {
> @@ -169,22 +177,13 @@ static int aspeed_gfx_load(struct drm_device *dr=
m)
> =20
>  	drm_mode_config_reset(drm);
> =20
> -	ret =3D drm_fb_cma_fbdev_init(drm, 32, 0);
> -	if (ret) {
> -		dev_err(drm->dev, "Failed to init FB CMA area\n");
> -		goto err_cma;
> -	}
> +	drm_fbdev_generic_setup(drm, 32);
> =20
>  	return 0;
> -
> -err_cma:
> -	drm_irq_uninstall(drm);
> -	return ret;
>  }
> =20
>  static void aspeed_gfx_unload(struct drm_device *drm)
>  {
> -	drm_fb_cma_fbdev_fini(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_mode_config_cleanup(drm);
> =20
> @@ -195,35 +194,22 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
> =20
>  static struct drm_driver aspeed_gfx_driver =3D {
>  	.driver_features        =3D DRIVER_GEM | DRIVER_MODESET |
> -				DRIVER_PRIME | DRIVER_ATOMIC |
> -				DRIVER_HAVE_IRQ,
> -	.lastclose              =3D drm_fb_helper_lastclose,
> -	.gem_free_object_unlocked =3D drm_gem_cma_free_object,
> -	.gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> -	.dumb_create            =3D drm_gem_cma_dumb_create,
> -	.prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> -	.gem_prime_export       =3D drm_gem_prime_export,
> -	.gem_prime_import       =3D drm_gem_prime_import,
> -	.gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
> +				DRIVER_PRIME | DRIVER_ATOMIC,
> +	.gem_create_object	=3D drm_cma_gem_create_object_default_funcs,
> +	.dumb_create		=3D drm_gem_cma_dumb_create,
> +	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap         =3D drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap       =3D drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap         =3D drm_gem_cma_prime_mmap,
> +	.gem_prime_mmap		=3D drm_gem_prime_mmap,
>  	.fops =3D &fops,
>  	.name =3D "aspeed-gfx-drm",
>  	.desc =3D "ASPEED GFX DRM",
>  	.date =3D "20180319",
>  	.major =3D 1,
>  	.minor =3D 0,
> -
> -#if defined(CONFIG_DEBUG_FS)
> -	.debugfs_init =3D aspeed_gfx_debugfs_init,
> -#endif
>  };
> =20
>  static const struct of_device_id aspeed_gfx_match[] =3D {
> -	{ .compatible =3D "aspeed,ast2400-gfx" },
>  	{ .compatible =3D "aspeed,ast2500-gfx" },
>  	{ }
>  };
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c=20
> b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> index aee30ff05467..2f3115106baa 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> @@ -1,9 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  // Copyright 2018 IBM Corporation
> =20
> -#include <drm/drmP.h>
> -#include <drm/drm_connector.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
>  #include <drm/drm_crtc_helper.h>
> =20
>  #include "aspeed_gfx.h"
> @@ -18,15 +17,9 @@ drm_connector_helper_funcs=20
> aspeed_gfx_connector_helper_funcs =3D {
>  	.get_modes =3D aspeed_gfx_get_modes,
>  };
> =20
> -static void aspeed_gfx_connector_destroy(struct drm_connector *connec=
tor)
> -{
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -}
> -
>  static const struct drm_connector_funcs aspeed_gfx_connector_funcs =3D=
 {
>  	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> -	.destroy		=3D aspeed_gfx_connector_destroy,
> +	.destroy		=3D drm_connector_cleanup,
>  	.reset			=3D drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_st=
ate,
>  	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,=

> --=20
> 2.20.1
>=20
>
