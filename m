Return-Path: <openbmc+bounces-1839-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49535F8A15B
	for <openbmc@archiver.kernel.org>; Thu, 16 Apr 2026 10:56:01 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fxFL211c8z2yjw;
	Thu, 16 Apr 2026 20:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776336953;
	cv=none; b=SahDMVSvJ96giY8lssYqRTOCltcZI1v6WgpqS2IddbXGKajAZEJ5tEN0fjc6pvski63qUcCg80yfsQk6OVfqCFi/2Z+T62T44p/HU3FXXnUc4qAe0Mtt0IyfW8/xkE+rlGyfnnn9Yg9DitToTpl7VnXRuUAQHfoR34bAyh/TlCkPmaiMLKxavDdj3gir0BPvzuEpvMevew5FHIcndm5ZuO092oMh314n7WDZm4Z4vrDBCYo6jJUlW4kk4ESO7GAoGBaoYLbWvuQelspUGxh2DHbYqHsrTffbDq3LGz27Qbj5q+FqbJUZHJIyGYIbrhAHal/rEAvqoDSglcv5iy5fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776336953; c=relaxed/relaxed;
	bh=4Ygirb/bNuzDvMTC7Pdxa4/CaYn/KhlSSFerHMJWSuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NING6HJvPYzPLklyhdRSRbAPw3N+aPoMfteJaoOqlcS0//HAngs805aBsygu3dJAYgphyAz2YD3wHXG8BaeCnh5AniUMwTZ5eCBbjCVNuEz/kBAplWgov7Z2BVXGGuBKwkHzAT2uyU4ukjm21MbIZUweIiQV4lRHlBRi9Hua0BtUr9o8tB2B37w3V98ZoZhshEglquNhKjbkDeeIhXNwQ8VJfCsflOAwRjOghJQai3TybSvUpr/RzMjV4E5DRgnkuRz0A6kAh0b6QIYCMrfF9Am0fyRe1A1qUM+jJ3bSQ6oNbsqalXvmAXqLFROo+j2Jj16CkImc3d60W2trjvQUPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=cesRnRkn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dnMgZb+L; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=cesRnRkn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dnMgZb+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fxFKz3NcGz2yVt
	for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2026 20:55:51 +1000 (AEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9F26C7A018F;
	Thu, 16 Apr 2026 06:55:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 16 Apr 2026 06:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776336947; x=1776423347; bh=4Ygirb/bNu
	zDvMTC7Pdxa4/CaYn/KhlSSFerHMJWSuE=; b=cesRnRkn2QCa0hUwv1lbA1BqcU
	BVviJ/1cTURZYHT9lxjyDzbFU98r2S2bL3X9Hy35nKjpzs+Da/U9osdwmRk18Ds7
	BLv0r0zRMcMKxXw4H/UEXhq1Va/jDZzwudGRiiAcnc4OGJXTN2ooKJaogeLCVhpw
	Yd/Ro23k8kUarla3sh/Tqnh+M7M2HZNdaTDidvMwQmo4J78gIRjp2lK3zcbx0iRn
	KLEQnufVQfwjhvGDEXkF+pzFpsv29vVv1JqzjfB395YjY7+for9b7XcfBuYARIf3
	gMlTU2tDTm24rPk3LuGdeqq/RMv+9xA9FRIMWyu2BuULlpoR3/qHl7WdX0cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776336947; x=1776423347; bh=4Ygirb/bNuzDvMTC7Pdxa4/CaYn/KhlSSFe
	rHMJWSuE=; b=dnMgZb+Lg+2dDzV8mF9GPNfFcuXmDR6+r8XF3aDtyCBsAAq63ai
	+2Kf1o6hi2rJrl5KGqPjHvwBr5QIRZ4IFekEOerQdOHiKH+Kl5Jv3HZrFcVuMz+q
	sw7bvZIsmxeDjLnsQ2zYODPTb7t9Qt+oczNnFx7nhv9JepvecZzOVIM4GfpJDsUU
	cnWFapUMxf71WnQ8mY5Xd4kjXEdvKTW/hdwQSefqZS2cPXt50vl+y0UF1tVc1+Mc
	g6yapKn82+ePoRPJetmgqZGLt7p4farMpotbJfJX68oIR+6Le06iey8cZ87n5f/R
	fxrkVRqcGzDpuJx2xz7wPURYGaQEBNHBOCg==
X-ME-Sender: <xms:M8DgaRUuM9zatBhQIuYLX04TNCqrd4X0b0n9QbsRWYHj5JVfF7LAiQ>
    <xme:M8DgaXkcIUcHzK_lwGg3RLuALqfSly8EDRFAmoDhbhUUZVHwD1vCjzYw8Itac-Qqs
    Rx2OxCgzXCNiplNlHyOxQd99Quj9x1VN8xurIWVYAY0DMFbR1wG4A5W>
X-ME-Received: <xmr:M8DgabDLgmpnMrucotIeC3MSo5YZW2CQCOHcV5AgMvx3xBzCaAhqYjtfex0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegieekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepudektdehieelfeekhfefvdetgefhudek
    veehtdduvdeivdeggefhueekheejgffhnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    dptghonhhtrhhisghuthhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprh
    gtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghorghpohho
    thesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoii
    hlrggsshdrohhrgh
X-ME-Proxy: <xmx:M8Dgafciy2rPzBhNhNDm68Hsrv2IQldYk3A39M7f1dhjbupu4EfVBA>
    <xmx:M8DgaeJKYlF5oLIc3HyhRk_gUyBqwfD17-ok-Z7lg2nY-diiswQawA>
    <xmx:M8DgaafZEJg7CS3eRHz93E_6_L80qnwHtEtuy_EDJIwMC1dZp3-EOQ>
    <xmx:M8Dgad1oQTYWlThQziXysXjuCQB1JnbItBPMGvEEl0YW6BgGlNsMMw>
    <xmx:M8DgaSlKVWcYWdD8KE3tf_jvOsPe5h2YuurDl-lpGBxVsGSMzD0uE7tZ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Apr 2026 06:55:47 -0400 (EDT)
Date: Thu, 16 Apr 2026 06:55:46 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: apoot mao <maoapoot@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Request for CLA Agreement Permission - Gerrit ID: 1002899
Message-ID: <aeDAMnHha6JOfox-@heinlein>
References: <CAOnE0XdMCnnkNasTrSM+4kg9VggEYU566mTc=hs2nxCOX+G_Vw@mail.gmail.com>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TDlrsV59F8MuaDL1"
Content-Disposition: inline
In-Reply-To: <CAOnE0XdMCnnkNasTrSM+4kg9VggEYU566mTc=hs2nxCOX+G_Vw@mail.gmail.com>


--TDlrsV59F8MuaDL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 01:44:43PM +0800, apoot mao wrote:
> I have verified my email, but the Agreements menu is
> missing in my settings, so I cannot sign the ICLA.=20

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#starting-out

--=20
Patrick Williams

--TDlrsV59F8MuaDL1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmngwDEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKsDR8wtAMEZQ2gP/j0fpUR3w1jtOy6D7AkA
DiJLK9N5KJk3hsbPcadF7mG9KWqdzeZJzW73zJNhUgAti1GaxqnSDpthCdMs3ZSJ
s+UxGhqNx0umQYCJVhHdOgP41Nt4vgQ5r2l2lJRYQHVWNtL6G5+kj3RKL5RHktuU
Dncozq9R9jtvhy3ZoIT565CGu6uKsSGO9Fx1MtWqr5cr1OP7ga09KRZWhvmGVbMB
i4mgLQQ/zXLuBc41UXjN/T6ZHY1ivO3bE02pc6UX8ZbIEiG3ASAz0fvAwEj+5buk
qI77C2XCKKELzcZLhYTeI9XsbV3hDU/Xb3e1PDmvolw6bQJUgATD2c85aUcOB6CE
mEQTVOkDTT1zcFjUBCaJ9WoWT3wAv05s6N2JptNr1pTE3tCFB6anGkV1dBkYqCBo
3CcRBdkPktQEAnFnCAGaEHeW2zzKYW5PQ3zT//mcLT/pex7yjzXzuq8usSWXf7v7
FOLP2h753OQqAmnkaHvT8bqscB6r7Fb2s/l6xC2INj7vZG09ZRtUZojrUdwTWU6X
bhjd8U8NN/YtTqQmvuLtXPO5lC2W5X8Bu2vkH1RrXITUf47+/SRAj+ghfPGf2TVr
MmTSj3SSza2OMl90wbMCqm2T1GJMsS5PF7BNEZ0r67XKH4ycNQcsdiwP+Cc/yGif
5a83JwqjldzPs42UYhR+bnCw
=Wnw7
-----END PGP SIGNATURE-----

--TDlrsV59F8MuaDL1--

