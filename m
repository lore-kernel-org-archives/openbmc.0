Return-Path: <kunyi@google.com>
Received: from mail-pf0-x22b.google.com (mail-pf0-x22b.google.com
 [IPv6:2607:f8b0:400e:c00::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8slm0cpyzDvW6
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 04:44:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=OSNPQetX; 
 dkim-atps=neutral
Received: by mail-pf0-x22b.google.com with SMTP id i88so35042815pfk.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id;
 bh=MEhoAjDVA/rzGgxdDFyedxcJ4y+qeKsXDtHWNN0enkc=;
 b=OSNPQetXwEhZ6F83+pZExzM43YzxurJhe3U9vrGPMYul+rLfA1W++6TiTW/or5ZF+b
 js441Y0OKI/4DaFxCy0pOYL3dG2y4lQ4B8KhI2sq5p/Nf8EAXp8TWrywdF8CxP6xIVfD
 R2rbcqMSoQ3a+bb1e+lMZAxuHondH0r8DTij4e5PrKcLMaZ2MMye07vots6K0YyCvFu8
 2PvMX8hqox0/KA/SEsHbCWSyJNy1BpvB9aAKZIDH2h0SyYnd8zrwsx6UJ1h21GdRmhwV
 z/qCkYK6u3v5ijcBdlJ4MqvSawq5hX7pJ+ZLh5VTMGO/wKC6GCZWpA1OEIDiBGGZN5nr
 9MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MEhoAjDVA/rzGgxdDFyedxcJ4y+qeKsXDtHWNN0enkc=;
 b=FhjfwYNbo0Kz5BkofvaJH5JXAOz/MUPDdLjaa04/PHpX4EQ5OqvCqBNIp+lh/Ee8to
 d2ddknouH2AUUEVYxiTFV5e3G+zsWvydDqyObsjuF2zRgfnvXtlikDrFHZDgc48oR27H
 6aWL+v+oYhYVSZMRoRigvUw78MoAdHjE+71mjaxBVDlkbJRgByW74rl+Lehk0iQn4keC
 EOoV5J/PKvKkw50cynNp/IXJqGQc5jgI6cEsjGJNhf+B/64cM59124ePdNDw+/nJcALt
 xeVQJjfj0ZfPC0iTVm09QqsTUwBVOlGyO9+iK917vSwcctJY1P6scGl27ChjruLgjocv
 3O2Q==
X-Gm-Message-State: ABUngvc/xzGRyJyHZ1zOIQ4g4f1q4TGWoufsm1SgG6JS4KfC12VEZ2aLUqIjqvKxGmg+Yfu0
X-Received: by 10.98.14.82 with SMTP id w79mr18506778pfi.153.1478195040770;
 Thu, 03 Nov 2016 10:44:00 -0700 (PDT)
Received: from kunyi0.svl.corp.google.com ([100.123.242.82])
 by smtp.gmail.com with ESMTPSA id a140sm14250975pfa.14.2016.11.03.10.43.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 03 Nov 2016 10:44:00 -0700 (PDT)
From: Kun Yi <kunyi@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-4.7 v2 0/1] Enable pinctrl to modify SPI1 strap bits
Date: Thu,  3 Nov 2016 10:43:37 -0700
Message-Id: <1478195018-132099-1-git-send-email-kunyi@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
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
X-List-Received-Date: Thu, 03 Nov 2016 17:44:05 -0000

Hi,

Context: re. Andrew's suggestion to a previous RFC proposal[1].

To modify SPI1 mode at runtime, pinctrl subsystem will need to add exception to
the read-only HWSTRAP rule. This patch does precisely that.

Sending this out as a standalone patch since it seems to me this change could
also make boot time SPI1 mode configuration easier. Instead of configuring
the strap bits in mach-aspeed/aspeed.c AND make sure device tree pinctrl
settings match what was configured, with this change device tree entry
should dictate default SPI1 mode regardless of what's set previously. E.g.
following node will be able to configure spi1 in master mode.

&spi1 {
        status = "okay";

        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_spi1_default>;
};

I saw Joel sent out a patch that configures SPI1 to master for every AST2500
machine, do we not have any uses currently for other modes?

[1] https://lists.ozlabs.org/pipermail/openbmc/2016-October/005194.html

Thanks,
Kun

Changes since v1:

- Allowed modifying partial bits of SPI1 strap bitmask instead of strictly
  allowing only bitmask == BIT[13:12] to go through
- Rename HW_STRAP_RESET to HW_STRAP_CLEAR and removed (to be obsoleted) macro

Kun Yi (1):
  pinctrl: aspeed: Enable ASPEED pinctrl driver to modify SPI1 strap
    bits

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 22 ++++++++++++++++++++--
 drivers/pinctrl/aspeed/pinctrl-aspeed.h |  2 +-
 2 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.8.0.rc3.226.g39d4020
