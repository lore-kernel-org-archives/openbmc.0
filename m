Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B811C2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 19:11:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143B820717
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 19:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="PcMJX9pV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143B820717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0XF86jd3zDqNs
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 05:11:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=PcMJX9pV; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0XCM4ZkfzDqHJ
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 05:10:06 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 593B4806F7;
 Mon, 28 Sep 2020 12:09:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 593B4806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1601320199;
 bh=DiKAakspdU2SU79C7dyC0E6jYFYmH4A4oqCdk5RLvEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcMJX9pVZztFXqwMt33V+1y5XcAlxbmUBmgzijN/tTFvrOUfGRnRSbflgI/QW20z9
 ZM90cClu/NQrZc4ZIvZ7m3zh9XWq8R2G1Bkz6dhU9gBCMnN2Csof3s+A41rqYepwjx
 SCG84PLsPs2Xo7xMy0JskXNAGzL3r2IerulSz+yY=
Date: Mon, 28 Sep 2020 14:09:53 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 1/2] peci: fix error-handling in peci_dev_ioctl()
Message-ID: <20200928190953.3wnfph2pwysrvequ@hatter.bewilderbeest.net>
References: <20200926212734.23836-1-zev@bewilderbeest.net>
 <20200926212734.23836-2-zev@bewilderbeest.net>
 <d64f8001-a13e-45e5-53cc-96da50614ec7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d64f8001-a13e-45e5-53cc-96da50614ec7@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, Jason M Biils <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Sep 28, 2020 at 02:03:12PM CDT, Jae Hyun Yoo wrote:
>Hello Zev,
>
>On 9/26/2020 2:27 PM, Zev Weiss wrote:
>>peci_get_xfer_msg() returns NULL on failure, not an ERR_PTR.  Also
>>avoid calling kfree() on an ERR_PTR.
>>
>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>---
>>  drivers/peci/peci-dev.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/peci/peci-dev.c b/drivers/peci/peci-dev.c
>>index e0fe09467a80..84e90af81ccc 100644
>>--- a/drivers/peci/peci-dev.c
>>+++ b/drivers/peci/peci-dev.c
>>@@ -122,8 +122,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>>  		}
>>  		xmsg = peci_get_xfer_msg(uxmsg.tx_len, uxmsg.rx_len);
>>-		if (IS_ERR(xmsg)) {
>>-			ret = PTR_ERR(xmsg);
>>+		if (!xmsg) {
>>+			ret = -ENOMEM;
>
>Yes, it's a right fix. Thanks!
>
>>  			break;
>>  		}
>>@@ -162,7 +162,8 @@ static long peci_dev_ioctl(struct file *file, uint iocmd, ulong arg)
>>  	}
>>  	peci_put_xfer_msg(xmsg);
>>-	kfree(msg);
>>+	if (!IS_ERR(msg))
>>+		kfree(msg);
>
>Not needed. kfree itself has null pointer checking inside.
>

Certainly, but the condition in question here isn't whether it's NULL, 
but whether it's an ERR_PTR (which as far as I can tell kfree() does not 
check for).  As is, there's an error path that leads to passing a 
non-NULL but also non-kfree-safe ERR_PTR (the memdup_user() return 
value).


Zev

