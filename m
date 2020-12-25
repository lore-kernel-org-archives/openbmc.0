Return-Path: <SRS0=j7It=F5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F54C433E0
	for <openbmc@archiver.kernel.org>; Fri, 25 Dec 2020 01:54:08 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C07224B1
	for <openbmc@archiver.kernel.org>; Fri, 25 Dec 2020 01:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C07224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D293K3G1szDqNp
	for <openbmc@archiver.kernel.org>; Fri, 25 Dec 2020 12:54:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UVX5LrgP; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D290r4lx9zDqMM
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 12:51:56 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id x12so1935239plr.10
 for <openbmc@lists.ozlabs.org>; Thu, 24 Dec 2020 17:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpUwJ1nPber1opGoG5sGbWTqO2vsE4ISoo3uVZd/ZGE=;
 b=UVX5LrgP360/FsOVo/nnWi567v/A25WfVu+KkijBLSqOqBqjSTTy0UJrN/wsd3oZjz
 BebBc8VDqMDmxd4qHuVvH2jgF9dYYEdaENppd5va4nfSZvr9Veep3ZuOXc34ptZwG0bK
 eB2AJ7rZu0XbBVFMv7iHXueyMsA7WHgmTila5rHFkFKZhiGdPSZnv75UaVY1Gv08vobj
 6crJjumeNVerGefn0eDMt/zvjtIOzfGKeesGLEH1Ahj8VZgC6LOWo26Th0JUxpCCthkQ
 rK3YjXfolBtZ81dJwP/2Imq+BFHQ6sPyDnYE58k0jzrZ0XBjvpQokkSAUXUoSCF7C6gF
 0CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hpUwJ1nPber1opGoG5sGbWTqO2vsE4ISoo3uVZd/ZGE=;
 b=W7etr8AP2rtKBHBVi41yj9YabFhgXH8Tliz3H3HSbjdvp9IHIARcE/L3iLodzj9Vj0
 eUh2P9JT0aJappFyZSvcR8LmHLkwlGSht/pT8tuBA9mCRissEA7jblbiymalu34tfzzA
 wCF9sT5T+BbT3SED8jw29dtySXpn8xp4O4EQYcDtjcvcuF47cN6mFj68imMZeni9d39U
 zvPmGAEdYdXLGVk2sLFtF6vLuCgTch+W7dPn5JL8pUdmEIncYpW+wmk74skh061Nl6SP
 w4rgsSGHPux/L0rK8Epk3Dl1iyNBa7MM5366ldLN40iP+cu5Z2xfxXObVWLdqm/p3CDA
 pP0A==
X-Gm-Message-State: AOAM530ogDeD1coVLcMbKJ/GaYMQSv54+HJ/YQfFbwPXjfTBzDcU7Yrr
 QjJH8A11KlWgCuyVOGcV/qVqL3u1H4IoN43F
X-Google-Smtp-Source: ABdhPJxmjpXwtdRjLFHAy+1F/HTSGcg0pyIwqJPFy+SE4hhldgaTp4S65HjNqnwLXPwLtxUhcoTU2w==
X-Received: by 2002:a17:90a:4a4:: with SMTP id
 g33mr6507283pjg.221.1608861112096; 
 Thu, 24 Dec 2020 17:51:52 -0800 (PST)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id a31sm28828488pgb.93.2020.12.24.17.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 17:51:51 -0800 (PST)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver
Date: Fri, 25 Dec 2020 09:51:49 +0800
Message-Id: <20201225015149.1416773-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.25.1
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

power-supply is compatible with Inspur's ipsps1 driver

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index efe521538d70..07593897fc9a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -789,12 +789,12 @@ &i2c11 {
 	status = "okay";
 
 	power-supply@58 {
-		compatible = "pmbus";
+		compatible = "inspur,ipsps1";
 		reg = <0x58>;
 	};
 
 	power-supply@59 {
-		compatible = "pmbus";
+		compatible = "inspur,ipsps1";
 		reg = <0x59>;
 	};
 };
-- 
2.25.1

