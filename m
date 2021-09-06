Return-Path: <SRS0=6F/y=N4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D973C433EF
	for <openbmc@archiver.kernel.org>; Mon,  6 Sep 2021 03:17:32 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9592B603E7
	for <openbmc@archiver.kernel.org>; Mon,  6 Sep 2021 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9592B603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2tqt0cPwz2yS9
	for <openbmc@archiver.kernel.org>; Mon,  6 Sep 2021 13:17:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2tqG6MxHz2xr4;
 Mon,  6 Sep 2021 13:16:58 +1000 (AEST)
Received: from [172.16.66.38] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B0C892012C;
 Mon,  6 Sep 2021 11:16:49 +0800 (AWST)
Message-ID: <6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Mon, 06 Sep 2021 11:16:44 +0800
In-Reply-To: <HK0PR06MB37799C48533B084CF864E49D91D29@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
 <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
 <HK0PR06MB37799C48533B084CF864E49D91D29@HK0PR06MB3779.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Chiawei,

> > If that model doesn't fit though, that's OK, but I think we need
> > some rationale
> > there.
> 
> After an internal discussion, we found that our eSPI VW device may
> not fit into existing GPIO model.
> 
> The reason is that GPIO direction changes through VW channel has no
> interrupts triggered.
> And the direction is controlled by the Host as aforementioned.

This piqued my curiosity, so I had a look through the 2500 datasheet. It
appears that the host has full control of both the direction *and*
hardware GPIO assignment though the platform-specific eSPI configuration
register set.

So, with VW GPIOs in hardware mode (ESPICTRL[9] = 0, the default), the
host has arbitrary control of all hardware GPIO lines (except for
the GPIOAC bank, I guess?).

There's a huge security implication there - for example, GPIOs that
assert physical presence can now be set by the host, possibly remotely -
so I'd *strongly* recommend that we always get ESPICTRL[9] to 1, to set
software-only mode.

With than in mind, if we're disabling hardware mode - what does the
direction control setting effect when we're in software mode
(ESPICTRL[9] == 1)? Does it even matter?

For example, what happens when the host goes a GET_VW cycle for a GPIO
that is marked as 'master-to-slave' mode? Is the state of the GPIO in
ESPI09C still reported?

If that's the case, then we can just ignore the direction settings from
ESPICFG800 completely, and have the BMC assign directions to standard
gpiodevs as appropriate.

Separate from this: I'm also proposing that we represent the system
event VWs as gpiodevs as well.

> A raw packet, primitive interface should have better flexibility to
> manage MCTP packets over the OOB channel.

OK, let me phrase this differently: can the OOB channel be used for
anything other than SMBus messaging? Is it useful to provide an
interface that isn't a standard SMBus/i2c device?

If you need custom uapi definitions for this driver, that might be okay,
but it's going to be more work for you (to define an interface that can
be supported long-term), rather than using standard infrastructure that
already exists.

Cheers,


Jeremy

