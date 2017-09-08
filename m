Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c05::22c; helo=mail-pg0-x22c.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rQG9AskI"; 
 dkim-atps=neutral
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com
 [IPv6:2607:f8b0:400e:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xprlm5dVJzDrbr
 for <openbmc@lists.ozlabs.org>; Sat,  9 Sep 2017 07:57:39 +1000 (AEST)
Received: by mail-pg0-x22c.google.com with SMTP id 188so6812807pgb.2
 for <openbmc@lists.ozlabs.org>; Fri, 08 Sep 2017 14:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AbJOKT2w30CmLJfNStO4hgZ8n4dzajPOh0eh0EgxdMQ=;
 b=rQG9AskI9iCeQdRAl2h0v6AkrSD6vOTDv2tEB2A3zVXTSPTJeM7Dyhqiybe6PB04XI
 LLiVXXtmIpjnkPOHVGIH2X5vlox6TPuhZgCiJQGt0AiGGcobeG9zvnVvLgW5fPLK1yQF
 It5yDySaoC3NLds7FF5gVkEs2mSc+mLEuj4Nk1h6vVccSXar4pkGPzr4TomROLBjjBiC
 2KYRTadmpmm4XU5b7GJDJLT46NQ2xxTedkxvXKmBfWG4nY9hUf/9oj/yg9ZyalnfSpBB
 0u1s2eB6XnWRBgT5z18CA8FrGiepZfYzypOSxBf6wKx+9+mNGaN+AfeY7rHhN4Raq6+W
 Qp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AbJOKT2w30CmLJfNStO4hgZ8n4dzajPOh0eh0EgxdMQ=;
 b=Iwp2zXBCWYkewJlGCemYfwkOt5UFmp0avhgfOCpR+EbgHc+r4+jGMSXiBMqXGefysA
 52LIbbkZdiOkqammPaeUHsAMed9vP4wsvzwb47TnMqfJFb0KZzA5VfCWS284Gv1R4IUM
 uKf5xH1W+tFzrw9Lvw4TVRMGX4BRCNWIhMxwGm414fWr9chNDwP1Dx6mBiu0ORdeOJmd
 V3m42kQ0RbnrHqrn44tGQhfUFlzEZyi+OBCTs1IhUg3oNxXmrz7w4j6hKq3jO8wM2c9o
 X/O7dD5a/re09Pdw0ibO2KmH/2abTJK6xvOuwnVzbNljuUvGP6hVXReucDy5lkDvJvnK
 jq8w==
X-Gm-Message-State: AHPjjUiLBLASUk+wgmdMq2D1zVjBbpObny8c1vlW38dqCyXvmKHxiJHH
 NqNhiAtRIUbIb4RVseQ/Jg==
X-Google-Smtp-Source: ADKCNb6/W7/9Y/Q+gbcc24X5I4SwD1XmjjbgyVtN0CEPwTxl5mGlTSdSJ5cf0g4t2wBpaLOoVavneQ==
X-Received: by 10.98.87.23 with SMTP id l23mr4546803pfb.77.1504907857424;
 Fri, 08 Sep 2017 14:57:37 -0700 (PDT)
Received: from pewter.svl.corp.google.com ([100.123.242.121])
 by smtp.gmail.com with ESMTPSA id d21sm5393300pfe.68.2017.09.08.14.57.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Sep 2017 14:57:35 -0700 (PDT)
From: Xo Wang <xow@google.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 1/5] ARM: dts: aspeed: zaius: Use LM5066I driver for
 hotswap
Date: Fri,  8 Sep 2017 14:57:24 -0700
Message-Id: <20170908215728.115818-2-xow@google.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 21:57:41 -0000

Not removing the "ti,lm5066" line because the LM5066I support is only in
yet-to-be-released 4.13-rc4.

Signed-off-by: Xo Wang <xow@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index e4e9519cd087..1c39452ffebd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -282,7 +282,10 @@
 			#size-cells = <0>;
 
 			hotswap@10 {
-				compatible = "ti,lm5066";
+				/* Device is LM5066I so prefer that driver
+				 * support if available
+				 */
+				compatible = "ti,lm5066i", "ti,lm5066";
 				reg = <0x10>;
 			};
 		};
-- 
2.14.1.581.gf28d330327-goog
