Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A4606A338
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Le/+a0St
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jSqTM2WHrz2yMK;
	Tue, 17 Nov 2026 01:08:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794838103;
	cv=none; b=EmOS4HacbCwUS6N/FuId+3AMFokIKzWL5exNKRonZZ8AzqDkOXSAhmkz4y+6lFs4K9Jfkjb72Gh6oyKoTpk2b1lCgHjRAQEqhPv8nFCamhkkwhtgCSu0oUS39I1RWIdOWAUZw++gDtt113neSJkX0ywtI1w5nBMD5oDHL916fJEC/qibnTQjDogbayQMt3Pwn+Cb8057E5TGHISJq4pgqq6rRXoP3d8y+cmKYGhak/vxpEYPZrEa3h2eg6jFgbI3wdACwn2GAAdOUI2coA+y3N21St1UiQ/2CeyNSVOApbuqP2JoukhHnBFKXWEvLQSgOf2kU/ebGtdP9lIsM+44AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794838103; c=relaxed/relaxed;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VP9UmIunYZ2jpGa71sSZYKRWfAIezyZaJnUxeU2ePr6/cRzBMjJM4bap3FfuS3eiYTWiUiN/Pk3Ko0TM8+ILkgRdy2FuM0H39s5XYHIJDNvcXdjf63775MhCkcSMuCv0Y5NXn4/i1a5rr8nJD+ll4bvMeX6Q4XF0zDjIX9vn+eWnuW8YkWUFO3jVpqSXep+G8+oraTXXWwt8p9nPsWKVuR3Zkl7dV/A8KPhCwmeZl4rxIyKnktKJmpOvjSIfqyQw+Ym0OTEy0jrQumCkgSj+xqfDkKpV4wt33TfQKj7T8jXK8lkPt1xY1KJHJFhW/+PLIG4kby/3HoTtv6/dFAL84w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Le/+a0St; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Le/+a0St;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jSqTL13Wdz2xfX
	for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2026 01:08:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794838099;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Le/+a0St5+LbKQh4KvmBcsPiv9Z54ypsyqNjFb/uB43/ZAZK22Q4F9XYCwyRVGMey
	 mphndvunk8dNwplRzbWJKiYV62UWsfDsL9jyF2q/UbEZUZ5QMgh7O95kDICDmjo7eM
	 xqNYO6BwW+WzDPoVMIWG4iRZdYeBmxdW2Ny9bU3zu2HPrDHLeL19cN9csHX68+0kmw
	 akgq6KFBgY4/y0bz+Y5z1T/MN2p9wRuoSfu79lQ/RlasxwzzX6HSxqu9ZzudxYyWkz
	 ya96AtbI4ikjJG+DABEeCu1ywwWLrxZHV9rt9LVtT8fRhrTuVTOIODVvuYExijyBT+
	 6Efj2sLle885w==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCEAD6005F;
	Mon, 16 Nov 2026 22:08:16 +0800 (AWST)
Message-ID: <63b0ab24f2ec4f83ac87add03f2aa9517f7f73dd.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Akhila Kavi <akavi@axiado.com>, Sammai Chakravarthy	
 <schakravarthy@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>, Matt Johnston	 <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Adam Young <admiyo@amperemail.onmicrosoft.com>
Date: Mon, 16 Nov 2026 22:08:16 +0800
In-Reply-To: <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
References: 
	<20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
	 <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
	 <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Akhila,

> Thanks for the review. To give some context first: this link is
> entirely internal to the AX3005, and not for host communication. The
> IRoT's MCTP endpoint is only reachable from the application subsystem
> on the same die, through the mailbox and the shared-memory carve-out.

Yep, understood.

> Both ends are fixed on the same die, and no third-party MCTP device
> can ever be on the other end of this link, so carrying it as MMBI
> would add nothing.

It would mean that the driver doesn't need to be entirely custom.

I'm mainly curious as to why you went with a brand-new interface rather
than implement MMBI.

> The IRoT can't bridge anything to this link. As above, nothing outside
> the chip has a hardware path to the IRoT's MCTP endpoint, so the
> application processor is its only MCTP peer.

OK, makes sense. Be aware that you may have the other direction too, in
which case the iRoT may need to fragment (and reassemble) packets that
are bridged through this host, to other peers via links with a smaller
MTU.

I assume that's not in your current designs, but will crop up if those
change.

> If you would prefer, v2 can default mtu to the 68-byte baseline and
> leave max_mtu at the negotiated limit, so the platform config raises
> it explicitly. I'm fine with either option.

Your call really. It's generally safer to start at the BTU and then
increase, but if your platform design means that the max MTU will always
be safe, then may as well set that.

> Please send the implementation comments when you're ready; I'll fold
> them into v2.

OK, shall do.

Cheers,


Jeremy

