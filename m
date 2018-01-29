Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qKV2Pi6T"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVV3p0VKMzDrCf
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 00:00:21 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id 23so5099603pfp.3
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 05:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m6kCzwNoojsT6o7VhQp4OH6bAnsrYWDIAB6Jyt8KuZo=;
 b=qKV2Pi6TUSZwSxH/3c4g0Tv/hBi4R2Cme4DkTvC0DocOvwa0cb01p0YXYivS4WC4zI
 HzIUJJJ3HvB/6pA9AJ3ENdyr8Uqdsdj8I7IuboRKHLltHYI/S14aMwGpQ7IaZ2wkkW1r
 AT084yx7WK9bcRDNkMfX2YyQHHvab7PnX8qK7KJm060kC7ZhcJfjcDUPegSH1JtWNkuu
 7I7X/Xxt8dOUu7le4I8sZYFeUnyQdQCKIh40Ed/4wI8hluC2zyXnY6AwdHYFkSQaVAAL
 rBktRAlb8acOfY0rLv56qVlagIJr81+yBz4QOFWc3oHAN8wXSoshSeR3qYga7j31mtNL
 hb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=m6kCzwNoojsT6o7VhQp4OH6bAnsrYWDIAB6Jyt8KuZo=;
 b=tGs5ZeUDifbyoR1am54qVp9pbk3eq+JUFbrims1hlRqX1CC+EYPa5xIgTTXImLxB2d
 VEd8NZUGxIKXNwBQ2opXf4peuTZLAO7T6989Dfk8Y9mwwPQ89CA/iGYlmHqcL6AKfk3S
 e8paPE1odr9v96WjJO/dGrMAxCout7Qd5IIsC3LBZ672arlVJqIZsOtrJYuN+uOUlBTy
 V256BB1wTmTTUieUhMlPdW9HOz0KBRNDph2j61jL59ChhCVjOM78mUYOsRdHGzBKkKuM
 VtEvL5S1TxkCrrbA88X8mXlOcl+R1k7FqPrh79l8y5/llQmyFogZ4zhYoMmaKt3W69d+
 2ekw==
X-Gm-Message-State: AKwxytf0RV9ieSb9vCqqHcSz55NrPJXmnAjZH13q0WJ0N63KuAYfNaur
 PpfQkLZ8B9+kGKn65OBDvP0Ab3Tq
X-Google-Smtp-Source: AH8x226deBG51/3pRwfArOQU4LSbNRWqu1CRt0N9+KNq4l46ZmrxQoW/GKNxOwaa4xC3/mRQrohFGQ==
X-Received: by 2002:a17:902:820c:: with SMTP id
 x12-v6mr22494868pln.103.1517230819642; 
 Mon, 29 Jan 2018 05:00:19 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id 13sm32083160pfk.93.2018.01.29.05.00.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jan 2018 05:00:19 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 29 Jan 2018 23:30:13 +1030
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au
Subject: [PATCH linux dev-4.13 2/2] ARM: dts: aspeed: Enable IPMI BT node on
 OpenPower machines
Date: Mon, 29 Jan 2018 23:29:59 +1030
Message-Id: <20180129125959.10499-3-joel@jms.id.au>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180129125959.10499-1-joel@jms.id.au>
References: <20180129125959.10499-1-joel@jms.id.au>
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
X-List-Received-Date: Mon, 29 Jan 2018 13:00:23 -0000

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
