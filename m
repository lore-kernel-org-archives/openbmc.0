Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJnRY0cE"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QS5s02VKzF35P
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jul 2018 15:18:37 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id c21-v6so12998717pfn.8
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 22:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FVQumo9wm8ncQal3F1AoN1aW7KlJZtFVbTlIQP7AbgE=;
 b=AJnRY0cEdF86pQDHnufIvV3hQqf6NSV/FofEOteg+Ckv2Ylh6C0G1qlqG8hcNT55MQ
 XY9s7KdSTSaRFGLV+oQwUfYVeFEHm7yReKS88gQlG4zsfstoLPb4kkRJcBakWMwHm3vd
 w/trshCxbnTnHp5Qu/iEFXLqTjcLKjjHlAme5eFGLP2NsmvV7iIQEM2v3VphvabYCAtM
 KcsGRn/2mKTlD3xrSLWbeoEft7BgG0qVSrpq0AfJCVjGF7FY535BZ8AiE3FD4KLkLD/+
 q3WkduyfIYvhjPTTCJFY+egkNewZZyMJphOC4zMnJwSjuU+U5AMJpljITnlRGAZt4lHA
 d9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FVQumo9wm8ncQal3F1AoN1aW7KlJZtFVbTlIQP7AbgE=;
 b=uOGwBrBR6e7kQB/ltEEQFzKzL5EPBjnCroV9W6D7Ie6d7Pd2zEMX1vFL33BcvO9R2O
 jKoZc7TQCcCo8Hr71VKbx7/BBZB1FSR52mUBPi8+KxST9bABAq/uuqoB20InAkCOhalj
 /wCzjHE/NbpAJpSMxKSFiSd1M4bSS7/sokquM4Ey0dWhFOiHQhHVGie11o6s0YHJr38k
 Icy5hZUD7+tzEci0cFaxfFEU0tHraCW90ZBz4/a6l6Zv0uvLQx1EfV6uUGAJhxJD4o27
 ym7kcoRN/9DX5081VK1adq3H8ZEkdg2Z+5IeXo04+1gEaq6Fvz0t+0A5kCINs3LANhiO
 W9ew==
X-Gm-Message-State: APt69E3T9BUXuCRPjkwO8LL6NY7FW/ohBlQoeDWMv55GfaKIXGKzZSRJ
 FEt7eMhaNVDm1hocEZiB7Yo/Ew==
X-Google-Smtp-Source: AAOMgpcdDh7tfBzhPuoxboIZ1v5xzFQ8DAEon7iJlCo8uN3LCuYb3TgxuI+eAPVet61b2zMy6gW6uQ==
X-Received: by 2002:a63:91c8:: with SMTP id
 l191-v6mr24582844pge.180.1531286315459; 
 Tue, 10 Jul 2018 22:18:35 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id p18-v6sm21357097pfe.22.2018.07.10.22.18.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Jul 2018 22:18:34 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCH linux dev-4.17 0/7] drivers/mmc/host: Add Aspeed SDIO driver
Date: Wed, 11 Jul 2018 13:17:03 +0800
Message-Id: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
X-Mailer: git-send-email 2.7.4
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2018 05:18:41 -0000

This series implements Aspeed SDIO driver. In Aspeed SDIO controller
with two slots and have a global register for interrupt status and other
general information.

For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci
each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).

Another is sdhci-of-aspeed.c for specific function call.

Ryan Chen

Ryan Chen (7):
  clk: Aspeed: Modify clk-aspeed.c driver probe sequence
  clk: Aspeed: Add sdhci reset and clock
  irqchip: Aspeed: Add Aspeed sdhci irq driver
  dts: Aspeed: Add Aspeed sdhci dts document
  mmc: Aspeed: Add driver for Aspeed sdhci
  dts: Aspeed: Add devicetree for Aspeed sdhci
  configs: Aspeed: enable mmc host in defconfig

 .../aspeed,aspeed-sdhci-ic.txt                     |  25 +++
 .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  42 +++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
 arch/arm/configs/aspeed_g5_defconfig               |   6 +
 drivers/clk/clk-aspeed.c                           |  15 +-
 drivers/irqchip/Makefile                           |   2 +-
 drivers/irqchip/irq-aspeed-sdhci-ic.c              | 147 +++++++++++++++++
 drivers/mmc/host/Kconfig                           |  12 ++
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/sdhci-of-aspeed.c                 | 178 +++++++++++++++++++++
 include/dt-bindings/clock/aspeed-clock.h           |   2 +-
 include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
 14 files changed, 548 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,aspeed-sdhci-ic.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
 create mode 100644 drivers/irqchip/irq-aspeed-sdhci-ic.c
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

-- 
2.7.4
