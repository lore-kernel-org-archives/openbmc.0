Return-Path: <SRS0=dhqT=PG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E276C433F5
	for <openbmc@archiver.kernel.org>; Mon, 18 Oct 2021 23:18:42 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A8C6108E
	for <openbmc@archiver.kernel.org>; Mon, 18 Oct 2021 23:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81A8C6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCVS16Yjz2yyS
	for <openbmc@archiver.kernel.org>; Tue, 19 Oct 2021 10:18:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hog7bbef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=hog7bbef; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCT50qpQz3c9P
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:17:27 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 805F312B;
 Mon, 18 Oct 2021 16:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634599043;
 bh=Uli1WR8UWpNt7EmPjX1GcffqS3gzN8FUSo94EIgBnDc=;
 h=From:To:Subject:Date:From;
 b=hog7bbefpNvjTdBYbr0mnTP4UvWirlZu5mzhKrI73GLYl+XNZA/i0O4C4d+KbZk2t
 5twjjNlwIl83f4tcuXYCHQts83X+fr+EhIfgcCNb2oZXi3yXbIq0QytYqpf1oUa8vf
 9hN+X/Z0Ra+E1mYOhN2YplkwV1AbjnUYKmMYS8UU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.14 0/8] hwmon: (pmbus/lm25066) Configurable sense
 resistor, other cleanups
Date: Mon, 18 Oct 2021 16:17:06 -0700
Message-Id: <20211018231714.19054-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Joel,

This patch series is now on its way upstream via Guenter Roeck's
hwmon-next tree; until the OpenBMC kernel gets rebased onto an
upstream release that includes them it'd be great if they could be in
the OpenBMC kernel too.

https://lore.kernel.org/linux-hwmon/20210928092242.30036-1-zev@bewilderbeest.net/T/


Thanks,
Zev

Zev Weiss (8):
  hwmon: (pmbus/lm25066) Add offset coefficients
  hwmon: (pmbus/lm25066) Adjust lm25066 PSC_CURRENT_IN_L mantissa
  hwmon: (pmbus/lm25066) Avoid forward declaration of lm25066_id
  hwmon: (pmbus/lm25066) Let compiler determine outer dimension of
    lm25066_coeff
  hwmon: (pmbus/lm25066) Mark lm25066_coeff array const
  hwmon: (pmbus/lm25066) Add OF device ID table
  hwmon: (pmbus/lm25066) Support configurable sense resistor values
  dt-bindings: hwmon/pmbus: Add ti,lm25066 power-management IC

 .../bindings/hwmon/pmbus/ti,lm25066.yaml      | 54 ++++++++++++
 Documentation/hwmon/lm25066.rst               |  2 +
 drivers/hwmon/pmbus/lm25066.c                 | 88 +++++++++++++++----
 3 files changed, 126 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml

-- 
2.33.1

