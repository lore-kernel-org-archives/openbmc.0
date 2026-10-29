Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC92606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:24:42 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFV2d4gRlz2yrC;
	Thu, 29 Oct 2026 14:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793244265;
	cv=none; b=DqD4MJixfHTh7PIo9e0JsbgTt10iGxQRu1CLsmgNfI7qKy27lWD/D8c71FjV445X1kV68e7T93LVqNM1H4uHPgOUXnF5j2hYdbGRsvY72sMY2WIKgLfS2qHVv7kKNFIIqn7UzNtUaDKoKM/0i3k9K+vBx3yMH+/HvFvVgeGkCyyaLiWpaLKZoEIpf+AZvyYFUjuYSlhIFGyeRSC9xdKkfzr2yKWC+DP+KA7x23zJzgALQCFmrsf/GPrH8CCsogaSOckkNZfccFD+k6Gnud+MSjvpe/1zNlG+CscvlSRC3iezg+zq/oN068mpwty9sy/8Ji/Gvpy2J3qdTbU62EgHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793244265; c=relaxed/relaxed;
	bh=j5+pHeNqM5Rv1TmhTyArdW6tAi+FR5Kz4HgRujQmT+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3dtjipTo7NEM4Uh49CAsq1R6DSxE/9dGuyXXse6obX6F+m1uhxvORu1y+dPC1si6Aq7lXrgU0Y6iqHHAQQ3uYr/KEtSk+0gyZBdd1mpWOoAI39KyGy7do8dfE/6nscoqUt9FvJJ026h8CZ4Em3TmYw4lbXKX5Stl8dalFbar149zKYATqRm5IJVyYbjOMm5AzhBnUk23eqs76+Soz+pvcreIW/DquVw9DgXQljUg3RmMIO2K2cnxDFqIw+EhjhdotTefx1w2VvC9ZouW7aukqzepynsRI7CfwqBw8VlwTqCriRxWeSmUMzW9v051JUKxV2sv9m6qUiTh6yL5zYsiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFV2c2Wdhz2yjN
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:24:24 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:24:08 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:24:08 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Billy Tsai <billy_tsai@aspeedtech.com>, <joel@jms.id.au>, Conor Dooley
	<conor.dooley@microchip.com>, Linus Walleij <linusw@kernel.org>, Lee Jones
	<lee@kernel.org>
Subject: [PATCH linux dev-6.18 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support AST2700 SoC1 pinctrl
Date: Thu, 29 Oct 2026 11:24:02 +0800
Message-ID: <20261029032407.540714-2-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029032407.540714-1-vince_chang@aspeedtech.com>
References: <20261029032407.540714-1-vince_chang@aspeedtech.com>
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

The AST2700 SoC integrates two interconnected SoC instances, each
managed by its own System Control Unit (SCU).

Allow the AST2700 SoC1 pin controller to be described as a child
node of the SCU by extending the compatible strings accepted by
the SCU binding.

There is no functional change to the SCU binding beyond permitting
the aspeed,ast2700-soc1-pinctrl compatible string.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Link: https://patch.msgid.link/20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com
Signed-off-by: Lee Jones <lee@kernel.org>
(cherry picked from commit 960b38750b17ed24d8f8de06e3c066c20d2167f9)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index 8b14d8d75639..47b07c30f6d7 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -100,6 +100,7 @@ patternProperties:
             - aspeed,ast2500-pinctrl
             - aspeed,ast2600-pinctrl
             - aspeed,ast2700-soc0-pinctrl
+            - aspeed,ast2700-soc1-pinctrl
 
     required:
       - compatible
-- 
2.43.0


