Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::236; helo=mail-pg0-x236.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kKHL8DeK"; 
 dkim-atps=neutral
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprlq41pbzDrbr
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:43 +1000 (AEST)
Received: by mail-pg0-x236.google.com with SMTP id t3so6853677pgt.0
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPOfMiCReYHdH0hczhUpEPNCEvz3eLjDz54i4EyD2Qc=;
 b=kKHL8DeKAKR62owOElQicWZbWBoL5rLNJMR2wR38Vu6a16umOGn1IiBPytgPvE/F0X
 Y1HBGseaiCg6zHOtsGEdSNEwGWHeFxKU5nrqgmjlqKD+noPM5qCD2mqN6s5XO8uSI24y
 L2EluOYSbE2dAMiz/4GS5rOA5JEpd6rG8KfBdGSzz9KRAwEPz3jDjwtBziHaeLv5M9m2
 YiDvmWNpOt8vvnZDWUVKsMlGxHcHzXyRJQShItZWi490sk1qRrFgcihJ1GwqPnIkOOAk
 haYmewXMqBNo+vcN+F2WaII3TOH66TBxvIRqkVk7a4KxdOsiYLsDHYeNY48YGb2KtJhc
 oG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPOfMiCReYHdH0hczhUpEPNCEvz3eLjDz54i4EyD2Qc=;
 b=sz7T8bSv1pB+iPXzeKmtfi0Pkzp8l5rmH+c5zST+QS4TUvoimmTuVNA8ZRwX6BLgQk
 iGfVGJVJEV1wqaXk9Y5ImMCIYI5aVQczJfqmhXy0G1GD2g5n8YB35VO8cwaTMEJ8AQrZ
 1+deimOdlf3+rziKfja0t/ELsUQq9Ne9V0Rdc+mot4b05uYhLzTvlY7h+JgSo0EuSoNp
 IDjAkKq/GpvWoBFsIY6APHVCtJh5mSqVc2nzeYtHCUkJGjRouEme72nZOtCp7UaCyfZk
 70HbWd852qqU28wxWWo7mROVIi5xYimPUG4xBrt4i3VyTEGGviF6qy3j+5zHlJw/iO54
 e92Q==
X-Gm-Message-State: AHPjjUgVl4ORRhYWEVd9B1xdO6bjwjkGnkzr0yavFrLRV5NGMX3PT5Ch
 kYIeqfdtPsey39C5Ib6K6Q==
X-Google-Smtp-Source: ADKCNb4/OPOdB8biHBQY0hPVFCg6vXG7Qh22n+1f4pS6yBY5Zcez2I3d7cTlsMZ7FQPC9ahjUZ756g==
X-Received: by 10.101.73.198 with SMTP id t6mr4533650pgs.382.1504907861469;
 Fri, 08 Sep 2017 14:57:41 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:40 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 5/5] ARM: dts: aspeed: zaius: Add PWM/tach peripheral
Date: Fri,  8 Sep 2017 14:57:28 -0700
Message-Id: <20170908215728.115818-6-xow@google.com>
X-Mailer: git-send-email 2.14.1.581.gf28d330327-goog
In-Reply-To: <20170908215728.115818-1-xow@google.com>
References: <20170908215728.115818-1-xow@google.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:44 -0000

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index ad760a7e8cb3..5410f58a5e9f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -108,6 +108,33 @@
 
 #include "ibm-power9-cfam.dtsi"
 
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
+		&pinctrl_pwm2_default &pinctrl_pwm3_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x01>;
+	};
+
+	fan@2 {
+		reg = <0x02>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02>;
+	};
+
+	fan@3 {
+		reg = <0x03>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x03>;
+	};
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
-- 
2.14.1.581.gf28d330327-goog
