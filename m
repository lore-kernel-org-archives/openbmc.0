Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D587606A31A
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 05:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QKNuk8db
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jFXt41d03z30VM;
	Thu, 29 Oct 2026 16:32:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793251931;
	cv=none; b=L8aFju5n8wwig+OVOL6eOhqjgqTlpkshn5cnsN3QzSH3aS9BXmnrClVW1agmHVxu2HGGQchjkdrrLnsVPRNUNXq2hxI1edfxMj5ONUIHDZC88gq5ns7ykD4rPWt4Zg7xM0YsTQVDJabSOsJ2cVdAA6HnCAxAlhKyn4IBRLpaDs5wum6VKYoLCVPbT1dMAGtF7YAAw4yBzv9Pt3fIDre3rqjOw4nflAv9WaFoxwd5K2E9bJfZ5m1H4jpFPBMQGhVvuSY1E/Tt8D0X3hC/4M8ICHsJL4wgk6x9ISLCNiruyxTy4TL/5pDl+/y0zlC+vL33BLummDNS74fy8sLUotLoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793251931; c=relaxed/relaxed;
	bh=qCeszYv4fbNNN8zAG8oL3xhnbkkRNTNeQ4vo56uGERo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ofXLEYMXDigeJ1VawRqlOOFaYf9u6uXmKXDtbGC/8vZIzTSMm30VZmUblRD0wZB4UdTjSMYYn+wlGsQfo36U36uCcz06nHZPJ0KJ1DW7ox5mf9fvbYaxMmaGnPR7PnsJv3198H5wZ1yiWoNkEsuCrc+fqAQj6+NJ0TC3GGfcEMpplr89ItyYE+xtpexb5Dv50c3m65e4sOzEjEnDz81iYOM04Pbi62lcGBSQzo8SO38ujDep6mBGd52NzP2N7TdJNLPy54Gxv4sQroBT0YmRwKU+ciS9CIi/4jvxGePWXA/YjNrSdebBNTa+n9fNPdgjjZv1ehIHart8RDjxpN141A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QKNuk8db; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QKNuk8db;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jFXt32RKgz30MZ
	for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2026 16:32:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793251930;
	bh=qCeszYv4fbNNN8zAG8oL3xhnbkkRNTNeQ4vo56uGERo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QKNuk8dbMBb5/yj6e/FGFC+XWgLYOXgSljAvdR+QeNRJRy0pQiWQEgip1LJ2dAqPd
	 tkHW/KRkca+xyQui9+0j04w881RAZ/BO/GkPC4pVWlD7ROJDwPiFzBavhnqmtC9KOG
	 PQKBxM1iWpNdISnfv8Zq6GjRe2RUZT0KqiDRe4r8i1z1odV6uyoFoLPUGoRgBej05h
	 kxwo375yxgttOPsaa0dX9eLg+L1Rzh4ja8/nDcy/aoJvKRO+fIW1N6v7K58zawSKHn
	 ok7q+b0G67HiEXLdeam41xpfpThXOp1DRvqmEIgCD9ZxlGVdRJpQLIYhTOfNJawGVP
	 AZf33FR/G1B3A==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9D31E70CF0;
	Thu, 29 Oct 2026 13:32:10 +0800 (AWST)
Message-ID: <6a9074d0493f0dd308c6bfbad7a26d0e4293363e.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/6] irqchip: aspeed: backport AST2700 A2
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Thu, 29 Oct 2026 16:02:10 +1030
In-Reply-To: <20261029030224.470029-1-vince_chang@aspeedtech.com>
References: <20261029030224.470029-1-vince_chang@aspeedtech.com>
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

On Thu, 2026-10-29 at 11:02 +0800, Vince Chang wrote:
> Backport six upstream Linux ASPEED interrupt-controller commits to
> OpenBMC dev-6.18 to add AST2700 A2 bindings, interrupt routing and
> KUnit tests, and remove AST2700 A0 support.
>=20
> Include the two follow-up fixes for allocation in atomic IRQ context and
> incomplete interrupt merge-bank disabling at probe, so the A2 support and
> its fixes can be backported together.
>=20

Applied, thanks.

Andrew

