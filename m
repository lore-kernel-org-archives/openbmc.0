Return-Path: <3RrfHWwUKB7chrkvfdlldib.ZljlmbkYjZifpqp.lwiXYp.lod@flex--kunyi.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::34a; helo=mail-ot1-x34a.google.com;
 envelope-from=3rrfhwwukb7chrkvfdlldib.zljlmbkyjzifpqp.lwixyp.lod@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ddhw3KSS"; 
 dkim-atps=neutral
Received: from mail-ot1-x34a.google.com (mail-ot1-x34a.google.com
 [IPv6:2607:f8b0:4864:20::34a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b6Hc0nH3zF3TJ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 09:27:20 +1100 (AEDT)
Received: by mail-ot1-x34a.google.com with SMTP id q23so20909865otg.9
 for <openbmc@lists.ozlabs.org>; Wed, 17 Oct 2018 15:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:cc;
 bh=Y3dOOoJ3k1/pt/2HO0ztXr3ZxTEqnAXn7l1xFrknVgw=;
 b=ddhw3KSS1y5kiwUCrxcc/gPSedSWZ5YAPlcbWsQ8dG0PQaKyF7s/GHnq432VdkNiYa
 YBIqLMTdhmKcMLDVnfSyLYr+pgynNAoswfVGNvbKh246/b42znnOwgToka3y66CqKQVS
 rz6OMfff1PcHjWezBksDi4nFxRA/+pj8zYhKKSg9mmsHLktb5cUX2nxb5D7DqB2ey2Ip
 k8ukAyWI95xeU73s7HKdkmZ10Vds2N90FUO93eIV6++rjDAYJnhTluuFdrt7rlSdHgpY
 JSF+NZrKCsJfYeNWGET4s75CtVmscuDnUrwSztaD330O/CKSvjbueQnBEmmRTt6VhZTL
 SBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
 bh=Y3dOOoJ3k1/pt/2HO0ztXr3ZxTEqnAXn7l1xFrknVgw=;
 b=mWtDM8EqGeFmLJRpDCEe5I8jBU+E/yP3rnfC+AZvEcFcE0hTHipCRjFlGbc8VUy6mo
 5meYMozfZm1nyuwQv3c3lfGs15uQLCPIAgRKKxqHYFOoF0OqmFilWjSPmNJJhkbK/fn5
 WMfioGQhJin7OjQg64w0k1uTweOPtEnFJacIwl8ger03FRLxDcNJqsCVC3fiwAB79BpT
 6BBTCM0nZLarh5sZPO7/hQ15SE31tCJlupRyGfnguxnmk0V7WrvL5nbWnBkRG6gIiUyJ
 IuT818UZ5K81BIuALHzlAs97mK+T+RBm044CMT+3IGDBJT36IIbtdUj40K6fx6sJMHlG
 FfWQ==
X-Gm-Message-State: ABuFfogOX57SlxtyqYrwA4hKUyBN2q7GeUQVWiYe3KsR50NgHsgMAsDu
 4ZALXQ8MGkugFOYmtUjRB2VRswXbo4FC+ORuF/fX62E/pWlWJi+QGyV0lr1clOJ5/SOwzrsFNt4
 slqpmVea95yE6PJWi7+7L+pvntKHt8BldCB9rLR9EIiqm7YRuhbB67FoiY5WH7Q==
X-Google-Smtp-Source: ACcGV62Oo+q7GwylrMubYABFZdqNKgCCqLgaZV+JF5xgx5JVeNHyDG9uJsNW/FCuyUSJvo5Q9MrKjZHjxw==
X-Received: by 2002:a9d:5b74:: with SMTP id e49mr21433135otj.56.1539815238695; 
 Wed, 17 Oct 2018 15:27:18 -0700 (PDT)
Date: Wed, 17 Oct 2018 15:27:09 -0700
Message-Id: <20181017222710.254994-1-kunyi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.1.331.ge82ca0e54c-goog
Subject: [PATCH v3 2/2] dt-bindings: hwmon: Add adm127x documentation
From: Kun Yi <kunyi@google.com>
Cc: openbmc@lists.ozlabs.org, kunyi@google.com, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 17 Oct 2018 22:27:24 -0000

adm127x are hot-swap controllers that allow a circuit board to be removed from
or inserted into a live backplane. This patch adds the device tree
bindings documentation.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
new file mode 100644
index 000000000000..1ecd03f3da4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
@@ -0,0 +1,25 @@
+adm1275 properties
+
+Required properties:
+- compatible: Must be one of the supported compatible strings:
+	- "adi,adm1075" for adm1075
+	- "adi,adm1272" for adm1272
+	- "adi,adm1275" for adm1275
+	- "adi,adm1276" for adm1276
+	- "adi,adm1278" for adm1278
+	- "adi,adm1293" for adm1293
+	- "adi,adm1294" for adm1294
+- reg: I2C address
+
+Optional properties:
+
+- shunt-resistor-micro-ohms
+	Shunt resistor value in micro-Ohm
+
+Example:
+
+adm1272@10 {
+	compatible = "adi,adm1272";
+	reg = <0x10>;
+	shunt-resistor-micro-ohms = <500>;
+};
-- 
2.19.1.331.ge82ca0e54c-goog
