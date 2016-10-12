Return-Path: <xow@google.com>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svTTB0NnyzDsrd
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 09:45:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=AB2SmVPG; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id r16so1288826pfg.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 15:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pt7ggki9Ga8ebuyVQ2k/HtH1TMcYzF6S2a6FrVTk8oY=;
 b=AB2SmVPGrG92ErOVC8c8mXXd5MOS2xFiejcCZJpkG5jYPqYdd7wYDbAtHO9fV35pBy
 9fa2mIqGjojmH5JsypqnGW7k0fr21DCGTh5ITYeid0PVF44R8KBSgGBU3GXPquXXx2vf
 XY2fGKJPR5q16vTvNsr80QKgmGAk6n+jZCZ4nILIfqHI3EP24P58Vb3qgq82slb74eU6
 4ucX9eYk09gsudVV68do/SCQnOslQo4hfZg2tJwJJjCDA8DG/ftfPEUy0yoWJmKIFfmc
 HutPbXAK9dcATk6P9uJogMKp0TDgWzuRuau9LlTz0hkADT2+SsWdulwl2RoxPh7f14it
 H/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pt7ggki9Ga8ebuyVQ2k/HtH1TMcYzF6S2a6FrVTk8oY=;
 b=OHOAGvUhDZL0ki5ObG73PLENpCeraG6Bza+9ApK8R52OR78kLZPYJu6SFmWYmwb25N
 qFWdiga9wf3bNIZ4UckmIGxVzyCxvj51CPZNoFpF935TT6X+qMa7WwfIlmySPNrsraLu
 IqkNM3zbq5HRKag+346+SP3SIfYCIo6ibwiZvsup2xyl9Bn9FLaZLJCRKdOp6jRfKLjL
 1yrkF9X34/kMQ5fyUZGjF+dHiHXl/4mOCvzfGCS5STGRwKCFn5OiGOSKmSDUpoqBccUp
 Xq8DZ+S1bPuixRhLNy67Fe4OebLMXp2VXXGYtbKCSW7sYEU8f1NbZjuXhPmUMAfLj5sp
 MkpA==
X-Gm-Message-State: AA6/9RkNoJOKdry1iN1BBFDSO5Gz8Khki8XC7irVDF4yDC6E5OL5F43eURaFYuQr1/MEu42y
X-Received: by 10.98.217.135 with SMTP id b7mr5298811pfl.103.1476312299797;
 Wed, 12 Oct 2016 15:44:59 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id z6sm14170700pay.31.2016.10.12.15.44.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Oct 2016 15:44:59 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 5/5] ARM: dts: aspeed: zaius: Add front panel LEDs
Date: Wed, 12 Oct 2016 15:44:48 -0700
Message-Id: <1476312288-100725-5-git-send-email-xow@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476312288-100725-1-git-send-email-xow@google.com>
References: <1476312288-100725-1-git-send-email-xow@google.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 22:45:02 -0000

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 8c3912a..eef045b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -59,6 +59,30 @@
 			};
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		sys_boot_status {
+			label = "System boot status";
+			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		attention {
+			label = "Attention";
+			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+		};
+
+		plt_fault {
+			label = "Platform fault";
+			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
+		};
+
+		hdd_fault {
+			label = "Onboard drive fault";
+			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &uart5 {
-- 
2.8.0.rc3.226.g39d4020
