Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9B606A31C
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j7YPIGd+
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG1RK0cJ1z2xwL;
	Fri, 30 Oct 2026 10:59:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793318348;
	cv=none; b=W+Ey8A74Sv/+d8zwJ+Ji2HfJmPmuxaQc22i5YjsR0/seCLN3Y3+cWBadVKbbjv2W1hqzAl5BVyxfLSavxq25kUvhkJHOxg6PTMN+2T46NXirsKy3AReMXZtV57dNfNGi5A8kyFedaYWGKtyVl9suZ2DEtrep4tAydfKT6ajreif3HqHfWvlYTI5JCuOCLTXjxmCxwRf5i4I9/aDER763F2quhyi6MGLG1qlE29xEnSS/AskK1q2Iy19RAuqcLU3g8qrmAbYl5SfAiyBVTl3r3Hs2J46tD9NmNEKoxBBixHxj52uqwgxeXUNDwCHQqXyiE5dqeBcR7MeTDdpk71nCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793318348; c=relaxed/relaxed;
	bh=zYwPUBR6EQGsQ8foBWX068WU2Z9N9zmnmF2GssrSTwY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jRImuSU1r/++uy0xTcY4+EXKq6rkVakBPk9rb912EfG4FmrLsDNacAGVa8aj2b2imWbF111vbjh3zwicRAWVF2kk18c2/LgFxYInhQO8P0BKOpeQ4FTZuuTCHKkeK7XlLWg3dgX4dXqt/AirWNvFf/fZZn21rC642Cac/IFPjnsJbuKPje5I0nTVchTStrSeYtyYs5fiU1unwOBYGz/NgItwbhLywSyWEkRksdqoSuWY+Bj4Dfl2LRZ/7nQT3BvmA6LYMqbjlHGdZz/YKvewKt9thZ9nZk/XGKQ8NBcEOCpjh6bPcf7ZJzeN/eCAFdeNjvE3+rTvYPjSyvgjprUqTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j7YPIGd+; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=j7YPIGd+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG1RJ0V5Sz2xln
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:59:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793318347;
	bh=zYwPUBR6EQGsQ8foBWX068WU2Z9N9zmnmF2GssrSTwY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j7YPIGd+6c97kHuk7EZ9+jmA3C2jVMr2oVTzTcxD+UTcQEUWWRo6yPCFquhe4NrJv
	 6tg3wp1MMyvTnSX+TpLiBITu11tBA/2FlRnP3VkzoVts8W/Abuvc1YtA7fMXRNGGhn
	 7XunU+92yY5ocgSSfmCquA0smaLRW14Bot1BqXuBtajk4Zub5mOafWXezlyJfSgBZm
	 k8rxfCAG//tIOqswtfXcoqiwYYtWu60DuVW/ickeutt0flddQmeedA3McNcHgE7cdr
	 n+0XE8isgRehBk14vQ8v19IfYii14n1asxp7sPV8OYufszrU7EnRyJy2ie/x6g4kkI
	 6Z7HfM4Yy+isA==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 55FCF70E47;
	Fri, 30 Oct 2026 07:59:07 +0800 (AWST)
Message-ID: <f9757c2411bc54ae449944b3fefcc943864068e1.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/4] Backport ASPEED AST2700 watchdog
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Fri, 30 Oct 2026 10:29:06 +1030
In-Reply-To: <20261029050847.810331-1-vince_chang@aspeedtech.com>
References: <20261029050847.810331-1-vince_chang@aspeedtech.com>
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

On Thu, 2026-10-29 at 13:08 +0800, Vince Chang wrote:
> Backport four upstream Linux ASPEED watchdog commits to OpenBMC
> dev-6.18 to provide AST2700 watchdog support, device-tree bindings
> and reset-mask definitions, followed by the optional-IRQ error
> handling fix.

Applied, thanks.

Andrew

