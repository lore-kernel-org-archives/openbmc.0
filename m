Return-Path: <openbmc+bounces-2344-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DA2C5516F
	for <openbmc@archiver.kernel.org>; Fri, 31 Jul 2026 19:02:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hBb6r1Vl5z2yjR;
	Sat, 01 Aug 2026 05:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785524563;
	cv=none; b=URaRsUQR5HhDgc8p7aks8j8+9MUBmriz2QGGgANhmIOCQoJFJO9NVhqlnnR3I0o2xXU5kopUPkmz50GxednhdvuPMSOEO4w6+rTI/K3hbLP8ftL1VCwsH5KomrqKl7x6V7ERN3Th/MMe15O72ffBuM7hkWDnqfhxmq4+T98jfDckEffxTCnRJjnU98L+d+vR6h51EVtbsZwpqUeP/KrCBMcQwmG67PUUpDMn1v+3FPgZDXIPELYMYaPr6zV50hFgP1McyKxWwqtAOpijiH4ELwnCmFHj3SUDHh3G2JC/AWT3xbe+MNeMvJ/KX9yNhJLLi6PXsaSfKIqb/ARzwMtW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785524563; c=relaxed/relaxed;
	bh=Ytc5/tNtb/3Qp51JMKOKMKdHBa+sCirW988T+37dzDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDX6AKwEvz5XxgVXgtwAciRm9AeOGi6KqzgYog64SmD9Mzpwb6n3KR5Ty5zh54Sy7KYhZCUZVzp3OKKASUEEjN6KVaBIu/WonbBrcq4lLxR2vzc/+rI7ZiLIaFgakb0vdmL3XpqOZyLvlvK4rUEPJwdc9gSlxAALjr9G4ny/I98yhdU9ZSgBLeRKaq6oviDRIdb6JaIjn5psHSihOVwCaHs7fNcQwadbwq1QFuMoZE+3AXSBKidWDDTstxoLEoPuy7GKg9z21A9crf/xq4orN15zf5Zf5AO2OS2EK4DyUSZaVLhoU8WhvhwlyDhifp3h9m6W0OH3bijlDBu1IscSkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=oUz52Bsi; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=edPLy/J+; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=oUz52Bsi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=edPLy/J+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hBb6n3fqLz2xwH
	for <openbmc@lists.ozlabs.org>; Sat, 01 Aug 2026 05:02:40 +1000 (AEST)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 939417A00D7;
	Fri, 31 Jul 2026 15:02:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 31 Jul 2026 15:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785524557; x=1785610957; bh=Ytc5/tNtb/
	3Qp51JMKOKMKdHBa+sCirW988T+37dzDA=; b=oUz52BsiV21D0mJy7Is6BjaULp
	lwRVAiWJVM0SPABjBxb/zHhswFRBdNdNWlSmcEH04M+6Eodfis4SrtNUMBzRHweH
	dwSjL828Gqgh9uJXqNNby8/tIVO63eOo3eOud22pqCbwn+99DD0z0J3m/N/Ejdpb
	5Hb1+Sujt0pMm7ogtXAY/yJtBd7RDr2HIgRjEPq3YyJ1Zl1mrO7Syoh26dBpjXne
	b+9YgQh++m1/NixTVLRGDh+mRsxiOcByR25wIcnU7GO6uKBpb8nRyymIutF1Sa7j
	N1SC9ZxxZur+1aJtx/84CTbxtC+WQOvTMCXoW/P4vFhp8cT6I2YaqTSkw2sA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785524557; x=1785610957; bh=Ytc5/tNtb/3Qp51JMKOKMKdHBa+sCirW988
	T+37dzDA=; b=edPLy/J+bWZCNDELBLJfynj++S/C6gbtPiOn2qOoVtluMrIdr/w
	h50HnJMnVUjJ/veWF6R9xUY5WxLg0etnhkdyRRRWo/pfuS+NUZzgBnPYjZIRXEOw
	ZCvoQME3UnUNLIJW6w7/7timK6+4TjxwR7YTVoyhjXK2Zm/MAJ8TxfrAnf8Dv63L
	PApm3jd/E3WyEKScHXmm+h+KLCsS8kK9Lf7z/zoVxCP6HnU0YJQO9IM1/ylHFB4m
	v7wu6kh65YuXrlNvAuWIhu5BJGVduzrrWkEGT9Rv2gcZ7r543nKa99zPd+MuM2r4
	IH0Lc/JIC7cF1tvCgzwRVZOGXlhEGh15m2A==
X-ME-Sender: <xms:TPFsau6nLjn2IlCEjmo5zbQ2yVLXEtQy_HH2QAKXrZ7ivy3bG9S3Cw>
    <xme:TPFsavVL9yjd8PgU02hUv9mNtmTCu_WpUMm98lXIKcWAMreYBsx4pLwcMevJ3_DbT
    wTT_Cp0YS2qpm5vu0MQCvcbmcc7oodrT0ZH9oHizcyt8WiWmQuVV8I>
X-ME-Received: <xmr:TPFsaq19409DTaDf5EVtaMyG2FKoydno0KB8oUxOJjCr1SOv-XrW7JKrz00>
X-ME-Proxy-Cause: dmFkZTEEQS2kmOjWQF74N79qLlFunhQ9qo3oSqC3XioNdYYIO6b/IlxK+7WPYkPGsp/0M9
    eTOzN0SJBqlxwYy56udhbcVJF8ZfqnR7Ip8QIH1/ZR6dBzm33hNKgJculBtV+ynPUcpldh
    1DWIUk1tE4t/5OviXx5x+W+AmwHsfPf4Rk602pZXNFCMshJ0IbKA8gqBWBXtBoKPsoRFWW
    CBXCjILKJWXmfXz2EusGdaa2ixZ4MiT8Z+jGHrpQynq7n3pUAjJCVCVTYELZfRPQLlpIvQ
    ERaRBXq/D1tl/4swhB/hTcm12DMa3GldULLu6PgwfBWjvcGUC+fZLzIjzVKI9UaVz4Jnn4
    ttomuC2Wn5oeY/Q47FTjW242hU2r79rsgmgi8EU4AQWGS3rwPswjIaZ1KlzH+7Vl05yOrp
    g9Nh6EbLZp4+zji5L7UhPmwQX0SzyV8eXr8cSRc4lwv9VJ8LjZpUgDAggg9+HJ/r3diVRQ
    ZAUwKFGiCPGptL92vB35L2lWebpMdD3fPMElqkIcQh7CmOuiLz1WAMQBqeLrr6IrgiX09U
    IEvViCg1PGM8V7o475vcNKHLdhfG9ycOylYIgsi7jha5YqTL7fU1ONtr/nwTb17W4/HqWX
    DegYn04lRtG0Jq/nNG37I4xHkENNwLVFA8mqZvGu4dQ9slpN4xVXit6etvmg
X-ME-Proxy: <xmx:TPFsak10DDFk3FHdoxAj7o4LgIFLScMqEl-OpjHGg2iCj5MSHKYIFw>
    <xmx:TPFsal8uKHrh6ksjQgonj9qMOt5hhYIXYJBMDKdHm04maWV4RD8_sw>
    <xmx:TPFsap2Z6khd2PnhFooZ5grXl9TU4BRrVZMoumDDf2DVQsJIx9HCIA>
    <xmx:TPFsaq9_dQJXRHAylx9Wlx_TTdZRL1VW--bA5OzxVXou_g6yBmr0ww>
    <xmx:TfFsajA3ioJLNnGcDY9HtH1qQB-wOLbOt7_DHHSbl3j_hrWn8WJPuVZ4>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 15:02:36 -0400 (EDT)
Date: Fri, 31 Jul 2026 15:02:36 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Chinmoy Dey <chinmoy@nexthop.ai>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	Roger Liao <roger@nexthop.ai>
Subject: Re: [stdexec] Long-Term Ownership and Maintenance of stdexec
 Dependency
Message-ID: <amzxSli1xmTpKCB1@heinlein>
References: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="BkS8mLrWolNTLwwq"
Content-Disposition: inline
In-Reply-To: <PUVP216MB324896F920CC47B13D11DCD4AEEE2@PUVP216MB3248.KORP216.PROD.OUTLOOK.COM>

--BkS8mLrWolNTLwwq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 12:29:03PM +0000, Chinmoy Dey wrote:
> Hi OpenBMC Community,
>=20
> I would like to start a discussion around the long-term ownership and mai=
ntenance model for the stdexec dependency that is currently part of the Ope=
nBMC dependency chain. As I understand it today:
>=20
>   *
> bmcweb references sdbusplus through subprojects/sdbusplus.wrap:
>      *
> https://github.com/openbmc/bmcweb
>   *
> sdbusplus is maintained under the OpenBMC organization:
>      *
> https://github.com/openbmc/sdbusplus
>      *
> https://github.com/openbmc/sdbusplus/blob/master/subprojects/stdexec.wrap
>   *
> sdbusplus in turn references stdexec through subprojects/stdexec.wrap :
>      *
> https://github.com/NVIDIA/stdexec
>=20
> First, I would like to acknowledge and appreciate the work that has gone =
into this implementation. The intent of this note is not to question the qu=
ality of the code or the contributions made by NVIDIA, but rather to discus=
s whether there may be an opportunity to align this dependency more closely=
 with OpenBMC=E2=80=99s long-term governance and maintenance model. Since s=
tdexec is now part of a commonly consumed dependency path within OpenBMC, i=
t may be worth considering whether a community-maintained approach could pr=
ovide additional benefits, such as:
>=20
>   *
> Reduced risk from repository access, policy, or ownership changes outside=
 the OpenBMC project
>   *
> Broader review and maintainer participation and long-term support
>   *
> Improved community ownership , transparency and reduce dependency risk
>=20
> If there have already been discussions on this topic, or if there is a pr=
eferred roadmap for the dependency, I would greatly appreciate any referenc=
es or guidance. My goal is simply to explore whether we can further strengt=
hen the sustainability, transparency, and long-term maintainability of the =
OpenBMC dependency ecosystem as it continues to grow.
>=20
> Thank you for your time and consideration. I look forward to hearing the =
community=E2=80=99s thoughts.

I didn't respond to this before because honestly it sounded like a
competitor to NVIDIA trying to assert a "we shouldn't use any software
=66rom my competitor" stance.  Nexthop isn't even an OpenBMC contributor; w=
hy
should you have any influence on this?  At least sign the CCLA before
you try to "assert influence".

For background, stdexec was the reference implementation of P2300
(std::execution) during the standards process.  It is currently the only
complete implementation.  We are using it because it is a reference
implementation of a very useful aspect of C++26, which we have based
future async programming around.

The day GCC and Clang have a native P2300 support, we will start work to mo=
ve
off stdexec and use the native support.  If you look at the way our
headers are structured it is even designed so that all stdexec usage is
replaceable with std::execution.

I don't see any cause for concern of using the stdexec library anymore
than I would have concern for using nlohmann::json (which is maintained
by a single person).  If for some reason NVIDIA moves the repository in
a direction that isn't useful for us we can always pin the SRCREV to a
point that does work for us, but I really don't foresee them doing that.

I'm the only one in OpenBMC (as far as I know) that has contributed to
stdexec and I sure don't want to maintain our own private fork of the
P2300 specification.  If you were to print it out, the specification is abo=
ut
190 pages and the implementation is some expert level C++.  The primary
author is such a C++ expert that there is a primitive named after him
(niebloids) and was also the primary author of the std::ranges specificatio=
n.
I'm not going to compete with that and I doubt anyone else in the project is
going to either.  Where the guy works shouldn't matter when his code
speaks for itself.

--=20
Patrick Williams

--BkS8mLrWolNTLwwq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmps8UobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKsDR8wtAMEZ+o0P+wTPBtklCAcvB6/H2BN9
+XYfZtN6On6UiNvMwcuZ++SnTwrIgujWOxAP0caMJfgGcAosq80ggi9tSvXbInCD
RceDDe7kyBkIxbvNpNBr/kFmvWni2kqGw0CA7xidjgqe+dnFejadqJmoIqDBlwqv
ZWpcA07q/Oi3+Vef0RFjCMvhe44vm0ufGluAxlWPV8bWgx1JKrLmL5FR8hKSVIda
e5ndgEaerWCtZB9ZAkRVcfvxaE+/YGQAhJi1rHfAXl4O9msFSxsTrCwUQ7xGepWB
gw4z1coOW2Ll79LUgF119ueJx7taOW4GIejF1u/PFyIbJUKFtzEi2oyC70DDIfSl
1jpxXOh9csL+JQnG+kDMmX67NocTHOemrGAimg/3f5U1+i2cKLyy6MbS+yLH2N+8
Pws/1rJI3yqqq8FQNAPmcJdT0kHdE5CCpS3GlOR2NiFFbeREs7h3CXIujR0lP4wK
8UhtrqGViBs5Jz7uqKyvu3s/eMrirzbH4Lpu1l7a4r/TEvDifol2lCqEVjuXxl2h
t4yaV7K+qfZkN/dNwHJ/itFurkXHvEEE2qsqbWk7h8j5evEf0S/cufl65p5rnpN2
dV22+XFcHjtOOoZfdG5UDWaN+dj3y/XMQS0Gz+IJvFmhlxH/RZkjKv6qfh+f+50V
4YAfzl0OQR0pYrCk4aT3HIO1
=9EV3
-----END PGP SIGNATURE-----

--BkS8mLrWolNTLwwq--

