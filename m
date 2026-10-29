Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CA60A261C
	for <openbmc@archiver.kernel.org>; Thu, 29 Oct 2026 23:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cxT1KNYG
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jG0s13JLfz30Sv;
	Fri, 30 Oct 2026 10:32:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793316773;
	cv=none; b=dC+Y3iRNXNo8rqWWDQXVTv6zpEnZj0t0x2rTE69qxQGzYBlm2AHzlE/u6GoCvIVq0nIzQdmvnPZtbCb5qkFDeAQK3lJUDfehP6Ubk676+ZW5ytiLJkeaJKL6nR5HPHsA5rZhlbmmVyC/S+X3oB5UGrcRK9GoUbt7UGj2pN8Ld9aLBajDjYhFLrimLa768TGCn/8y+zWltyj4p0IceCof/8h6P15+kR7YAfOdKnTWwZCv0PQRkQnLhAr07KwIorMC6auedoq8fSmpKhEvCLb7tXDvqaPF6vdl0/tax/vDhrYQw5s6geYC7vCbKVUnLTk3lVsCbbCJrX7ht3qkiZ6NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793316773; c=relaxed/relaxed;
	bh=XWpSf8X6GEXYLtoQjvghUc8+rme7rpgWHTlDhmLixYU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n9YqT1JhRAN/bAPvJjZ9PNRPFIwgDQ3MabP/TNrULXWhOOSRqSgT2kSVtApiuY6FL4LhvPuBWVLlFJUBaMsfJWk0rWMoo6D8dFGkP+qWs9WdpSrAkbEDZeTrC4rIl1sgb70JSD6lfM+AAV+1EhUSRuP9D91rnARDysPglhZlIKfyonbzB+FLfaX1neZRnVdo6LYzCV08u+106e7ICj5n56Tsp5CXJvmtWPzcWSTjtHre7iI5np1Mz+8sEbqv6Vu6kWwYNj1I6ABkjpDdO8kFJPR83MWrQH1S7ZMQZol9eFD8Z3DKFWDmRIWld9GVOjFgu6zJNm5lkfb5CQclfrWR4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cxT1KNYG; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cxT1KNYG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jG0s00ZQ9z308H
	for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2026 10:32:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793316771;
	bh=XWpSf8X6GEXYLtoQjvghUc8+rme7rpgWHTlDhmLixYU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cxT1KNYG/XbFAH6iT4QkJoVSDrul2p2Ba0dcKY+ND3W23l4+4Xn/uIUTYXbEQXSk7
	 pV+cxW2qSZok7hDqflTQ3DOvz25CjfMKxVKQYkcJNOPi/WOsz5YGPKO+kOzdlp/1Ja
	 83eRA55rwnXolVneLWXjDGVaFXs4YIrKUBdhdoo6UnipnTGXSfFCIQ7MWDPsXSYhna
	 JC87D70/+fnmzJGDfl6BcXRnxmcfVK+Na43LUzLKXp1l//Aa4MtpHnui5OC16uNToE
	 93rMgJn2+BtOPH5hw1cDp+9+8gkL18I1A+vICVXesD3fn4PsVcBp7Xi7J+SpBVo7Pt
	 pDDRNRw/xA36w==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE36570E47;
	Fri, 30 Oct 2026 07:32:50 +0800 (AWST)
Message-ID: <b6c5cf44c1e1b649f90ebf88162d4882a8ea6261.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/5] arm64: aspeed: backport AST2700
 platform support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vince Chang <vince_chang@aspeedtech.com>, openbmc@lists.ozlabs.org, 
	tan.siewert@9elements.com
Cc: joel@jms.id.au
Date: Fri, 30 Oct 2026 10:02:50 +1030
In-Reply-To: <20261029035242.651988-1-vince_chang@aspeedtech.com>
References: <20261029035242.651988-1-vince_chang@aspeedtech.com>
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

On Thu, 2026-10-29 at 11:52 +0800, Vince Chang wrote:
> Backport five upstream Linux ASPEED platform commits to OpenBMC
> dev-6.18 to add AST2700 board bindings, Kconfig, initial device trees
> and defconfig support, including the follow-up DTS correction for
> duplicate pinctrl labels and the address scheme.

Applied, thanks.

Andrew

