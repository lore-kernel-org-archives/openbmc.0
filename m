Return-Path: <SRS0=dhqT=PG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EB2C433EF
	for <openbmc@archiver.kernel.org>; Mon, 18 Oct 2021 23:20:27 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D8360F02
	for <openbmc@archiver.kernel.org>; Mon, 18 Oct 2021 23:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46D8360F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYCXT6RZWz3c5k
	for <openbmc@archiver.kernel.org>; Tue, 19 Oct 2021 10:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=nG84xIBN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=nG84xIBN; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYCT50bYdz3bn5
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 10:17:28 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 56A4FB25;
 Mon, 18 Oct 2021 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634599044;
 bh=+bWpQkI1O4/JywgiOFgtTo1BhtlZerGBHCVvyBvBOyc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nG84xIBNERVi8FqLSTZr/0iu/W13lBPnbq27gKMNEX/qj58BxuINPtfoQyPixXFlR
 R3LKqg1meeK/hzvtomDDXchjR+re+OXll6vuikQW0DhKlNjZQs8pUKz0lzXWpxSwr4
 3V7hVR0rMa/c3bGVMAuOB7pM6iYrgFqKAm7KyFIU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.14 4/8] hwmon: (pmbus/lm25066) Let compiler
 determine outer dimension of lm25066_coeff
Date: Mon, 18 Oct 2021 16:17:10 -0700
Message-Id: <20211018231714.19054-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211018231714.19054-1-zev@bewilderbeest.net>
References: <20211018231714.19054-1-zev@bewilderbeest.net>
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

Maintaining this manually is error prone (there are currently only
five chips supported, not six); gcc can do it for us automatically.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Fixes: 666c14906b49 ("hwmon: (pmbus/lm25066) Drop support for LM25063")
Link: https://lore.kernel.org/r/20210928092242.30036-5-zev@bewilderbeest.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/lm25066.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index 4dc003ff859e..1ff5407b6977 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -51,7 +51,7 @@ struct __coeff {
 #define PSC_CURRENT_IN_L	(PSC_NUM_CLASSES)
 #define PSC_POWER_L		(PSC_NUM_CLASSES + 1)
 
-static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
+static struct __coeff lm25066_coeff[][PSC_NUM_CLASSES + 2] = {
 	[lm25056] = {
 		[PSC_VOLTAGE_IN] = {
 			.m = 16296,
-- 
2.33.1

