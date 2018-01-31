Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RIKmd34C"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWSCG0MLgzDrG0
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 13:40:10 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id k68so8866999pga.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=m6kCzwNoojsT6o7VhQp4OH6bAnsrYWDIAB6Jyt8KuZo=;
 b=RIKmd34CwSBOjdITNukWUjZhHuCAKqbbF0xLXvREGEgBSH4XwSvG+AAucsguUAR9Ha
 qHptoM5vW+DjFd8/ckx9dKLyXElCYiACBhomBtDSvAplAZACEnHcAymnJD2/7mWrSekH
 3HR8NlVdmSRW3p9H3Uti48xOQFkt923CBm1Jv/I2r9j+z16aAbWD1ylrh1Zzq6n4l9BH
 vD7bzZ/lyqNjd/cn5ZYSprG2Vof5Ypca/Hh92vBVY8+vBz2wmsBKeXdIb4L2xgzVqYXN
 qELhU4lR+7NvXRkoEatcz7RLezEIyJKvYm2OC+GG9PDIsB5SzdAYkewqcdUXcth3HG51
 A7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=m6kCzwNoojsT6o7VhQp4OH6bAnsrYWDIAB6Jyt8KuZo=;
 b=sNcyMRWkRIfEoAHzu34TApEY/MgMOlOapWarXLIeDkAeHjK7pzs+6oyQ7cZpx2cel2
 iYd6ZU7hX9+tjQxq9du85GFTrwUhrBlVBCBPavi0GgJPMTRwYNHQ0dmZBWa3t5wNGFvp
 OccAgIKxS8umLK/VzESh+kf70sOZrDNFLybJgc1nLdYJ/suHJhBl/OC2EwoBGj8NknE+
 +rWEOwAddVq/GaJP/DSXUy7fc6+lTYRU4J1esrLj4XIRhTp6td+TNFiU9P2fGvyLekbi
 n41Shn4MrcyH2p3wYSHXCRmJuytiVc9EM3tigja2aOkeRF++e0SCapZevIiWxlBPDMT2
 a29g==
X-Gm-Message-State: AKwxytecDX4auo4QUYcsuoQ6WY9561UM7l/SpKWoa8OTefhu8A/665PD
 RBfMI6zDFZILpGSzQPn8j8JY/SsU
X-Google-Smtp-Source: AH8x226IrBEZCTGL1SdrwHBtQ2oJNGllg1+sMn0hmc79i71x3L81XFta09AztEswFeP+4Y9Y9t9YVw==
X-Received: by 10.98.70.18 with SMTP id t18mr32317371pfa.14.1517366407929;
 Tue, 30 Jan 2018 18:40:07 -0800 (PST)
Received: from aurora.jms.id.au ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id r26sm40720776pfi.72.2018.01.30.18.40.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Jan 2018 18:40:07 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Wed, 31 Jan 2018 13:10:02 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	andrew@aj.di.au
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Enable IPMI BT node on OpenPower
 machines
Date: Wed, 31 Jan 2018 13:09:47 +1030
Message-Id: <20180131023947.24832-3-joel@jms.id.au>
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
X-List-Received-Date: Wed, 31 Jan 2018 02:40:10 -0000

These BMC systems require this device to communicate with the host.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index c03c4274f910..e64df1c3b01a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -114,3 +114,7 @@
 &vuart {
 	status = "okay";
 };
+
+&ibt {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index 09dab179e154..4039381f9361 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -270,3 +270,7 @@
 		aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
 	};
 };
+
+&ibt {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index b24ea9967fc8..5f8dbffa6b22 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -632,3 +632,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdtrst1_default>;
 };
+
+&ibt {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e7669d126df1..7f5a29566801 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -435,3 +435,7 @@
 		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
 	};
 };
+
+&ibt {
+	status = "okay";
+};
-- 
2.15.1
