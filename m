Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E58606A31A
	for <openbmc@archiver.kernel.org>; Wed, 28 Oct 2026 03:37:36 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jDtMh12hMz2ygK;
	Wed, 28 Oct 2026 14:37:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793158623;
	cv=none; b=WD/HPSffr3iw4+FSug0gvJwyTfDlFWnyjf8IwRQdx6lTED1AV62qw31SG0XBbtd1Pkurien+Kdw9+Xt9HghM9WCr9/zGwcU7n4sP+TcUEmQHzoq65h22GJz3l9341wUsHUxcXkID0GNnCo5U7VdKMRQnzumWQiw+dpPaAfw/aTgfdeHvSPove1S2i90cmHL4raxidYMmH/OivewKzCG+tjIHjvrHurI6dnXjG6WcWhPbzXIfRAPHCyjABonTs3iRDVvaR/pi33vA9LdYU45Bt5n90sZxMsnWdfXt5VRrNJyGxzUrEHXuDtLcifWelFgXR2vi2vjAE+Pdp1WG2X4n1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793158623; c=relaxed/relaxed;
	bh=en2Ve4g8dvdSl/ankcwbO47Ao5MO8GDiF/uYao+2SH4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkFBQWPam3NV8t/XigOHpqHYy+2Gm2/ky21p4XkMTGZC8CzzzD6SNOjC5nkaWl+M8UP4chxeUetoBrBibQMn95qTZzYnhlzZR5UfhYvoQVNbFwScDiG2WZWOVnrzhFOBw4QJqM/KBIpyKBT5eIGdlGWyQD1RDzOWVyM39drPJO+wvXwc34mm8LE+oPspLtEIMI4wX2/BnMTUjcfJsJfU/hvU4Yo2IPEDP6NxdTT2I4RhIC/1vxop9KR6wILHVGogQC/RC2T3HgbGdlKWFanOXtGs7V4NrRTJ1uJ7zXyxdF1k+ecgLa5MbRnxfyrQaNwBlGXKbIyu5HDfq3OHBxoLrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=vince_chang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jDtMg0txvz2yYd
	for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2026 14:37:03 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 28 Oct
 2026 11:36:44 +0800
Received: from aspeed-fw02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 28 Oct 2026 11:36:44 +0800
From: Vince Chang <vince_chang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: Ryan Chen <ryan_chen@aspeedtech.com>, <joel@jms.id.au>, Brian Masney
	<bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH linux dev-6.18 2/3] MAINTAINERS: Add entry for ASPEED clock drivers.
Date: Wed, 28 Oct 2026 11:36:41 +0800
Message-ID: <20261028033644.355247-3-vince_chang@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028033644.355247-1-vince_chang@aspeedtech.com>
References: <20261028033644.355247-1-vince_chang@aspeedtech.com>
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

Add support entry for ASPEED clock drivers.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
(cherry picked from commit 122c157c4808f79bfe2d1786b59479fead43ad92)
Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d88583b5ec3..03432299ba6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3773,6 +3773,15 @@ L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	drivers/net/phy/ax88796b_rust.rs
 
+ARM/ASPEED CLOCK SUPPORT
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+L:	linux-clk@vger.kernel.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+F:	drivers/clk/aspeed/
+
 ASPEED CRYPTO DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
-- 
2.43.0


