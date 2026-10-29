Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB624606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:02:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTYf5Fw5z2ygg;
	Thu, 29 Oct 2026 14:02:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793242966;
	cv=none; b=RsihjFydnyryCD3Yk2/G9CRllHvokvhG7Ohj9R018Rp5tn+NEblisYFvxJmHU3QeJ4fUJukqR+8RgtSThzRRu8Lwjy4HM9LEPOlU/myQugzKPr/6wHYvHMtj2vXujLMpvo9HRJFxTm+mhUms+ga2OQwQ9OAgmpQh/LbhzJbZtsVINdKfEF9C+rJia3PIQxHfhY9HjZUMhynSoPBRspkokGamvmQYS7OmONkVf8FSOBMeFk5RP5rWM/3k8pwQrhbZxXBxT3zIC/d90VvqIVYhxitisH0zf8FdJGhSh3frO/jpTFF7jYhIIOBtDXoEzIDExulQlVvjL8WXyxKrCpDtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793242966; c=relaxed/relaxed;
	bh=zgKegM7+8jqLLIBnXyVp5UvFksFZEHH0fOSK8afSmf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ejnh40glxXu8xlm2I7Ne4/aKoqtYAGNpCur7KSi0HCBNxpUurdKYAxP1lmwY5GykbuM7K0ZUf17IwXruu55MyFAgcwuQIoLdVW7E+L35yFYBiWtUEJ36I6WEow+uT1yKlS862zT4fGoklg17Sgexf0UrLncXqoDHWN3WLXQE7QUqyior7fHYXqJkUa/qVqedbX0wuBKhxAfPUaAS+WeiiQfEq6nM9HSrCkXeTpEFkv/luzcmfLajbNK5vQwRSxzjIU8212nbgRGNz/PpmTcq5BwcFImGsz6GKZWX5Z1Dnjx662rR2e3HkZkOn9BbUDi8xI38hAIe5jP2NoMJNlyukA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTYc3bFtz2yDm
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:02:43 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:02:24 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:02:24 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>
Subject: [PATCH linux dev-6.18 0/6] irqchip: aspeed: backport AST2700 A2 support
Date: Thu, 29 Oct 2026 11:02:15 +0800
Message-ID: <20261029030224.470029-1-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport six upstream Linux ASPEED interrupt-controller commits to
OpenBMC dev-6.18 to add AST2700 A2 bindings, interrupt routing and
KUnit tests, and remove AST2700 A0 support.

Include the two follow-up fixes for allocation in atomic IRQ context and
incomplete interrupt merge-bank disabling at probe, so the A2 support and
its fixes can be backported together.

Michael Pesa (1):
  irqchip/ast2700-intc: Disable all interrupt merge banks on probe

Ryan Chen (5):
  dt-bindings: interrupt-controller: Describe AST2700-A2 hardware
    instead of A0
  irqchip/ast2700-intc: Add AST2700-A2 support
  irqchip/ast2700-intc: Add KUnit tests for route resolution
  irqchip/aspeed-intc: Remove AST2700-A0 support
  irqchip/ast2700-intc: Avoid allocating in the irq_domain activate()
    callback

 .../aspeed,ast2700-intc.yaml                  |  86 ---
 .../aspeed,ast2700-interrupt.yaml             | 188 ++++++
 drivers/irqchip/.kunitconfig                  |   5 +
 drivers/irqchip/Kconfig                       |  23 +
 drivers/irqchip/Makefile                      |   3 +-
 drivers/irqchip/irq-aspeed-intc.c             | 139 -----
 drivers/irqchip/irq-ast2700-intc0-test.c      | 473 ++++++++++++++
 drivers/irqchip/irq-ast2700-intc0.c           | 582 ++++++++++++++++++
 drivers/irqchip/irq-ast2700-intc1.c           | 281 +++++++++
 drivers/irqchip/irq-ast2700.c                 | 107 ++++
 drivers/irqchip/irq-ast2700.h                 |  48 ++
 11 files changed, 1709 insertions(+), 226 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.yaml
 create mode 100644 drivers/irqchip/.kunitconfig
 delete mode 100644 drivers/irqchip/irq-aspeed-intc.c
 create mode 100644 drivers/irqchip/irq-ast2700-intc0-test.c
 create mode 100644 drivers/irqchip/irq-ast2700-intc0.c
 create mode 100644 drivers/irqchip/irq-ast2700-intc1.c
 create mode 100644 drivers/irqchip/irq-ast2700.c
 create mode 100644 drivers/irqchip/irq-ast2700.h

-- 
2.43.0


