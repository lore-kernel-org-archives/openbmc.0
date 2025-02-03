Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EBCC02192
	for <openbmc@archiver.kernel.org>; Mon,  3 Feb 2025 17:12:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMP06SZz3dVN
	for <openbmc@archiver.kernel.org>; Tue,  4 Feb 2025 04:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602700;
	cv=none; b=H/HcyboOGrpL4CVY3PycfO1ofmPV8vkQReBrBizN2FXF/rqV/KV/McfvABDNEQcwSIO04FMtgxu5NGvKsd/tMF4YQAN+sqmjThBfAMqYpl3FYwHV/GE2lqZSvBajRABNYibdlt3vE2+Lsd5SVN2zXYVcLeMji0uZ0ino5Si8RMjwzQSAwJ5oGfOrwo5HiSxZQfEmdY5lLWDVQ0ZbpiFhj7EWrCf2hrYSHyebjgE61vx0WdU17v9GqbEchtr/qxoIIZkWIqHBI9fDlVmVqDYA73/1LKowx/MmLMXGVuNnJ+erU6NJW820Ny1wCPaabua9SOM2f1TZtxjK7KGxKGcz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602700; c=relaxed/relaxed;
	bh=r3yb6HVJF+ShdVo1h+vAtuD/kcGFY6iG4+3LfQm+TiY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nZSBbvcLxYvncstND5+iK6JojJa5vtIPc/UHUlQxPLGwhNYFa91LYdIh9zJaD9Vf9b3DN9G/7uPE41HYDng3NYiuMfK93tLjPWb+/aWA4c5JqW4EJNGV0vaESFR1ME1uyADWPAfFanurn/z/6kHqFck2px7/UDW13p3VQtmGAvbhaBdKKAyT5Hj6Va4j2uFCczAxJefVEQt/3EaI0aTkHxmpXUIbhO7FP0MBTt5asApOX8WfDwyIDQ93kBc1gFPZEnu9Aow0Lwxzp4I91hqXMRtvyDdQbu5HhzeOLPjZYU2OTlINGNK7dAolFqWYhkTYji/rBMUubVPRtwVxJtbpIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtMG5KMnz2xjd
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:38 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GExES006481
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:15:00 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:14:58 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:55 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 473925F5B1;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 37539DC3281; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 0/8] i2c: npcm7xx: Various upstream modification 
Date: Mon, 3 Feb 2025 18:14:42 +0200
Message-ID: <20250203161450.265480-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NotSetDelaration: True
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch set contain the following upstream modifications:
i2c: Remove redundant comparison in npcm_i2c_reg_slave · torvalds/linux@48acf82
i2c: npcm: restore slave addresses array length · torvalds/linux@8f65c45
i2c: npcm: correct the read/write operation procedure · torvalds/linux@e365422
i2c: npcm: use a software flag to indicate a BER condition · torvalds/linux@b011810
i2c: npcm: Modify timeout evaluation mechanism · torvalds/linux@4a34b9b
i2c: npcm: Assign client address earlier for `i2c_recover_bus()` · torvalds/linux@862dd4f
i2c: npcm: use i2c frequency table · torvalds/linux@6ddc913
i2c: npcm: Enable slave in eob interrupt · torvalds/linux@8b56f98

The above modifications build successfully.

Charles Boyer (1):
  i2c: npcm: Enable slave in eob interrupt

Rand Deeb (1):
  i2c: Remove redundant comparison in npcm_i2c_reg_slave

Tyrone Ting (6):
  i2c: npcm: restore slave addresses array length
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
  i2c: npcm: use i2c frequency table

 drivers/i2c/busses/i2c-npcm7xx.c | 458 +++++++++++++++++++++++--------
 1 file changed, 346 insertions(+), 112 deletions(-)

-- 
2.34.1

