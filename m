Return-Path: <SRS0=xVxV=MT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	WEIRD_QUOTING autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C1C4338F
	for <openbmc@archiver.kernel.org>; Tue, 27 Jul 2021 03:46:05 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB7D600D0
	for <openbmc@archiver.kernel.org>; Tue, 27 Jul 2021 03:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AEB7D600D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYjPl2dmnz308M
	for <openbmc@archiver.kernel.org>; Tue, 27 Jul 2021 13:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OgSvMsmZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OgSvMsmZ; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYjP75fDfz2yfg;
 Tue, 27 Jul 2021 13:45:29 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id k1so14120467plt.12;
 Mon, 26 Jul 2021 20:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B9hnvixYLx+Mbh/V+fqgD8k3DA6gCdWi2FOiiA5JvqE=;
 b=OgSvMsmZgcrP3TBJcm+NaGx2br6XhBjElKw6xhO1Yc7LAOBbjktS/EiiKVYTcngDz+
 u2UQcHJlsQ5SsEe0YOqjD8KAkCbjZyM/nKpDB9LKqQQoiFhzc3OrPHvarC8FzLY/uMOh
 60XJ7o9bGpS4aWOIumCTFxWToslAHk3ENEOrfdGD28yyBDEtKQkKRBudcoSmVu1Jdqfp
 IPltpNROkPLzvJXzpx+U25kbPIcSKwKnh7igo+K/MVtiNOk4jKRUDyAPFlSEaz/e3EKN
 ErzIMQDs9/eMRsU2A1vix9peZNchkdSZdv6iay/nxnXyhkKCYmIwrh1SV9IXgmhJl3J/
 2JWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=B9hnvixYLx+Mbh/V+fqgD8k3DA6gCdWi2FOiiA5JvqE=;
 b=kqGjyCZ8Q9NeMiQQqyFvRIRa+lGkBKGz+hJEo6jy8RySxSZzfdY7Es4wrsVC/Yq+76
 tXskISXsp3tsBzZZT6T0IJjdq4mxzWvxB3wwzJwImiGSgN/f1nvt1tf3V9D3gq9M/UgZ
 brArGnUOxxRFdOb1aRUyxgfWP8QlL5cpBD66D55+DAaoWIcsnJyOmSwa7REw6E/6fIYR
 ltrioPf1Zs2rJGWn6vk4X/3PyWf4gIRYcGzS2OwDfmZDy3iV9F3iRpz2+zFhkLCpoPtT
 Dl2/gA/009uDuhSJQvIg/03KuVH1IzkLoBT0ly3ydQhTFQwDVRmXieRzQP0Ndh3CSSYh
 f0/Q==
X-Gm-Message-State: AOAM5328t2A6zCvhCi4AoyIGfMbCKrC52Q6WNKPaKVfgF045zrsgDcas
 qKlb31bpRglkoCip7dUJ5VYogoh45lo=
X-Google-Smtp-Source: ABdhPJz58GGfBYcZ1L4gPOUQ8+TCxyFqNMgQ3k3rqU+QwphY7eptrOk/mDMVpHOHn1iQLqLr5JvicQ==
X-Received: by 2002:a63:3601:: with SMTP id d1mr21192310pga.299.1627357527183; 
 Mon, 26 Jul 2021 20:45:27 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id n32sm1536391pfv.59.2021.07.26.20.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 20:45:26 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.id.au
Subject: [PATCH] ARM: dts: aspeed: rainier, everest: Add secure boot GPIO
Date: Tue, 27 Jul 2021 13:15:11 +0930
Message-Id: <20210727034511.474205-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The secure boot enable GPIO is used to indicate that the secure boot
jumper is set, which in these systems will make the key storage EEPROM
read only, and indicates that the system should enforce boot security.

The net in both systems is called SECURE_BOOT.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 4536cd538af9..40efdba5f7cd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -244,7 +244,7 @@ &gpio0 {
 				"PIN_HOLE_RESET_OUT_N","","","","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"led-rtc-battery","led-bmc","led-rear-enc-id0","led-rear-enc-fault0","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","secure-boot-enabled","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 06b3d1573780..b41af45d8f8b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -262,7 +262,7 @@ &gpio0 {
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"","","","","","","","",
 	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
-	/*I0-I7*/	"","","","","","","","",
+	/*I0-I7*/	"","","","","","","secure-boot-enabled","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
-- 
2.32.0

