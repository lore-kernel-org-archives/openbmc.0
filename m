Return-Path: <jaghu@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD8nc4PgmzDvbd
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 13:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oO3ugx8C"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id i88so117029918pfk.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 18:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0Q57uOqM2x+HTXaGq4rKd/aQZaSRQ3xeqsV+KE/7WiU=;
 b=oO3ugx8CqYKa1Fps2hf5vyjPsFf2mp7B2AreAimW0eA32srnflM+Zze+5juHjV1C1Z
 m0NMWnpARDM58gMV8l5eHve/ypB0qBG0t0Iuu4fMdZl8o9KXPLKwt74Rzz+SMyJXmuZf
 aZ4lVLnB4qRUecgYGLm5+M8ePZzlcQaE2jW4eukE75YpUPKaQkYXUQytwnZVIQRE2JV5
 1FWPzQEmKBV9KWWKbR0Zk6Ep/aU9GOt5Lmju6P4TbTaJeTOgtMhaUeG7l749lhO9SQ9c
 Rk7sTzOzOebY0Du0HYDzEXnBI3X8ovk9rhZ5qxqkR7zQkAoNPRCfIJEjhJVm8oF5z3qg
 8+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0Q57uOqM2x+HTXaGq4rKd/aQZaSRQ3xeqsV+KE/7WiU=;
 b=gZQ8agiaRHdn2Ve1u9a6vGEC/TMAPqveD2QWWl1Twsk5pwThzKxXuu9U+pFePOCQ5U
 9OM9rbFfTFQf3EjRlLmPMFA82JTQ5l6Kstynvy4ZVFxRtKgKTH5wynxS9TPTWCvP5gZI
 3TpyFTRi7xvBmr4F3QF4I9WHpYrrVG7wrh9oXFhJwiGDBLnzxMSVYvheRwZI+FDnyPhE
 mueksR8MBX9Tv2fcPLV17i6i2egXCAVF74dFKEMAbA/ezgiC/3u/OG0CWtGbj6gpXBQO
 S8OuBfBvOKFQVP9Brj42iBRseoxakgvPLWtEwuUXgHFDlRWgOVcUAboFdijiE5XYMEBC
 K3pw==
X-Gm-Message-State: ABUngvdhJmEixQbqVL3+i9IbAfNTbxjHufi9lg0Skf/L0oqB7sjTMPXZe7UtJNMItJCdwaIX
X-Received: by 10.98.78.88 with SMTP id c85mr28722146pfb.138.1478657522899;
 Tue, 08 Nov 2016 18:12:02 -0800 (PST)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id sh9sm51056998pac.41.2016.11.08.18.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 08 Nov 2016 18:12:02 -0800 (PST)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 3/3] devicetree : Add support in Zaius platform for 4
 PWM output ports
Date: Tue,  8 Nov 2016 18:11:45 -0800
Message-Id: <1478657505-23109-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1478657505-23109-1-git-send-email-jaghu@google.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Wed, 09 Nov 2016 02:12:05 -0000

Zaius has four fans. Add support for four PWM output ports in Zaius.

v2:
- make the pwmX entries children of the pwm_controller entry.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 4c4754b..5ba8fed 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -58,6 +58,49 @@
 			};
 		};
 	};
+
+	pwm: pwm-controller@1e786000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x78>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+				&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+		compatible = "aspeed,ast2500-pwm";
+		clock_enable = /bits/ 8 <0x01>;
+		clock_source = /bits/ 8 <0x00>;
+		typem_pwm_clock = <1 5 0 95>;
+		typen_pwm_clock = <0 0 0 0>;
+		typeo_pwm_clock = <0 0 0 0>;
+
+		pwm_port0 {
+			pwm_port = /bits/ 8 <0x00>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_duty_cycle_percent = /bits/ 8 <0x64>;
+		};
+
+		pwm_port1 {
+			pwm_port = /bits/ 8 <0x01>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_duty_cycle_percent = /bits/ 8 <0x64>;
+		};
+
+		pwm_port2 {
+			pwm_port = /bits/ 8 <0x02>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_duty_cycle_percent = /bits/ 8 <0x64>;
+		};
+
+		pwm_port3 {
+			pwm_port = /bits/ 8 <0x03>;
+			pwm_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			pwm_duty_cycle_percent = /bits/ 8 <0x64>;
+		};
+	};
 };

 &uart5 {
--
2.8.0.rc3.226.g39d4020
