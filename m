Return-Path: <SRS0=EFpz=I6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ADBC43618
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 18:43:06 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A890B606A5
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 18:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A890B606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBBrm2Yk0z3btn
	for <openbmc@archiver.kernel.org>; Fri,  2 Apr 2021 05:43:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Usq/elWS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Usq/elWS; dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBBqS63mFz2xb8
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 05:41:55 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id f16so3321171ljm.1
 for <openbmc@lists.ozlabs.org>; Thu, 01 Apr 2021 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ecxr54BVhuqNisUJnZY8IMeAL2386jwWLTsil5N/OSc=;
 b=Usq/elWS/FL4+uMyRotTqsaI/CQhK76qyZJ+fCg/rq9gdTylA3DjJOlRE0jzz52BwO
 4KESiBvqbd+HFN57+UOxaL1BUK6nW+bKbCnxs+zYsBQEg8apZh9d4sX5I/+SRjOpzHTN
 P6ZOdDMnAYOe7ribueGsd/Cie16yvTicJ9YwQMRhwvo+EX+ZPwg9+/DT3yOeDFUUaKUc
 8uBFkqvvhfNtygWqTYV9kthsJtNGMneiuvWNVDIG8YgX6RG1D4O9p4SPmvXUrjkeRhQg
 Ei2aC/wVPcmshO9x6G7EzGlUGW3IBJxZDd00AZ/wU0KL8X3A1Oi85JAy1PkPkxnskJZ7
 h60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ecxr54BVhuqNisUJnZY8IMeAL2386jwWLTsil5N/OSc=;
 b=f9ecgrjEZo2i/hK/YMzIDHtOMe55+XKF7djLYRJYSJAi0kQ80uxT8iGWQEgBgueHx/
 c5E9mcTTes7ka+8WMcFoThFEmL9g5O0lxd7pvCV8vRdpL9opK7mBidpQsb3PPJQZOwJ5
 LijrDcU0804K6b5KxwQxmAiGrxb0SbgzeZcVmKcY6Uiq6JxTNRL06R4T4dS7cHD3bPqZ
 kgUrTahIu9FxP+VzvheaO9X9bxMnFpuL9lcnilUVdhxsBRS/XsJFtZXRQDW3Y6CH/k99
 6tvL1G7BA33J7SFbuqXoYJMVs6str2UBT9WjO2hy18WehxcIoSAotReVXDAnUp74c1Tv
 LJsw==
X-Gm-Message-State: AOAM530seRQNahbuhU5903GfFGwuXOp/7UBYx68hbsDFgXwsHQ7qbDz2
 0g4x6rzRGvBqDibxTrFb4js=
X-Google-Smtp-Source: ABdhPJxr/81IeM7jfyTPnc5LMDEafSkRafYpMRZ37e1IwQqjttiqXQAfujmmfgjB5COBzml/xgfE6w==
X-Received: by 2002:a2e:5854:: with SMTP id x20mr6199169ljd.59.1617302509040; 
 Thu, 01 Apr 2021 11:41:49 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-10-29.ip.moscow.rt.ru. [46.242.10.29])
 by smtp.gmail.com with ESMTPSA id 80sm621321lfd.14.2021.04.01.11.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:41:48 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: aladyshev22@gmail.com, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 1/3] dt-bindings: (hwmon/sbtsi_temp) Add SB-TSI
 hwmon driver bindings
Date: Thu,  1 Apr 2021 21:41:45 +0300
Message-Id: <20210401184147.2506-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Kun Yi <kunyi@google.com>

Document device tree bindings for AMD SB-TSI emulated temperature
sensor.

Signed-off-by: Kun Yi <kunyi@google.com>
Link: https://lore.kernel.org/r/20201211215427.3281681-4-kunyi@google.com
Reviewed-by: Rob Herring <robh@kernel.org>
[groeck: Fixed subject]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 .../devicetree/bindings/hwmon/amd,sbtsi.yaml  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
new file mode 100644
index 000000000000..446b09f1ce94
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/amd,sbtsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: >
+  Sideband interface Temperature Sensor Interface (SB-TSI) compliant
+  AMD SoC temperature device
+
+maintainers:
+  - Kun Yi <kunyi@google.com>
+  - Supreeth Venkatesh <supreeth.venkatesh@amd.com>
+
+description: |
+  SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
+  interface that reports AMD SoC's Ttcl (normalized temperature),
+  and resembles a typical 8-pin remote temperature sensor's I2C interface
+  to BMC. The emulated thermal sensor can report temperatures in increments
+  of 0.125 degrees, ranging from 0 to 255.875.
+
+properties:
+  compatible:
+    enum:
+      - amd,sbtsi
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C bus address of the device as specified in Section 6.3.1 of the
+      SoC register reference. The SB-TSI address is normally 98h for socket
+      0 and 90h for socket 1, but it could vary based on hardware address
+      select pins.
+      \[open source SoC register reference\]
+        https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sbtsi@4c {
+                compatible = "amd,sbtsi";
+                reg = <0x4c>;
+        };
+    };
+...
-- 
2.25.1

