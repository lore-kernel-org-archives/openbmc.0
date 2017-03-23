Return-Path: <peterh@google.com>
Received: from mail-pg0-x234.google.com (mail-pg0-x234.google.com
 [IPv6:2607:f8b0:400e:c05::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpTHD2HP4zDq5g
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 12:19:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NSDOEKLQ"; 
 dkim-atps=neutral
Received: by mail-pg0-x234.google.com with SMTP id g2so114213366pge.3
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wN6pkA7lDgfoImynmthoOYom8R5lhfukSMcTtgNP5LI=;
 b=NSDOEKLQqadQ4OEKO3zokaZNxffvZRlwk0R5fk026Bv4j8czKF9l/o7jcMLUItxl1l
 Xh1WCiSpCe8Pu6QzzTXxHbn/EKesEVZL6tKZJPOlzj5O9duYCF8sqWFMGdEuoxFRsCtE
 1gKNLUVFRzSHpuvQh4Ui1qtsh5T+ziC4gZf3kNejqa7+NKlI6EobYtU9CrKPducFF3xh
 h2tH/AsIEPCq/vIMGcBINUM8SFGKtaTbcM9U2jSH/FcWt2LA3EXopSKsxFCyhdhetPvN
 epHRYcCFodTvZ79zKuK/1c1tt/BAqenjqUfjNG2130V/MfN2Kke0F2D/LZoNl/UctD++
 jiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wN6pkA7lDgfoImynmthoOYom8R5lhfukSMcTtgNP5LI=;
 b=tRF5B1dG9zYq/QeAch26sTnAQL3wZTOH1Wj7lVHOQERfmvKCRuLxjVYBnMG/BsOY8r
 bC+zytTRQSabNwNoujj9lwXBAVAQEpiiFMq3ofoR3mtgNQHgxRM9iCPOYlQwl8LKGtt5
 Bq/LH3lTVLH7bFsBwT4tpnZerznAdZjnHllHOoOAELZysTInMw9tTBgUPWBDq9yL/sYs
 0IZY92xzgL66Wy9VSQMl3MwIdDSOUK5JHlCD84+XvKnwJ5w0bg8WuKmjjNJ/EXKgETj5
 /y0wNL90Ox1K64Z/wLbrjMJAw9CyhQxrMcqybFyShYn976Q1eRh0e/JJ16d9SuaV9NH3
 VVzg==
X-Gm-Message-State: AFeK/H2dj64Un6nyEBAawjBW3rDr1PeHlmtcPkdG/nVpeqclZ7T8jJJ85eRj6uqqfMSh9aQ2
X-Received: by 10.84.224.133 with SMTP id s5mr57945464plj.93.1490231971611;
 Wed, 22 Mar 2017 18:19:31 -0700 (PDT)
Received: from ouranos.svl.corp.google.com ([100.123.242.122])
 by smtp.gmail.com with ESMTPSA id s65sm6136709pgb.64.2017.03.22.18.19.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 22 Mar 2017 18:19:30 -0700 (PDT)
From: Peter Hanson <peterh@google.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>,
 Peter Hanson <peterh@google.com>
Subject: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
Date: Wed, 22 Mar 2017 18:19:26 -0700
Message-Id: <20170323011926.176272-1-peterh@google.com>
X-Mailer: git-send-email 2.12.1.500.gab5fba24ee-goog
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
X-List-Received-Date: Thu, 23 Mar 2017 01:19:36 -0000

Signed-off-by: Peter Hanson <peterh@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 3bd70ed810af..dfd0dd7c16e4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -269,7 +269,13 @@
 	/* Master selector PCA9541A @70h (other master: CPU0)
 	 *   LM5066I PMBUS @10h
 	 */
-	/* 12V SMPS Q54SH12050NNDH @61h */
+
+	/* 12V Quarter Brick DC/DC Converter Q54SJ12050 @61h */
+	power-brick@61 {
+		compatible = "delta,dps800";
+		reg = <0x61>;
+	};
+
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
 	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
 	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
-- 
2.12.1.500.gab5fba24ee-goog
