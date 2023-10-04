Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E83E936EB
	for <openbmc@archiver.kernel.org>; Wed,  4 Oct 2023 22:56:43 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D1pjy+z3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S196d69Dyz3cN7
	for <openbmc@archiver.kernel.org>; Thu,  5 Oct 2023 09:56:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D1pjy+z3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S195W5Cnkz2yQL
	for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2023 09:55:43 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9B29D200DB;
	Thu,  5 Oct 2023 06:55:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696460143;
	bh=JLixjReAsI6A6MMmsRho/T0UXAXzy2JHLyn/T/5v1Po=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D1pjy+z3/aW0cqzQ7D+psD7IV00Z85GRZV1dBR06NVwWUgY99TcKmilA7oXX8Pel6
	 xNUZSgAgYmwjMEKLY+zv32w64/A63gQbCKWwt5RU+ANMzGhC+9nfzqcyQEC3EwBQQf
	 jCRQVuzj4xCVLdj4rVyst48C14ob9uOYLAL6FueYkmnlwiXsaVFpGnYNuqqEZVgADb
	 RHYqSMrVJ6o57mbehQbNyaUeSkqVXaj5nC74AqVFHD4UJdGo3RWIkcI3Kf1Y1X3S4Y
	 qNnPCjJHv9ew6FVscTnPv/nE9zvSPhSaju/h+3yVSgRhSLiZ9L/Pb9y4WObCnXJcMZ
	 Fmoo6i97nCAXQ==
Message-ID: <c5173d78a039cbb8e048af670db006ab598b67de.camel@codeconstruct.com.au>
Subject: Re: Aspeed SuperIO runtime management
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Michael Richardson <mcr@sandelman.ca>, Zev Weiss <zweiss@equinix.com>
Date: Thu, 05 Oct 2023 09:25:39 +1030
In-Reply-To: <3490.1696428140@localhost>
References: <20231004003427.GI19997@packtop> <3490.1696428140@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, 2023-10-04 at 10:02 -0400, Michael Richardson wrote:
>=20
> My question is: what if the BMC just did all the provisioning necessary a=
nd
> the host either just didn't

This is essentially how the VUARTs and PUARTs operate, but the trade-
off is you need some "platform ABI" between the host and the BMC so the
BMC can meet the host's assumptions on the peripherals.

Andrew
