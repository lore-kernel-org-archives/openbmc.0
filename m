Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ufi61Ygc"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ySGBR1N9SzDqlM
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 17:58:06 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id s2so4262401pge.10
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9TLlZoBXI4gQe7Uc7aFKLxVFD+DkO8Q+DXVOjCl6CUw=;
 b=ufi61YgcSyKInhgaTwY48aQ1X6cVUMKQqa9kpSxFQjsnOBnnGvljzFYuomdePNl+AC
 MmfMgarMXt5DzGrGQScfX/bSfOAuMN9Nno7rR0+F5S9MKJq0+OlK8C3HuGc7Y9YVz2U0
 bDymMilBgKi+jmfCouYJQveEoIADZi5or1rpgX2NtBnmIsgpL6TTbCrdtw7R3HDq4XMv
 UOp2Bb7OSGX8iohAdcRNZ/FeBX92X5tQC1ZPbPpSQtpBO/wrFW3iULlShHtQWA0DScxW
 S6VoWQYYlRkCp3ncwxx6R7gKSU8uIBIZacHXDCrv/SoBhFQqUosNIANMMgBfn227HNQN
 CT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9TLlZoBXI4gQe7Uc7aFKLxVFD+DkO8Q+DXVOjCl6CUw=;
 b=h07Zwn7VUbsufR4pOPwS62BeJCTUnmkhx/i1UWqIs1+qWUqicIuITem9lah/bxThV3
 z65L38T+pB+s1iTeGerqeuUfwLpnBL01vft41K8IxZz809zvwpVJSB4hoDhY/11BORW6
 XIKL9MJyKVOop2rbRCZq1vtDJTnVUxKsd27a8gf9JpSC45nmE+lmRQoilUaEwwkLY4pE
 e21zdd1o3S4Be+WZH0I1318cNiyfCD79HlmQP+J0WhOC5V6GGt7IvRmPIVhT1gXA+dKz
 7KMcbkvs9azQGMWf4VKPPT3BhQ4AAnhK29m9CseEqvwqimJ8u7lHk10608XrR5vFLrWe
 pmHw==
X-Gm-Message-State: AMCzsaX75jZdnJJcvQuLgUZANeDnedIq3Fa1Btzd1DSFj2ciLV+ENHCF
 OkbN/Eqyxu/NXC38AG98Ge1L+rID
X-Google-Smtp-Source: ABhQp+SOdnCo83Wc7+DAAEVfN9nAMlO2pgIb7gs4O6+N4a2RIo/H9i3rrXPVaCndLJKRj6WI9IUQyw==
X-Received: by 10.99.174.1 with SMTP id q1mr2558436pgf.125.1509605884095;
 Wed, 01 Nov 2017 23:58:04 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id b16sm4460584pfe.58.2017.11.01.23.58.02
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 01 Nov 2017 23:58:03 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Fix identify LED
Date: Thu,  2 Nov 2017 14:57:41 +0800
Message-Id: <1509605861-20215-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 06:58:07 -0000

The identify LED is different from other LEDs and shall be
ACTIVE_HIGH.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
index eb0994e..b0c3cb5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
@@ -35,7 +35,7 @@
 		};
 
 		identify {
-			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
+			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		};
 
 		power {
-- 
1.9.1
