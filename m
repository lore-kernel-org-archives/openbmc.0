Return-Path: <SRS0=LnGq=G7=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5CBC433DB
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 00:21:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2928661492
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 00:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2928661492
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1Nl1lsKzDr6S
	for <openbmc@archiver.kernel.org>; Thu, 28 Jan 2021 11:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XuT4eE27; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1G76ksHzDr5k
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:15:43 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 31so2179729plb.10
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/QjVUdX1qO2B7Vwm7OOOX/e+4j7K/R5/brlUz2N3fE=;
 b=XuT4eE27CECCRIPzOeb+eCIrPcwfrn2yUuLwc4N4XT8gDvo7uT2ZVxS42+mbao4xpZ
 bJioFWgDRSVuykDhSqPLi6LUEmrlcixJRtkOhTIXnwh5AKYEODCFTeFeVvYxrRNGJxng
 vusxRK076uWUqPSbno2LU9xYswU2ZbDFDhXRiMfsCUzBwMA0zNu5ez0WxTRXYJmP8fDz
 01h4wBtXLwc4fM4nJyIfCavvxnue+Qt77QsjvclnjNvPzX1dlcwrtLv1SGAmnXNVIz3T
 RIpMWpvEno998L9aqCQNpnAWJYGpiYPNhvM1aljR9Os5r1/aceCLaoKfCDNf10ncsR0W
 /KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B/QjVUdX1qO2B7Vwm7OOOX/e+4j7K/R5/brlUz2N3fE=;
 b=GaosiUINs2LSIWswBRTv3Kbau1/niq0CBmJdoUCrL3A/4UpnDG44ioqoAMKvvIFpSU
 LPAqb6Vl68gVGv0ebfLpwezW3uTXiI2+1iXuQe3f7flJn3DpRSmVjTMLbMAI59jm6SaZ
 1pBYYbRct5Fh9j/oy/E6gfzlsWBO9/X1vD4AhNFspNhqQpVsJ34C//H4Cnb9nzuC3M3v
 6QDzxoMQDKFls7r6IM4qQHP0DSgTeOYKBs0z7oy9OUNQ9kvIoMczvuDflGCRlv3RWPUy
 ZZW+l7mqhTa9hNxT7b592X6Qhd0BA4Lp+PfXq5jo4RBLXU8Srod+82BRhbx4pgkwKpBx
 vkvg==
X-Gm-Message-State: AOAM5316H0xkcAJhTeR3dzEO8/QwAcAAJc8Pk/U7nM4AoVCBVIst9wTW
 WXzgO9zHaXgcUm4D0PiSW+E=
X-Google-Smtp-Source: ABdhPJy0nTdtZFQI2VeWxd/MO3nlkane+N3s0C/cSig5Fyp4gyqjWjkRoMJA42goRiwJcHNC64ckJA==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr8197236pjb.137.1611792940588; 
 Wed, 27 Jan 2021 16:15:40 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x19sm3529239pff.192.2021.01.27.16.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:15:39 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 3/4] ast2600: Modify SPL
 SRAM layout
Date: Thu, 28 Jan 2021 10:45:19 +1030
Message-Id: <20210128001521.266883-4-joel@jms.id.au>
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

The SRAM is 89KB on the A1 and beyond:

 0x1000_0000 to 0x1000_ffff: 64KB, with parity check
 0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
 0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once

Allow the image to fill the full 64KB payload size (max that secure boot
supports) and place the stack at the top of the 24KB of SRAM.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: reoorder patch

 include/configs/evb_ast2600a1_spl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index 69f3c32ce1d5..a39988820add 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -25,8 +25,8 @@
 
 /* SPL */
 #define CONFIG_SPL_TEXT_BASE		0x00000000
-#define CONFIG_SPL_MAX_SIZE		0x0000E800
-#define CONFIG_SPL_STACK		0x10010000
+#define CONFIG_SPL_MAX_SIZE		0x00010000
+#define CONFIG_SPL_STACK		0x10016000
 #define CONFIG_SPL_BSS_START_ADDR	0x90000000
 #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
 
-- 
2.29.2

