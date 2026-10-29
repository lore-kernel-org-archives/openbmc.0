Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC59606A31C
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:53:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFVgb6zq3z30C6;
	Thu, 29 Oct 2026 14:52:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793245979;
	cv=none; b=a/DKVrLISDjB48yvFGlDUD7c9/WarybvWI0L6v1uc19GcmUO9uxetdEmOZn1j+3YUfJO/tfP0UQMywsRWmrQUTC5MLOiNnLN+4PZNkqTz+nKbLax0h7F0YZ0nJtas6aCgTbeLa3Z0w4TMFHvYJ+l8cN6otKqwH9EwtVeyfKfi7KfzUAzm9hM6AjOEFtJ2LZ8iTQwocq3dZoNsUBCG66s86EaoOMWgLbyerGK5ca+RTf3Txgs5E9hxcUBFAqjuuAjS//Wtbu18tlkWysYLZDMa99cAJJAixPSZiGevnvg+h3W/DHp1KvnWVzYtNy+qI7w3U8XHg49pkxylYIJVUKqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793245979; c=relaxed/relaxed;
	bh=ZelBi4AubZInti3vC36HEh7qkILloGZPDa34BKZ1yjo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtzgazK90qdw27YbOhVsjvfc/p8FS+TvTZ5fs0wzSKOorssklZgCVJ0SNbVcyCp3gemx8uH0mMHL7IsBX7MNo7VOeALfuF9NUB9XfvXJctQ0h5K8MgvzMGiS2sSzFXtA2RxCzarZiX/063dT8kHHqHjvFZ4XQkrR2nl4R+EtDSQ3KOphLnaubBhDJ/JOEuynUweuLg1ZDWjwy5zJ8uaFPhovsF2NhCYvO67I6QxrQsOFE0R34Q3+/12410YH1ckC8MVfjW7xTSdPdScCfsauUvK9ZXP21X7PrK15Y4zmQypmTyHPlwZUpiNmx122sBV7zlBVfXPNyftz2QvyS2u8+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFVgZ6JWzz2yql
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:52:58 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:52:42 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:52:42 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Conor Dooley
	<conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH linux dev-6.18 1/5] dt-bindings: arm: aspeed: Add AST2700 board compatible
Date: Thu, 29 Oct 2026 11:52:36 +0800
Message-ID: <20261029035242.651988-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029035242.651988-1-vince_chang@aspeedtech.com>
References: <20261029035242.651988-1-vince_chang@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ryan Chen <ryan_chen@aspeedtech.com>

Add device tree compatible string for AST2700 based boards
("aspeed,ast2700-evb" and "aspeed,ast2700") to the Aspeed SoC
board bindings. This allows proper schema validation and
enables support for AST2700 platforms.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20260609-upstream_ast2700-v9-1-f631752f0cb1@aspeedtech.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
(cherry picked from commit 34efd73379ff9f36ed598ade7406a1aaddd03d7b)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 970c53190f27..b7e70868ebd8 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -120,4 +120,10 @@ properties:
               - ufispace,ncplite-bmc
           - const: aspeed,ast2600
 
+      - description: AST2700 based boards
+        items:
+          - enum:
+              - aspeed,ast2700-evb
+          - const: aspeed,ast2700
+
 additionalProperties: true
-- 
2.43.0


