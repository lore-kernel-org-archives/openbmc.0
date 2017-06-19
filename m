Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrd1v4fz5zDq7c
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 14:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S500BkED"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id f127so13971159pgc.2
 for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2017 21:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=2emdo+ptnE+LWY5NAC7c2cI2T6ZUFCr9wrzrPWEcQCk=;
 b=S500BkEDsZAECB5eJ4VgiJaIpB32JF5p1/Hqxy7zUvGQV9dhZoQozLM172Rie7YQaI
 4ESk+fW0+TtUQrUcbAcmkxlVp2Jdzjsza+G5OoUsm7rxN4meaCI1+MoxA3LoQ2w3xDVz
 0vS/r3GjsSmeRBltbXZ20AMmZMhK3946aQt8W06iVxIwpzA39w7s4nbihMuuGgnjgcdq
 wWlyx04Q8Kro6UFQMrJZVA/X0NxQSp0HTACs6zvtO3uOAU6LQpYyAkT2e71ZUPpzg1lz
 kVvcuP+JCZges9Yf0b937h6oMkwDfUlzqPTO0m2Ug5+WnfVPAiI5NXqwo6OGCCi2CW53
 03tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=2emdo+ptnE+LWY5NAC7c2cI2T6ZUFCr9wrzrPWEcQCk=;
 b=i1ZaKTd/odvSCNN966KdsdBYGg4yCCbOgEu50MczOE9lPK1t8f6lsJQk8NQlaanEtb
 NcXEYOAsfuxNeBdV853BsZtf3ZOaNyjudykAv3o+Vf48nRbabo1VEs8bVfyp/1tai5yY
 S4oSee1u+knK+6X1F5395+1OeDRRBDeVKfVTfwoYI/x9mmqbv9d/RGXpAIvuFTUR1nwN
 sa4V0XjyqtHxcckiANLbxyfUNZ5kMo/aKQjVSxs4PpWFuwgT4ZnNLwqzHnnaCENR0QZK
 lbeuSk8rI3gVoYah9iALlhghN4T3xe70ESFSsEA6FImrHtiUS8jFXIBw6knLZNmfsEJc
 NjgA==
X-Gm-Message-State: AKS2vOyytcbSpAvH/nMbrgg7SMMwvDwascuD+k7yLwLr8I7K812i72NR
 YDmb6nDc1CgISZznCtc=
X-Received: by 10.84.217.7 with SMTP id o7mr20249322pli.156.1497845744649;
 Sun, 18 Jun 2017 21:15:44 -0700 (PDT)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id t128sm15894730pfd.64.2017.06.18.21.15.40
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Jun 2017 21:15:44 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 19 Jun 2017 13:45:37 +0930
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: Matt Spinler <spinler@us.ibm.com>, Xo Wang <xow@google.com>,
 Lei YU <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>,
 Patrick Venture <venture@google.com>
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: Enable WDT2 for all platforms
Date: Mon, 19 Jun 2017 13:45:33 +0930
Message-Id: <20170619041533.26446-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Mon, 19 Jun 2017 04:15:48 -0000

Some versions of u-boot leave watchdog 2 running, but some do not.
In order to handle all of the u-boots in the wild, ensure Linux is
loading a driver for it.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
If you're on cc, please reply with an Ack so I know that this change is okay
for the platform(s) you care about. If I don't have objections by Wednesday,
I'll merge.

 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts   | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index ff5058ee8834..9bfd5462ea9e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -201,3 +201,7 @@
 &pinctrl {
 	aspeed,external-nodes = <&gfx &lhc>;
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
index 9f7098876ecb..e4e853d0f561 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
@@ -184,3 +184,7 @@
 &vuart {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
index 430622c86ef7..873e62ce6673 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
@@ -224,3 +224,7 @@
 &vuart {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 8ebed01e7725..f7a7cbf77aba 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -324,3 +324,7 @@
 &mbox {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index dd01dfaa8509..d53dc597a0ce 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -257,3 +257,7 @@
 &pinctrl {
 	aspeed,external-nodes = <&gfx &lhc>;
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 99003b9fb54b..31315d03dfb8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -419,3 +419,7 @@
 &pinctrl {
 	aspeed,external-nodes = <&gfx &lhc>;
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 68baf3288263..ccf6cad2e382 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -386,3 +386,7 @@
 &gfx {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index a73d33d4ce90..e609c53d58f5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -244,3 +244,7 @@
 &vuart {
 	status = "okay";
 };
+
+&wdt2 {
+	status = "okay";
+};
-- 
2.11.0
