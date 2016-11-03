Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8QGl3y3vzDvPX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 11:05:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=J0hlb0E7; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id y68so3019264pfb.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 17:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:from:to:cc:subject:date:message-id;
 bh=ovgqg/PzaxxvoaKPrKUze7hI4Baa041b6Sb5n6V15jo=;
 b=J0hlb0E7CtHjY7A2Aa/v+1aFNPe/39hEUTS8A4BXeKjraND12xOGwtMyyJbU1DcWrF
 P8IIcmIz1TwWGUGQGCqlGBsEcXyf+bwSK/Q3yS0LiC0kGd+DDSW2rOaAdpZG7EX/cDr+
 tmQncakkQ0QyV1E3+63m3TGqmaen46d5lu47v0fb62o4F6huHMaR01g/zaRGo+2H+GVw
 bF1zb2AtvfB0+OMM/Yd+xoGAJYLtpcP6K7Un6tp3AJ6ABrRSHK+TrhDkmi1Ip2iUdF/I
 Weu1bbAqanr1QShpUMmTytRLESJ4V8n8n+oBG4Qxt1p9tc+w0qlYVwZqcoGouSIuptFY
 XPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=ovgqg/PzaxxvoaKPrKUze7hI4Baa041b6Sb5n6V15jo=;
 b=StCVarP8yqnfbuLY1BrNAS+WZjtqqn1S93YV+U3/zq79syuM1jpW7jAdKUHUVHdjQu
 DfrUbXpGmDjDPs4BoNBpbMTEs/ZExtAyLLWJZqo5DVqOIcGHg2h/W42/jbDJ6tXlTkhV
 6FnZXP8Of9iNyrSciH5mgnqcG2mFb2+YKXApmP/VScHbEGkGsQPEkoY4V5EW791AjfMi
 A0EQIuCiayp3wWkgcga0E5JVDPP8pAJuAAktPqgPohWCC9Aq6T4vKVyaNQIfYYHuhaiH
 Y2FIbCsrURZhPs+0eJgufii1ywOrbVDSbx7oz/LdJ2wHcSX15PgsxfhZockuvZIPI8ea
 9KLg==
X-Gm-Message-State: ABUngvdsoAh17zuXYHh0B3DrP+Kxz6Cad8PAc0B6FTIgb4V2rqfBP+mHFt15mD87YPMYGw==
X-Received: by 10.98.149.140 with SMTP id c12mr11808477pfk.100.1478131549462; 
 Wed, 02 Nov 2016 17:05:49 -0700 (PDT)
Received: from aurora.jms.id.au ([2403:480:11:8000:45ae:bf99:943a:2a9d])
 by smtp.gmail.com with ESMTPSA id l187sm7385023pfc.0.2016.11.02.17.05.45
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 02 Nov 2016 17:05:48 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Thu, 03 Nov 2016 10:35:39 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] arm: dts: ast2500-evb: Mux MDIO pins
Date: Thu,  3 Nov 2016 10:35:37 +1030
Message-Id: <20161103000537.19830-1-joel@jms.id.au>
X-Mailer: git-send-email 2.9.3
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
X-List-Received-Date: Thu, 03 Nov 2016 00:05:52 -0000

These are required for the MAC to talk to the PHY.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-ast2500-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 33b3907c436b..37b6793698e0 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -47,14 +47,14 @@
 	status = "okay";
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default>;
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
 };
 
 &mac1 {
 	status = "okay";
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default>;
+	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
 };
 
 &i2c3 {
-- 
2.9.3
