Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::241; helo=mail-pf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jRqkVI+X"; 
 dkim-atps=neutral
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWSC82G7LzDrCf
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 13:40:04 +1100 (AEDT)
Received: by mail-pf0-x241.google.com with SMTP id a88so11098725pfe.12
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=2gGU68LlwsoHKY7BrrofH9Xjd/qT5w25UvuNqaduqxk=;
 b=jRqkVI+XaTyWx9QxQvIpAf4ybFrDgQJ3u8X0N9+FnHI6KHp3yOjK3lRyQRxlaauIKm
 gWC7MmOuevr7/dt78xQGBRI9VoALc4s8ouVMrjygrhamVc8CFj2AVxHUrawexL8UIgbr
 jQkf0bZ2+W/Mh48sN17sVaLO2T9yL2oqNX5Ax+eHLdtCIodKnD0nEEHiNhwFhw0yrRVp
 tZ6FPnv4s6hh1ggNLcyhpAcYfQCqGzBq0/s4UvJqgDQOsf5mxhXKm0Bwe9jPNx2N3A5C
 oSKZJwa9REDnqsn4CA526dQalBEEqYFHkVA9p4JI8+DP094IvYUigK+tfO9ARPjYZ+hG
 DoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=2gGU68LlwsoHKY7BrrofH9Xjd/qT5w25UvuNqaduqxk=;
 b=gAs8FyVNSU0Te+pNB2QwUPbOQ8DfIbss8kEUC2XuvlqHaU8xbn6qSn2VtP4/gfjXK5
 uLcD4yPUvzaxZwQ/9AtintZ4d41xlhACKxRWUc5s2mjppZ37OPkeh/7TWTZB6luogS69
 5R9ARwZWFZQz5GR3hUd2JGSDopzJcHe3ozK5CJ/8dUGiRoEZrOGdNFu9NOSviXH++6aH
 TbSBKVzrslwf3QU2LdxMK6WXH8wm3UySxk6XA21rPqG/EsdG01W5wvA07Y+g5q8oVcyQ
 PFswgbcEyUPtVLqF+yJ3hllBUxEvWxzMZJOXNAe82BBEASW+1ZP52bX2Kohwh7YePTs3
 4rbA==
X-Gm-Message-State: AKwxytfpRHx/K5XVhg3GFlHPpDoJU5EyEUnPRLgeuM7s6Y3GuFPkWpUQ
 eHbTKElP66O362w6PPbT7COcnv8s
X-Google-Smtp-Source: AH8x2271+Xl/opbvC5bxMTIHLY2Ksj/giPBW5E/T27uWGbya2JtwLycNFkdLz64mgUTxOVZA/Ox5YA==
X-Received: by 10.99.123.87 with SMTP id k23mr25229419pgn.228.1517366401944;
 Tue, 30 Jan 2018 18:40:01 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id w12sm35378603pfd.86.2018.01.30.18.39.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Jan 2018 18:40:01 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 31 Jan 2018 13:09:56 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.di.au
Subject: [PATCH v2 1/2] ARM: dts: aspeed: Add IPMI BT node
Date: Wed, 31 Jan 2018 13:09:46 +1030
Message-Id: <20180131023947.24832-2-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180131023947.24832-1-joel@jms.id.au>
References: <20180131023947.24832-1-joel@jms.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 02:40:04 -0000

The IPMI BT device part of the LPC interface and is used for
communication with the host processor.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Fix bt reg node. It should be an offset from the lpc_host address,
 not the actual address of the iBT

 arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index e6f4047142a8..7e0da0b8cd12 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -246,6 +246,13 @@
 						reg = <0x20 0x24 0x48 0x8>;
 					};
 
+					ibt: ibt@140 {
+						compatible = "aspeed,ast2400-ibt-bmc";
+						reg = <0xc0 0x18>;
+						interrupts = <8>;
+						status = "disabled";
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2400-mbox";
 						reg = <0x180 0x5c>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index b7b42c7c89e1..f1b2fa204873 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -299,6 +299,13 @@
 						reg = <0x20 0x24 0x48 0x8>;
 					};
 
+					ibt: ibt@140 {
+						compatible = "aspeed,ast2500-ibt-bmc";
+						reg = <0xc0 0x18>;
+						interrupts = <8>;
+						status = "disabled";
+					};
+
 					mbox: mbox@180 {
 						compatible = "aspeed,ast2500-mbox";
 						reg = <0x180 0x5c>;
-- 
2.15.1
