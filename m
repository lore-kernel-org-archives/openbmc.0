Return-Path: <openbmc+bounces-1951-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF78ACD4F4A
	for <openbmc@archiver.kernel.org>; Mon, 18 May 2026 14:09:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gK06R2sfZz2yDs;
	Tue, 19 May 2026 00:09:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779113359;
	cv=none; b=YeKGV5r4zDbMFI1mGXcPNnTwn5sMV8Sp2SqNkfMUYVbfiwHrErSpC8OAj+8GOojiNKzywW3Cn/4nJbUJ3+IbQ90wKPFZ4pzw2LzUoTNaKOT7xdrEgo1pfHs27F46biqNu1AB5XD1vQZfWhhjqvogTRpDDJtpsrIWKeaLpofcO9VWnUZREBXUoLszxS+L//Lhw9/wGPEbW+VC38XLrtsmjBKG2RNLW2PISNDObp0DlQ6+usvBr+IjLOYnahAsbYBkuc6/fbT4WfN0Lz0oz+UMhQqJqJ9lUOlR3HIUesCEfoVWeZpz2YcgM9LJhXiAR3Ta1nGtJLCQRRD3f9KhjVDr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779113359; c=relaxed/relaxed;
	bh=Afm9GVzFpj9IoJ/6UkLeAQvSehUhaFk0OnAggbluics=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mzgmGaQe0+oFdOLkJTQ3EjcDhggWB3FzNu9N6AXQdgSn0O+Bo+w1aCik5GO/s3e9n++p6pbnXlAsq3QG7U2tNDF37L8myVOm2q0ZYEnMG3lNTtBoZV171HTqs7m5RcHYlytfb6Ot5qwB6V/7QzGHuOU1oJamouz1dMOWkKl4p4ep/WKQials5NUrw3iDWIUUkKdlkINAQSlH7umOcKB/6idpHYzCVx8mbzNkAsr5Sx4i+nNDDp3HVa2K4rhnf0IBhCvWZcxxWUK1fy4Euzj5fPgqS31Gjtesd+9csmc5f/fIhYb37Y8PIr1hb3ap3270NmahMFuFRCgomthceWhZqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LHiCqErh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LHiCqErh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gK06Q2YcJz2xPb
	for <openbmc@lists.ozlabs.org>; Tue, 19 May 2026 00:09:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779113357;
	bh=Afm9GVzFpj9IoJ/6UkLeAQvSehUhaFk0OnAggbluics=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LHiCqErh7Y0Bj8Fl5mlK38V0l9baskKTKbNiuRK4aXH81wVnWXAkrI7egphgL9dgV
	 7aUsBrOIaWxHik4YiD678SOWAEfxp7eB/7WPlDIqLup+DHWxrHamaYqTo8ux10jMX4
	 2N5/DkOjujbqjwKWL5aLlAnIeBnhNlx3vw0wvTUJFVbdWm8olix9UbqHt2bqYNLe6K
	 iwn40iS/RJzWBTi7P5tehfvbPho+q2mgtftor/rNelngY4EPvv4bxrEX5ArYgLTuiQ
	 gCPkNGCDDXGC2FA3oYW6cEtnlOMF0LPcEnHkj7f3VQFaCW1lW2jjZNKTWzcyBtO0gA
	 829TShfoD5vJg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 072A96025D;
	Mon, 18 May 2026 22:09:16 +0800 (AWST)
Message-ID: <232283865a4396b07ca4783a09c1b5cad7f25387.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18] eeprom: ee1004: Fix build error
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Konstantin Aladyshev <aladyshev22@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Mon, 18 May 2026 23:39:16 +0930
In-Reply-To: <20260429070650.28931-1-aladyshev22@gmail.com>
References: <20260429070650.28931-1-aladyshev22@gmail.com>
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

On Wed, 2026-04-29 at 10:06 +0300, Konstantin Aladyshev wrote:
> Currently driver compilation fails because of the undeclared
> 'ee1004_groups' variable.
> This variable was deleted in the commit
> 79d0df36b541 ("eeprom: ee1004: Add nvmem support")
> but by mistake was used in the commit
> 1b9ab93850ac ("eeprom: ee1004: Add OF matching support").
> Remove 'ee1004_groups' usage from the driver to fix the compilation.
>=20
> Fixes: 79d0df36b541 ("eeprom: ee1004: Add nvmem support")
>=20
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

Applied, thanks.

Sorry for the delay.

Andrew

