Return-Path: <openbmc+bounces-2070-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8202CD8CB9
	for <openbmc@archiver.kernel.org>; Wed, 10 Jun 2026 11:58:31 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gb46p5TD2z2ykX;
	Wed, 10 Jun 2026 21:58:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781092706;
	cv=none; b=W1uAp5eYE+dQsvbBUWWGbCa1amaGQuh6FMoxpWQ7u/4u0Ffmx+VfD5Co2YSB3t+YDrtluwcQwARWIc/UxjY8XbPiR1oDbm07z3DjCANrbMFyZ/Z2NzsKU6j1WdjZoQk+yVNsAUYclJ9uN8gXI/19burzUuHSZGhPgZTdTJGCb9eEryDtpxJrdKRhXsxH46mfx16Fm4qJqMhumfNxe3Tf2Ch+frwA99xbyGQqHHirvmit9ixXacU7leUQJFwkGAB0rzqmXrocNJCW1kLlmNV4g65fsYeZv+R+ZDHHhc3d3hmuLkBzVgo42c6NHghfT3dDTV3otbiUzIgkeUD6uQ4m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781092706; c=relaxed/relaxed;
	bh=S7/vvy/4SDu/u0Hw6EJPP8AspWB98Zz5HHFD3gc8zf0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kIbJ9+M/L2ulEzvkGwjwVfIrJAIMze7Tdo60k8U3ODG+ofVmhYVxSq+L7ofyn5PnEjzuoMJt0MowD3YTvJJMKgryqBqR+eKc8AcJjKcIQCbxM3Nac7huCHLrT9/ovH4fymftX42nX9cXVew42tGHxMSgn2kxX/7BDXrFViuDC0liLoDBZMuC8cRamJS8v/40V/kdp7QHO6q+5UIny7ZPYaBDehKiJN3Rjyko4MjwFkPs1rHHwkSiKtUHaEe91FsmYMJ56zXKWQ4J6Iq8lVltJrYokkKDhxM+3GSvf1M2aFSWTxG+FUh0HDBMCUEDZNk4fOKLOA2XmoRl3+y4FlFlFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=e/3ICdLe; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=e/3ICdLe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gb46p0ZRlz2xYg
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jun 2026 21:58:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781092704;
	bh=S7/vvy/4SDu/u0Hw6EJPP8AspWB98Zz5HHFD3gc8zf0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=e/3ICdLeOHIDOEMN/JOXYUR636UKcezjTMeMox4zGOTLMoWHGatQneK5JlZbIrKz6
	 rKaLakHtUlo+L4k6SkrdDanrkIfLObnD5lxGW+pIuMDnltvxJ0iLr70R7jELHBCUx/
	 nBuGSDWOqUuy9K3qLSu4CUQbRsIhU68DkHqyXsIhWAbdMzksJ9p/9Yehylw6MVqyyP
	 ZSmF9FjgTdck7O5r+OfEOZRTeJN45cVDkE1ZIr4kamRAi0t+4GKZ0U8/HCoY/yqhvn
	 wk49iYyAy0oRnWGDLIhoG2us8/I2FWoIL7HIVD8xmdJR9ayDla83lkoCwl/azCP5SN
	 Gf7AJnKBL1N5w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3E58160A14;
	Wed, 10 Jun 2026 19:58:24 +0800 (AWST)
Message-ID: <8a059e3a4a3338bc03829071a720012bd426bf6d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] arm: dts: nuvoton: npcm7xx: Drop redundant FIU
 clock-names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 avifishman70@gmail.com, tali.perry1@gmail.com, 	venture@google.com,
 yuenn@google.com, benjaminfair@google.com
Date: Wed, 10 Jun 2026 21:28:23 +0930
In-Reply-To: <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com>
References: <20260609163919.3321228-1-tmaimon77@gmail.com>
	 <20260609163919.3321228-3-tmaimon77@gmail.com>
	 <ff53862950a6075c43bb8f1e47c14389d6fc7575.camel@codeconstruct.com.au>
	 <CAP6Zq1gBcSEQznnQ+awrqacBXjTOWELQsMLDXL1yw8_daCzMOQ@mail.gmail.com>
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

On Wed, 2026-06-10 at 14:56 +0300, Tomer Maimon wrote:
> On Wed, 10 Jun 2026 at 13:49, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Tue, 2026-06-09 at 19:39 +0300, Tomer Maimon wrote:
> > > The NPCM7xx FIU controller driver gets its single clock with
> > > devm_clk_get_enabled(dev, NULL) and does not perform a named
> > > clock lookup. Drop the redundant clock-names properties from the
> > > FIU controller nodes so the DTS describes only the resources the
> > > driver actually uses.
> >=20
> > The devicetree is a description of the hardware in the form documented
> > by the bindings. Generally it's not right to discuss Linux drivers
> > here: they're only relevant in the context of Linux, but the devicetree
> > binding governs devicetrees over multiple projects.
> >=20
> > From a quick look it seems that these names are not described in the
> > corresponding binding, therefore no drivers should be using them and as
> > such they can (and should) be dropped. A driver would only be worth
> > mentioning if it did use the undocumented names (as that would be a
> > complication).
> >=20
> > Can you please rework the description?
> do you mean change the description as follows
> "
> The NPCM7xx FIU controller nodes reference a single clock,
> but the FIU binding does not describe their clock-names properties.
> Drop the undocumented names so the DTS matches the binding.
> "

That sounds reasonable to me.

Thanks,

Andrew

