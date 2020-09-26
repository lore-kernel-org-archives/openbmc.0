Return-Path: <SRS0=cZyQ=DD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15859C2D0A8
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2020 21:29:36 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E950E21D7F
	for <openbmc@archiver.kernel.org>; Sat, 26 Sep 2020 21:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="o1G6hsCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E950E21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BzMP84L5PzDqRG
	for <openbmc@archiver.kernel.org>; Sun, 27 Sep 2020 07:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=o1G6hsCa; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BzMMN21mWzDqR7
 for <openbmc@lists.ozlabs.org>; Sun, 27 Sep 2020 07:27:58 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 45323806F8;
 Sat, 26 Sep 2020 14:27:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 45323806F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601155674;
 bh=nZfi1+eKztGkuhWi5Kd8XyVOzISOUKSDbjLp2uqJZUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o1G6hsCaHcTGC+V4Irbz01ZAn1spQcVyoxyXo16owQrbDooz1w5AvoOvQw8yIUzAR
 qoFim+CiOfZnIVhd1Qu+qlN0BEFDjJecwipbnlgo1/ytuxwE08LVdjEuZtRdA96k9M
 vbnMdmQKQTG/3UhhG0XZJw6XVsgWQwUEox+oG/x0=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] peci: fix error-handling in peci_dev_ioctl()
Date: Sat, 26 Sep 2020 16:27:33 -0500
Message-Id: <20200926212734.23836-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926212734.23836-1-zev@bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
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
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

peci_get_xfer_msg() returns NULL on failure, not an ERR_PTR.  Also
avoid calling kfree() on an ERR_PTR.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/peci/peci-dev.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/peci/peci-dev.c b/drivers/peci/peci-dev.c
index e0fe09467a80..84e90af81ccc 100644
--- a/drivers/peci/peci-dev.c
+++ b/drivers/peci/peci-dev.c
@@ -122,8 +122,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
 		}
 
 		xmsg = peci_get_xfer_msg(uxmsg.tx_len, uxmsg.rx_len);
-		if (IS_ERR(xmsg)) {
-			ret = PTR_ERR(xmsg);
+		if (!xmsg) {
+			ret = -ENOMEM;
 			break;
 		}
 
@@ -162,7 +162,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
 	}
 
 	peci_put_xfer_msg(xmsg);
-	kfree(msg);
+	if (!IS_ERR(msg))
+		kfree(msg);
 
 	return (long)ret;
 }
-- 
2.28.0

