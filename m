Return-Path: <jaghu@google.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t4k0l4xpTzDvR1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 10:40:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=dKVrTSsT; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id e6so25773483pfk.3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Oct 2016 16:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WgtlNYamVtKUfWL5hKLC893TwR4F0jp8WFrS+NdGj74=;
 b=dKVrTSsTep9pXKZKM18Ew2VI2dqB53CAaQ6bxxwMUgZy0WkH4WTtiO5lW7lB78GZbw
 FAJiQvUaxdaqepMNvE+eIr0axHsit/0VCOcuRoy8OsUl2LbpS8tATUmD8JJWc7WaXf09
 807afo0GTFICvUBUdczy8W9txKWCCH/CtoE6kkoZtFZ9JfOP7hpg9CnOLDueagh047Cl
 XXvTg9792/JGmZWeN/GxEem5VsGxEzrO7YnMPjK3qKnp79/to+7NWqNhAi1UPWq1chTG
 SIVNZIB78pFowi/iBdaHM/t1mhN74p5eMsqKg9Grs22i6P6Rchpa54hEMc7MWQHUEp9s
 QoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WgtlNYamVtKUfWL5hKLC893TwR4F0jp8WFrS+NdGj74=;
 b=cW3bsmy0qEiEErd5zfggI6HKYVXJdOQBl77eTwhS+x73RTSx4J7m7SdeQ29Kg0oe4q
 6VYlqO4cPjUOPgrUKOfaY262KTGhAxWtYSjQ/jf3vBspqSyN/IVc8Wmn6C5nS5aisJSN
 pUjQkMNOyHut2Q0nQqNQMU7BsgY3tr3Tez/oXoAQs5+ULlVdTQIhmlPv06NZtNRg5BN5
 XSly4Mi5exA+WrQIH8xNv6UQBgMKwphi9Cn7ACwiLx2cMoWhfko138iG/s2kk+Ep7mpe
 OKmdWPrLOWxmVkjkYK8kjDb+5MQ508gOLV97IM8kaXFLwfiuNqp1JTyiHgvhVeGZ3vcq
 HPTQ==
X-Gm-Message-State: ABUngvdp4Gwshi/ZVNgVyUkkkmrwgANfkSrUuZjGm5A20tQan9CQO4qkM8KwCo7EnNvVpAM5
X-Received: by 10.99.171.3 with SMTP id p3mr15922821pgf.119.1477611653790;
 Thu, 27 Oct 2016 16:40:53 -0700 (PDT)
Received: from jaghu22.svl.corp.google.com ([100.123.242.38])
 by smtp.gmail.com with ESMTPSA id y189sm14147467pfy.34.2016.10.27.16.40.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 27 Oct 2016 16:40:52 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 3/3] devicetree: Add support in Zaius for PWM
 controller and four PWM outputs(fans)
Date: Thu, 27 Oct 2016 16:40:22 -0700
Message-Id: <1477611622-28120-4-git-send-email-jaghu@google.com>
X-Mailer: git-send-email 2.8.0.rc3.226.g39d4020
In-Reply-To: <1477611622-28120-1-git-send-email-jaghu@google.com>
References: <1477611622-28120-1-git-send-email-jaghu@google.com>
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
X-List-Received-Date: Thu, 27 Oct 2016 23:40:56 -0000

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 63 ++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index eef045b..82a12dc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -83,6 +83,69 @@
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	pwm_controller {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x1E786000 0x78>;
+		compatible = "aspeed-pwm-controller";
+		clock_enable = /bits/ 8 <0x01>;
+		clock_source = /bits/ 8 <0x00>;
+		typem_pwm_clock = <5 0 95>;
+	};
+
+	pwm0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x1E786000 0x78>;
+			compatible = "aspeed-pwm-dev";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pwm0_default>;
+			pwm_channel_enable = /bits/ 8 <0x00>;
+			pwm_type = /bits/ 8 <0x00>;
+			rising = /bits/ 8 <0x00>;
+			falling = /bits/ 8 <0x00>;
+	};
+
+	pwm1 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x1E786000 0x78>;
+			compatible = "aspeed-pwm-dev";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pwm1_default>;
+			pwm_channel_enable = /bits/ 8 <0x01>;
+			pwm_type = /bits/ 8 <0x00>;
+			rising = /bits/ 8 <0x00>;
+			falling = /bits/ 8 <0x00>;
+	};
+
+	pwm2 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x1E786000 0x78>;
+			compatible = "aspeed-pwm-dev";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pwm2_default>;
+			pwm_channel_enable = /bits/ 8 <0x02>;
+			pwm_type = /bits/ 8 <0x00>;
+			rising = /bits/ 8 <0x00>;
+			falling = /bits/ 8 <0x00>;
+	};
+
+	pwm3 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x1E786000 0x78>;
+			compatible = "aspeed-pwm-dev";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_pwm3_default>;
+			pwm_channel_enable = /bits/ 8 <0x03>;
+			pwm_type = /bits/ 8 <0x00>;
+			rising = /bits/ 8 <0x00>;
+			falling = /bits/ 8 <0x00>;
+	};
+
 };

 &uart5 {
--
2.8.0.rc3.226.g39d4020
