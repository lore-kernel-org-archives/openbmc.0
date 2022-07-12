Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A8DC43334
	for <openbmc@archiver.kernel.org>; Tue, 12 Jul 2022 01:26:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhjkq1X6Sz3by2
	for <openbmc@archiver.kernel.org>; Tue, 12 Jul 2022 11:26:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=EJ6QI3xf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=wangmin_phy@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=EJ6QI3xf;
	dkim-atps=neutral
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhjjL4bgdz3bsl;
	Tue, 12 Jul 2022 11:24:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kYhfT
	TXFSNJd4PzWfDHhsdkZ92TcmmF06NJjVM9JBEU=; b=EJ6QI3xf0ZpGbRSOi5OQb
	6097lhZCJc4EVzyzcL6xtSrgtkBpd972ss96xN0B3wd74X1eEHtf6N7jK5I/9eIm
	Kz2o94mCiRZ29ojrDt+Ep7ORjCqc6nx4ZM0QvBDGt1eEXvnwVTcR/90aKXoPu5zx
	VTQGS/Zg+ylI9L0IPD+OJs=
Received: from localhost.localdomain (unknown [120.55.36.104])
	by smtp10 (Coremail) with SMTP id NuRpCgBnhoIpzcxi3zHIGQ--.8524S2;
	Tue, 12 Jul 2022 09:23:54 +0800 (CST)
From: wangmin_phy@126.com
To: openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH 0/1] *** Add device tree for Phytium's BMC ***
Date: Tue, 12 Jul 2022 09:23:52 +0800
Message-Id: <20220712012353.386887-1-wangmin_phy@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgBnhoIpzcxi3zHIGQ--.8524S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOzuADUUUU
X-Originating-IP: [120.55.36.104]
X-CM-SenderInfo: 5zdqwzhlqb1xb16rjloofrz/1tbiYAo8pVpEIRncBgAAsP
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
Cc: wangmin@phytium.com.cn
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

From: Min Wang <wangmin@phytium.com.cn>

*** BLURB HERE ***

Min Wang (1):
  ARM: dts: aspeed: Add device tree for Phytium's BMC

 arch/arm/boot/dts/Makefile                    |   3 +-
 .../boot/dts/aspeed-bmc-phytium-pomelo.dts    | 302 ++++++++++++++++++
 2 files changed, 304 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-phytium-pomelo.dts

-- 
2.27.0

