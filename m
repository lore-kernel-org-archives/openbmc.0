Return-Path: <SRS0=u/Aq=LM=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E9DC2B9F4
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:49:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 340A4610CA
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 02:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 340A4610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5k0K4RPJz3by2
	for <openbmc@archiver.kernel.org>; Fri, 18 Jun 2021 12:49:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ua/h6txe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ua/h6txe; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5jz40TKtz2yjB
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 12:48:15 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso7262947pjb.0
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 19:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QfrZ+/jiCcm3yEIdJhYftMLE4m4RAznbYN+f5YuEBs=;
 b=Ua/h6txe3YibmvUfyefLncVftEuCl3Ob9mYKBZg2gEHvXhL4sOrrDsvowOSJTyKOCV
 aWD76lvJPVJ3FAOtbW0ehzree67dw0zfyAa1Zxr59OSGMReFYcidzu7pHhThdIjxiNkr
 hJKtzyzZkDvD4/ioxC3pEgmoNukvR7uCSkhoz6MV0k4NpSPN387DS3AoShtHE+4O+5WQ
 f0D4xmJV+jzZH43jRsdi8qDJ/jYkYTdBkrI/i5AjpW0YTGvfzF6+mmMQQ/FDvYqvpUe5
 fq9kNNP1GhoTL4rtsBPshNRh37zKN2iIgOkSo9oaUXNkoMvlh4CZFMbn2uQPxUTBFf5I
 Dxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4QfrZ+/jiCcm3yEIdJhYftMLE4m4RAznbYN+f5YuEBs=;
 b=WMx1G/cagiKjq/S2pcpdR3dCH3XDf1sevbdNCGlioQv/zKnPSQ/8+cV3iaclP8azN5
 esv56phjDxR4/QrMclccnYHd9h5QaumMCkRpXsZco04xt79uB2bOGeeLaZpDU5zBcpt2
 hNC7f8a+nzoZdIIQjcnxEzU1mPT+pX4BG8YrbEZ/P9FYdOgLH6HQM6XaIJ0E+gHASzVh
 ab3vsS42oIljyHFYxtrvV/UMterzKdAa9kwapZaS7Bl5j3vmbBiYIzY9/DYxR0ONHGjw
 /cJNqFIBhKw6Co1Wu4bpxHKKzOZWeXzaeKk3tslWf6SZH2mS3xSizXhBP0PFgWL8XOk6
 I+Iw==
X-Gm-Message-State: AOAM532x4sebAP0WPOYYOyoh7UdsgDvvyo67lDsKkHZQhWDunGp3yvRi
 Ij5HMhDa2TP8UMEBILsr+2QXcGfZiTQ=
X-Google-Smtp-Source: ABdhPJyjlNVRykmOxX0wQ0yuRvSUXlWbY1n1/ABnso7XPG15bQK1SDd7NcQ+j5vQnnSFF2EiV5h4jg==
X-Received: by 2002:a17:90a:c002:: with SMTP id
 p2mr19089539pjt.132.1623984492622; 
 Thu, 17 Jun 2021 19:48:12 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t62sm6425224pfc.189.2021.06.17.19.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 19:48:11 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add environment
 for booting from mmc
Date: Fri, 18 Jun 2021 12:17:58 +0930
Message-Id: <20210618024758.892642-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618024758.892642-1-joel@jms.id.au>
References: <20210618024758.892642-1-joel@jms.id.au>
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This adds the default environment from the OpenBMC project.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 board/aspeed/ast2600_openbmc_mmc.txt       | 9 +++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++
 2 files changed, 11 insertions(+)
 create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt

diff --git a/board/aspeed/ast2600_openbmc_mmc.txt b/board/aspeed/ast2600_openbmc_mmc.txt
new file mode 100644
index 000000000000..47a474c92d70
--- /dev/null
+++ b/board/aspeed/ast2600_openbmc_mmc.txt
@@ -0,0 +1,9 @@
+bootargs=console=ttyS4,115200n8
+boota=setenv bootpart 2; setenv rootfs rofs-a; run setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kernel FIT image
+bootb=setenv bootpart 3; setenv rootfs rofs-b; run setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kernel FIT image
+bootcmd=if test "${bootside}" = "b"; then run bootb; run boota; else run boota; run bootb; fi
+bootdelay=2
+bootside=a
+loadaddr=0x83000000
+rootfs=rofs-a
+setmmcargs=setenv bootargs ${bootargs} rootwait root=PARTLABEL=${rootfs}
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index c5d03721c97a..344a4d8f9c96 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -83,6 +83,8 @@ CONFIG_CMD_MTDPARTS=y
 # CONFIG_SPL_EFI_PARTITION is not set
 CONFIG_SPL_OF_CONTROL=y
 CONFIG_ENV_IS_IN_MMC=y
+CONFIG_USE_DEFAULT_ENV_FILE=y
+CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
 CONFIG_NET_RANDOM_ETHADDR=y
 CONFIG_SPL_DM=y
 CONFIG_REGMAP=y
-- 
2.32.0

