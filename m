Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA4606A319
	for <openbmc@archiver.kernel.org>; Tue, 20 Oct 2026 23:02:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4j8Sbq2ZJQz2yPR;
	Wed, 21 Oct 2026 10:02:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1792495588;
	cv=none; b=YCEGqo9VLbmmHzzuUdfSiqZO3FOefSfkT2/X2E5/AU2exsCSFKJHhnw1NlsTkmSre5jZmxb3iuQvc6fJIlJYTriWggzXxnUvf+Z6+fTI8yZxByLDd+VmjFkENfrvbYW92tp0CWGbtYDxF+NdhL1c1qapWfoMa9FCD4fN2msLoK3IdgZO08QmNdL5o6JzcH/T7grj50iuagYDRiNaZ779ASq856WIu5kinfMRKnuGfAfpx5Og15iNKS2DOYoi3gTBpuIltJkRRpwZQYY9wfplWx4Oil0e/30AEAH1GXwNp5Lyb2gmC2qqfwJRgG6GBJCEKuJ8wIXHgkfsCsu36F69CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1792495588; c=relaxed/relaxed;
	bh=b1c4a8LGzkAlWJaW5GGLfzI5hyIP41cYA/JBMXI2mcI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l61DWOGcm0JyG+8K8PLbUkikaWcqwPEx+PAK3llmWkT6F2h2iwZykE5S4ZqSnzExTqG06mzT15MiTPAzcfF377cd1xApeO2CGdgnSr/jFNuSW3jcrNwS8wwceDJiotRUI0jbA83AoQ8RG9ALub9soj1uZeaThYdmg+dNWtW628OkKkpL7PQZI7in1ArsZoDwCwxAswNwVKEM8YnCpbiuX7NLh3rh2DDJmqi4V4661fC+sdQgGVNlpvJYusIw+YD7l3lUrlXucXT8mxLix3tFoa19uVOvGLJ+hC98VxXGqgRDaX0zA9bMY8p9yjkEIP1GLlH+O0tKTM674VfeaYkUxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=cooper_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=cooper_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4j898z1zBqz2xSl
	for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2026 22:26:26 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:26:09 +0800
Received: from aspeed-fw03.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:26:08 +0800
From: Cooper Huang <cooper_huang@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <andrew@codeconstruct.com.au>,
	<tan.siewert@9elements.com>
CC: <joel@jms.id.au>, <vince_chang@aspeedtech.com>, <troy_lee@aspeedtech.com>,
	<ryan_chen@aspeedtech.com>, <chin-ting_kuo@aspeedtech.com>
Subject: [PATCH u-boot v2026.10-openbmc] configs: evb_ast2700: set default SPI FIT address
Date: Tue, 20 Oct 2026 19:26:08 +0800
Message-ID: <20261020112608.131187-1-cooper_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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

The AST2700 EVB bootspi command reads the FIT image from ${fdtspiaddr},
but the default environment does not define fdtspiaddr. Set it to the
SPI-mapped FIT image address used by the OpenBMC image layout: flash
offset 0x420000, right after the environment, in the FMC AHB window at
0x100000000.

Fixes: b62b55ba4b2d ("arm: aspeed: add ASPEED AST2700 SoC family support")
Signed-off-by: Cooper Huang <cooper_huang@aspeedtech.com>
Link: https://patch.msgid.link/20261016-ast2700-fdtspiaddr-v1-1-2b376be8a6ef@aspeedtech.com
---
 include/configs/evb_ast2700.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/configs/evb_ast2700.h b/include/configs/evb_ast2700.h
index 6b73eddc1af..bf5cda94fe4 100644
--- a/include/configs/evb_ast2700.h
+++ b/include/configs/evb_ast2700.h
@@ -21,6 +21,7 @@
 		"bootm ${loadaddr}; "					\
 		"echo Error loading kernel FIT image\0"			\
 	"loadaddr=" STR(CONFIG_SYS_LOAD_ADDR) "\0"			\
+	"fdtspiaddr=0x100420000\0"					\
 	"bootside=a\0"							\
 	"rootfs=rofs-a\0"						\
 	"setmmcargs=setenv bootargs ${bootargs} "			\
-- 
2.34.1


