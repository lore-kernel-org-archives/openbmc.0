Return-Path: <jaghu@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHW1K0KCjzDqBN
 for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2017 15:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NYfuDODS"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 194so34558293pgd.2
 for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2017 20:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eYNadqWXoCeFxjzPFI54kbJwCb+GVwCcstrTyBj1pNY=;
 b=NYfuDODSu8J6ocnFe11nHxMMBQB3Xj90obT7Wzv4E1nM73dftcBHYd+sEQGMOphFwA
 /Xfm3uGw/xI0X+X+YrPLDnXfOhjlMYy01Dh5zcXMkK8qmq2eM0tNYUcBg1xja01lUPcb
 Qwqa13bn+kgE3I+qT1eylN42NK2T+Q/1Jan0rwyLpSIlMhiUC1D0vxk+AC7I7NPRN9z4
 54adkMCnjw4cmWDfCv+Hjn+SZS1ROHwY5q9nWy5kNIcPKrneJvrb9ZIdErJEWD9jcmCh
 BDbAXh/F325GAq/FDs+RoybMRFpH7chwFfP2PuRqR6jJIeaM2x4yrY21fgNI/OwG0XKp
 FU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eYNadqWXoCeFxjzPFI54kbJwCb+GVwCcstrTyBj1pNY=;
 b=lQy2sQgApeetoXBk/ggzvSkZ9iCBGBIVmM+Zz3Q3WVqSah7nFYeJJd/bwDX27dNI2K
 kgbXCJjrDcjOnwqJtwNCdUaGXR4xRfqJffeNprlKfSPhdM6J/8A3xPOqoHpIImBK0Dn/
 Qlch38T/tDT0wQ+hZuzYNDQWHmzPsOsVWOfTuq+OaoTPD/EXn8X6/SV3ikpUjxr9sk/r
 uRye09d0GKs1m2pq+6/K9v+pQyBWJVoDZrfUonOePJhEkrZKr8bt7AAKJR0xZ+jpCxxF
 O7R5ir72NZwDou5UbNkUJ8a3GT2SAp8xoVNWyEmUFOlLrCPZYmSiTGvm05OdX8oTxVWn
 jk9w==
X-Gm-Message-State: AIkVDXJ2GzwaeDjNT2SmZLxKSUvr15s366BM4dEP6NXrBbrk88HRhsk+H2mgTZvDzG3aa+nz
X-Received: by 10.99.3.5 with SMTP id 5mr18012328pgd.150.1486440242616;
 Mon, 06 Feb 2017 20:04:02 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id p25sm6289384pfd.0.2017.02.06.20.04.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 06 Feb 2017 20:04:01 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 1/4] Documentation: dt-bindings: Document bindings
 for seven segment display support
Date: Mon,  6 Feb 2017 20:03:53 -0800
Message-Id: <20170207040356.9891-2-jaghu@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
In-Reply-To: <20170207040356.9891-1-jaghu@google.com>
References: <20170207040356.9891-1-jaghu@google.com>
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
X-List-Received-Date: Tue, 07 Feb 2017 04:04:05 -0000

This binding provides interface for adding clock, data and clear signal GPIO
lines to control seven segment display.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../devicetree/bindings/misc/seven-seg-gpio.txt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt

diff --git a/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt b/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
new file mode 100644
index 000000000000..9a4e25540104
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
@@ -0,0 +1,27 @@
+This binding defines interface to add clock, data and clear GPIO lines required
+for seven segment display support.
+
+Required properties:
+- compatible : should be "seven-seg-gpio-dev".
+- clock-gpios :  Should specify the GPIO pin connected to the Clock line on the
+  hardware.
+- data-gpios : Should specify the GPIO pin connected to Data line on the
+  hardware.
+- clear-gpios : Should specify the GPIO pin connected to Clear line on the
+  hardware.
+
+Optional properties:
+- refresh-interval-ms : The interval at which to refresh the display.
+  If this property is not present, the default value is 1000.
+
+Examples:
+
+#include <dt-bindings/gpio/gpio.h>
+
+seven-seg-disp {
+	compatible = "seven-seg-gpio-dev";
+	refresh-interval-ms = "1000";
+	clock-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+	data-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+	clear-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+};
--
2.11.0.483.g087da7b7c-goog
