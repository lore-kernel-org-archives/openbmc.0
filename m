Return-Path: <openbmc+bounces-1732-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348CE103A9A0
	for <openbmc@archiver.kernel.org>; Thu, 26 Mar 2026 07:17:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fhFTh1XZKz2ySj;
	Thu, 26 Mar 2026 18:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774509447;
	cv=none; b=DDbft8h7NTHKKNSdRbowDabIITT6A1Fr0Rnky9lD6uF7x6uqC2BNYYx+e46IYQERJOwxFhRePTlCrRUlHznpDCig/AT6dCdCCHvbEKGYcEVhbr1t2XgOTILPwWaTm7C3ayNyk9O/dHrkdfgoQKAoVi5o9O2niFGRWLzEToOCs1hhwRl424YMDVfjc3hzJHeboKMgp4FfhROzNJywKYefdBfvU3amMcxKp8oWOQLaPcf58MHjC0+Lf1BRSdWfPINE2RIofgDQhNkzUEdXL0btwpQC2PuUKiy79kR7uFhb5sRlKkDbFj1M7ZNTf42uIms0siTexf1zGAsvH9uKrVk1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774509447; c=relaxed/relaxed;
	bh=l+yJtd+EbVz46pzCdYAJFyJzLcYkFVl7rnzHqgV8A/Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=irfUVKFzIQuQTfVwqan1apvKaeWdL0vgeeQbmpcHy6jwP4BKd+TZY2aPJ80PPIfbid6BdPzmlCIOdEUTSm1+5wTfFUiE/bWHpLjYCdVp2fUkWSO3IZxWpMQMevn+/CfkpNYne2MvtDYd691O0Yl1RVVKedGMBSZm4lRtXwbJDBxrffxfVl1PpmTkrmzcO0es2HsqhgLPkM4cDNx4pbwL7IHUrh5yce3KfWMfFba/J50bKUhKp7EbBFLE8BdvtYdR1qjqF0YdSkLwR0Yeparhk85Q558ysk7kC2LD8tT5bCbH0klZa+qR42Q4mT9p22xYMdDz3fGIsFT2ah3LnbnszA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lE1j66cw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lE1j66cw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fhFTf04tNz2xS5
	for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2026 18:17:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774509445;
	bh=l+yJtd+EbVz46pzCdYAJFyJzLcYkFVl7rnzHqgV8A/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lE1j66cw0Q5VAvXXCSmwXXyy17pO5JLWmJ3B8y7nEnd5ZH51P5puFWRf4aXUyce+n
	 WzYCm+cjgN4ZiL8XoGA3rSFsPQw4Hz8cS+2i3qJPhm8aaiazI3IjcXWPnuBnKgxJ3n
	 yUT/eUnnnPGXyl9ScMrufUzP0DtdlKND3xqAWJAHB37SAelhwZaZ+fLHjkSSoNXv/d
	 CIWYA8r4mZSLR9KPjcfMrropoOhJduS6hFADUPoYkV9gogHYUYQKMvzE25eFPbVB8X
	 XPeJUkkXcb/mTWGDZqkNk3CmS2XwDWsssBdrBzIgrCgwMxvxXjIbVpUZtfDBrpqJR+
	 PFMoZ8hfkyD6w==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 57A7F6597C;
	Thu, 26 Mar 2026 15:17:25 +0800 (AWST)
Message-ID: <ec8c74b657f51985eae26225807bf41e8bdbcff6.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 1/2] dt-bindings: trivial-devices: add
 mps,mp9945
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Cc: cosmo.chou@quantatw.com
Date: Thu, 26 Mar 2026 17:47:25 +1030
In-Reply-To: <20260319061319.43920-1-chou.cosmo@gmail.com>
References: <20260319061319.43920-1-chou.cosmo@gmail.com>
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
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0

Hi Cosmo,

On Thu, 2026-03-19 at 14:13 +0800, Cosmo Chou wrote:
> Add dt-bindings for MPS mp9945 controller.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> Link: https://lore.kernel.org/r/20251009205458.396368-1-chou.cosmo@gmail.=
com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

In the future, can you please:

   1. Send the patches with a cover letter
   2. Include the "cherry-picked from" information

Thanks,

Andrew

