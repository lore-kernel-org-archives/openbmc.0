Return-Path: <jaghu@google.com>
Received: from mail-pf0-x233.google.com (mail-pf0-x233.google.com
 [IPv6:2607:f8b0:400e:c00::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tdpmN6Rn9zDw53
 for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2016 18:56:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="KF+/0EcS"; 
 dkim-atps=neutral
Received: by mail-pf0-x233.google.com with SMTP id 189so2800569pfz.3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 23:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d6CVoINaO1fCt0YfNHJEbxWUiyUinkOB5ep0QvdusN4=;
 b=KF+/0EcS10T0DYNcgqbTo3YlB7tLrfKv4iJIeSkT1S2B14AfskbOHrUkFjt6z1FgUg
 jBI3PQosEDjewHI1aYgpkU1vY5MGKIRRmJCWjVgXlYA2FTMmjL5v/uA5to+pKezRPANh
 QiHr8erLFNupaqY6AS0spaN3jn4jAA5tQjHWeITr8aiVUuli0qluHaInjqwPxbfa09iX
 6093xQwF0kkJE/gbbUoTISLuqpEJMtBvL/CntkUDCsqgUD9vo3gollWRbRt8JIvSXT01
 6FXEvSoMDj7Mx87qqJx9wbx9ZzE1wbwSfFeYpOiIGdQDN35sv2s1Jus/QAGy7tSbrBTB
 ebhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d6CVoINaO1fCt0YfNHJEbxWUiyUinkOB5ep0QvdusN4=;
 b=i+WmyVoQvyi/T33ceWiihRfIC/79oYejI/J/TWAKWuvH4522ruSTthu15YDebGQyCy
 mokhOnRYzJA6+FY1Pljfmlr5uqubKNx8OnIVOsn8+YZ2DdpAiEuM+LH97GFbgRA1rROs
 X/YhXf5FQaGD0zTHwqVqL4yCGjO5s7omYzeIwNIlfSw992EHgdqy0f9NTUSExlwtg2JY
 /ciFezY/R9VyCD7KdD8l/aua/YIZy0w6E0/RnH+B7FLzE6Tucgrr3SwTXhjQbCxMHP7r
 9BQVpmJ2zHanHYq92D/dPUsD6n/AiLtDaEwW4P/8Eo6HI4xy6ml9J4O32L1ktcMf0LM+
 CgPA==
X-Gm-Message-State: AKaTC00PNHNnVrgkgYQlMVMrfwCia4f4MxOFRAFS5YiiPV/ROVoJ79T9u5FZ6K5Siaf/5/k4
X-Received: by 10.84.217.199 with SMTP id d7mr204424559plj.165.1481702162642; 
 Tue, 13 Dec 2016 23:56:02 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y134sm84845071pfg.81.2016.12.13.23.56.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 13 Dec 2016 23:56:01 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Subject: [PATCH linux v1 1/4] Documentation: dt-bindings: Document bindings
 for seven segment display support
Date: Tue, 13 Dec 2016 23:55:01 -0800
Message-Id: <1481702104-8617-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1481702104-8617-1-git-send-email-jaghu@google.com>
References: <1481702104-8617-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 14 Dec 2016 07:56:05 -0000

This binding provides interface for adding clock, data and clear signal GPIO
lines to control seven segment display.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 .../devicetree/bindings/misc/seven-seg-gpio.txt    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt

diff --git a/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt b/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
new file mode 100644
index 0000000..9a4e255
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
2.8.0.rc3.226.g39d4020
