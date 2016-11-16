Return-Path: <xow@google.com>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com
 [IPv6:2607:f8b0:400e:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK0pD1tjJzDvp7
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 10:29:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HE9VFXow"; 
 dkim-atps=neutral
Received: by mail-pg0-x22a.google.com with SMTP id x23so81413137pgx.1
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAyu2AYPiwOCY7nTWT2awNqSA7Rg/H7AFYKvXLwuwGw=;
 b=HE9VFXowrTLE9em97ziUVMGPZO2xPzXPm7OirFssFk55sSH8xD0gzq0o2RWlB/DeWb
 8SS+5n7dnDPFA64C1obbs11TjEgBopaDCPnz3TI2jsBNZweICz8/BruxE1YTCEL5ofJF
 VzXqi6g/rqmyt4XtoJIwnrbmoV3PBjQ+7d2+wQgSN5mPsWQFipVQbqJ9xzOCKd9i0fae
 6a7O34T2q5gAJ9Ljg00wqyLnS4704tF1Bwp7DS6f635j0wVoPe9Mjci0aF4PRRKtFhGO
 FTXiO5tqTDeC9dlah0q02XGggUy6SfZTJRWPL6knSvVQr+0KWok/s95fyJQ9m8+Mm4QJ
 5Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAyu2AYPiwOCY7nTWT2awNqSA7Rg/H7AFYKvXLwuwGw=;
 b=RdImGex36t96zJo/UmVVB1Hf91e3b6xjyqVbnKxDxMe2UlbLdIRsz1WdycVZzSxjfl
 nU0MqupO+jEag6XGx+vd9FnUXNnx0RldaYtO0uAyhIQsno7sCBWv4+tm8t/5SEFo67ff
 WZYor2Ak20QXUrcEC+rowTAwqyM002CxL2aLoKWu/uw+ntNiq/hFNfgfm2z0sgvq6jG4
 SOdH0TT80wyakY4DGnAwZ/OQ/UL+vmZKLeHlmkY9seKIW6uLCZh4OX/YaqN52evyIKWg
 cxPh74vgOOyV/e1HI6u153WLg+KS0i4y2KtL1gWInA8KzqewpUYe0EPpM0WPkyUMbijF
 tFtw==
X-Gm-Message-State: ABUngvd3u35cY8/9bscyYEH1RUoXw/VvjPLWU5olUTLewyzeydKGlANiBOojBHr7xhMH/NTj
X-Received: by 10.99.237.69 with SMTP id m5mr354595pgk.94.1479338960761;
 Wed, 16 Nov 2016 15:29:20 -0800 (PST)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id v77sm149381pfa.85.2016.11.16.15.29.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Nov 2016 15:29:20 -0800 (PST)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/2] ARM: dts: aspeed: zaius: Add 1-wire buses
Date: Wed, 16 Nov 2016 15:29:14 -0800
Message-Id: <1479338955-5248-1-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 16 Nov 2016 23:29:24 -0000

Add device-tree bindings to instantiate GPIO-based 1-wire buses. These
go to headers for DS18B20 thermal sensors.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index b52e45e..3d997d9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -20,6 +20,26 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
+	onewire0 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire1 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire2 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
+	};
+
+	onewire3 {
+		compatible = "w1-gpio";
+		gpios = <&gpio ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.8.0.rc3.226.g39d4020
