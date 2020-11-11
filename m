Return-Path: <SRS0=hJiw=ER=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE2DC388F9
	for <openbmc@archiver.kernel.org>; Wed, 11 Nov 2020 14:05:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4596D206B5
	for <openbmc@archiver.kernel.org>; Wed, 11 Nov 2020 14:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeFnHDfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4596D206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWRM92zkBzDqQ9
	for <openbmc@archiver.kernel.org>; Thu, 12 Nov 2020 01:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TeFnHDfE; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQvY1W9ZzDqMN
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:44:40 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id f11so3228779lfs.3
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=XcES7rXjSoh+dE3MGr5VttpSr8mwBEMuRhOFhYUHlXk=;
 b=TeFnHDfEfY33ySW6qjiT/C6H4fTpr/w947BXJ4dFgSgTIuZLPSKtSjevFM20goloB7
 ZpftwSN70F9fTESVq4u4sIJQgXcVxJqqtlI/CyIRnsg7cA95pb4iiRcyxFBMzPuEnCQH
 pNGFbECa/Nyn7AgCoD46EJeOyEA/4JZUzt5BiqRyYod4VpG3o1hY6uLGsf/sPetN4w7C
 7B+uF7Eolwq4p/28M40G3cESLwaBVgXHvchOFR7Mnpx4ka4WtlUsHerVCNI/afG44DJ7
 QfavRKpRCGpjDc6XlAzhElCFfvdNTVEocaUWagamNgrwHHLCELOUJcLCMCSaYI5hf1ct
 ahkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XcES7rXjSoh+dE3MGr5VttpSr8mwBEMuRhOFhYUHlXk=;
 b=fJWacwbOql8JVM6HMLe1ug699jxte25KFFQ+JpR0GLlJZx7fxGZZaJxovvNPH+yhZ7
 /7xo2K5s44upzVqVxG/PFwrH/uq2CwIcztIZ1DOep3WGRouSTPaSL8nYdHL2wCncAiMD
 V+evPJzqupC9pr16TvNdHQx8f0MaIXYIMCOv7ltTytl+3yJ6Dyt2EMArd/Z3nWZbjpqP
 OAp0qiLeL1ff6p49v2oYcIfOYIZnzHI1uTKIoluZlG/HcgQguTnN8r5TYx1t182Cu0Ah
 Ei9tEnGvdGpSj7/E0Duq+vpKkjhmdBSum7Eb/Tgrgy/P6qikNjuzWOJ82/6jKfEBYGlB
 aI1Q==
X-Gm-Message-State: AOAM531bua4BfxW86perxepUOD2CdfbypCDvJpMjSZ+aFxbBH7z5UlEC
 7McjVJXTl7kb1UBVphLpoLk=
X-Google-Smtp-Source: ABdhPJz9hulO1jvQ6TNdc9J/IABA/Vd9HW1K5CWzaTH/GjpeyMoeWd0Wg7zwZind9ulXRWUvw8P8Gw==
X-Received: by 2002:a05:6512:48e:: with SMTP id
 v14mr8398897lfq.255.1605102275395; 
 Wed, 11 Nov 2020 05:44:35 -0800 (PST)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id q191sm239916ljb.139.2020.11.11.05.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:44:34 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 1/3] ARM: dts: aspeed: amd-ethanolx: Enable KCS
 channel 3
Date: Wed, 11 Nov 2020 16:44:25 +0300
Message-Id: <20201111134427.1579-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

The KCS interface on the LPC channel 3 in the controller
is used for the in-band BMC<->BIOS IPMI communication.
0xCA2 is a default host CPU LPC IO address for this
interface.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Reviewed-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20201027123722.2935-2-aladyshev22@gmail.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 89ddc3847222..2a86bda8afd8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -147,6 +147,11 @@
 	aspeed,lpc-io-reg = <0x62>;
 };
 
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xCA2>;
+};
+
 &kcs4 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0x97DE>;
-- 
2.17.1

