Return-Path: <xow@google.com>
Received: from mail-pg0-x229.google.com (mail-pg0-x229.google.com
 [IPv6:2607:f8b0:400e:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7pQz5RCFzDqkm
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 07:11:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="u3UC+VT1"; 
 dkim-atps=neutral
Received: by mail-pg0-x229.google.com with SMTP id k14so35470910pgr.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAlVClx0azBYlF8K/+GVsx3MkhAlDdNIslL60BYebWw=;
 b=u3UC+VT1GscAkKysvytY06ZgeQcxe/3kRD58gWkcoBiKChvT1D5H+dmYyQU9p3X3H7
 zwzrN0P65uhEWpxqVASHIeK+/Y+EL+eRvWBIIVl0hAEgGlpdv1X37ncIO6AZoOmveiS2
 LJ5NWiGY94QoB3Y4vnTB9SkmlxhZBckAt+gqVPEgZeLWIOYWvDiXQTY4437selqCJlQ/
 WudWgG33L4yBDKCfEtb1MD7T9gWP/nI3LgVbOrrTXS0NH3BMdZbqkV+Ai6Vyj3OV1nS9
 m5kMPgTQqLnWiBZYSWw+FkUyt/bbJAu0z8BzPCBcHKK+7f3/kGkVkqUWIKgV358Ed7vl
 yKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sAlVClx0azBYlF8K/+GVsx3MkhAlDdNIslL60BYebWw=;
 b=SPZDA4wUP22iNQA4E8PCaUhRSxoiU7C9fxoCyteOVfxnTH4Yn4hVfolzn16EmpB9r/
 KTVKzLz+aUNfq0svahqzmk+jvG/XZS28HFnVdMQ0GRyK0Mdgf4WnmC0EONSqC5PdSHYi
 RWndUuv6q6jR9LLHTdJxQvFHAX36TLyjRpB2Az371bJG/TS9Msp2IYrnvZ73alipLXjp
 PF0/aYq2JpeqRIuH7UUrdPWARZlfWA/LWEobvJNf2LHgFk/zeWy/55sCrY3qQaM/SzW3
 QfwaN7GGlFUidGBL2vuKLC9ZYe5aqYzb5JhvIWfs/w7lGoCUtrshSok6/HQsIJLe57nk
 ennQ==
X-Gm-Message-State: AIVw110+0/MjPB7HDIxs8sfELCoLCE+n/jI12K5yjK/JJ9Bt/XtYrGiM
 WDNP4pnBZTVGja17XL8ZbA==
X-Received: by 10.99.95.147 with SMTP id t141mr11010936pgb.263.1499980296591; 
 Thu, 13 Jul 2017 14:11:36 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id t83sm11976808pfg.91.2017.07.13.14.11.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Jul 2017 14:11:35 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux,
 dev-4.10] ARM: dts: aspeed: zaius: Add gpio-keys with checkstop
Date: Thu, 13 Jul 2017 14:11:26 -0700
Message-Id: <20170713211126.111342-1-xow@google.com>
X-Mailer: git-send-email 2.13.2.932.g7449e964c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 13 Jul 2017 21:11:40 -0000

Report the checkstop GPIO pin going low as keycode 57, per OpenBMC
monitoring requirements.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index c6200153a065..353e37ad44ca 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -47,6 +47,16 @@
 		gpios = <&gpio ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		checkstop {
+			label = "checkstop";
+			gpios = <&gpio ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(F, 7)>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.13.2.932.g7449e964c-goog
