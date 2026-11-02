Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4C4606A324
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I926b+8a
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jHxNL1tZnz2yY0;
	Mon, 02 Nov 2026 14:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793588593;
	cv=none; b=C/mHT4cxZrKIPOyq7NvVqoLgjjLoHLxozNyi3FveSqLSMulX9O+8EMIBaT1TILyw3qtb7OFw3GGgkR4ACv9XFyHlfjX42cxY69rL68Djvm/yCV2QsUhd2DaGs03n+pl88lC4VXiOsjwuxe2fD3BA/l7Z4Nw0YsjERqmNgLagS+On1N3IqOL/4hzWIP0MLvl2Fs9eyvJHEM6iBdeVH++iw62RmPjCMoSHcc2ggepkwF43x13OPT8i7QYfDRJU397mM8HNdlZFOpg5G9c1csWyFQrK+6R6tbLMAB9QOTjcz2dKX/zHC4IGpE+puyvB7D0Mu0OTR0Fu4v2/5hB1gaYB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793588593; c=relaxed/relaxed;
	bh=F47TvpF4alCvrDwB/lWnRKJYMN0llS7GsPiSe1nXvh8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bz5VBKUg07RASj4d/02Nt8qDNisz1AEYvoj3r9fcohNWTESyN+14e2hDRJu4E4lCu8LcvHK5V+ipOmatwRGukIpVGU5uBdDwh2jxOOpJ+O/KjA2k+J2zs85mUr0vYturidU4wX0LPVeGL5bXLkCZ5YAAslUffRvzRzJaCj7tgESQd/Wm00/lMLZOARakPzvgOupSTC98VDZuWRj8doDp1YzJch99Rt9XCe7NubxTBzJ9PkviFU5WrM/WMeStUVNWAnvqTUdqoK5y6RmhxwN3lcKFFCqCxOTsR78a0h5D9Qc80V/QmFnvQcrosoAG2RvTliGMg77cfevDUgBrmY6zmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I926b+8a; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=I926b+8a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 431 seconds by postgrey-1.37 at boromir; Mon, 02 Nov 2026 14:03:12 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jHxNJ2blBz2xjh
	for <openbmc@lists.ozlabs.org>; Mon, 02 Nov 2026 14:03:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793588158;
	bh=F47TvpF4alCvrDwB/lWnRKJYMN0llS7GsPiSe1nXvh8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=I926b+8aUm++ApEmUumF6Wq1fFjZYN/De2AQVGpR7/LKQmgawmZ1MZBHmTXRtGXeA
	 WNy4K6xrj1IK8Yj0N+JU/18N0U93HBopE4zHN2PFpZ+lpP+0dOb2ajvqmaN1L1CrSR
	 1WfZFU31ZSVQCH/es2G7x5G6paJL+mlzMOOtDdEqALUG6dpww6GWIV+rAzs1SFqnAS
	 CmEauo5bUgRJucwgkMWNHk5cGLNHCexucabtj9R8T2DP+nE/2R4EgVyGDL+JdbIqXP
	 eje/0nxF65/YuIA3ZovO7hzFS/jhSx1JpK0/IScBRfsaFBOllaBj1SygxYX4Ad47rX
	 AMUoOzEtIHamg==
Received: from [192.168.72.161] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F1D0C64A21;
	Mon,  2 Nov 2026 10:55:53 +0800 (AWST)
Message-ID: <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
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
Date: Mon, 02 Nov 2026 10:55:53 +0800
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
References: 
	<20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
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

> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. Security protocols such
> as SPDM and PLDM run between the two over MCTP. This series adds a
> transport for that link, so the host side uses ordinary AF_MCTP
> sockets.

One overall thing: why not use the MCTP MMBI (DSP0284) transport spec
for this? Sounds like this would be an exact match for the MMBI
use-case.

[Also: CCing Adam who is working on PCC, which may have some overlap
with the mailbox protocol used here]

And finally: how confident are you that the peer will never be able to
reassemble? Even if the peer's own MCTP stack may not reassemble,
there's no chance of it bridging to other endpoints in future?

I have a few (minor) comments on the implementation, but would like to
sort out the overall protocol usage first.

Cheers,


Jeremy

