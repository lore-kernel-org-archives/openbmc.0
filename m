Return-Path: <ryanchen.aspeed@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c01::242; helo=mail-pl0-x242.google.com;
 envelope-from=ryanchen.aspeed@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VjjYIACo"; 
 dkim-atps=neutral
Received: from mail-pl0-x242.google.com (mail-pl0-x242.google.com
 [IPv6:2607:f8b0:400e:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VBhV5342zF3Hc
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 17:28:09 +1000 (AEST)
Received: by mail-pl0-x242.google.com with SMTP id f4-v6so63336plb.9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G3J00ElCrEV93i4GmW5jFtWIvonlsxx8dISO4gbTICc=;
 b=VjjYIACocE5hsJhDlIzfnqsmUOqz2DyjZPqRmo08zhKRGghzHm6UEDKtF93nmmEcj4
 IytTOtIXhm2ibHll2vAevD4uouaELpDx5qy1xDOwsV3CtKxHEJqntHRpqFmUXRQ+6rJh
 tm6Nzt1hZ2YVgxqk7CG2attmzMAcM5ogAw6sdn9RBfnU6MKJ33n5+pOKNrDLgdbdvkzP
 W/RDhRVAAnbVynZqssQO1Sf2iw/HCpZ42kg1MilIpLtCbNEbeP5g6KDoXOHXOfKE7ZUB
 rziU9+v9Li2qtRiVAPW/JbhmIo/wsahha1ag95TmlpRT84DMe7WHcTn0GAHO1J5SQ8mB
 +DGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G3J00ElCrEV93i4GmW5jFtWIvonlsxx8dISO4gbTICc=;
 b=BdGHcMbeRUrohMpUe9pBh4PR04mnDcnqmnJd93QhfUryY0H3OCvAaVieI3rpIebEFT
 osSDeD5pB92wqpQkSc0ma2izvgZA1R7QdzvAAbweSikjZ9+XA2kKQY4uFftKUqc9GUId
 tAH1Ua+yFS6aYBq99FCQplFwRnXacEM6eiNoJ07QQQW21pupGi1n0/o3h2rzx5X5Y8OI
 d9NjqZqMw0HOMFBbwk5Lf+Jpqb+uC1OkjDh5xlqhj6XAfvEsF1UK8MHRfWGPQFWxIzqi
 T57L0VmNFoytNIiAPpxZ6L9949joje8FC6ajfFYsIrw4QrsEg6kh7Y72k60NKSjPQJKo
 xFYQ==
X-Gm-Message-State: AOUpUlG6qiVteV9BeRBW5bQDwvurYLplezsj2FtU0g38gDkfbmBb8xD/
 pigEW8nMRYuirz641lh/F2J5og==
X-Google-Smtp-Source: AAOMgpfiVCv5FL38z8YUUVNGdJm8Wg8c5QO+7BGOZqMWFnXMmplRzM6sTqbpSVXN9d7beppaht3Psw==
X-Received: by 2002:a17:902:a9ca:: with SMTP id
 b10-v6mr493879plr.275.1531812487553; 
 Tue, 17 Jul 2018 00:28:07 -0700 (PDT)
Received: from ryan-ubuntu.aspeedtech.com (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.gmail.com with ESMTPSA id f6-v6sm578647pgp.13.2018.07.17.00.28.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 17 Jul 2018 00:28:06 -0700 (PDT)
From: Ryan Chen <ryanchen.aspeed@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>, joel@jms.id.au, andrew@aj.id.au,
 ryan_chen@aspeedtech.com, benh@kernel.crashing.org, mine260309@gmail.com
Subject: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
Date: Tue, 17 Jul 2018 15:26:11 +0800
Message-Id: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
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
X-List-Received-Date: Tue, 17 Jul 2018 07:28:11 -0000
X-List-Received-Date: Tue, 17 Jul 2018 07:28:11 -0000

This series implements Aspeed SDIO driver. In Aspeed SDIO controller
with two slots and have a global register for interrupt status and other
general information.

v2 
Change irqchip driver(irq-aspeed-sdhci-ic.c) to aspeed sdhci core driver
aspeed-sdhci-core.c

v0
For implements this, it will have have irq-aspeed-sdhci-ic.c for sdhci
each slot irq dispatch, and then go to sdhci driver handle (sdhci.c).

Another is sdhci-of-aspeed.c for specific function call.


Ryan Chen


Ryan Chen (7):
  clk: Aspeed: Modify clk-aspeed.c driver probe sequence
  clk: Aspeed: Add sdhci reset and clock
  mmc: Aspeed: Add Aspeed sdhci core driver
  mmc: Aspeed: Add driver for Aspeed sdhci
  dts: Aspeed: Add devicetree for Aspeed sdhci
  Documentation: mmc: add aspeed sdhci binding document
  configs: Aspeed: enable mmc host in defconfig

 .../bindings/mmc/aspeed,aspeed-sdhci.txt           |  54 +++++++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts           |  14 ++
 arch/arm/boot/dts/aspeed-g4.dtsi                   |  40 +++++
 arch/arm/boot/dts/aspeed-g5.dtsi                   |  40 +++++
 arch/arm/configs/aspeed_g5_defconfig               |   6 +
 drivers/clk/clk-aspeed.c                           |  51 +++---
 drivers/irqchip/Makefile                           |   2 +-
 drivers/mmc/host/Kconfig                           |  12 ++
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/aspeed-sdhci-core.c               | 147 +++++++++++++++++
 drivers/mmc/host/sdhci-of-aspeed.c                 | 178 +++++++++++++++++++++
 include/dt-bindings/clock/aspeed-clock.h           |   2 +-
 include/linux/mmc/sdhci-aspeed-data.h              |  28 ++++
 13 files changed, 553 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/aspeed,aspeed-sdhci.txt
 create mode 100644 drivers/mmc/host/aspeed-sdhci-core.c
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.c
 create mode 100644 include/linux/mmc/sdhci-aspeed-data.h

-- 
2.7.4
