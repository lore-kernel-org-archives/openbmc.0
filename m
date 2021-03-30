Return-Path: <SRS0=myNV=I4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6910C433DB
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 00:33:37 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F60E61985
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 00:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F60E61985
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8Vmb6ftQz30F6
	for <openbmc@archiver.kernel.org>; Tue, 30 Mar 2021 11:33:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MCAxh5WQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MCAxh5WQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Vkn1m4kz2yyk;
 Tue, 30 Mar 2021 11:32:00 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D037B18F;
 Mon, 29 Mar 2021 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617063847;
 bh=fIyo5Z9zNHuQ1sE64Jzum374jTuO69a6cFL9RIBAmuo=;
 h=From:To:Cc:Subject:Date:From;
 b=MCAxh5WQ+FIdaywXSnS6heqIjLTjVSc8vnUIUKk09fJp8wy8VEc+BqjGRurVWWfLc
 A2mfuEXdKwx8rMggd6kuzHdut3VAbajZYYBD1dlywn6vGH2vRNHxCwzw+344lF9PJk
 UTfJaVB/Qyf1rpQe3kn+16HF8J2v1sCsT9JSzPZA=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/3] simplify Aspeed VUART SIRQ polarity DT config,
 add e3c246d4i BMC dts
Date: Mon, 29 Mar 2021 19:23:35 -0500
Message-Id: <20210330002338.335-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This patch series reworks the existing aspeed,sirq-polarity-sense DT
property as a simple boolean (aspeed,sirq-active-high) so as to
disentangle the interrupt polarity from the eSPI/LPC strapping and
updates the documentation accordingly.

The third patch adds an in-tree consumer of this property
(aspeed,sirq-polarity-sense never really had one) in the form of a
device tree for the ASRock E3C246D4I BMC, an OpenBMC target in
progress at Equinix Metal (formerly known as Packet).


Zev Weiss (3):
  drivers/tty/serial/8250: simplify Aspeed VUART SIRQ polarity DT config
  dt-bindings: serial: 8250: update for aspeed,sirq-active-high
  ARM: dts: aspeed: add ASRock E3C246D4I BMC

 .../devicetree/bindings/serial/8250.yaml      |  14 +-
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 188 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  39 +---
 drivers/tty/serial/8250/Kconfig               |   1 -
 4 files changed, 196 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts

-- 
2.31.1

