Return-Path: <jaghu@google.com>
Received: from mail-pg0-x235.google.com (mail-pg0-x235.google.com
 [IPv6:2607:f8b0:400e:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tM3Gr1hNJzDvmh
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 18:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JccVHntf"; 
 dkim-atps=neutral
Received: by mail-pg0-x235.google.com with SMTP id 3so118987188pgd.0
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 23:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=il8qdBPZRMqBYz8xHa3Lrp2LO8wQZZ+POApk3N94czI=;
 b=JccVHntfpVsjRVSlxZqXV6kayWIP2NpHL68TzvII0QMfqk2fScX06QXPnmnBWRqweR
 ISlbOFN0JlzwooGhkYc4xg7WZLwFo75mXrLUyB1zj7LvkBxJiaNR+TcZvdJMFySQ6yxi
 CJy+W3UcStMYr6KB/oAmJjFFkef3+XC6CdnyVgPDnzRV05xuyHxGLPkzTFBDYOwmaa9V
 FhwV3pk3C4AFpIHX1DS4wVu+TFf6nBZcMl14kumxP3wNsX2zvvXA9W2OwDA3tVrr3ram
 EX/26kKH7Qlv1NrNtAzA0dMnJoGDzePkIv71A5qqhEWRU7/e2G8cyxe0aCBB+N3sB4WC
 58cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=il8qdBPZRMqBYz8xHa3Lrp2LO8wQZZ+POApk3N94czI=;
 b=d7jDmBP+91eBhw0Ly7/+DEmW6q2LiKo7HpqxJy33GA3BH/A53sZthhq0qEo9/U8pCo
 ZRhRl8vsUTB3GykghbXnMFvvmz18vfY1kvDTW3gKf8NG5w8Gv9I1KvA2uoKwkeJ39L52
 zd2u21b2sgq040JNoNkxwseMrJ4e3a0wB38qbMCkg1x2QwfOUKn3hJXyLViQel060fGo
 eJUlZv/zSZDcUUf2qMuJyF+7TeelIvmTCEM1Vp34fb2MQaIGLxgl4AAx9IyBUaAfLmuQ
 FJHsmIp/gPThybdNwCNpXLiFlDIplr+I/dPYghuItzodF81mgk7sNbi9mSUgSyutBWue
 C1Aw==
X-Gm-Message-State: AKaTC03sPnpmVYjZv2+3U4b4hILadV74kPAvZZ/XjifegV0s34OEYEVjkNiJ51uwerQTeUAU
X-Received: by 10.99.100.132 with SMTP id y126mr17795760pgb.177.1479626866548; 
 Sat, 19 Nov 2016 23:27:46 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id r2sm28825975pfi.67.2016.11.19.23.27.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 19 Nov 2016 23:27:45 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 1/4] Documentation: dt-bindings: Document bindings
 for seven segment display support
Date: Sat, 19 Nov 2016 23:27:33 -0800
Message-Id: <1479626856-18511-2-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1479626856-18511-1-git-send-email-jaghu@google.com>
References: <1479626856-18511-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Sun, 20 Nov 2016 07:27:48 -0000

This binding provides interface for adding clock, data and clear signal GPIO
lines to control seven segment display.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
v2:
- No changes made

v3:
- No changes made

v4:
- No changes made

v5:
- Made the binding documentation update as a separate patch

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
