Return-Path: <bjwyman@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wvb2L6xP0zDr0Z
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jun 2017 09:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZB0iMWI6"; 
 dkim-atps=neutral
Received: by mail-qt0-x243.google.com with SMTP id w12so7208291qta.2
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jun 2017 16:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BF7P+kYb7AP+Y2yvs4Zkv/j3AxxsHRPypEy7DZZnjLI=;
 b=ZB0iMWI6ehtJWi0HjqiIb4Zop7stKTdn6mjdpD9H/SmKcxdBE/MLHMoqApKa6QaHJs
 h0hKVVp1kWDy0/4OXYTXjAi0zpXivYBh2FafM/KRWX8nKaYCsUNZ/OymICwN04Adkbvy
 URZhkbdLqWAHXcsCFnjx754KovjW8xv3y8HBDh1dr9zNaaIeGkGdLvo39pzWUloTiPR/
 dZvf+BiUPsIh+AkEZUtQLZ25xXXtvb8UTFQMOxqHvnZl+cnXwjNdaIAST/FHsAfEEHFZ
 JbUc6EWCHBjJWEBonaOdkZ1HQMNEw3dPPrxetwBh1LiC3QraQyzHp4yUHvzK0djHxs/B
 b93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BF7P+kYb7AP+Y2yvs4Zkv/j3AxxsHRPypEy7DZZnjLI=;
 b=bJTpFe4twWPZyABMhZa6uuoph6a7ukBOMzieG+4+4gGik3knyXhHRmM/CVQA3yLkoH
 60MgH2HHVbu9Z9PlLRxsNHnEKXqGXmfB4RUTWwzZAp1vZpt9mUpZ9R3zJivblBcYWDMX
 t9jsZ/d2Zkd1alg6vK2Kcr7YxXQ1b5uaeJW0CGN5SwKwZj8IWleEvtlGMmsIYjYfDFmS
 Kn0ZNybFc52+yIIWEAAE34TqxVasZPNVZ1cbHaDDG89FTW/yOr1vQ+rWSCex7xnh5lyY
 Ta7IUhH/RcxA8tj/3hj7omHaR/X8kLCoZek3Ci2/ENG2SFv/JhgoYj9xamKjLAT8reqi
 8EOg==
X-Gm-Message-State: AKS2vOyqO97L9/CTcxY20w1rNbrnp3tE7rNd1A7e2j0684OYITcHYJ5F
 0koIfE9U8opSPg==
X-Received: by 10.237.34.88 with SMTP id o24mr13058126qtc.217.1498262184306;
 Fri, 23 Jun 2017 16:56:24 -0700 (PDT)
Received: from gfwr703.rch.stglabs.ibm.com (rchp4.rochester.ibm.com.
 [129.42.161.36])
 by smtp.gmail.com with ESMTPSA id 5sm4572087qkr.27.2017.06.23.16.56.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jun 2017 16:56:23 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: joel@jms.id.au
Cc: Brandon Wyman <bjwyman@gmail.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10] Add fan card PCA9552 to Witherspoon devicetree
Date: Fri, 23 Jun 2017 18:56:18 -0500
Message-Id: <1498262178-27820-1-git-send-email-bjwyman@gmail.com>
X-Mailer: git-send-email 2.7.2
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
X-List-Received-Date: Fri, 23 Jun 2017 23:56:27 -0000

The Witherspoon OpenBMC system has a PCA9552 chip on the fan card that
is used for fan fault and identify LED control. Adding this chip and the
LED lines to the device tree.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index 31315d0..e5e3b37 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -203,6 +203,53 @@
 		compatible = "infineon,dps310";
 		reg = <0x76>;
 	};
+
+	pca0: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		fan0: led@0 {
+			label = "fan0:yellow";
+			default-state = "keep";
+			reg = <0>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan1: led@1 {
+			label = "fan1:yellow";
+			default-state = "keep";
+			reg = <1>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan2: led@2 {
+			label = "fan2:yellow";
+			default-state = "keep";
+			reg = <2>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		fan3: led@3 {
+			label = "fan3:yellow";
+			default-state = "keep";
+			reg = <3>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		led@13 {
+			label = "yellow";
+			default-state = "keep";
+			reg = <13>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		led@14 {
+			label = "green";
+			default-state = "keep";
+			reg = <14>;
+			type = <PCA955X_TYPE_LED>;
+		};
+		led@15 {
+			label = "blue";
+			default-state = "keep";
+			reg = <15>;
+			type = <PCA955X_TYPE_LED>;
+		};
+	};
 };
 
 &i2c4 {
-- 
1.8.2.2
