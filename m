Return-Path: <peterh@google.com>
Received: from mail-pg0-x22e.google.com (mail-pg0-x22e.google.com
 [IPv6:2607:f8b0:400e:c05::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpS7C2TjvzDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 11:27:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Kwsrt9oJ"; 
 dkim-atps=neutral
Received: by mail-pg0-x22e.google.com with SMTP id w20so11854276pgc.0
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 17:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+ufUSLvbtA/LocJkDalcuE5E2Sh7r9Wl4SFQ2FQFbHc=;
 b=Kwsrt9oJI2dykkgf5CXspHFF2LalZiYCW2bif+nG+7W7g5OGR7isklKVx0eAiDVx4q
 U2T8y+kNOCaQw322IHBPoKIgyrGvI9MlFwyulsat9OgnM1ceRFxV8cIaIxF5rq4VI4dI
 iqvGWWbmxuBOi2Hl1HVg1TGNnG2/3prfsiJ8B8iXvaPBBF2UF0Ja347zujjhU6o1jXqF
 KECYze/6wxsGQi20ozxQaTPoEHqU3jCfwujGw23qnm2bKT/Adxpo7ta5TmKvmbQqavEe
 pU2hbvVs5IhXN+Phe+/88UgC970urRD+7V1Qjp4h+vu7gLlFQaKzgaz7KY7nudmYewET
 nbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+ufUSLvbtA/LocJkDalcuE5E2Sh7r9Wl4SFQ2FQFbHc=;
 b=LemAOMO0MF9wWwvOtA8Xq1HL1vbwjRvOBW5xqvMhroBZhnXOebZbd7zR6jTqepW9qP
 WhTM4dZ8i5eqYJhhOohqZtLhqYCIpOkLM+H6ztzgP67A7ds0P+r7vur+M0j3H/oY0MOL
 8WOMbkA1kn/nXvLJz5zjt6bBVRW+5DILDMf1TC5fWikiFTwM5EIWs1KGc21nHVuD18zo
 2nsGLMD+YCzawqX6L9j/mDSQVXq4jC9umA7CATMm40SHAtkoji0zFXRjvy+Q1lFUoT2H
 YehYDxCPzRQPzX8BOJkBD8GSIl1JauOZbGJVhPdzKbiNq6Mk58dhIAXubi7peo9suXXr
 g7og==
X-Gm-Message-State: AFeK/H1pxeFNpCl6qUp1thNZB8h/VbOpsMxh5ha9oeOoAcn2Uq7BIrm6FprPMHX1YBCEQXQz
X-Received: by 10.98.204.25 with SMTP id a25mr48186696pfg.6.1490228851975;
 Wed, 22 Mar 2017 17:27:31 -0700 (PDT)
Received: from ouranos.svl.corp.google.com ([100.123.242.122])
 by smtp.gmail.com with ESMTPSA id l29sm6028639pfb.118.2017.03.22.17.27.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 22 Mar 2017 17:27:30 -0700 (PDT)
From: Peter Hanson <peterh@google.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>,
 Peter Hanson <peterh@google.com>
Subject: [PATCH] ARM: dts: aspeed: zaius: Enable 12V Delta Power Brick.
Date: Wed, 22 Mar 2017 17:27:27 -0700
Message-Id: <20170323002727.117666-1-peterh@google.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 00:27:36 -0000

Signed-off-by: Peter Hanson <peterh@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
index 3bd70ed810af..4fd27617bb3a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
@@ -269,7 +269,13 @@
 	/* Master selector PCA9541A @70h (other master: CPU0)
 	 *   LM5066I PMBUS @10h
 	 */
-	/* 12V SMPS Q54SH12050NNDH @61h */
+
+	/* 12V SMPS Q54SJ12050 @61h */
+	q54sj12050@61 {
+		compatible = "delta,dps800";
+		reg = <0x61>;
+	};
+
 	/* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
 	/* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
 	/* CPU0 VR ISL68137 0.8V PMBUS @60h */
-- 
2.12.1.500.gab5fba24ee-goog
