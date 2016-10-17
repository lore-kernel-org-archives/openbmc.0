Return-Path: <jaghu@google.com>
Received: from mail-pf0-x230.google.com (mail-pf0-x230.google.com
 [IPv6:2607:f8b0:400e:c00::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syPqc0F8GzDvHv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 04:11:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=GYStE2sb; 
 dkim-atps=neutral
Received: by mail-pf0-x230.google.com with SMTP id e6so81171225pfk.3
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 10:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QXJRtS0i3FQFierWYqOOaXoVZ31s79++fMhRFws93S8=;
 b=GYStE2sbkckjI4LiRH/6lhFVAl6mUri7DvhkrHpUjLN91llJGRArE//J61UEVmtKaU
 hDssC5yMCs+JLWBglOEmygIazYNBYzd8eisG7AD9224G/iD0dI2q9WBHuN6XH5AkvtHA
 y8INiW5ESOn/0s4207LGm9lFd6dQuC5VVUEeFhx2FucVdWYKc/+DcwcC3RWvRe1JnKek
 lTJJ/72UA+3FC27BgPEOUldiSxx8td3Qz0wT4RM+P4yeYV8B2fz5IEYjrLgUk3/d7EpS
 VVoOdYh4jna64XIQjMgxvmEAjpUKIJ7tJVAyjOxU7Ik52yvS5vP7hdyVrUx3FG/gshIU
 x56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QXJRtS0i3FQFierWYqOOaXoVZ31s79++fMhRFws93S8=;
 b=lzJ4RBxmTD4wpRJjR1Rf4CqQ0GOueePoFMz28SPZz6daWBW+zb4UECIGBJLJpuJtI9
 dmVL51QkhUlzTwt2iUG+VVAUpSbwaW89t36Pe2oEUjpm7Q9W9xr+4vw0vMybNPGguePP
 I8zwQPNJTL9rvo2my6Qp3RP1J25got0erjQq1PFjc6elnfJiCY/F3Kp5/SPMNpxgy8Kj
 kSroaxiS32E2tUlxhKVlK545R7AkN8V1Zswnlvzvr8FtvdmXW03Z9KRJdqVYo1fBWVY+
 WIgAYSBNuSCvEMZ6tOpUK1HV7Lk7nKgBRFAplIA5+ZUQxsMYtP4omxgIURHjwhzcjX02
 k0Zw==
X-Gm-Message-State: AA6/9Rmggb0YsgeUgkRhySCLg6cM7RUcadkl2WKGm6UrJ0pfxfx2xx3ytD56K8rlqdv1DhyF
X-Received: by 10.98.61.85 with SMTP id k82mr39165403pfa.7.1476724266035;
 Mon, 17 Oct 2016 10:11:06 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id w65sm49482473pfd.48.2016.10.17.10.11.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 17 Oct 2016 10:11:05 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, raltherr@google.com, xow@google.com,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 3/3] devicetree: Add devicetree changes to support
 seven segment display on zaius
Date: Mon, 17 Oct 2016 10:10:48 -0700
Message-Id: <1476724248-15796-3-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1476724248-15796-1-git-send-email-jaghu@google.com>
References: <1476724248-15796-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 17:11:08 -0000

Add clock, data and clear signal lines to control seven segment display on
zaius

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4c4754b..7581540 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -1,6 +1,7 @@
 /dts-v1/;

 #include "aspeed-g5.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>

 / {
 	model = "Zaius BMC";
@@ -58,6 +59,14 @@
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
