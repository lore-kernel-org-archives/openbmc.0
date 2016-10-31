Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7B0k4VgrzDvNg
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 10:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=bEM6GNHV; 
 dkim-atps=neutral
Received: by mail-pf0-x22f.google.com with SMTP id 189so30973719pfz.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 16:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2BiHEHv0jpQ7jenMUZrZBz7vfvd5qZ1v5rV0K7bgxnI=;
 b=bEM6GNHVbF3F+fUQsD3lbW41EHY78bQD6MtwjPrJusghCOPaT+vAtDuBBorcTraxMZ
 tZVvjwoN4Fmmai6kaSxNNG0RP3NXGdSx3YmnzZDKyL4EY0EaTmhMjYFuJNvIx7N+PsoG
 gbySHZc9WfdpGsHNzjoF7HwYWDGMd2sybbKTv80hE2M0/x8bGQbNWqzwzY6rvohYqMV+
 e3vSpB7wLBwW7ZkOD1QC2ZyyLksVeSgLs4cpYNCVKTOGsc2bB50byoDFuQWfHKgbCoEQ
 v81toow7VmXVFIxOVP/00udpnoXK5qkm5D6poYNRKvOW1mMw0Rf418B1EfV9bAp3NSY3
 p/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2BiHEHv0jpQ7jenMUZrZBz7vfvd5qZ1v5rV0K7bgxnI=;
 b=dP4HfxlpIJ/X+dBjm/h+QAB/MmunSpj/nKroxP/jUqBjSh2fvLj7YFM6Ir9DDRX3Ys
 wLRiYoQTOHb2bKoJusBAltzzsOMNSAy4ZrXYjOM5/rY8eusheYzBL6gd7vvAbjua9Ar6
 nKm7V8Bg7ZTeIELBsoPoxFg9cChTuiFCK+GNsd/Mt+kzU0ZnoCsQQSeBRyJxuvm0bO5u
 EaQ31AgyZrINRVzKC236CTvtEzUmAskuRgQResj5lweaOKzMfL8aoiCjRr00h46N4Dag
 f2vHHu7kaa3MXDK7SSL2Bht2UZSVPuFg8vQprIkyEb/JW/14btmYfZQSlJpRaGyK4a6+
 yejA==
X-Gm-Message-State: ABUngvfuSIsoHr+tuxnBv5CPjwc9rtqVVzquoEV93ZwP/tQ0iT6cuClHuHevMu47hDS9Kidq
X-Received: by 10.99.151.17 with SMTP id n17mr44841510pge.150.1477957764616;
 Mon, 31 Oct 2016 16:49:24 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id v84sm37824374pfd.91.2016.10.31.16.49.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 31 Oct 2016 16:49:23 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v3 3/3] devicetree: Add devicetree changes to support
 seven segment display on zaius
Date: Mon, 31 Oct 2016 16:49:12 -0700
Message-Id: <1477957752-4831-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477957752-4831-1-git-send-email-jaghu@google.com>
References: <1477957752-4831-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 23:49:27 -0000

Add clock, data and clear signal lines to control seven segment display on
zaius platform

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4c4754b..cdead36 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -1,7 +1,7 @@
 /dts-v1/;

 #include "aspeed-g5.dtsi"
-
+#include <dt-bindings/gpio/aspeed-gpio.h>
 / {
 	model = "Zaius BMC";
 	compatible = "ingrasys,zaius-bmc", "aspeed,ast2500";
@@ -58,6 +58,14 @@
 			};
 		};
 	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = "1000";
+		clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
+		data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
+	};
 };

 &uart5 {
--
2.8.0.rc3.226.g39d4020
