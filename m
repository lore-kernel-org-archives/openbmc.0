Return-Path: <venture@google.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnP5l6qDtzDqLM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 08:07:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PZw0wzLa"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id k93so82468545ioi.2
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/lrRQTIVFPP5FY4dq40zR/rGmTaopI7ODO9OwaWQ14w=;
 b=PZw0wzLaKOSgwctXLFyGX6aLKrZK25as9w11rsacHU3dzLonf0szLdmDC/hbEIeRWR
 fnsZprY8ImBBMr3sQlTsYzy0mEAkLJgUqERLfCk0CJk2Myy2cU2nVS9iHiLqUA6fpX6u
 qld5PKpXy/Xgn05H9dYn9vRtkE1S4O3QpLj/gnuo6wNBFMtM3DHqZLMoSjvGzUQInL26
 HmB8h6FBegytMRzsElpHxPWUMPFsoawKfnYEBIx0u++nhO/Tj4nCXA/BIAgP4I78xckb
 A9iyIyLhxGvSSPv8SvCEhPyl9hN5aN0qVYMPaQrtMzVDBrV0yjO0gqq6vbRU9+OvTivZ
 VCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/lrRQTIVFPP5FY4dq40zR/rGmTaopI7ODO9OwaWQ14w=;
 b=B7Ry07Qde6zajasvhhJmOeoJO1IfFCHQgEvpg3DWYS+rwsA4717Myo0xhqF866Fupr
 GhJci13/2x8/XlQA9kow2mQmh5E17mYteLk6EBjDSyFC1Cz/HbZGxlnr963325yYYaYV
 fnIj1o/WWzQjRX40iFDwdldBurPw9KQTXq9d00kjKU3FSHmU/eXLRQ8lzLKLfueuCec3
 JbDdEL16Ntu/tBMg20kADPdX6K9XespOExbftmiG9bbw2MwWAdf4ecIcWaWIlpE5WV+l
 DwUQm5SqaomJI61ftywi5JLp2ug4QBJtRZxsXJuSpim7wpGcD0wn3OQorgPdwhqNNUS4
 fryQ==
X-Gm-Message-State: AKS2vOyywaLasdl5VhsPeiaHxG1ztx8Ls7gBlrp6r2wFoyKGiOT3njaD
 Smo17gLVYb2LrfmEmTtU0A==
X-Received: by 10.107.11.77 with SMTP id v74mr2898195ioi.39.1497391673825;
 Tue, 13 Jun 2017 15:07:53 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id b24sm6803231iod.33.2017.06.13.15.07.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 15:07:53 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/4] ARM: dts: aspeed: quanta-q7l1 Adding 3 FRUs
Date: Tue, 13 Jun 2017 15:07:51 -0700
Message-Id: <20170613220751.99812-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jun 2017 22:07:56 -0000

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index d6d4ba2cf2b2..675281b11e70 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -83,6 +83,18 @@
 
 &i2c1 {
 	status = "okay";
+
+	/* Baseboard FRU */
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	/* FP FRU */
+	eeprom@57 {
+		compatible = "atmel,24c64";
+		reg = <0x57>;
+	};
 };
 
 &i2c2 {
@@ -91,6 +103,12 @@
 
 &i2c3 {
 	status = "okay";
+
+	/* BIOS FRU */
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &i2c4 {
-- 
2.13.1.518.g3df882009-goog
