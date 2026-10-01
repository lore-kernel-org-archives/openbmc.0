Return-Path: <openbmc+bounces-2690-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C245CA5FA5
	for <openbmc@archiver.kernel.org>; Thu,  1 Oct 2026 05:01:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hwKWq2kfwz2yYf;
	Thu, 01 Oct 2026 15:01:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790830903;
	cv=none; b=mool2G2JQlj09TStDpH38/1PERRkLD0Dzf6lURniq/Jcc3hk+VXwn98Ldbs6MJ2W2BqByUYrfMUI6QyBsbYxOVcM6sB4n+O8Om3yrkoCWnVE9tUIGqlo+DKDoDiZ56gqO4P11dX38rCvU26cMEz7pLRIw65QZr/+Pa2kap1+QWNqi3t8RmV22ybQKoKBaDKTB+npYVLifNbiQpYFpaHtneIW9h6oKgz0esUeAMFK9Y/6ZTVwYULj7cbtmHx8xqBUbMQe5UxWHeI9m4daXOez9ojyOVe23JEs5/KXB8SOaJtVPdnZ2KZWU4gHCwCGhyQxprKMCubMv54Ki5IWAYecoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790830903; c=relaxed/relaxed;
	bh=IOFCU1TCg+s4qw9CDuDtxrdMDYOONDlq4q4XLqBbF3A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOEJwBS/wwiaZMAWIb11IBpWbhdKVHxEt+EL/ub/YwYUDE5D6eMhPijNdNdCAX0Hku5sUb6LOWNATccnPyLz1B0nXEJwAjGAgsixC8epWCPg1ypHR8FO18bi6TJLG4PlqYdY/Iz5RL0Pv6+5UwgYrzttGp/poBbsY/TYrKTR5T0FDJ+ucMUl+1jX2HJEKAyUIatUoFHGwODAQXJcicZzaudor6LsZ3EZLjm6WMx5ntwpUju1nFL7+lQfJAJlBwrFBxbrNj66HzN2Pc28OJ/poh6xvju9Aw2koYIVyPNqsFrPOhb/oN9SU+3P6ynzczE8bHyhCaPDp0xMDHuwiBLLSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DSwRBHZ5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DSwRBHZ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hwKWn4KvHz2y2Z
	for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2026 15:01:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1790830899;
	bh=IOFCU1TCg+s4qw9CDuDtxrdMDYOONDlq4q4XLqBbF3A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DSwRBHZ562J0v3wjdYnCcwuP3+D/QWrLxnKEU3YhB87Xxn9I4Zkgp0FZH6710M1VG
	 yqFGg3226GBEvq7n2Z1ydPjPv97Yie2K3XVwpoMEud8hpaVuqTAliaCm37q+pK7TF+
	 oGqi+RY0IGdBVE6Mqwk94HNxkpkyn68V18jGaK8yyRxnj3+ROn9olE/Q9eqdwj675y
	 7VbDIt8oYwtxRKSXAn1zUoxIsrAid3AziQL25Z/ypks5BYyyO4xlQ1HVAXmHagMmAG
	 v3ywUhtzF21V6j/wRLH1MpuUz1pm+nhJTL2rf2THb8UhfZqmiBH3NH30sePMrLmpmz
	 +flnuSaUMH7KA==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8DB876A14D;
	Thu,  1 Oct 2026 13:01:38 +0800 (AWST)
Message-ID: <9022f1c4c1f01b5bbfe99d83ab3e4aeb9797d73a.camel@codeconstruct.com.au>
Subject: Re: Clarification on BSP Support and Linux Kernel Approach for NXP
 SoC in OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Vivekanand Jha <Vivekanand.Jha@einfochips.com>, "geissonator@gmail.com"	
 <geissonator@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>,  Patrick Williams	 <patrick@stwcx.xyz>
Cc: Vivek kumar <Vivek.kumar@einfochips.com>, Krunalkumar Darji	
 <KRUNAL.DARJI@einfochips.com>, Krupal Ka Patel
 <krupal.kapatel@einfochips.com>
Date: Thu, 01 Oct 2026 14:31:38 +0930
In-Reply-To: <SA1PR04MB98025B61B31179557A85D097F18C2@SA1PR04MB9802.namprd04.prod.outlook.com>
References: 
	<SA1PR04MB98025B61B31179557A85D097F18C2@SA1PR04MB9802.namprd04.prod.outlook.com>
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

Hello Vivekanand,

On Tue, 2026-09-29 at 06:58 +0000, Vivekanand Jha wrote:
> Hii Andrew,

I'm _an_ Andrew, but not the Andrew you addressed in To, so I hope it's
okay that I have some input here :)

There are quite a few conversation threads to pick on in your mail, but
for now I will trim it back to a couple:

> =C2=A0 4.=C2=A0 Upstreaming Strategy
> =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 Should the NXP-specific kernel cha=
nges first be upstreamed to the Linux kernel and then integrated into OpenB=
MC,
>=20

In essence, yes, for your purposes, this is the approach that should be
considered.

The project maintains a unified tree for both ASPEED and Nuvoton SoCs,
and intends to keep doing so for any further SoCs that become
supported.

The current unified tree for the project is openbmc/linux dev-6.18.
From a quick search it appears the linux-imx recipe is also based on
6.18, in which case there's hopefully not too much work to be done to
make use of the openbmc/linux tree.

> or can the initial BSP contribution maintain the required patches within =
the OpenBMC/NXP layer?

Patches carried in the bitbake metadata are no-longer accepted by the
project.

>=20
> I would also like to understand the expected directory/layer structure fo=
r an NXP-based OpenBMC platform so that the contribution follows the existi=
ng OpenBMC conventions used by other SoC vendors.
> Could you please provide guidance on the recommended architecture and con=
tribution approach, particularly regarding the choice between linux-imx and=
 the OpenBMC kernel?

Hopefully the existing vendor structure is useful as a reference. Is
there some specific concern that you're looking to address?

Importing meta-imx may be feasible but I haven't yet understood the
impact of doing so. We'd need to consider recipe names and conflicts
with respect to the statements about Linux above.

Andrew

