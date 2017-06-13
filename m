Return-Path: <venture@google.com>
Received: from mail-it0-x229.google.com (mail-it0-x229.google.com
 [IPv6:2607:f8b0:4001:c0b::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wnNR11m89zDqL3
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2017 07:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X61vzbbw"; 
 dkim-atps=neutral
Received: by mail-it0-x229.google.com with SMTP id m62so48923778itc.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jun 2017 14:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:signed-off-by;
 bh=aE+iFiHwyEyy0GDUadL7H99UC/Wb44eu03smCOvLceQ=;
 b=X61vzbbw+wOhK9Vgipvi9xZE5up6fLALIKAskMRAhG0zcwYvB/HsaFy6LFL7Ri2own
 WQoLxpADOLi6fyG0hkyt6X8Sw+8GytJfScEud/8lfLc9xH2btOPzft2Ie5Riusw7GYRw
 0Ig/PD5Oydvpm/xMRCkSQKWRZ/D7TQHaEJZo11tR+/gvq/mbkNoBfp6PTUgU3L/yiWlX
 IvG3l7cEm7DMjYjbURGDELUQJmeKGzMmyEPIJrXLzAbWmg0PrzK0hWjTkAp2vpKOVIfG
 Y0HXIKMeokbTP2603v8t3hRChMBNh9yWaVbcxoxmWq9/jbpcdubQla3azZvkLrDNQBp+
 5BZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:signed-off-by;
 bh=aE+iFiHwyEyy0GDUadL7H99UC/Wb44eu03smCOvLceQ=;
 b=hubtqmrnh+CzBjSIh2emuUl/lkUtuXZH5W72yYeZXk//UmdDP9LQveqQ9XlzVmpMx0
 1bdzawc3f63dg098raUSRL+y35U+nbBpfztQsSB5KU/B9W3oYzv536jjlpDpME7RauQ1
 eVTZp7o/U+ipNeuKihUHoILxnfZ9cxkfgN/a4QFb2Xo7eN9DtGm/vUoljM/hCZYYKee1
 CvuR/sJf/xOn6wc4CYjJ/nXjgvg3nnnwGlg2Esa3Z89rLa5m2okXTtl8LX/YL/tHupDV
 GERhGjcyy2FihMgAOyCSyUpxkcyKmW0a2Yfef3DZ0h2OkZexNRRf6PpanmRd4Lx3YpXk
 g5HQ==
X-Gm-Message-State: AODbwcC5AZD7n7P2ovY4VPfdl/Z1MvuwG6SyoJ69KU1h2hwUvyAnT7m4
 n3bsqUnXcrOWsge7
X-Received: by 10.36.178.26 with SMTP id u26mr20341353ite.102.1497389865951;
 Tue, 13 Jun 2017 14:37:45 -0700 (PDT)
Received: from venture.svl.corp.google.com ([100.123.242.104])
 by smtp.gmail.com with ESMTPSA id j62sm6943209iod.29.2017.06.13.14.37.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Jun 2017 14:37:45 -0700 (PDT)
From: Patrick Venture <venture@google.com>
To: venture@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: quanta-q71l: Add front-panel LED
Date: Tue, 13 Jun 2017 14:37:36 -0700
Message-Id: <20170613213736.95374-1-venture@google.com>
X-Mailer: git-send-email 2.13.1.518.g3df882009-goog
Signed-off-by: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 13 Jun 2017 21:37:49 -0000

From: Rick Altherr <raltherr@google.com>

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index 50be8dd921cf..51ddce0d9222 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -30,6 +30,22 @@
 			reg = <0x47800000 0x00800000>; /* 8MB */
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat {
+			gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			gpios = <&gpio ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &fmc {
-- 
2.13.1.518.g3df882009-goog
