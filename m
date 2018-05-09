Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::244; helo=mail-pf0-x244.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LrYZBCbU"; 
 dkim-atps=neutral
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40grpH3QrhzF27m
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 19:36:23 +1000 (AEST)
Received: by mail-pf0-x244.google.com with SMTP id e9so21353237pfi.4
 for <openbmc@lists.ozlabs.org>; Wed, 09 May 2018 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ROGIlT9YWWCfnlG8vSWVy4IImCEb7Z46lC6HvCUD6jU=;
 b=LrYZBCbUde5ThkvAQGztpNGs380I5z+yHOrur/qC2y0CRF4JhElWtV9fRY27OBdQyz
 jdhjztrePtsuWbhpBtKRNo2WwvAFiu8ZdZ6iqvDz4Fjwz2uZ+TASV0H/vIsLKOXgmmfl
 wanX31vBKZ3ILbyut6SVsaitOEpZ6l6Gn98yL44YVpf0hsZNCDmgeeeXVe5jCs9c9yey
 KjKOlrWOB7w0NqHw1htmQppleG8ysa+XNsQmBC8y7WMcoaDmkC5ygG1BMCOJkrn7gWMp
 9H/hcZ8IdKdCdhf4zUSCXjm1kNLLIpdZjZWbAR5WSFhg1kOHKxZuYsrEvaFzcyKAUz0I
 Qi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ROGIlT9YWWCfnlG8vSWVy4IImCEb7Z46lC6HvCUD6jU=;
 b=oZLG0Y6bL4Qy9l5bQGHaunnV9eRSJ+u9h7hUYWDOHGQQ0CJxGx9fnvqJf3aiByePmi
 j/sSWRxuL8ZTuwM3ER8GJ65TecX234JjB5yUAQfFFqARASgQkoa8/BQX0ZKnn76evA7a
 x/Ar3Z7u6pLKXp/BES167WUG78xHWQphy52hmLxU/RL37vg7GY6qgDxZH7a9S8zUWBOQ
 bI3sX0tNQZbqpeWTZOh3h0WCDKVHK4TpOiDPPeeb5bDo/O/jufdLIdT+AQu0IQCTOeAL
 wKbVLm15KU58hFew7iH/H41wz1mnwsOEAYahpxxo14U+HNqQ7oj42xv42yetzDWPBD38
 nznA==
X-Gm-Message-State: ALQs6tAeYUkmjE4/GzjDpJin30WEH45kzxtWL0y8JRo83VOBq1vNf9sI
 8B422IvTbM6p1UwHOBMOOVzXBtECRYE=
X-Google-Smtp-Source: AB8JxZq5jPmAGBzJO91ZaXR9ibWCnyfsedop5g1gpiJ0TYtYPy4m4K5u4pr4dsaH7qSIMU/YKdtDnA==
X-Received: by 10.98.178.4 with SMTP id x4mr43283854pfe.21.1525858581433;
 Wed, 09 May 2018 02:36:21 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id z13sm5207306pfe.77.2018.05.09.02.36.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 May 2018 02:36:20 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Lei YU <mine260309@gmail.com>,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com
Subject: [PATCH linux dev-4.13 2/2] ARM: dts: aspeed: Use 24MHz fixed clock
 for pwm
Date: Wed,  9 May 2018 17:35:59 +0800
Message-Id: <1525858559-130220-2-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525858559-130220-1-git-send-email-mine260309@gmail.com>
References: <1525858559-130220-1-git-send-email-mine260309@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 09:36:23 -0000

The aspeed pwm driver always sets the clock source to 24MHz, specify
the fixed clock in device tree to make sure the driver is using the
correct clock frequency to calculate the fan speed.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 +-
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 50bc661..9354ac9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -201,7 +201,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1e786000 0x1000>;
-				clocks = <&syscon ASPEED_CLK_APB>;
+				clocks = <&syscon ASPEED_CLK_24M>;
 				resets = <&syscon ASPEED_RESET_PWM>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index e9e039a..0633162 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -259,7 +259,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1e786000 0x1000>;
-				clocks = <&syscon ASPEED_CLK_APB>;
+				clocks = <&syscon ASPEED_CLK_24M>;
 				resets = <&syscon ASPEED_RESET_PWM>;
 				status = "disabled";
 			};
-- 
2.7.4
