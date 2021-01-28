Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75E0C433E0
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 00:17:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4785364DCC
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 00:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4785364DCC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1Hp59LCzDqMr
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 11:17:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GyHywsoA; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1G01WY1zDqS6
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:15:35 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id n10so2966192pgl.10
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 16:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJkBPPW/Yt3A3EOC8SeWrFhIFaCcTbW01/j3TO1HL4k=;
 b=GyHywsoA2kQP7ftcHtIj7ITmMYXJCOafN/Rr2NpmtTCLPHieIVCcUbCLrniQY9kbZ3
 QETbnagSyM4QkWbt6tLwBtjP6TnvYr8QB9xuoGbxfi1xEdhCc346ut5A5Bgwl+V9o0mb
 Dn3UAca4yVX1Ib2kRoORHZ2bYEsRf2bHWcYCRcTfWK5ecX31v5Gr9gkwXzfLDe4Epqup
 Sqjq/yWo8IwWjFTOyxw3hESDjpZ2F6fuUpT0eeqFjdPmpVgvaFqKpg15uhc4D7o3t8ax
 o0fZwPHVOvQr1SxDG7OQhtm0rX108aXInSVNPlaAn1iIBn2m/K2uWPxSakzNIFKkKHCQ
 zxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uJkBPPW/Yt3A3EOC8SeWrFhIFaCcTbW01/j3TO1HL4k=;
 b=KbftstGxtX4UsHSbh6ipdeumB/OiK0kWzEvwhyG+FP0I6SKiK2GjJv4Wj3DuUsrNTX
 2e+0m+a30L0p5t60YnCnPu+qWlRGhlbtoRPCY3oDu/2Nmr631V4liSuHTEuYHjc0JjfV
 GCmzh1ImV+O+8NPbYU6lKII+i5CUTsAu4Mi9Hii+UGkkJInxBxFS5LT2JyHWaG1IIe8y
 +LF0XfAknAwkizie0ALAma6mVgl/62yIY1MKBVEpgp/vcpJ5asJfxTXSEN0qT+xM2/or
 gvA/Jb4Vh7R6jGorfiQd9uNoMeQQGb6xUBZL/VutZpfQSBh1fLHZxUdTxco8k545pLE7
 kNmQ==
X-Gm-Message-State: AOAM532TF/LlonUZgrxYmI6X+bFGGBgzMqERf2QlrgWlm4OzUW2IeWVZ
 VCMlfQuhdtxzABPe2dKQgH8=
X-Google-Smtp-Source: ABdhPJzRnTKAPVdh2PKiTt4qZ/LBQzgHl6BGEaMONmqw3QzS/CFrHU9RK+u9+wbuFNxSNTlfJ/PEJQ==
X-Received: by 2002:a63:454e:: with SMTP id u14mr11291548pgk.113.1611792932995; 
 Wed, 27 Jan 2021 16:15:32 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x19sm3529239pff.192.2021.01.27.16.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:15:31 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/4] ast2600: Allow
 selection of SPL boot devices
Date: Thu, 28 Jan 2021 10:45:17 +1030
Message-Id: <20210128001521.266883-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128001521.266883-1-joel@jms.id.au>
References: <20210128001521.266883-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The AST2600 SPL can boot from a number of sources, with or without the
AST2600 secure boot feature. It may be desirable to disable some of
these, so put them behind the defines for the drivers that are used.

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/Kconfig    | 12 ++++++++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index dd991e87c795..518f41b558d3 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -53,6 +53,18 @@ config TARGET_SLT_AST2600
 
 endchoice
 
+config ASPEED_SECBOOT_BL2
+	bool "ASPEED secure boot BL2 support"
+	depends on ASPEED_AST2600
+	help
+	  Enable ASPEED's "secboot" secure boot support for verifying
+	  the SPL's playload ("BL2").
+
+	  Enable this is if you're using secure boot support in the AST2600 (or similar)
+	  to verify your u-boot proper.
+
+	  Disable this is if you are using u-boot's vboot to verify u-boot.
+
 source "board/aspeed/evb_ast2600a0/Kconfig"
 source "board/aspeed/evb_ast2600a1/Kconfig"
 source "board/aspeed/ncsi_ast2600a0/Kconfig"
diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
index 58a22f646e08..98cf72bf440d 100644
--- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
+++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
@@ -42,6 +42,7 @@ static int aspeed_secboot_spl_ram_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("RAM with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_RAM, aspeed_secboot_spl_ram_load_image);
 
+#if IS_ENABLED(CONFIG_SPL_MMC_SUPPORT)
 static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -101,6 +102,7 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
 }
 SPL_LOAD_IMAGE_METHOD("MMC", 0, ASPEED_BOOT_DEVICE_MMC, aspeed_spl_mmc_load_image);
 
+#if IS_ENABLED(ASPEED_SECBOOT_BL2)
 static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 				      struct spl_boot_device *bootdev)
 {
@@ -161,7 +163,10 @@ static int aspeed_secboot_spl_mmc_load_image(struct spl_image_info *spl_image,
 	return 0;
 }
 SPL_LOAD_IMAGE_METHOD("MMC with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_MMC, aspeed_secboot_spl_mmc_load_image);
+#endif /* ASPEED_SECBOOT_BL2 */
+#endif
 
+#if IS_ENABLED(CONFIG_SPL_YMODEM_SUPPORT)
 static int getcymodem(void)
 {
 	if (tstc())
@@ -204,6 +209,8 @@ end_stream:
 }
 SPL_LOAD_IMAGE_METHOD("UART", 0, ASPEED_BOOT_DEVICE_UART, aspeed_spl_ymodem_load_image);
 
+
+#if IS_ENABLED(ASPEED_SECBOOT_BL2)
 static int aspeed_secboot_spl_ymodem_load_image(struct spl_image_info *spl_image,
 		struct spl_boot_device *bootdev)
 {
@@ -245,3 +252,5 @@ end_stream:
 	return ret;
 }
 SPL_LOAD_IMAGE_METHOD("UART with Aspeed Secure Boot", 0, ASPEED_SECBOOT_DEVICE_UART, aspeed_secboot_spl_ymodem_load_image);
+#endif /* ASPEED_SECBOOT_BL2 */
+#endif
-- 
2.29.2

