Return-Path: <SRS0=EFpz=I6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA849C433B4
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 07:36:44 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09CA06101E
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 07:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09CA06101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9w3t1tJpz309c
	for <openbmc@archiver.kernel.org>; Thu,  1 Apr 2021 18:36:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=C6N3FcwA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=C6N3FcwA; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9w3P1h6wz301G;
 Thu,  1 Apr 2021 18:36:16 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 52C8C8C;
 Thu,  1 Apr 2021 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617262574;
 bh=B3O9cEE/x7yQOH3OCzBfuz/r90ljyAx9qgSdSAUBQeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6N3FcwA7Id76ASk9cp4pGQ/ND/WQGbdAlIE2LuJdb68naJSLZ7qYJ/XbnoQstgtt
 xTa2QgbpBg4DvpayDCbLB54CIq3bTjSQQ6zcFkFUKeSHHTO+CIwNuFQdsKvqj/BUK7
 yr22HupdBi6ZVCWCAO6kxXZftOwKlcz0EeoIf9NM=
Date: Thu, 1 Apr 2021 02:36:11 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 2/3] drivers/tty/serial/8250: add DT property for
 aspeed vuart sirq polarity
Message-ID: <YGV368K00FHSj5aY@hatter.bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-3-zev@bewilderbeest.net>
 <CACPK8XdPVf1WMmo8C8RJtd-1cH5qV9odEDhDUHWRiMOk=dQNtg@mail.gmail.com>
 <YGVXuyqOyxc8kcQz@hatter.bewilderbeest.net>
 <06aee58f-819b-4486-a5ea-22e6d45e2be5@beta.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <06aee58f-819b-4486-a5ea-22e6d45e2be5@beta.fastmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 12:34:04AM CDT, Andrew Jeffery wrote:
>
>
>On Thu, 1 Apr 2021, at 15:48, Zev Weiss wrote:
>> On Wed, Mar 31, 2021 at 11:15:44PM CDT, Joel Stanley wrote:
>> >On Thu, 1 Apr 2021 at 00:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>> >>
>> >> This provides a simple boolean to use instead of the deprecated
>> >> aspeed,sirq-polarity-sense property.
>> >>
>> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> >> ---
>> >>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>
>> >> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> >> index c33e02cbde93..e5ef9f957f9a 100644
>> >> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> >> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
>> >> @@ -482,6 +482,9 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>> >>                 of_node_put(sirq_polarity_sense_args.np);
>> >>         }
>> >>
>> >> +       if (of_property_read_bool(np, "aspeed,sirq-active-high"))
>> >> +               aspeed_vuart_set_sirq_polarity(vuart, 1);
>> >
>> >This assumes the default is always low, so we don't need a property to
>> >set it to that state?
>> >
>> >Would it make more sense to have the property describe if it's high or
>> >low? (I'm happy for the answer to be "no", as we've gotten by for the
>> >past few years without it).
>> >
>>
>> Yeah, that sounds like better way to approach it -- I think I'll
>> rearrange as Andrew suggested in
>> https://lore.kernel.org/openbmc/d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com/
>>
>> >This brings up another point. We already have the sysfs file for
>> >setting the lpc address, from userspace. In OpenBMC land this can be
>> >set with obmc-console-client (/etc/obmc-console.conf). Should we add
>> >support to that application for setting the irq polarity too, and do
>> >away with device tree descriptions?
>> >
>>
>> I guess I might lean slightly toward keeping the DT description so that
>> if for whatever reason obmc-console-server flakes out and doesn't start
>> you're better positioned to try banging on /dev/ttyS* manually if you're
>> desperate.  Though I suppose that in turn might imply that I'm arguing
>> for adding DT properties for lpc_address and sirq too,
>
>Why not just adopt exactly what I've done with KCS, where we have aspeed,lpc-io-reg and aspeed,lpc-interrupts?
>
>Andrew

Ah -- yes, that does sound like a sensible approach.  I'll send a v3 
with that worked in.


Zev

