Return-Path: <SRS0=tfcJ=JN=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09576C433B4
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 11:30:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599EF61153
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 11:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599EF61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMDXY0F9Bz3bwq
	for <openbmc@archiver.kernel.org>; Fri, 16 Apr 2021 21:30:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S9HTtZq1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S9HTtZq1; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMDX15dm7z2yYh
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 21:29:52 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id j4so4721822lfp.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDvn2kw+AqHFVmMHA1E4Zwk58TbXRmahkn2Efahmx4U=;
 b=S9HTtZq111/Tna/SFkWcX2CkYSxXKXv+Q/6qx2Lg/pc/yELcc41wWWk3W1sDxTVRkW
 fkPoQgTOgQtOfsiUjyJWXkNxuKX+1yI5qrtxZhBrHf44Szuoa/yG78y/04sccnjrqkkJ
 BvxV/B3fl/thVoiCx9N9gltKarGPiuCAN4rC/N2FQTY6c1mS/hcASLhdKD3mhh0wXsHE
 iGbT+QBkJTWpESERzuE1v/leM3VGfKDxay2SLllNmjH2AUDu6KllVEDI1KwDATdQbErQ
 clrie93//MLjbSf0U/E6kpLuo1VlQFetPIrBLke0J9TcZB1653mMekR7+0iggRDJ5yTR
 ZC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rDvn2kw+AqHFVmMHA1E4Zwk58TbXRmahkn2Efahmx4U=;
 b=szDU/PzCtQS14fCj4JMMJQ7W5022oZ0qkxZAymClTuv24zb96j2QMEqS6iHZXqSIQ6
 Ezlwz5uyOkOUu5uLMhDFwaQCDHWgJAJBCA7Tb7t/PYpC49bqzlXDaweVWRyKsPZ/clih
 XqihsoW1vyWxYI42RyB4Gcb9hl/L0OaIS62PkDugGdOyXgjmNPeyuWCw+NQmn8LRXQNc
 hBk6q/IDfK91SbRQeYm8gbyA3XVwBkFnpYlcUsVeDRYCjfGVyzob0e2xTSgNv8yu170q
 R8a2G/R6eFNL97KQ7wkQsLStCrpmiS+qAW76A+/Cx/hOibXEc4fDBCCQp7O0S4nBKfeA
 jaww==
X-Gm-Message-State: AOAM532/6bYz8mQ3kkSHjTu/b193md6iIUSrz800vrrsup+xrRkuXoqg
 tM9ppVSuYylXcRtyAzK6Xk0=
X-Google-Smtp-Source: ABdhPJzIjXVFSMeWIjmEIokBGHB04as8Cdoi8C5k3P7qp/fu/JHi6aWnhJCwBxx3X5HoGB9ROmT7PQ==
X-Received: by 2002:a05:6512:ad6:: with SMTP id
 n22mr2864622lfu.592.1618572586285; 
 Fri, 16 Apr 2021 04:29:46 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id t5sm913295ljc.78.2021.04.16.04.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 04:29:45 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: aspeed: amd-ethanolx: Enable all
 used I2C busses
Date: Fri, 16 Apr 2021 14:30:57 +0300
Message-Id: <20210416113057.3026-1-aladyshev22@gmail.com>
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Enable all I2C busses that are used in AMD EthanolX CRB:
 i2c0 - APML P0
 i2c1 - APML P1
 i2c2 - FPGA
 i2c3 - 24LC128 EEPROM
 i2c4 - P0 Power regulators
 i2c5 - P1 Power regulators
 i2c6 - P0/P1 Thermal diode
 i2c7 - Thermal Sensors
 i2c8 - BMC I2C

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 96ff0aea64e5..d94f2b51762f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -151,6 +151,31 @@ &i2c1 {
 	status = "okay";
 };
 
+//FPGA
+&i2c2 {
+	status = "okay";
+};
+
+//24LC128 EEPROM
+&i2c3 {
+	status = "okay";
+};
+
+//P0 Power regulators
+&i2c4 {
+	status = "okay";
+};
+
+//P1 Power regulators
+&i2c5 {
+	status = "okay";
+};
+
+//P0/P1 Thermal diode
+&i2c6 {
+	status = "okay";
+};
+
 // Thermal Sensors
 &i2c7 {
 	status = "okay";
@@ -196,6 +221,11 @@ lm75a@4f {
 	};
 };
 
+//BMC I2C
+&i2c8 {
+	status = "okay";
+};
+
 &kcs1 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0x60>;
-- 
2.25.1

