Return-Path: <SRS0=JXsw=JK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FCBC433ED
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:10:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98505611F2
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98505611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJDw1Ympz3bvm
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 18:10:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mApDfmBJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mApDfmBJ; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBt1YsXz2yxL
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:22 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id w8so7455645pfn.9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jv6qncHvRahRe+pfGqHvyYfhjCnZ6jrv/LiUqSfY0So=;
 b=mApDfmBJut29NN39rhZJG8gUjfCpP1W2cv3QVBVxOLWCuQt25R23VGmW5XxtfiuMH8
 cYdDTJTP8MlBH+jCS+Gah5TgRipIdBFVPwDmEDcTvxLF06D0IzXb3W+GJslxOdxDMlhw
 iC3CHwHq1iYGZpcz1b/dsJ9eOoNuSXglDX44ib0dkZjFtGDpXS6EuVmb1QPCxbUNQ0G0
 D7bAAT4o6wawpyGlyT0o2atoadcaDn34kcnIyOTfDQwRj7wwgVRxqdYGgytKeIwwQgRr
 OEKAFxYvfXluBQ6rnOAgpHF4+aNimemF9ZQdwSYxIqGC3m5+wJG8UXgprHtxpm5dsx6x
 n8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Jv6qncHvRahRe+pfGqHvyYfhjCnZ6jrv/LiUqSfY0So=;
 b=iPprxy7ISB4jxWdE7pKufhpNoRmPf9aqcCMnbjcnm4LzoiBDw/2rjlHY9s7wGe0XFo
 GFoLaDywy9hil9M+eMKA54rj5FukTSFACe0Ofdtg24uObCfnEbShiy7BrSkLz+iFw9zW
 S9o9yKYsZorUvruP0ILrK+BlrysoGn2SikAJ4BgLPaC9az/IZDR96ziKkXOttDuDM8hZ
 HEXJ4ycJpoTynhnS8oYK5nRzX4sCmF408NrfaAmD+2STR84BFqiaj+HxXzaj/j6t8nmg
 MI4uRFhpo5mOsbgzlQ1DvvOaDB0VKBEIOMKYxtmZ8CaI3/fbueSPv2zbK2zNqKoiuw1C
 U3mA==
X-Gm-Message-State: AOAM533HVvB8/10YHMA5Fw17Q/WISywrLG50nKBTI+dL5Ten2RJOlUHa
 tP5DuEtO4thxXggp0C4qbhbCVJ1jTto=
X-Google-Smtp-Source: ABdhPJxvibVssLjm2uqCnGMOnN8JKZ49VH7Q3LP9aEFNa9Sp/P6NTi1mdVAiPn0eTrID528oj5wtSA==
X-Received: by 2002:a63:a42:: with SMTP id z2mr30846404pgk.52.1618301299404;
 Tue, 13 Apr 2021 01:08:19 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 04/11] ast2600: spl: Support
 common boot devices
Date: Tue, 13 Apr 2021 17:37:48 +0930
Message-Id: <20210413080755.73572-5-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Aspeed's SDK has some custom boot devices. There's also the common SPL
code for loading boot images from various devices that the system can be
configured to use.

This will use the Aspeed device types first and then fall back to the
generic ones.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/mach-aspeed/ast2600/spl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index d794421b4070..527e14f8e3b6 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -34,6 +34,7 @@ void board_init_f(ulong dummy)
 
 u32 spl_boot_device(void)
 {
+#if IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT)
 	switch (aspeed_bootmode()) {
 	case AST_BOOTMODE_EMMC:
 		return (IS_ENABLED(CONFIG_ASPEED_SECURE_BOOT))?
@@ -47,6 +48,15 @@ u32 spl_boot_device(void)
 	default:
 		break;
 	}
+#endif
+	switch (aspeed_bootmode()) {
+	case AST_BOOTMODE_EMMC:
+		return BOOT_DEVICE_MMC1;
+	case AST_BOOTMODE_SPI:
+		return BOOT_DEVICE_SPI;
+	case AST_BOOTMODE_UART:
+		return BOOT_DEVICE_UART;
+	}
 
 	return BOOT_DEVICE_NONE;
 }
-- 
2.30.2

