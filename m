Return-Path: <SRS0=YSNb=JZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4D4C433ED
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 22:21:51 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2165A61419
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 22:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2165A61419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVtQh5JwYz2xMd
	for <openbmc@archiver.kernel.org>; Thu, 29 Apr 2021 08:21:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=VYreN+oo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FYXofIwm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=VYreN+oo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FYXofIwm; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVtQC2949z2xMd
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 08:21:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 58FA15C00E0;
 Wed, 28 Apr 2021 18:21:17 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 28 Apr 2021 18:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=oagfioE2oLqKqIj8+fpjJEsVOBulyXN
 QoL4L8uvKL1U=; b=VYreN+oo7eS2kCZITZiY8uY/KZMlUQXF6lSn8oELuj81GzC
 h1oN3F10KZA0UlISrTZNeCsgfc9ONWvE6gCI11gQAb7Txie40YS1Xh3EMHQYkzq9
 PFLLaPfnCTnD0qSctMKoJvZiJ8K/5Mts1w/vvqFj23jd1I/vsKHKBz3flGsk/Dib
 Kf+ld2wSbTcB6tzysED/J9E5eKdy0aiwHq+D6YnzmmKbbo1L0SxdBDxH3vkmjzn4
 NG2Bkke9V7npnDcvw6vpVGW6Shk6sSG58W+edautpRk9xOU3HcoyACGlqgciAERy
 r/lj8Ov+gJINcaxXdLNkuzjnzKK1E5VYIYGmNRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oagfio
 E2oLqKqIj8+fpjJEsVOBulyXNQoL4L8uvKL1U=; b=FYXofIwmdUmCHoMWAmdlCY
 HncizzM1kT/gKggAgwfdJhroUcAKZVOuV7ezaHE5imSHXWIuUGkO4W3zNyMEqCfx
 s/CrJHEshTen8ru1bILAyC7HOhfdAfybpMblh3OGNdHvJg8IP3XX27Hl5JKy0Fe9
 BkKkJtjN9H+g4ptX1Tit66TPPPgtd8es/aIaDfQcmM0DlBX/nDIxsjHAH5zOItVE
 mpLm1cXKhxQBEUx/5pWgY8Kur/7Ne8SbUAbzCiiwsfiYxyOGot9SBHG5f0O5MPdG
 c0EejirBdMMIzmMtn/oGZhZjsLOwgW03uH/MfBYZpODUADvoU1NXc6kmhxRHQbFg
 ==
X-ME-Sender: <xms:3N-JYJenWpnZVs-9dF5lK7nqHzLMFhj2akcNPzsOaNFMkL8rfDtrtA>
 <xme:3N-JYHMhVXfrru-evvivTf0l2RCynWbLwDdi_IxSrpruyq9-qsgzVjNUv_nE0D4Mm
 y_pZPM4mKTb-IKMzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvfedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepofgfggfkjghffffhvffu
 tgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorg
 hnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepffevtdetleelvedv
 gfekueevueehffekfffgudelhefgudduveejgfekueduffefnecuffhomhgrihhnpehgoh
 hoghhlvgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:3N-JYCjosNIpieHMOKuTRu8Y2v6IE4OPxzTTWRXroph-TAJx5SxzWQ>
 <xmx:3N-JYC81qp8UNdAZ4tiAJfSrXXmHTR27gOVVxBlyaD6V8_wD9CEKDA>
 <xmx:3N-JYFuj2Ozim31SGg9zkn8pI8ollGRqxBcaMFjRCLfW7amsxleXUw>
 <xmx:3d-JYK7vIvTmVUEkUdGsiFbe2xLneEuWrOECyGOn2EVg0ZqIC3Kgtw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B8C97A00079; Wed, 28 Apr 2021 18:21:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
In-Reply-To: <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
References: <965c9157-c64b-6594-fbdf-bd2a44c795a1@linux.ibm.com>
 <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
Date: Thu, 29 Apr 2021 07:50:56 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group - Wednesday April 28 - results
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



On Thu, 29 Apr 2021, at 07:01, Joseph Reynolds wrote:
> On 4/27/21 4:48 PM, Joseph Reynolds wrote:
> > This is a reminder of the OpenBMC Security Working Group meeting 
> > scheduled for this Wednesday April 28 at 10:00am PDT.
> >
> > We'll discuss the following items on the agenda 
> > <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> > and anything else that comes up:
> >
> > 1. passwordless sudo access to members of the wheel group
> This customization does not match the common OpenBMC use cases. 
> Abandoning this commit.
> 
> Bonus topics:
> 
> 2. Intel Hack-a-Thon 2021 results are coming soon.

What does this mean?
