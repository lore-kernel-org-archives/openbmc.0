Return-Path: <openbmc+bounces-2035-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1444CD6E4A
	for <openbmc@archiver.kernel.org>; Wed,  3 Jun 2026 01:55:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVW4M6kj4z2yMn;
	Wed, 03 Jun 2026 11:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780451731;
	cv=none; b=BVYbziNr6hFeEfd3Zsvd2lwCcG8RHbetJpeOz72MWw4jhRUA53FHrNXoz8pQhee53jxP7QaWyzdU3+Cv0kw6zqqHpZL4tDzgW1dHqejPqT1yg/xZSYejucJJKv3g61k35OOr5UlQJ0lygRZ+gafdVz2d2XnnkNdItm3B0bEEXaAiingJyPAYkziRGid6RZiUX4NpgQ5hfQnXDDO9wdId9EJnaYsFPZ6TG1qxgv7HK8/cVlj7+loCiXHxPq9c7z4ozLCgWg+fRBnGaVfoBGqZoWkGv13TX2JkRhKJRvhba9JPIK2uJtawOi8m8/IWFzMn2lsKCwk2cTSXIB7OW0g2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780451731; c=relaxed/relaxed;
	bh=tx82nXcNwoZBDaSltchd88wfYFzbl1TA2nlVTrEqhtg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=aOek579fsVyOPA5AFW+ta+GMORvIxPYJUJGnMyWvX2wQyazHwuAvvOgeTEA+T/KeXyQWvegvB4I0MkbIBqVVcbJYdGc6izfhn5cskRodRWeTo2iUcL6ShDf8+9f7rf3xOP4bVDG8b9sE9NlBWTq3jPIhAOAeALOmRFDlh9H5aqVCHdBbR/pppjvgoY6q7tKLDGwlVgTBnNn7DmYF5JChyssEJUF6Mt4iZ5V3duqxZS2382z3FwUeN3+8fULPgsKzizlEcQNrUn54UbyGWbC0BR0cgtydDKHrpOddlmBXzwFJPmVUoU0oqd74gLLPSSCDQr8NnXT+0lsiUhnWXSHFRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bCn2zoTl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bCn2zoTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVW4M0RDdz2xc2
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 11:55:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451730;
	bh=tx82nXcNwoZBDaSltchd88wfYFzbl1TA2nlVTrEqhtg=;
	h=Subject:From:To:Cc:Date;
	b=bCn2zoTloqOxxDig5JmDUJm6foeRhBtzOX06v24QuFpeEjX86wYXplBnnTpBJPJfk
	 ih1moDj6u1KxTKfjvzvsxivMT6Z6NWmGeAvVsWM0ujjYUrseXUDfxszU6lg5YSXDaV
	 OvPbBIHLJZxAP33hcJOscqqQxTFfYEatcUIG93f222aVOm8igbNg8LOJMEoR0OXYxi
	 S7Y+FwoafaPjMtHQPCSt/Dhvk5CwhDZJ40NoP3qpw6nPJpmK7CJnqX96gA0oTzyVPS
	 5L19RZvH4Qrv9rUOIdrNLqRo5qXDYG45kKZdoLaxUwk1BMH/lFw4U+C5qVgYilnpc9
	 GV8o/lchiUpAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 302CA60087;
	Wed,  3 Jun 2026 09:55:30 +0800 (AWST)
Message-ID: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:25:29 +0930
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-devicetree-0

for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:

  arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for v7.2

Just the one patch adding ethernet nodes for the MA35D1 development board.

----------------------------------------------------------------
Joey Lu (1):
      arm64: dts: nuvoton: Add Ethernet nodes

 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 25 +++++++++++++++++++++=
++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 24 +++++++++++++++++++++=
+++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 52 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)


