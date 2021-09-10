Return-Path: <SRS0=LPz7=OA=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA41C433EF
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 09:09:13 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38AD6109F
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F38AD6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5VRq2zk0z2yPh
	for <openbmc@archiver.kernel.org>; Fri, 10 Sep 2021 19:09:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5VRM0JQPz2xv2
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 19:08:46 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 34A6420164;
 Fri, 10 Sep 2021 17:08:41 +0800 (AWST)
Message-ID: <a2c3598e977a6283a9e65f3f29a74fe55d12ca20.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC] Specifying default-disabled devices
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Zev Weiss <zweiss@equinix.com>
Date: Fri, 10 Sep 2021 17:08:40 +0800
In-Reply-To: <20210910083542.GH17315@packtop>
References: <20210910022433.GD17315@packtop>
 <71375410db4f03bd19c820f97f3a23418b56ecc0.camel@codeconstruct.com.au>
 <20210910034958.GE17315@packtop>
 <1df72fd584f9c54544f9d5fafcd6232e3079ee49.camel@codeconstruct.com.au>
 <20210910052835.GF17315@packtop>
 <857e71679c7d1a421f6cc50896ac7927fe49cd74.camel@codeconstruct.com.au>
 <20210910083542.GH17315@packtop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Zev,

> Sorry, which semantics exactly do you mean we might not want to
> change? It sounded like Oliver thought that interpretation of
> "reserved" should be viable, modulo some possible bus-specific
> caveats...

At the moment (as you've noticed), status = "reserved" does not
instantiate the device. For what you're proposing here, we'd need to
change that: "reserved" would instantiate the device, but suppress the
probe. I'm not sure what might break if were were to make that change.

> Well, I'm aiming to be able to use a dts fragment looking something
> like (on an ast2500):
> 
>   &spi1 {
>         status = "reserved";
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_spi1_default>;
>         flash@0 {
>                 status = "okay";
>                 label = "bios";
>                 m25p,fast-read;
>         };
>   };

[do you want just the flash node to be reserved, or the entire
controller? I assume the controller is always available...]

> ...but I'm wondering about your mention of "rather than instantiating
> entirely from userspace" -- is there some mechanism for
> runtime-materializing a device ex nihilo that I've remained
> (embarrassingly) unaware of?

It depends on the bus; we can instantiate (and bind) i2c devices with
something like:

 # echo tmp75 0x50 > /sys/bus/i2c/devices/i2c-7/new_device
         ^    ^
	 |    i2c addr
	 |
	 i2c device id

- which requires no DT node at all.

But on a quick check, it looks like there's no equivalent facility for
SPI (which makes sense, as there's likely to be additional platform data
required for most devices..)

Cheers,


Jeremy

