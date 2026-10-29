Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A2606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 03:04:04 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFTYq0b9sz30MZ;
	Thu, 29 Oct 2026 14:02:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793242974;
	cv=none; b=mXJtzlB9PeZwFcEfvcaKMVn6ri+6vU762Qxed6W75W3F8HrTvdVKELKG+2a6hdTuxOlOFH601Ty5uV/lp03LmQNvJdDNOzxjgRzoDFntLyGoXSTDOxeneDUCPTrCxcHZIaCi8WELvvLB0MZBNZtUBxSCPEfNaRm+1O58iZdd/IB0vSGcFy5k4/MpiSEm1xDvNrOqN9U77UxJQ8L8BsoYoE0q7KfdQDmAz3PvpUTEHgg1xNkHS2Xeyh6r3rZTpFmqUM8Sn8UYSqtROhw0i1+XQ0pGUpKaJ8ZopmX98l5jJm1W7UJg4jqepF9YnxysG5KTZkfSZMTmHxuJ4/UhKQcHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793242974; c=relaxed/relaxed;
	bh=waYHc7UmbPxNgRdQoSvA2HnAEtVyadn4TZ6aKU/M52c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XKVcyMWN/RVIs2i0GS8fB7sMIcXJztAiUASFULvrT2nFhoZQ5qNeWPvh7VBUdckExhvM8SR4iBpoSYRiF8+Yufm2PbjWTPgyWNb1XHo8SpX/ijVLSbYmYIjLlq9q81D1m6rhvhFQsRJFQDhBwgxLajpZwFZwo9I3EzXSop/J+jPg6gfG8uORownVfKAlh0pzLt1bZA6Y+LQU+TbWeB6NPoLTbjZd4GQRYY9O6dujCoEs6Z6AQt0DYE1L5U2vohiEUZPBPBtBHabKlhl1NrAGx2ynhZQ0s9Lnl4FSvaNssQDsfd/CExy/dCdUh7jWQDqZbc0R8L3MEK/K/6JWwbngGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFTYp0MDKz30FB
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 14:02:54 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 29 Oct
 2026 11:02:25 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 29 Oct 2026 11:02:25 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Thomas Gleixner
	<tglx@kernel.org>
Subject: [PATCH linux dev-6.18 5/6] irqchip/ast2700-intc: Avoid allocating in the irq_domain activate() callback
Date: Thu, 29 Oct 2026 11:02:20 +0800
Message-ID: <20261029030224.470029-6-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029030224.470029-1-vince_chang@aspeedtech.com>
References: <20261029030224.470029-1-vince_chang@aspeedtech.com>
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

The interrupt core calls the irq_domain_activate() callback from
__setup_irq() with desc->lock held and interrupts disabled. Both
aspeed_intc1_irq_domain_activate() and aspeed_intc0_resolve_route() test a
compatible string with fwnode_device_is_compatible().

fwnode_device_is_compatible() invokes fwnode_property_match_string(), which
allocates with GFP_KERNEL. That's obviously not possible with interrupts
disabled and a raw spinlock held.

Both call sites are only ever handed OF nodes, so use
of_device_is_compatible() instead: it walks the property in place and does
not allocate.

Fixes: 07825e41519a ("irqchip/ast2700-intc: Add AST2700-A2 support")
Reported-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://patch.msgid.link/20260819-fix-ast2700-intc-atomic-alloc-v1-1-d92a02e2a239@aspeedtech.com
(cherry picked from commit b76eee9c2157223aa4aac42ceebb563288e078aa)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 drivers/irqchip/irq-ast2700-intc0.c | 2 +-
 drivers/irqchip/irq-ast2700-intc1.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-ast2700-intc0.c b/drivers/irqchip/irq-ast2700-intc0.c
index 14b8b88f1179..c85b98a19bd4 100644
--- a/drivers/irqchip/irq-ast2700-intc0.c
+++ b/drivers/irqchip/irq-ast2700-intc0.c
@@ -312,7 +312,7 @@ int aspeed_intc0_resolve_route(const struct irq_domain *c0domain, size_t nc1outs
 		return -ENOENT;
 
 	if (!IS_ENABLED(CONFIG_ASPEED_AST2700_INTC_TEST) &&
-	    !fwnode_device_is_compatible(c0domain->fwnode, "aspeed,ast2700-intc0"))
+	    !of_device_is_compatible(to_of_node(c0domain->fwnode), "aspeed,ast2700-intc0"))
 		return -ENODEV;
 
 	intc0 = c0domain->host_data;
diff --git a/drivers/irqchip/irq-ast2700-intc1.c b/drivers/irqchip/irq-ast2700-intc1.c
index 59e8f0d5ddcd..df6acbafce2d 100644
--- a/drivers/irqchip/irq-ast2700-intc1.c
+++ b/drivers/irqchip/irq-ast2700-intc1.c
@@ -157,7 +157,8 @@ static int aspeed_intc1_irq_domain_activate(struct irq_domain *domain,
 					intc1->ranges.nranges,
 					intc1->ranges.ranges, &resolved);
 	if (rc < 0) {
-		if (!fwnode_device_is_compatible(intc1->upstream->fwnode, "riscv,aplic")) {
+		if (!of_device_is_compatible(to_of_node(intc1->upstream->fwnode),
+					     "riscv,aplic")) {
 			dev_warn(intc1->dev,
 				 "Failed to resolve interrupt route for hwirq %lu in domain %s\n",
 				 data->hwirq, domain->name);
-- 
2.43.0


