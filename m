Return-Path: <openbmc+bounces-2414-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0594BC5DF86
	for <openbmc@archiver.kernel.org>; Wed, 19 Aug 2026 09:46:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hQ1tR2ZgBz2yRP;
	Wed, 19 Aug 2026 19:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1787132799;
	cv=none; b=j3M+t7Ql8uu9/ozskab51Kj6xol5vkmSlAJ4UoD+biOOVr7ZRXh2CnkIu6wMSxIHwRvnglOi68Uz9ORJS6Y37UYHP6k84yXPVIpLWg9YFKg3z5NdA4hyOCYodDzOjpEFKXPfqFSoXsbMiLQHfPIS63deWI5UqsEyLdNU2XPMA0GdJELo28NVfaTLeyHcZACuNLaVxgTC4PPldwFyO/IFpzBzdZggMJEP2D4kW+Cme52DsYzfjT95zOFoh0tweUqGeOSeooz1DFXBODc1OqVHJ21raRj3iZBJKvMA7BpiuNnjekppCv+ClaJ4PFgNlX8uU+NgFaXCcXS9QwEfqOJtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1787132799; c=relaxed/relaxed;
	bh=Q/zOpe2HngJG23s9QAhN8OFYFXMzqOJAL3nJjlP7+wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEJBcZoh3pZ5OgwisQBii0dn9Rljtz01YgrfUxytD+vGdMTW01U25UtxEHEbJvp6bVEHzbdmjypfwjOAKFWpQ/OV5O8SjIc7FM5E2/oxt4dzm9q9HDCNE00vy8j05Ni0/Pv3js+9YRSg52zSqabof3Ba+ziYy1IvD0QwpQTy3kRlzcYA0Nk9PNfkz8idiWxYmHcRAJZYSKTtljltW+EqKFrr/1vWA7Q0LyKIu0Cm2jCnEd7SRcJUbP7Uyf1Ps2X8r3Woye65YLkLtFKj/UAzuBCBY9ZvqqGgK0z2x6noaEJMnzB45dqv7doNJWd2fvM62b//1hbcjtLQmYiYL/Rixw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZCSjoC4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZCSjoC4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hQ1tQ0F2mz2xfq
	for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2026 19:46:37 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB1460A63;
	Wed, 19 Aug 2026 09:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2481F000E9;
	Wed, 19 Aug 2026 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787132793;
	bh=Q/zOpe2HngJG23s9QAhN8OFYFXMzqOJAL3nJjlP7+wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZCSjoC4XV+BnBOuj6G9GjNJ0myzhg40c5fWKVejHTYg35wWI/9WvzZmwqoszlDV0
	 IJF5/pUAxcDkEFic86+MC4oDBoWlc2uG+hMwP2DPYo04gIZLoEiikwRBWhiFugjf63
	 u3s8AtYpkYaMFqBiu+x1fX1REH+Z8KriU9ihPrxvXpDFEK2T/Zz0UeaFAyrbJ3rZVQ
	 Flt1DeQ8tysjs58EMmIeItskhGBCc+WHpidTT079W4bjv43Bi9TYmEWaOW/PbryMXn
	 VKxd5NOEkW9LJ1GKGzO2KKwh00Mn35K8BulG0SxvUWUIPTnW7kukeuRHRD29PFl/7i
	 X6sSGm1rKPkMg==
Date: Wed, 19 Aug 2026 11:46:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Krishnakumar Kesavan <kkesavan@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: add Axiado AX3005 mailbox
Message-ID: <20260819-popular-vanilla-poodle-80c9c7@quoll>
References: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-0-25e713eccff3@axiado.com>
 <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817-upstream-axiado-ax3005-mailbox-upstream-v2-1-25e713eccff3@axiado.com>

On Mon, Aug 17, 2026 at 08:34:07PM -0700, Swark Yang wrote:
> Add a devicetree binding for the Axiado AX3005 mailbox controller.
> The controller provides inter-processor communication channels
> between the host CPU and the coprocessor, with separate TX and RX
> register regions.
> 
> Add the corresponding MAINTAINERS entry covering the binding.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  .../bindings/mailbox/axiado,ax3005-mailbox.yaml    | 96 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 103 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


