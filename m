Return-Path: <3JSnCXAcKB2wfOXdebOQYYQVO.MYWYZOXLWMVScdc.YjVKLc.YbQ@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::24a; helo=mail-oi1-x24a.google.com;
 envelope-from=3jsncxackb2wfoxdeboqyyqvo.mywyzoxlwmvscdc.yjvklc.ybq@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UzoErBRL"; 
 dkim-atps=neutral
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qrFC55bSzDqbB
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 07:39:52 +1000 (AEST)
Received: by mail-oi1-x24a.google.com with SMTP id d198so551958oih.6
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=yHLXlA/NxedR7DWXIwVPp4SGeiulaPxtZOhwVJEzE3g=;
 b=UzoErBRL/TyFb0ihpfQvqZKCULRtoiuAHxbqAgdgEjiQxoD7k4U+j5nGVyFPboGT3i
 i1iT3waqxNTPiCulyS2YOhPIU5qi+aed8ny3iNxc4JG2i1fPO/ibV/jUjGEegjqK7Fjs
 hC/c2MQIy41g9G8E5WmMnON+OCRSCwnW+ki2ksDHkaRjGAcs9vJyE8bFQXqymxxCJ4Ju
 5fFE8QBCnbxEX9IcEKNDoTduUPua/oozMsm2t9TkvPDkUf2y0ZJLaIf3vmF1ldc/hAC1
 LTPxC9AMHN6Ml90/XPlrL5dOhlrBX+W5Mm86qiLDmOUTyzo7B1/boZp1Pku9Gxw4szlw
 h8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=yHLXlA/NxedR7DWXIwVPp4SGeiulaPxtZOhwVJEzE3g=;
 b=n7WFas2/TExGrxIj68lxF8MF8eSIyuAGLgP0qT4xYbk6YCKUo2VVYbfBBU2FSvDLso
 xBmthHb1N0/ulGKUbvrzWS+S2D0ytF4nmPP0HDriZDSh9t61cG4gjkfj2EeMzsbXDVjv
 9OXOdqEgPnA9JGV/TbiGkUiCQJSIMp87DdT+OOn66mECLtPk592gY3i3xJ8JaV9R7b/K
 dSqKWwdT9fkW8Uql0JdJxry8f0SLVg2xXOcV4XK5OjTUyMXrhKCmMFNLWwhQR6iOOfKE
 xXOrWUD9vTgBZyB99XstZVgcI11uDiAhRJQyGh9+ktWft6pbiS8/rJp1RG6EEhTgF4T/
 50QQ==
X-Gm-Message-State: APjAAAWqpb7vMwGTmLm9Y31xuTCUbAL7hnkvqVHu/vnyxVs7tr/jRzan
 h2IIkiEHoMQBbRXeMqJgqrNUX5EmK3FA
X-Google-Smtp-Source: APXvYqz7F4LeTq1AH4mG1OZZWiLNZaNuDu//dWvhNinE/MW8HKrnipxkBSe+A6ol67zJ7QQnqe2S1UNlNNZ2
X-Received: by 2002:a05:6808:97:: with SMTP id
 s23mr4908002oic.71.1556228389627; 
 Thu, 25 Apr 2019 14:39:49 -0700 (PDT)
Date: Thu, 25 Apr 2019 14:39:43 -0700
Message-Id: <20190425213943.111641-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0 1/2] ARM: dts: aspeed: Add aspeed-p2a-ctrl node
From: Patrick Venture <venture@google.com>
To: venture@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Thu, 25 Apr 2019 21:40:00 -0000

Add a node for the aspeed-p2a-ctrl module.  This node, when enabled will
disable the PCI-to-AHB bridge and then allow control of this bridge via
ioctls, and access via mmap.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 4 ++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 3990aed25ee6..6011692df15a 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -168,6 +168,10 @@
 					compatible = "aspeed,g4-pinctrl";
 				};
 
+				p2a: p2a-control {
+					compatible = "aspeed,ast2400-p2a-ctrl";
+					status = "disabled";
+				};
 			};
 
 			rng: hwrng@1e6e2078 {
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index d11c07888f01..674746513031 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -224,6 +224,11 @@
 				vga_scratch: scratch {
 					compatible = "aspeed,bmc-misc";
 				};
+
+				p2a: p2a-control {
+					compatible = "aspeed,ast2500-p2a-ctrl";
+					status = "disabled";
+				};
 			};
 
 			rng: hwrng@1e6e2078 {
-- 
2.21.0.593.g511ec345e18-goog
