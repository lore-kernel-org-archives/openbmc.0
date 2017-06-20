Return-Path: <brendanhiggins@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsgc62ztFzDqhp
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 07:15:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TwUJxuuG"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id s66so74940544pfs.1
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kWE1Sd9TZQ2w3IU2H+1pCF6eeVqHbkbXN2B/lZ/GH+o=;
 b=TwUJxuuGqvj4pYN409oifMqJYjGoFwjR9EtJNAyC+2NR9oysMCjZijztnh4VUNWcIR
 Q8LYwdwcM9QO09ON5470eLXpIZCaYIIRDad5OoMvH9A9jApJA1TtCDqWJk/Alju1SOV9
 frsWm2WivZCeGlw9NdfuDeg+2IpWjW7RauEDkimcstG26Ycip6ncnz+Z+xFAniPb/kQc
 v2EV6bsbplkKwKEiyIh8xOJ9Tm2CdJQJjmYgP/MV5qOzFu1xGmFBuN/DANZDWTWH1moJ
 7aHP1eTkLscveYs37k2SVlIcB2VrIVu3ONUSZdMeDsyPLCOV+c2X/j5qcixIGBJilR2C
 E9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kWE1Sd9TZQ2w3IU2H+1pCF6eeVqHbkbXN2B/lZ/GH+o=;
 b=P7noTvue9syVTNsm1wUXUfrXlHYQl3g1fn4SH1llFmDYtzW1oMzmeqS0gJBXpzt+Xk
 jOVEANFjeeP9aQ4R+l1eYnWg2gheJUD8XJ8BWIIsWjt2SK8oIbm3ubDh3fAnk6BOiuo6
 9vPFLYMnopl274c23fI3npqIW02FoPGX8qejwTK+7ltgr8J+mCusIlPfTnB8AbB3Hsg+
 uVjQGebxftdzPXSn3A41PhGqre6/wbxgSQaSLd6BDit0Wdn1imcxZgQniUS+/fycJMFr
 Z246ka8QNJiaUiAJCTP6PqC5rte/My9tTVsutSxMEbP5kfwbkMIFiMiZDb7DPJVqasAJ
 VXJw==
X-Gm-Message-State: AKS2vOxwQJ5qAo1cac5w6GuvMd92pViyVITmMCYlBSP8ZxOu8DZ5zq7T
 NJxhypcPi488O9Oj
X-Received: by 10.98.50.196 with SMTP id y187mr14541812pfy.67.1497993332120;
 Tue, 20 Jun 2017 14:15:32 -0700 (PDT)
Received: from mactruck.svl.corp.google.com ([100.123.242.94])
 by smtp.gmail.com with ESMTPSA id a69sm29012015pfg.91.2017.06.20.14.15.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Jun 2017 14:15:31 -0700 (PDT)
From: Brendan Higgins <brendanhiggins@google.com>
To: wsa@the-dreams.de, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org,
 joel@jms.id.au, martin.petersen@oracle.com, benh@kernel.crashing.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v11 1/4] MAINTAINERS: add entry for Aspeed I2C driver
Date: Tue, 20 Jun 2017 14:15:13 -0700
Message-Id: <20170620211516.13095-2-brendanhiggins@google.com>
X-Mailer: git-send-email 2.13.1.611.g7e3b11ae1-goog
In-Reply-To: <20170620211516.13095-1-brendanhiggins@google.com>
References: <20170620211516.13095-1-brendanhiggins@google.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 21:15:35 -0000

Added myself as maintainer of the Aspeed I2C driver and the associated
I2C interrupt controller and added Joel Stanley and Benjamin
Herrenschmidt as reviewers.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
Added in v11:
  - Added MAINTAINERS entry for Aspeed I2C driver and friends
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 053c3bdd1fe5..2bb541549cc1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1123,6 +1123,18 @@ F:	arch/arm/mach-aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 F:	drivers/*/*aspeed*
 
+ARM/ASPEED I2C DRIVER
+M:	Brendan Higgins <brendanhiggins@google.com>
+R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
+R:	Joel Stanley <joel@jms.id.au>
+L:	linux-i2c@vger.kernel.org
+L:	openbmc@lists.ozlabs.org
+S:	Maintained
+F:	drivers/irqchip/irq-aspeed-i2c-ic.c
+F:	drivers/i2c/busses/i2c-aspeed.c
+F:	Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-i2c-ic.txt
+F:	Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
+
 ARM/ATMEL AT91RM9200, AT91SAM9 AND SAMA5 SOC SUPPORT
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 M:	Alexandre Belloni <alexandre.belloni@free-electrons.com>
-- 
2.13.1.611.g7e3b11ae1-goog
