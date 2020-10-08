Return-Path: <SRS0=YW43=DP=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6338C433E7
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 08:37:52 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA422083B
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 08:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="m3dzIqym"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABA422083B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Pj90DlCzDqKM
	for <openbmc@archiver.kernel.org>; Thu,  8 Oct 2020 19:37:49 +1100 (AEDT)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6Pg21fbVzDqRK
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 19:35:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=m3dzIqym; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C6Pg139BJz9sRK;
 Thu,  8 Oct 2020 19:35:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1602146157; bh=8UasE3ZaGv9bUMTlhKyQFHvkWTTgdjiN2t1eiSa0ols=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=m3dzIqymHHR2ZyWMuC8GSZopAb2rnt9nhgSeEPkiN8gvlKB9zpBBxicpiso66QeT5
 KvIFquEQtwJeqjOLdf0vgr4DZaau/y2v5BpYVkYhRM2gJp/IbtmZ7VxkzdBI24oszp
 1dApebGNkcbmsYj13VRo1/Sfb1UEbvFbuxBnypyxu5CxPERjt5MwahIFYwoueVu1gW
 Uvdd4rscrY0k+1SklVPNS/Zw3z/SCX4zuwL1M1frEYYO/LQei3C+vr30nSi2XH5SRj
 gsSwr3b4+Pc6bcd4I37OrWgo6yV4VQ+cCl+Ru+2SUWC3Nga5UuVUIUxZvI71Ni8/SY
 wRbjj5dEX4xig==
Message-ID: <63f9af23051a75523589eb9b036bd8d9877594d4.camel@ozlabs.org>
Subject: Re: Use usb-ctrl for USB gadget management
From: Jeremy Kerr <jk@ozlabs.org>
To: "i.kononenko" <i.kononenko@yadro.com>, OpenBMC MailList OZLabs
 <openbmc@lists.ozlabs.org>
Date: Thu, 08 Oct 2020 16:35:50 +0800
In-Reply-To: <127b55ea-175f-b60f-90e1-08465fb53592@yadro.com>
References: <127b55ea-175f-b60f-90e1-08465fb53592@yadro.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Igor,

> I've found the gerrits change[1] about including the usb-ctrl to the
> state_hook of Virtual Media mounting. 
> I'm working on improving Virtual Media functions to add media
> interface type[2] which impacts state_hook. I'd like to take over me
> the above described changes  to speed approve updates of [1].
> Kindly may I ask to assign the task[1] to me? I'll like to suggest a
> [2] together with [1], is it possible?

Sure, I'm fine if you want to take care of the state hook changes!

However, I'm not sure what you mean by assign the task to you. If you
want to work on this, feel free to take my changes and modify them, and
I'll abandon the original review request.

Cheers,


Jeremy

