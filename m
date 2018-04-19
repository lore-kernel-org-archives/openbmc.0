Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::241; helo=mail-pl0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQHOEpfx"; 
 dkim-atps=neutral
Received: from mail-pl0-x241.google.com (mail-pl0-x241.google.com
 [IPv6:2607:f8b0:400e:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RQkr6sgZzF1RV
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 14:20:19 +1000 (AEST)
Received: by mail-pl0-x241.google.com with SMTP id 59-v6so2431603plc.13
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 21:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=0TbSbk5/EBCbq9gYYeoEe0mQgO5g6jkOBnUdnqK18kE=;
 b=AQHOEpfxTH1/yDQ3OF3fmfELtPbJtov32Cg2RHMh3mZWJjJhoEKeKIYW6vw/OYHm5G
 RzjPX6erXfQK9cqcDs32Vj+mSS79OlYmLmaGdj8TwSKl1rOWOoL5xibZkPhjc/ZtVPZP
 wXn8S8eAx3Ud7KpeS6y4EqRrFHnGw0dD0I7Dx0rih9lDd8zYmj/XeTm2ZffeJJOQcjxk
 xvnTfbQPPoh22+fCButp8R46eduL/ejWN9GS4RTNHYLFm31das+SVt0offly65NsqYTB
 SzYoGZ5AGgUXdFU07HTg98tNL0+1VJwTSiCP1urW4KrE/BuD5Fs/orXZM4IyJ5AUfyHC
 bhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=0TbSbk5/EBCbq9gYYeoEe0mQgO5g6jkOBnUdnqK18kE=;
 b=QnQwD31raef2py2JkJPaLwqdwctcuGBc5SSXhQH4C3uDWxnU3MeCIHQK6x9aBnDHXx
 ddXc5mUshKgctVOre2FQqPF8gGk1nvEYnIv8It7ob48iiznj/q7+tFsHq493QnFUFR1+
 m1Jiy7fQagt3zPiDq2DjL636wRIxfRn+Vs38HshD1chIin+d5iY1minIEzwFh0XuiK3z
 YMfIE+AyDHpIw0FgJwkk7be517JwB5MCclK/c8Ha3knurDpx4e4zj73oHmFx0kecDocR
 sgmHkm9DEbdpOaZVnzILvYNaByzdDQfuoRZGNFDmpgZQTSZcliRr81h2S6v9V+G3jl0y
 uW/Q==
X-Gm-Message-State: ALQs6tBqqnBdK6maQF/plwHDG+gBWuqMrbb7fz/PX1R0UbIDWqRn5M3/
 H9FJ0IcmHbT/xrTS5QVllLz7aPtR
X-Google-Smtp-Source: AIpwx4+nngBEo5NjIWaBOlNl7hCu2sXk+ZXZWnr/FEmVsDd5l3rSPb84VSUO4SVVClUq8rq4GbyS2g==
X-Received: by 2002:a17:902:14b:: with SMTP id
 69-v6mr4689393plb.184.1524111617598; 
 Wed, 18 Apr 2018 21:20:17 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id d23sm4344566pfn.22.2018.04.18.21.20.14
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Apr 2018 21:20:16 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 19 Apr 2018 13:50:12 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 0/5] drm: Add ASPEED GFX driver
Date: Thu, 19 Apr 2018 13:49:59 +0930
Message-Id: <20180419042004.25168-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.0
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
X-List-Received-Date: Thu, 19 Apr 2018 04:20:21 -0000

This series adds a DRM driver for the ASPEED AST2500 GFX ("Display
Controller") hardware present inside the BMC. This is distinct from the
PCIe VGA device that is exposed to the host. It uses it's own hardware,
and has it's own framebuffer in system RAM.

Joel Stanley (5):
  drm: Add ASPEED GFX driver
  drm: aspeed: Debugfs interface for GFX registers
  ARM: dts: aspeed-g5: Add resets and clocks to GFX node
  ARM: dts: ast2500-evb: Enable the GFX IP
  ARM: dts: witherspoon: Enable the GFX IP

 arch/arm/boot/dts/aspeed-ast2500-evb.dts      |  21 +-
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |   8 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   4 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/aspeed/Kconfig                |  15 +
 drivers/gpu/drm/aspeed/Makefile               |   4 +
 drivers/gpu/drm/aspeed/aspeed_gfx.h           | 105 +++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      | 247 ++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c   |  77 +++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       | 266 ++++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c       |  48 ++++
 12 files changed, 797 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/aspeed/Kconfig
 create mode 100644 drivers/gpu/drm/aspeed/Makefile
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx.h
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_debugfs.c
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
 create mode 100644 drivers/gpu/drm/aspeed/aspeed_gfx_out.c

-- 
2.17.0
