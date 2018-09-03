Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EmHv7+Sx"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 423dYm4fvzzF391
 for <openbmc@lists.ozlabs.org>; Mon,  3 Sep 2018 15:19:24 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id x79-v6so10349698ita.1
 for <openbmc@lists.ozlabs.org>; Sun, 02 Sep 2018 22:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id;
 bh=jJ9dx2tbFADJamyi7jdYLjQPovcoqRzQ0Uc50ljiQvQ=;
 b=EmHv7+SxmwkCzKwtjfU7Ap1F+WnNSEF0to8NDQmgiMtY3C1l/u+TBABPH23WDqTh98
 FqETMZBE0rclIqekwUvoi8Ks0ZsM8zKWnd5BcqkJyVB6FF7FPY4VlOdZDV9/Okcxm8aw
 8CR906DTTkLOWiUGeQ+SfEOCeJBMMGLd36NyLQMxN4x8TdgrwJtglGRfPK1WULCsS14A
 wxnhQWAm9k/pAqqWrmiO8fxOcPPeLXObqgAJ038OaQGCxi7p7WszYvdzL7AnUzr9CoWD
 fRjeSdLEoHWMmYp0e9RWhRzql88mLW6XQyW7GwQWtb21I1ZCvoyOg7TfkH6jt22cMzUP
 Q4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id;
 bh=jJ9dx2tbFADJamyi7jdYLjQPovcoqRzQ0Uc50ljiQvQ=;
 b=e0BM/Y05m5fJuJog5nfHqC0J4XFCxUxnPLwMDnMFdYJaddQzkag4M5oBL/70pXsYgW
 6oSvfavXKNrdicvzKOwki3Q+WEJJYh/xKzRLY3Zrq5d1dkFQ7/Kp2oxw7MO8mwngxspV
 4jFoMfw8M0fi8nkrjAY6KBedwKen7CYto4LU8gLBQJ8uDtFtJ8p6xH/zbehYG5V9bMsC
 X0zHBgKBAP8e0QlgwHulOvxM8PD/xSFEfphFxEWbSQPvAHJV7Rib8uTGLQLC018Q1xZh
 s2D23e9XT3yYUUkzXHof++eqscAumrNBGbAtVttwP0wAomm5JRUTf80vgx5L01HZ+DtE
 eW/Q==
X-Gm-Message-State: APzg51CabWX2ENe9d1v/ju2G/34B5/phSCw9WJbo78uYZZSQKuJN+VQY
 l5tVmNzINQlNHFaVAOxojfYjsG2Y
X-Google-Smtp-Source: ANB0VdZNyKfOK7rnz62xthbD4Rud7VRzxQCr/1hm8RwtQ9PuByJAipA14ioJZsp6XDWuwMd1gXNB0g==
X-Received: by 2002:a24:5753:: with SMTP id
 u80-v6mr4045107ita.21.1535951961576; 
 Sun, 02 Sep 2018 22:19:21 -0700 (PDT)
Received: from aurora.jms.id.au ([209.82.80.116])
 by smtp.gmail.com with ESMTPSA id b130-v6sm5625708itc.34.2018.09.02.22.19.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Sep 2018 22:19:20 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Sun, 02 Sep 2018 22:19:17 -0700
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.18] ARM: dts: Add OCC description to Power9 dtsi
Date: Sun,  2 Sep 2018 22:19:13 -0700
Message-Id: <20180903051913.25145-1-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 05:19:25 -0000

These are not in the upstream submission. They are required for the out
of tree OCC HWMON driver.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/ibm-power9-cfam.dtsi | 6 ++++++
 arch/arm/boot/dts/ibm-power9-dual.dtsi | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
index 5bda517f93cc..945e57993e27 100644
--- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
@@ -4,6 +4,7 @@
 #define __MAKE_LABEL(p,i)	p##i
 #define _MAKE_LABEL(p,i)	__MAKE_LABEL(p,i)
 #define HUB_LABEL		_MAKE_LABEL(fsi_hub,CFAM_CHIP_ID)
+#define OCC_LABEL		_MAKE_LABEL(fsi_occ,CFAM_CHIP_ID)
 #define I2C_LABEL(n)		_MAKE_LABEL(_MAKE_LABEL(cfam,CFAM_CHIP_ID),_i2c##n)
 
 #address-cells = <1>;
@@ -87,6 +88,10 @@ sbefifo@2400 {
 	reg = <0x2400 0x400>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+
+	OCC_LABEL: occ {
+		compatible = "ibm,p9-occ";
+	};
 };
 
 HUB_LABEL: hub@3400 {
@@ -101,4 +106,5 @@ HUB_LABEL: hub@3400 {
 #undef __MAKE_LABEL
 #undef _MAKE_LABEL
 #undef HUB_LABEL
+#undef OCC_LABEL
 #undef I2C_LABEL
diff --git a/arch/arm/boot/dts/ibm-power9-dual.dtsi b/arch/arm/boot/dts/ibm-power9-dual.dtsi
index 8807c1106566..d66c97a84b33 100644
--- a/arch/arm/boot/dts/ibm-power9-dual.dtsi
+++ b/arch/arm/boot/dts/ibm-power9-dual.dtsi
@@ -21,6 +21,15 @@
 };
 #undef CFAM_CHIP_ID
 
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
 / {
 	aliases {
 		i2c100 = &cfam0_i2c0;
-- 
2.17.1
