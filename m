Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5D3C19F2D
	for <openbmc@archiver.kernel.org>; Tue,  9 Aug 2022 14:05:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2FG029lDz3bXD
	for <openbmc@archiver.kernel.org>; Wed, 10 Aug 2022 00:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2FFS5Pccz304m
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:04:59 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279E4qVG006457
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 17:04:52 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 17:04:51 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 9 Aug 2022
 22:04:49 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Aug 2022 22:04:49 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id BA53160269; Tue,  9 Aug 2022 17:04:48 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 1/2] dt-binding: bmc: npcm7xx-lpc-bpc: Add npcm845 compatible
Date: Tue, 9 Aug 2022 17:04:43 +0300
Message-ID: <20220809140444.28753-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220809140444.28753-1-tmaimon77@gmail.com>
References: <20220809140444.28753-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt          | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
index 0832c9cbea32..2aa16d62a224 100644
--- a/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
+++ b/Documentation/devicetree/bindings/bmc/npcm7xx-lpc-bpc.txt
@@ -1,15 +1,16 @@
-Nuvoton NPCM7xx LPC BPC interface
+Nuvoton NPCM LPC BPC interface
 
-Nuvoton BMC NPCM7xx BIOS Post Code (BPC) monitoring two
+Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two
 configurable I/O addresses written by the host on the
 Low Pin Count (LPC) bus, the capure data stored in 128-word FIFO.
 
-NPCM7xx BPC supports capture double words, when using capture
+NPCM BPC supports capture double words, when using capture
 double word only I/O address 1 is monitored.
 
 Required properties for lpc_bpc node
 - compatible	: "nuvoton,npcm750-lpc-bpc" for Poleg NPCM7XX.
-- reg 			: specifies physical base address and size of the registers.
+		  "nuvoton,npcm845-lpc-bpc", "nuvoton,npcm750-lpc-bpc" for Arbel NPCM8XX.
+- reg 		: specifies physical base address and size of the registers.
 - interrupts	: contain the LPC BPC with flags for falling edge.
 - monitor-ports : contain monitor I/O addresses, at least one monitor I/O
 				  address required
-- 
2.33.0

