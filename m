Return-Path: <SRS0=74US=NY=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E01C432BE
	for <openbmc@archiver.kernel.org>; Thu,  2 Sep 2021 03:30:09 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 275D4610A8
	for <openbmc@archiver.kernel.org>; Thu,  2 Sep 2021 03:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 275D4610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0RJH430Jz2yJN
	for <openbmc@archiver.kernel.org>; Thu,  2 Sep 2021 13:30:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0RHp5Bppz2xY5;
 Thu,  2 Sep 2021 13:29:42 +1000 (AEST)
Received: from [172.16.66.18] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AF9A620164;
 Thu,  2 Sep 2021 11:29:37 +0800 (AWST)
Message-ID: <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>, robh+dt@kernel.org, 
 joel@jms.id.au, andrew@aj.id.au, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 02 Sep 2021 11:29:35 +0800
In-Reply-To: <20210901033015.910-4-chiawei_wang@aspeedtech.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
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
Cc: ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Chiawei,

> The Aspeed eSPI controller is slave device to communicate with
> the master through the Enhanced Serial Peripheral Interface (eSPI).
> All of the four eSPI channels, namely peripheral, virtual wire,
> out-of-band, and flash are supported.

I'm still not confinced this raw packet user-ABI is the right approach
for this. The four channels that you're exposing would be much more
useful to use existing kernel subsystems.

Specifically:

1) The VW channel is essentially a GPIO interface, and we have a kernel
   subsystem to expose GPIOs. We might want to add additional support
   for in-kernel system event handlers, but that's a minor addition that
   can be done separately if we don't want that handled by a gpio
   consumer in userspace.

2) The out-of-band (OOB) channel provides a way to issue SMBus
   transactions, so could well provide an i2c controller interface.
   Additionally, the eSPI specs imply that this is intended to support
   MCTP - in which case, you'll *need* a kernel i2c controller device to
   be able to use the new kernel MCTP stack.

3) The flash channel exposes read/write/erase operations, which would be
   much more useful as an actual flash-type device, perhaps using the
   existing mtd interface? Or is there additional functionality
   expected for this?

4) The peripheral channel is the only one that would seem to require
   arbitrary cycle access, but we'll still need a proper uapi definition
   to support that. At the minimum, your ioctl definitions should go
   under include/uapi/ - you shouldn't need to duplicate the header into
   each userspace repo, as you've done for the test examples.

Cheers,


Jeremy

