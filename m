Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::244; helo=mail-pg0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnOeBCsA"; 
 dkim-atps=neutral
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLxFb3X86zF0gN
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 16:57:39 +1100 (AEDT)
Received: by mail-pg0-x244.google.com with SMTP id q67so10728735pga.9
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 21:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WbxPDIfAe7sb4xbvpbLqgno8nERI0fIIvIq/OETyG/k=;
 b=fnOeBCsAV2wfxmSLLIjAnMq+V6cxKFhGdr3tsrRSZAHhO3hFxKc26hHs18t6ND7qUj
 2HI4hikPmmCLe7rPwLWzlx5HulRVcJmq8DmL4n1b2gUNuLSYxFxuMNI9+QtASH9JNhS6
 ferieKxvgZ0teSjJva+pdQZpFCPgjMEfa5AV5dUUrxvButrwB0utfgeYsPNJezAPd5aS
 R01EEaBmiX2HzECrEpth8NuKhK1XdpPa01lidPwdTG1WpMR5qFgj7zaX5R+3Egr7z0lW
 VKdxpmNTVLZ3f3ga5KK9d90ZXt3p5pWvlesLl/NE5aVsx698gKJiIh/tLDknTqIgfkPd
 bT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WbxPDIfAe7sb4xbvpbLqgno8nERI0fIIvIq/OETyG/k=;
 b=l0y+oBQlHPyLqLX2T+2x1nS7kltRzhIlhs/zHmtRh5CsvgarpiSkLGFQhvAIEpNQvR
 PHT5kyTj3pfIdhUYSXdFTCuTwlperXfmN9Xygx23XBkh/v68DeexNczRIx3Tpw/CsugQ
 NL/zlv64i9fiq3eA0U4aR5RcKcosKuNkt/EEa4pT775o3ascZiU5jSa6cRWhuLDEPbxp
 JsL+Gej3n3TMwOcoFUvvmOq91ouICFcBSLZDrN46sIgULM/Emj5b5qj+YMR+TwXbsf6B
 TfpyM67ZDZry5sRjVE0jU7E1Nk9SAJbDLQCfR4BhN7ig1w0ak9wEJiAT/57EIuhIaQIx
 +E7Q==
X-Gm-Message-State: AKGB3mLWDYIglWB3WIpp/ReESXuapTLCHrn9vCbgcTBmCSakqOSMYZvI
 gfcEG8oD7s5kN9x7Gvy/Rr0AFZtc
X-Google-Smtp-Source: ACJfBouaOO2Nh1eJZGdE8YSZgsAC64z/XBokfeyw+zvWh7yC2yPnl850rWev7tpHM4WD4Iye+gzxSg==
X-Received: by 10.99.116.26 with SMTP id p26mr25446129pgc.320.1516168656736;
 Tue, 16 Jan 2018 21:57:36 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id 13sm6243745pfk.93.2018.01.16.21.57.35
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 16 Jan 2018 21:57:35 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Add w83773g temp
 sensor
Date: Wed, 17 Jan 2018 13:56:56 +0800
Message-Id: <1516168616-3928-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 05:57:40 -0000

Signed-off-by: Lei YU <mine260309@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 3a53cdf..1ca2457 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -255,8 +255,11 @@
 	/* CPLD */
 	/* Power Supply */
 	/* Temp Sensor */
-	/* Temp Sensor */
 
+	w83773g@4c {
+		compatible = "nuvoton,w83773g";
+		reg = <0x4c>;
+	};
 };
 
 &i2c13 {
-- 
1.9.1
