Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE467C433F5
	for <openbmc@archiver.kernel.org>; Sat, 26 Feb 2022 13:34:03 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K5SKP5VCGz30L1
	for <openbmc@archiver.kernel.org>; Sun, 27 Feb 2022 00:34:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ggOJxiaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ggOJxiaJ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K5SG16j7bz3bb2
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 00:31:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 49309719;
 Sat, 26 Feb 2022 05:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1645882260;
 bh=P2xiTwQMAdsmqg/FNdUPZpligEXOXfRM8Fq/bDkK1gQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggOJxiaJk+r+zaC/lYAxsUBGPB6eFN2eGUKuZvCTz8cacYPhhwKLh7HF3CNxjBei3
 v/MXUEWW0JkhN7ie+lk4QM1kNVst++FbCthT+xF4qXybVHY87WIe9wbXIIRW6NEY+y
 9oXqc76g4sFHcKtbvysJ5MTa7am2ksKmq7L1saUs=
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 4/5] dt-bindings: hwmon: Add nuvoton,nct6775
Date: Sat, 26 Feb 2022 05:30:46 -0800
Message-Id: <20220226133047.6226-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220226133047.6226-1-zev@bewilderbeest.net>
References: <20220226133047.6226-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

These Super I/O chips have an i2c interface that some systems expose
to a BMC; the BMC's device tree can now describe that via this
binding.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../bindings/hwmon/nuvoton,nct6775.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
new file mode 100644
index 000000000000..7b1054db46b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct6775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT6775 and compatible Super I/O chips
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct6106
+      - nuvoton,nct6116
+      - nuvoton,nct6775
+      - nuvoton,nct6776
+      - nuvoton,nct6779
+      - nuvoton,nct6791
+      - nuvoton,nct6792
+      - nuvoton,nct6793
+      - nuvoton,nct6795
+      - nuvoton,nct6796
+      - nuvoton,nct6797
+      - nuvoton,nct6798
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        superio@4d {
+            compatible = "nuvoton,nct6779";
+            reg = <0x4d>;
+        };
+    };
-- 
2.35.1

