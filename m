Return-Path: <SRS0=K+4f=PK=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FF9C433EF
	for <openbmc@archiver.kernel.org>; Fri, 22 Oct 2021 02:04:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5600361163
	for <openbmc@archiver.kernel.org>; Fri, 22 Oct 2021 02:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5600361163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb72G5hysz3cFf
	for <openbmc@archiver.kernel.org>; Fri, 22 Oct 2021 13:04:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=U2/S3A/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=U2/S3A/W; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb6yD4PDrz2y7X
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 13:00:52 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 86736B5D;
 Thu, 21 Oct 2021 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634868048;
 bh=ywEBrdGbkyi0QJnFE8aQ/OJz+ZBKYfFbMIxjCGa0a6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U2/S3A/W/JaKiShxEXetHUItCy/+sBkAcB5xLHm4tyjmabYHNOz9U8/A5M1LzWwIW
 ricK/uahG5gtjO5pOnXZZBD/XUJZsN3ZWiha2w8Ozz4XTx3UKbCziVpsgZPmxyR4yP
 I2mIzeFcQlU0iAilWPibes2OI83hj6YYmIpsRQxY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/5] of: platform: instantiate reserved devices
Date: Thu, 21 Oct 2021 19:00:32 -0700
Message-Id: <20211022020032.26980-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022020032.26980-1-zev@bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Devices with a "reserved" status will now be passed through to
of_device_add() along with "okay" ones so that the driver core is
aware of their existence and drivers can be explicitly bound to them
when appropriate.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 74afbb7a4f5e..060e1e9058c2 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -170,7 +170,7 @@ static struct platform_device *of_platform_device_create_pdata(
 {
 	struct platform_device *dev;
 
-	if (!of_device_is_available(np) ||
+	if ((!of_device_is_available(np) && !of_device_is_reserved(np)) ||
 	    of_node_test_and_set_flag(np, OF_POPULATED))
 		return NULL;
 
-- 
2.33.1

