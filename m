Return-Path: <SRS0=+D4a=OS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F2DC433F5
	for <openbmc@archiver.kernel.org>; Tue, 28 Sep 2021 19:06:22 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8FF56124A
	for <openbmc@archiver.kernel.org>; Tue, 28 Sep 2021 19:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8FF56124A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJprX1QY3z2yw0
	for <openbmc@archiver.kernel.org>; Wed, 29 Sep 2021 05:06:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=DWL+C+dH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=DWL+C+dH; 
 dkim-atps=neutral
X-Greylist: delayed 485 seconds by postgrey-1.36 at boromir;
 Wed, 29 Sep 2021 05:05:40 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJpqm0bGKz2yNn;
 Wed, 29 Sep 2021 05:05:39 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8CF6F293;
 Tue, 28 Sep 2021 11:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632855446;
 bh=IFT3ZrpRZd+Ibr02i8FrlOCSYn/cxKG+rD5MpR8Vock=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWL+C+dHOgnPcq0cZchQ12PhW3t9SddpmR2MCjXQLHiGjRkmHFwkj9b5Fxcx308dN
 WkzsqUDmdqAMqFjnryQZ3xWDMM603fAOMHZzB8wQL+2+A5H0NRuApMACU2H3jptchH
 j/SDraM5EGdylpEkqfLBwv2INKURWptZ+I6RjTao=
Date: Tue, 28 Sep 2021 11:57:03 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Message-ID: <YVNlfwLUDNxtp0fs@hatter.bewilderbeest.net>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
 <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XfE6zB9BWYq7e8WbXkPFp2Cicwv2x2dc8h6jNaR2qZV0g@mail.gmail.com>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Sep 06, 2021 at 04:47:14AM PDT, Joel Stanley wrote:
>Hi Mauro,
>
>On Mon, 6 Sept 2021 at 10:10, Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>> > Subject: Re: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
>> > enabled
>> >
>> > On Thu, 2021-06-17 at 17:02 -0500, Zev Weiss wrote:
>> > > As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
>> > > garbage interrupts"), the ASpeed video engine sometimes asserts
>> > > interrupts that the driver hasn't enabled.  In addition to the
>> > > CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
>> > > patch, COMP_READY has also been observed.  Instead of playing
>> > > whack-a-mole with each one individually, we can instead just blanket
>> > > ignore everything we haven't explicitly enabled.
>> >
>> > Suspect this will fix an intermittent problem on AST2500 with screensaver.
>> > Change looks good, thanks!
>> >
>> > Reviewed-by: Eddie James <eajames@linux.ibm.com>
>> >
>> Reviewed-by: Ryan Chen <ryan_chen@aspeedtech.com>
>> > >
>> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I notice this wasn't merged in the pull request you sent for v5.15.
>Would you be able to ensure it makes it in the next pull request you
>send?
>
>It can have some fixes tags too:
>
>Fixes: 65d270acb2d6 ("media: aspeed: clear garbage interrupts")
>Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>Acked-by: Joel Stanley <joel@jms.id.au>
>
>Cheers,
>
>Joel
>

Also not in the recent merge of the media/v5.15-2 tag it looks like -- ping?


Thanks,
Zev

