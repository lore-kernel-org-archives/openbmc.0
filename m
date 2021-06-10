Return-Path: <SRS0=BVeY=LE=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63332C48BDF
	for <openbmc@archiver.kernel.org>; Thu, 10 Jun 2021 23:07:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82E4613D9
	for <openbmc@archiver.kernel.org>; Thu, 10 Jun 2021 23:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82E4613D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1KPx5lM6z3bvs
	for <openbmc@archiver.kernel.org>; Fri, 11 Jun 2021 09:07:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=NOc2SQzT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UHrK0x+k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=NOc2SQzT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UHrK0x+k; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1KPN4lpcz2ymQ
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 09:07:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1566C5C01F8;
 Thu, 10 Jun 2021 19:07:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 10 Jun 2021 19:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=1Vt/2JuCidkijudw5wXwvP6xcLkpe79
 IP6bLbrbrKcw=; b=NOc2SQzTrdaQBS6KDNzdekCJJ4xQ96sIFBFMsGO5XsysBSD
 4tWjenuLIlWWfGt2ACkx7o+oUoIyMQzqRDXmHckIsdwKej+G3mNmfVjIrDjgwGpK
 5JlQJxIUb+cikWeOj0EibGLbhLNFftNJw3yL3Wntue5SVxwy6xRa3NpBU6O0hBu7
 Z4+PAq4j4v2XTMPTpJHH39DGY7snOOksXHGVBWssMlqOXXKrc4vcnxmIVlMkaB1j
 q1Z60VYEFwfC353QWbrwlNUWRtk5/1Glu0YUerS8mRZ6ZHATh4eyE4gEXJiTo+cw
 xLXMIzc7ocXWicpj202PHqdemx/cYNiBwaiuv/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1Vt/2J
 uCidkijudw5wXwvP6xcLkpe79IP6bLbrbrKcw=; b=UHrK0x+k5VuRUXiFKToq1M
 va6N3wQkZ5++4QLACONAX1jxJERhafj1xGTuQZrykkLD7BIxzRY9KT87PZ7sXWW6
 J0ASL9xboPOQWgUhKLMxfsnUz+IVVC3OSjHJyRxwxfl02k+GnqwOhecdwulUcLyb
 Z6cOzKqJYKjTE/wV3qqh7ovGHC8QQ2JsWMBN3Dgshf3AGjSzKyXQqWkm4HvddS+w
 dymw9Ny7AVtZ6NM+tC9KoGGwh9USscFEzzm32leCS3QUVNZD+6KX2f+XyGhbdQWL
 c7UMEmS0t3z/ClAE73M1+olcInow+xtrQbLfG9KYfWugyC1fGfolg0/1Z38e+nhg
 ==
X-ME-Sender: <xms:IJvCYDTUaHLM5O3Jx5jAQP2i3svLItKdZCquXSgFLmKp9J6YXuqllA>
 <xme:IJvCYEwuL-W9UovQl7w9GhrmB0XT43zkcs2CfRHB15rLh1sv0GVkAnDGde4RInNlY
 ned2TXzm80WmHv2lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:IJvCYI1WH4aAt8e5KikKpQEJYEpXbVNNNbREOPjnOYeGU-AFSUQ3Kw>
 <xmx:IJvCYDD0-Zcd95ef7kcvaIYWbpmP5aBXsYiEHLIJj9WSDDl0WE49TA>
 <xmx:IJvCYMjcUz8siOFbw4Muvqnom6Wbpcxe-YE3q1Tr9AmYm68nEb8UUw>
 <xmx:IpvCYPu6oh03gP-ixr1YoZzJLs2nipHAHSgd3t2yS0qZJxpb9I4Rdg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A26D2A00079; Thu, 10 Jun 2021 19:07:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <d792ca2d-3ec3-4a2e-b7f3-b0efa9a12ca3@www.fastmail.com>
In-Reply-To: <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634B89E3FF275E28FB590CC8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <CAH2-KxB5=VQ16c6Cabik6T3HRMNw-R+r8EStpLu-hpgqGtnO-g@mail.gmail.com>
 <DF4PR8401MB063429AA13146432E80B43DB8F359@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Date: Fri, 11 Jun 2021 08:36:32 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>,
 "Ed Tanous" <edtanous@google.com>
Subject: Re: RDE Enablement
Content-Type: text/plain
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, matt@codeconstruct.com.au
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 11 Jun 2021, at 06:29, Garrett, Mike (HPE Server Firmware) wrote:
> A requirement for this 
> to work would be the ability to discover PLDM devices and assign IDs 
> (MCTP EID) in order to interrogate them for RDE capabilities.  It is 
> unclear to me that the current PLDM and MCTP code handles discovery or 
> if it assumes devices.

It's being worked on. Jeremy and Matt are working on the kernel socket-based implementation of MCTP and the associated userspace daemon for managing the networks.

Andrew
