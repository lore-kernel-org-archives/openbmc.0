Return-Path: <3bYm4XAcKB04Bu39A7uw44w1u.s4245u3r2s1y898.4F1qr8.47w@flex--venture.bounces.google.com>
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--venture.bounces.google.com
 (client-ip=2607:f8b0:4864:20::349; helo=mail-ot1-x349.google.com;
 envelope-from=3bym4xackb04bu39a7uw44w1u.s4245u3r2s1y898.4f1qr8.47w@flex--venture.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n9VEHxIo"; 
 dkim-atps=neutral
Received: from mail-ot1-x349.google.com (mail-ot1-x349.google.com
 [IPv6:2607:f8b0:4864:20::349])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lM074hfSzDqPP
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 00:28:00 +1000 (AEST)
Received: by mail-ot1-x349.google.com with SMTP id r23so1150385ota.17
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 07:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hvOGK6bpBkIVcOTALMfE8b3N41k8VJ4SG1O+ogB3+QY=;
 b=n9VEHxIoMMdeUKsFQ5RrPRC64V6guIXO+22pWGd9T5HX+Kkty9iyom89LlQXEeA014
 0dMQjR4oPQTp4V+c2jZBL3QmM8D2H8shsPOidfYIM/KLUMc1xcIY/+LUhQw9knE3uFV/
 jI4gbYh8nqw8bYkInqiL+8/1MoWN1rJLzrP6bKPOGiJcKVkCHZHQYdFdGDk0vsOiyoU+
 iR6g6RslPle7kGf5nvpeeLnDPjdWPMsUFPl263FfO0D3RaC9r/ahNTXbRB3XQ9+ZRfwc
 KyZdBW2LGlkzysJR5Uz9MEztLpMW81PdmGRhmNuFZKfDM5rk/RZdA1JXoL5GuS5IlNcC
 ukUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hvOGK6bpBkIVcOTALMfE8b3N41k8VJ4SG1O+ogB3+QY=;
 b=ds2th0LtAWgFHE+2s0jpPnQZ/qc6SzujpqpemIKhG7qlvWw7FAXa07mGXjDbctfJc/
 WRy/zsvvVcrzTxHsJY19SDNhT1RfdA+s//phz/b7RBUIKJDADuus+qpawsT1Y8eR+2c+
 i+3dmDoygnUDOlMbP+2CHaV0tYrr4V/RMABh++j5mlK9JAYz5YYlx29SxrP5dBKJDu7f
 QJ45EpINcQPH9n4Sqhqv4scT+8zsTitbGZ453wcjrge6tHoC/hIlkoXS+50PgtNQO3A0
 UxRkLzPwdo8ZeHaWUlPdo7kFkZ28jE1/abrmnp/p7MN643KAQO683tReNQYrApLmik06
 6lcw==
X-Gm-Message-State: APjAAAWCqfPqFwcnDxRES+ml2uuNrf9xsm7cshnrNJ8j7kgI7b8/tI8T
 q6tuWZeO9nuaDK+Gg+rCOJ6Bcbr9ard+
X-Google-Smtp-Source: APXvYqwV4cHoklNs4PrWg745dDeerhqxJERl5LjLQ6cbaQp7pCSt7p0zNUKBLorPixBeG1YtuYSuwPLJGOsE
X-Received: by 2002:a9d:77c9:: with SMTP id w9mr57780342otl.197.1555597677546; 
 Thu, 18 Apr 2019 07:27:57 -0700 (PDT)
Date: Thu, 18 Apr 2019 07:27:53 -0700
Message-Id: <20190418142753.24085-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH dev-5.0] fixup! ARM: dts: aspeed: zaius: add Infineon and
 Intersil regulators
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
X-List-Received-Date: Thu, 18 Apr 2019 14:28:08 -0000

s/intersil/isil/g per prefix in vendor prefixes file.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 53751adebf17..9fa70cdab710 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -305,17 +305,17 @@
 	};
 
 	vrm@64 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x64>;
 	};
 
 	vrm@40 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x40>;
 	};
 
 	vrm@60 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x60>;
 	};
 
@@ -325,7 +325,7 @@
 	};
 
 	vrm@41 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x41>;
 	};
 
@@ -354,17 +354,17 @@
 	status = "okay";
 
 	vrm@64 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x64>;
 	};
 
 	vrm@40 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x40>;
 	};
 
 	vrm@41 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x41>;
 	};
 
@@ -374,7 +374,7 @@
 	};
 
 	vrm@60 {
-		compatible = "intersil,isl68137";
+		compatible = "isil,isl68137";
 		reg = <0x60>;
 	};
 
-- 
2.21.0.593.g511ec345e18-goog
