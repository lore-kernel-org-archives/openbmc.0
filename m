Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D091606A321
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 02:02:43 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFSD06Trbz2yj1;
	Thu, 29 Oct 2026 13:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793239344;
	cv=none; b=ZOa6on3LdL9C3jtxLqUUmPLGEhdUvVeqvPp5MDMjBS0CaFzYMf27Jmb6ZR5NFxpVMCQ6h/5RP5H1at/PSYH3PTosVFfb7h6aOHiua+hQCChDYjNXuTNPzzWus/Ziu6fhifAmm2nhXL2x6jbyaYtp6g/bmdOsGz3LphZXvgp6GPIJRkTtyFlcBbZZNpq7sx0hAx1yz7paCus+pOfzVefQyjGoCNTmiEi2n/xJuslyvA6VSDi6vtzymQif1P1VApAoyMBoscyjo60t9DBqdo99SxQU2bSxFQxiO8PYh4EIvPkCR3LzprNIy5FTQf/kyd8ERUSezYojViyPOU0/4ZQlng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793239344; c=relaxed/relaxed;
	bh=+TKuiCC16oiw7N+aYntIvdHtz82Q+Bg4ypJKyaRnvLE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOuKsipc7EZRKQ9KX3T4Nan7JG/Ie/IX5NT+1eBEsArrl2i7NRt58YRXx0j3kMoCrMHfNbOmDOYZ64OTOUnv4LOBboMKW6s+OoYfOw8LUA+c1nfs0GUD+3WjWpvAvMm+k3gjAZp4dEFeNi7EG5VzpY9r7x8w+qh0W/mGnO9PsynpcODbOm1hCz5MMR5zAAe4+urEpv5XffMkd7MlXUOcq6THeq72GBmWpUTlnjYUl3kMmL3zFDERGcXy6R793QMH2BXOpHyuORGW/ryBAir7GA9v/FX79R2bd88aw/4VC6tHykYg93qCmGJFaWLU8JoprSZC2ZQX4t57JL7A+QrQ3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFSCy4BBBz2ygK
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 13:02:22 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 10:02:06 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 10:02:06 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <joel@jms.id.au>, "Conor
 Dooley" <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH linux dev-6.18 1/4] spi: dt-bindings: aspeed,ast2600-fmc: Add AST2700 SoC support
Date: Thu, 29 Oct 2026 10:02:00 +0800
Message-ID: <20261029020205.335352-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029020205.335352-1-vince_chang@aspeedtech.com>
References: <20261029020205.335352-1-vince_chang@aspeedtech.com>
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

From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI bindings.
AST2700 FMC/SPI controllers are not compatible with AST2600 due to the
following hardware differences:

- Address decoding unit uses 64KB granularity (AST2600 uses 1MB).
- Segment register semantics are changed.
    AST2600: start <= range <= end
    AST2700: start <= range < end
- Hardware limitations in AST2600 address decoding registers have been
  resolved in AST2700, so extra callback function used for bug fixup
  is no longer required.

These differences require distinct compatible strings for AST2700.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://patch.msgid.link/20251114101042.1520997-2-chin-ting_kuo@aspeedtech.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit be6671d3908e97a2128f5327610a1dcb4d420cfa)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
index 57d932af4506..80e542624cc6 100644
--- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
+++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 description: |
   This binding describes the Aspeed Static Memory Controllers (FMC and
-  SPI) of the AST2400, AST2500 and AST2600 SOCs.
+  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
 
 allOf:
   - $ref: spi-controller.yaml#
@@ -20,6 +20,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - aspeed,ast2700-fmc
+      - aspeed,ast2700-spi
       - aspeed,ast2600-fmc
       - aspeed,ast2600-spi
       - aspeed,ast2500-fmc
-- 
2.43.0


