Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYJ171FJdzDvyN
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 10:36:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DLDL2DHs"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id 3so154436210pgd.0
 for <openbmc@lists.ozlabs.org>; Tue, 06 Dec 2016 15:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DpZbCNYaF3HDAZXm9zzEthhQIULWfEylQSbeITPZ48s=;
 b=DLDL2DHsIvSFj+JjfuPzBrYmVx/Nd/9eX0DZA0ejd4mBrGvEShpytGXX7BJRloCail
 VLVtwKWNat/gR2sTCQqjDfHyJyno/x6g4bnQPEi1qKRwHzQCWJBODv0nKGXPw/1ooLVl
 4BvjPF4MwtV4ow+r1hDSUpMH1eTg1v7LmHzKuZRqna0/K1VA30Dxqcodu0sXxWxwzquZ
 dVsLn9XUVuhHyL6yLRqA3ZNUXcsHvp2GlmI9ndYYNc6IpSoaE9Q7MeViY0++lcj5lF7l
 vDNiWoZddAQM7sbbLY53mXwBKPPlyOGI2FQuKWDkUh+CDphf4OHYyxFJL3PqWDlWdxDy
 l9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DpZbCNYaF3HDAZXm9zzEthhQIULWfEylQSbeITPZ48s=;
 b=Q9W6TOe821A+7xF8Fp/XtVrRHCk/fr35yTvVkZbtSSW2KXpkLi2h5paBThNH0zR+1e
 fVQ9n2zfLcEUPH5qZiPH3TMGwvO+hMwsr46Ke24yDa1OMUHlPRlgYE0NDYccjWUsgEY+
 r4RbvZhOOFsWpxGGY7DXOznptvq/LKR9Wi1hZfXa34mRK7VTMp5XF+rmRnnEzAE6jhnb
 qBBFMzRwmfM70yzFNml1Joat7GYuAxz6pExFVoZgGFj6OHFujZGFbEKXDCCGFVOid3Tv
 rIDsj1pQSE7H3/EZrvgkDA2zI+DJ6zUnYoIUIzxlIvXR9CO4sxvvv0C2iA5JoIn5VEfN
 B7Ig==
X-Gm-Message-State: AKaTC017traTPT3Dd63zjkazuRoeWfyaW9VhzbAj+0gFxYbndPFy5KDKGYDquSiri3Tlfzn4
X-Received: by 10.99.107.4 with SMTP id g4mr117502711pgc.108.1481067385156;
 Tue, 06 Dec 2016 15:36:25 -0800 (PST)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id b126sm37142409pfg.90.2016.12.06.15.36.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 06 Dec 2016 15:36:24 -0800 (PST)
From: Brendan Higgins <brendanhiggins@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Brendan Higgins <brendanhiggins@google.com>
Subject: [RFC linux 2/2] spi: aspeed: added device tree documentation
Date: Tue,  6 Dec 2016 15:36:03 -0800
Message-Id: <1481067363-3782-3-git-send-email-brendanhiggins@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481067363-3782-1-git-send-email-brendanhiggins@google.com>
References: <1481067363-3782-1-git-send-email-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 06 Dec 2016 23:36:27 -0000

Added device tree binding documentation for Aspeed AST25XX SoC SPI
driver.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 .../devicetree/bindings/spi/spi-aspeed.txt         | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-aspeed.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-aspeed.txt b/Documentation/devicetree/bindings/spi/spi-aspeed.txt
new file mode 100644
index 0000000..8b774d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-aspeed.txt
@@ -0,0 +1,33 @@
+Device tree configuration for the generic Aspeed AST25XX SoC SPI controllers.
+
+Required Properties:
+	- #address-cells	: should be 1
+	- #size-cells		: should be 0
+	- compatible		: should be "aspeed,ast2500-spi"
+	- reg			: address ranges for the control registers
+				    and IO ports. There is one IO port window
+				    for each chip select.
+	- interrupts		: interrupt number
+
+Example:
+
+	spi1: spi@1e630000 {
+		compatible = "aspeed,ast2500-spi";
+		reg = <0x1e630000 0xc1 0x30000000 0x02000000 0x36000000 0x02000000>;
+		interrupts = <59>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+		flash@0 {
+			reg = <0>; /* chip select number */
+			compatible = "jedec,spi-nor";
+			spi-max-frequency = <100000000>;
+			status = "disabled";
+		};
+		flash@1 {
+			reg = <1>; /* chip select number */
+			compatible = "jedec,spi-nor";
+			spi-max-frequency = <100000000>;
+			status = "disabled";
+		};
+	};
-- 
2.8.0.rc3.226.g39d4020
