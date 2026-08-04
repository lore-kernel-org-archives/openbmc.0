Return-Path: <openbmc+bounces-2360-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F0AC55172
	for <openbmc@archiver.kernel.org>; Tue,  4 Aug 2026 05:23:14 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDhlH5Dm8z2yYs;
	Tue, 04 Aug 2026 15:23:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785820987;
	cv=none; b=oMl5UrXByEvqdCOrjTEz2R3WHMOAHPaTSjuIE6O2D/KkbIuDqoo2lilDt9of7la3c5gYLi+9q1c8v65RAmArxJl6p0gMy3p7xRVVSEc5lkzPOSv82eidDxsOgCxeL6g6qV/mGag7ao2Pdg/r1kd70ANrOQK9iBEZFyhx7Zv1YmzBAIZOcA6mN5j7+29/RFl5omhTIutQK7e77gCyPrRDdjJNfFru3eoVaudWG1k2vTLe32KaLx1dVS5q+Q2YC8mmQmJMdhbboWlIj20zelf10aNAc0DBbOvnRZtnoJlVyUvElbvPlOkGCeuXnXiJQRS3zJvLR4Nx9i5rdunFpbIc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785820987; c=relaxed/relaxed;
	bh=1A/KBD+ttLHFVfVvYGOtSgdKkMaEe4HsHsCsRXDAhhc=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=PRH9p60Arl3K5YZMjvCrCGviBwuZhNEyd5kZ4YBKG8sRZrsbR3k1XRlp6z3G5c1XAhmqfvv9OoYT5E7S2T8XQeggrzYpZ4y7Z8+d06EilE/A4himl0Yp/fwMdHaPICbnc4yua0gTDAEg91VzlVH0fwHmMvce5VYNTv2XSw+x1RaOq5NEFq/UggcJbE0XA4cxIMmrnkPj8y0UhlqRlSAA0YkyyAwTNA8EZ69DkpMBPLBb0LRfRiLvhJHUUnqcJ57ch9C8nJJXBiiZCDNRmjQesM0SaJC6HQ2Yb5VpEMiSKuZvOpfawGckJPiDZUflHj9pkIcT3a2XZXcOflNrLp2wMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IGFmogKV; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IGFmogKV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDhlG1rLvz2xy3
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 15:23:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820985;
	bh=1A/KBD+ttLHFVfVvYGOtSgdKkMaEe4HsHsCsRXDAhhc=;
	h=Subject:From:To:Cc:Date;
	b=IGFmogKVFy0r3QOEkmBcdVljcYoReqRdbjf1dC07PNyXN5eBb+mX3YMtsQyjUOYov
	 8nlouW+/2rENq7/VDrZ1K5cyzU+YRHc4a7ujb+kBUu92f/PkdO5a2sesHUonrIj3JV
	 aIgUWZLKBPXdd1o5oj8jClv9/lozGGpkdKZ0M6gdo6lYr1rvcjKYB0DCFvkCbXhB5t
	 hE7+TdxHE2lur3aIX8zizF67s91/C2diAmUPk2JZc+MGzrnJJFV0eIWUkXeyXCJy9s
	 VFsK20M1+BNUjL3bsMflX0CxvFqNGcSKIvU36nUS7YvuNrlTZp60lSxuSemlbMkqdo
	 AnyabYUQdthvg==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6C895655A9;
	Tue,  4 Aug 2026 13:23:05 +0800 (AWST)
Message-ID: <6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:53:05 +0930
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git nuvoton-arm=
64-7.3-devicetree-0

for you to fetch changes up to 60b9d5b8ca8b09019d8b162bf41fdf24f847fa02:

  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes (2026-07-22 2=
0:27:35 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for 7.3

Similar to the 7.3 ARM PR for Nuvoton we have a couple of arm64 tidy-ups
from Tomer.

----------------------------------------------------------------
Tomer Maimon (2):
      arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
      arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 33 +++++++++++-------=
----
 1 file changed, 16 insertions(+), 17 deletions(-)

