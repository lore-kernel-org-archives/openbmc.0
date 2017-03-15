Return-Path: <mine260309@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjjYg4ZDZzDqGk
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 18:15:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rO7JmGYT"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id g2so1293445pge.2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ai3J6rN2dSpg480/zGSUmoPagukz3foeeJwD1mDmX88=;
 b=rO7JmGYTYeeeEtQL4Cv/ApsKyOrkxW/sA0TnYk3xp2j1Qlg8TFz6GmS6s1ouumWBli
 U7V2Z8F25pGleA7nNmGFKKanGZI/78dbJyW1C6t6YBsHOGU9SB5KVcUfcLJCbAHcpwqE
 3XOU0whzu9qsbPXenCP8QQq/EF83bDbtBbhjsCOM8Xf5mGt9U8XQ1E6T8FGBHiQyWjuB
 +O+oBGngQkziMi6gRn0lTmttTaBEXBRgN0zeYqoFWLgTASei1z9QN6TWk7mKtWspRcpL
 p+WnIV5kY4RT+WVA/YxHQ9+xKI6TfPS67uhibSns5GjJKZ42DSq8clEt32y6ZsyT3cnX
 rskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ai3J6rN2dSpg480/zGSUmoPagukz3foeeJwD1mDmX88=;
 b=gwVrvobxGOPuHXJgQSiJ0KrhxxOFZG7gWXSlAhatF2sdRh4go7pk4rGquIlS29GgYB
 ZunzACLb0nukJwl3vfLswHcPxr2tcDEGDoL9q53OHJkPCRWLQxw4GaoNUGg61VM51uej
 P+fqcKYb7hJQYa4psVCTLIfrIo+rPxFG7VcOtV5XenEghLCZ78N1yUHc/pztxExO1rYz
 B7Yvx6k8WTHskHFEa/jjbX0TYiPYBAV307NRbQ8e7xSwWsDH5XIEUVUYB+ytwoc7nUyv
 d3XLcZP4FiZNi84/B0Z/C2H+unP+gQrZjM5ISqcPuikVvrvyBvo3H55yTyxf02PyRnNa
 PNog==
X-Gm-Message-State: AFeK/H0vIwxp0mkJ64diL+1GeaO0NaI1pC5pXQfAzIEBoCEv7kxt222aZNwtYJIs+Qb+BA==
X-Received: by 10.99.152.10 with SMTP id q10mr1985977pgd.192.1489562133845;
 Wed, 15 Mar 2017 00:15:33 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id x15sm2046904pgc.16.2017.03.15.00.15.32
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 15 Mar 2017 00:15:33 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: Add GPIO hogs for
 nic_mode_func
Date: Wed, 15 Mar 2017 15:13:48 +0800
Message-Id: <1489562028-22480-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Wed, 15 Mar 2017 07:15:36 -0000

GPIOD3/D4 are the "NIC_FUNC_MODE_0/1" pins connected to Broadcom
5719 which control the PCIe functions.
Add GPIO hogs to pull down GPIOD3/D4 to use that function.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index b8b2d7f..2266c85 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -181,6 +181,21 @@
 	status = "disabled";
 };
 
+&gpio {
+    nic_func_mode0 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "nic_func_mode0";
+    };
+    nic_func_mode1 {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "nic_func_mode1";
+    };
+};
+
 &vuart {
 	status = "okay";
 };
-- 
1.9.1
