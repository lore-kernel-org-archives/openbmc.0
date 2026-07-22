Return-Path: <openbmc+bounces-2312-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A141C44539
	for <openbmc@archiver.kernel.org>; Wed, 22 Jul 2026 13:53:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h4whR14hkz2yfS;
	Wed, 22 Jul 2026 23:53:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784728422;
	cv=none; b=E7GeHMvFBXoFSy7xrbVjqg2I/WJt3Am3zgJ7vRC6ebeRxiZIak2prDpGLOXeiZd0hRVC4+zuv1VAmu6TBvQVtdjYPv8/KeUkglKarBqt6YqIHi2fKgztDyrUCAdrIdIG7i7k6WhK3MOLzHnb4h2o310pOZKcDc0HGPxozLshCIF4METLQPF9xnt5gA6lsSMekhlUNHtLOxTdUY/hOfJb0n8EriM5Y3pZCfDde+QFwgCm+M2aDLVddZy5im2m0Y/RkfEa83lbMnvZzZaR/0LiBVEwmQ3w9HnQPsOLMBajmRnPMbOc7BbVMvnUCglARmYTKBnsygUZRFNwK/7q3560Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784728422; c=relaxed/relaxed;
	bh=aYBveTePjjg0G5po0SOfHr83wVb5AGXhVTAccd5SD4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hEqwFbrdBXF3WwhZ915y2nCSjKv7LNPbHMcCvQnyg5+saJQRfA4uJ7vW8txoXhpjn25UPGJg2KN4mjiuUb3mIEb+Z5mwgCg6uPqVw6XNqe1Flm6Hif5skxkO/+lXKmPhXgPIuKC5mW8+sO7s7Hg8V/Mbisxg7EP/tBmbE2Z99cmNXO6oMWodkZPOrFl73scZF2SSjcDyNpPyTWwlSd6UU+bcR3E7qQHjdXBXy39G1ilj1875Hxo5bdulAASsgOD7GZzhtfXt9jF2/UPihfeXZ0hAMe7P+waESja8+bsl+N6vtWpfFC4b24S7DnZVRI0IM5SSx9kAknnwJGLlfuS81g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fEQu2ZN8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fEQu2ZN8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h4whQ2zCkz2yFK
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2026 23:53:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784728420;
	bh=aYBveTePjjg0G5po0SOfHr83wVb5AGXhVTAccd5SD4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fEQu2ZN89/ADwPeDBwqIgGB7RT/+duAZmOpolZwsvs41wXMyxS0AN988MBdnA95t8
	 jcVTG2s/0X/6CRBniv+S/am1DLwKsA3gwntAfWsRRV8JzdVwVFh52QYJW/10NSDJ+n
	 H6dJDydNPG+Zg/RTFCW1liCW8FEFy/W7G/OZgoZ1nJlGYq2CyL0PTsBjH7lYesllKG
	 TbR+LUJ2g+HMi8GhmKpjgh1Mvf/7xPs2Uj9yR0nfYrzedY2yJ2kolwJyNKWZgyiJbM
	 Rfi01af3VFlK546aBfZ80FgmfwUCrtxabQT4Ar7+JsW38Yc9/8xMnYi2VJY8J4WTkh
	 io1WMi8IZL/JQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7F4D865B37;
	Wed, 22 Jul 2026 21:53:38 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Russell King <linux@armlinux.org.uk>, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525033846.1346744-1-dbgh9129@gmail.com>
References: <20260525033846.1346744-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
Message-Id: <178472841877.1739993.4789559545976492167.b4-ty@b4>
Date: Wed, 22 Jul 2026 23:23:38 +0930
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 24 May 2026 23:38:46 -0400, Yuho Choi wrote:
> npcm7xx_smp_boot_secondary() and npcm7xx_smp_prepare_cpus() look up
> the GCR and SCU nodes with of_find_compatible_node(). The returned
> nodes are used for of_iomap(), but the node references are never
> released.
> 
> of_iomap() does not consume the device node reference, and iounmap()
> only releases the MMIO mapping. Drop each node reference after the
> corresponding mapping attempt.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


