Return-Path: <SRS0=JXsw=JK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63E1C433B4
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:09:45 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B96B0611F2
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 08:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B96B0611F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJDR2Pvtz3c24
	for <openbmc@archiver.kernel.org>; Tue, 13 Apr 2021 18:09:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e0ctdDtD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e0ctdDtD; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJBp5b0zz3bSj
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:18 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id t140so11353652pgb.13
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2a03jwPO77rJpa/gzeBgYoidArHDtVIdX/eL3jlYRnQ=;
 b=e0ctdDtDtpsDgQAxHU/CmX5yWuGONMa/D7tWn2OuUavdUhtt93vN1BMmdHijJFOopE
 0Fm6TAKS1HI2a5W+AvcjKRyRPSyhPsjur5LtMOdEuaw+WHtof20emejyvlW9epKK5ux/
 5Awxx5fFfKm6Wl2jzTG7WcdoKybWROlZsvyCJpbfk2P+D1NdjnJHJQ6IEk4tY5wEoRJo
 40vN/RvX2vO8CtyJAnIg9AR4bR/rixsMgZU1uvFh76PpWCChhVFEinET8xN76ejO7mpc
 Hu3XMv14LamtocfIGr1WPZ4BJpxdC4fGLrUHEKUiJHHy9bpJf0sn9QhHvKd8sSTr+9Al
 iBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2a03jwPO77rJpa/gzeBgYoidArHDtVIdX/eL3jlYRnQ=;
 b=DmBOq+YCwdaTL1UpCUdBDUI/lOJomcRUG7edrtE96FQxigSYfe7+U3u0UEBYPeJTA8
 6sCgdbk+sALl/AFYvJm7wEsad18+3NmE5/7IBjR4TjzVJ+alHXh2/u6qm0MEWKZ6TQH+
 KkRwmOOCWbgrGE2CX5fjn4bu4l9kaNBQTWq7DdQ0eJvqabstJ3brEbpdAtD1R50OyNy4
 Lyop3HH9xWkgB4ymGy9sRUERBh9xuoMwctKo6cvsqUdTpYoo0SK3OOUM3zk7w3J8RcHM
 tWfkpJP+QMs4RbSGJSjclLRLOYi0PML+vOSm0U3kX86LVUenVmqdXTp9vKnYfa4u/vjl
 2Xjw==
X-Gm-Message-State: AOAM531BSDO0BuM169qL6DQdFdDNvrASfmVgOgF2efXiZU/hVDoBWBRR
 YEw6oQObmTs2JpNKkvpqyG8JYpSl0wE=
X-Google-Smtp-Source: ABdhPJzY+k5ibDzYY6QSgluAjjXw4i5qgiQs6Lf3ygFcmHcYjcvY40mRza/5jodGbxH1IB2WcZjy4w==
X-Received: by 2002:a63:342:: with SMTP id 63mr30410125pgd.151.1618301296115; 
 Tue, 13 Apr 2021 01:08:16 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:15 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 03/11] ast2600: Configure emmc
 boot options
Date: Tue, 13 Apr 2021 17:37:47 +0930
Message-Id: <20210413080755.73572-4-joel@jms.id.au>
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

Assume a u-boot that is 1MB, minus 64KB for the SPL, that is linked and
loaded to an address in DRAM.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/configs/aspeed-common.h     | 2 +-
 include/configs/evb_ast2600a1_spl.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h
index 876958735b75..093c59c0eadc 100755
--- a/include/configs/aspeed-common.h
+++ b/include/configs/aspeed-common.h
@@ -82,6 +82,6 @@
 #define PHY_ANEG_TIMEOUT		800
 
 /* Uboot size */
-#define CONFIG_SYS_MONITOR_LEN (1024 * 1024)
+#define CONFIG_SYS_MONITOR_LEN ((1024 - 64) * 1024)
 
 #endif	/* __ASPEED_COMMON_CONFIG_H */
diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index a39988820add..4d8405e9dbc0 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -13,6 +13,7 @@
 #define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + 0x5000000)
 
 #define CONFIG_SYS_UBOOT_BASE		CONFIG_SYS_TEXT_BASE
+#define CONFIG_SYS_UBOOT_START 		0x81000000
 
 /* Memory Info */
 #define CONFIG_SYS_LOAD_ADDR		0x83000000
@@ -32,4 +33,7 @@
 
 #define CONFIG_SUPPORT_EMMC_BOOT
 
+#define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR	0x80	/* address 0x10000 */
+#define CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS	0xf0000	/* 960KiB (1M - 64K) */
+
 #endif	/* __CONFIG_H */
-- 
2.30.2

