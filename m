Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D9DECAAA1
	for <openbmc@archiver.kernel.org>; Fri, 28 Oct 2022 19:45:55 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzY1t0dwcz3cHw
	for <openbmc@archiver.kernel.org>; Sat, 29 Oct 2022 06:45:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=onq3SIl4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=onq3SIl4;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzY0m1pklz3cGF
	for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2022 06:44:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 502B3344;
	Fri, 28 Oct 2022 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1666986291;
	bh=nQoRjrEsUO89yM+Es8sfAk3knuKjH07TV0H0W08nsVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onq3SIl4LSZwOvPld42fB+1ZU/V+G9XEjPO7wOsux3spVTEGe2Dzp0YFId3UGOyzS
	 yAGiDmnpbTEQCr1NnshE1us+H2TPhKvQ7geywlkNsG1Ncw5fqca6DIkBw6WheH3ejq
	 6v0b3rVmuhyMtAJ/UbgAd3nRw8zUq2J2kzQGF3GQ=
Date: Fri, 28 Oct 2022 12:44:50 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output bindingg
Message-ID: <Y1wxMk2x25AeRwLr@hatter.bewilderbeest.net>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
 <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
 <Y1rRCq9Kdd2zPPkw@hatter.bewilderbeest.net>
 <ee37b5a1-5afc-71b3-f777-add295d9ce17@linaro.org>
 <Y1tWpikPogEtV0+x@hatter.bewilderbeest.net>
 <Y1v6migO2PNV4ksW@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1v6migO2PNV4ksW@sirena.org.uk>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 08:51:54AM PDT, Mark Brown wrote:
>On Thu, Oct 27, 2022 at 09:12:22PM -0700, Zev Weiss wrote:
>
>> I can see why it might look that way, but I'd argue it's actually not.  The
>> systems this is intended to support provide power to entirely separate
>> external devices -- think of a power distribution unit that might have
>> arbitrary things plugged into it.  It seems to me like a property of the
>> hardware that those things shouldn't have their power supply turned off (or
>> on) just because a controller in the PDU rebooted.
>
>We don't turn things off on reboot?  We don't do anything in particular
>on reboot...
>

Okay, perhaps not on reboot specifically, but the userspace-consumer 
driver has a regulator_bulk_disable() in its .remove function, so it 
would be triggered at least by a module unload (which is sort of why I 
ended up with the "when software relinquishes control" wording in the 
patch).  If we're going to continue with the plan of using that driver 
for this functionality (which seems overall quite reasonable to me), we 
need a way to express that that must not happen on this hardware.


Thanks,
Zev

