Return-Path: <openbmc+bounces-2386-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9BEC5AD05
	for <openbmc@archiver.kernel.org>; Fri,  7 Aug 2026 22:11:54 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hGyzk3Lh8z2xfB;
	Sat, 08 Aug 2026 08:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1786140706;
	cv=none; b=fkNTzBjjwKwTrqo+AAm8HECO0k8vqvE84WZH1CsQCOXFZri9J5h07kRqqS0NOjF1fU+7KUKzWS6aidy0W1Abzj9NrqcbaLlfluOPrcuRj2ktQwmCSTy1sKXLXtJd9UOSutOmdf4DudWwFUNdcoKiWLpYJ99BrAllyGeVzsdjQltKMM4RqaT7h/KmdEsaRoPkypJmrsDR2/f7BGv3SaTPwa+Y3h4/sC5k0nfwpdKslj8zi7kH6hBBEyehBatPc+2icQ2uBGvH+A3VmCejQKUar1QY6JjjtQbjmNIT1zOqL2W7Y/arjX7pmboHCM1qw+SD3DI6mg0tRYBrP1ys2Mr2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1786140706; c=relaxed/relaxed;
	bh=QDREMibDvqdPO6KM0G6Hp4nxgHnhbjdljQYAhu7ZQPs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJ/1P2VLsV+qr+GiASXH7OVMGFAvPziLJ6+hHNcP6Ipq3xQIS1vkvfxQobp+iMcYeGsu04AXWB+VHuXyekhYtsnJW1yNMQguIrYWXJf9Me6/NT8RNRWF86QXaLQ1uswetXUEMLobJLf0qjwchxAGab/6TOvlnSLIKRCvJRvrNQd6oJJ0Ix/TZXmJJXWb8LNE1XXphOCpYuLxjcEXotYaN3JbxyGlvwYWE8TUiBEEwh707er4GflRvnC2NiZs1gEPv1tcZ+mi3sJNWeFgi/w1CnOGG9qeLRdFIyj2R/pHU6fAoFIZQffPcD02i9FXpF4W6aouHkxBJcuf2abMXB8ngA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=aMFT+3zC; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NtMrIcdX; dkim-atps=neutral; spf=pass (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=aMFT+3zC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NtMrIcdX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hGyzg46gxz2xLf
	for <openbmc@lists.ozlabs.org>; Sat, 08 Aug 2026 08:11:43 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ABDDD1400048
	for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2026 18:11:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 07 Aug 2026 18:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1786140699; x=1786227099; bh=QDREMibDvqdPO6KM0G6Hp4nxgHnhbjdl
	jQYAhu7ZQPs=; b=aMFT+3zCwHOuThWqM12ny8VnUGfCgy3yzwoJySrCP/G+3Q2f
	iakZDm2J3IKXdtNphayQgbJx9R+TW4DbzpP1CoZLIg9vWOj597cY0Mjq96NtU6h/
	zronNzg/cmVaIU9915JhqCsAuBK0TXjg/NR/sgsmxZ5w1eEE+D6RNeuIu74xCbGe
	2Qsx7uNdOiitBM9YpjaM9cEd1kJk10A52gsVvIKfSAMIHgRXgUtqBmZ/68CM4MFG
	C1LHjNL7Flp6KvU+X0qgb7YkpFjnao6aTAWD4xwYhi1EvC3d/pco+uwuq+qae88j
	Je+Ri5OL6VtuoaaRi6PANKz2gv/NZ7FG/zVHGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786140699; x=
	1786227099; bh=QDREMibDvqdPO6KM0G6Hp4nxgHnhbjdljQYAhu7ZQPs=; b=N
	tMrIcdXBXTRqXDckWuCaXDOqZKKvK6GXAbWS9blOD7nvlT1gn7Q23UsHwiGqJuxB
	vuDuQNK2t/6P1pDvNxtk0WynizquuH1XBhJI6sZxo1xNdMaGKmgezz2STR2kUmUl
	OZgyrfZifab+0ohsrXzbIjJUC0qSEjcUy+aTcrcbuEZDWOlHaOHWpZEVi/2QCiYa
	z/+o8OoWHEa1Nno1bFWqPdwqQOmSyo/5DZKLNNJZLI5Gapp9gFT+YQlQY6n6Hv3n
	2kuKqBJuVNAzvXgSGuvi8iPCtVkis9lDy+behvc+Md1oK+gJ1PH5UC8jm4aqgcu/
	foFTRIpUQFQYzxc07UmKA==
X-ME-Sender: <xms:G1h2aoWIIvcgYDcXlYhhiSk6P62HUQJSVbajBbGab8PQRP72rvK7uA>
    <xme:G1h2ajizlxc2cFuBFr99IMJ6wlw5_3XKWvwIOZ8n6Yd1khtXsvUETrQpJwgQxxxFo
    CgIjpi6MGmK752ps-ruxzO1AwgZUFA8cD1490TFrwoGvFgS_BDFMW-L>
X-ME-Received: <xmr:G1h2aiAKXpol2-Ik-NaSq3s2zQg-Ui1BWp-Jo1otHY1olJd429ZlHKNFjrU>
X-ME-Proxy-Cause: dmFkZTExUQPFomocRrkQgcSqiO0qzLBbq57p6MbLayKzT7DrY/1ELCVgY/R/4dFeR31NQ6
    suql/vZXM3TIIMjj9lI7DVJ2+yM6+oXdo2p6dMW75AegncPrIGKwpxsrQfOlSWvJ9dmZm6
    VOprAex5+0tgUdohpQxRLCxDkiEuR/aNU3GkK8hvgOq2njxUSVTaZaYl9VUZiWLoVNhoqH
    wgLaVuHOASomx9zV2XqZAN3So5OkYQa9etJ3AgUE9JOyodyLjT2fsyCibHm8tbpA5QVIKm
    cy/J19NUCK/H3wVCfOVWgy40yEpK4huvYy1WOE8XOYAlkiBqpm71opY5sRqU8oAuBLBdNm
    ipo+/U1ArTvhy8aZ1cVJXLCWYtajA6U38f0X7JZGGYNJ1d7fjxUSVG2LN//E3VwvMcWhaq
    tz68ltNxxAbGu33PYYqAa6YOFMcO913dum3uilFGdg+7hgP1V3kGaqXFNoowg1htEsFL6c
    FEgFqPyKEsx8LGJbkzOznCfqCBtoa3+cfard+K0BHzeE1pa+kBl0cur/Du88b4J7OGJww8
    kJZJhgH7PCoUSZ2sQSTkg2mlYwJabRBwR76mImMNYrzj/VUiQIZACkYifu1hYTf1VpMKC6
    LPwxszVnvYOVg5GFuIxtZfWvcoQxTjtF5koaiSgtKGBlCXhIjxN1bFv6Pfng
X-ME-Proxy: <xmx:G1h2aseQGLWvCsHOmIvXJWCOoNu04Fhgzkcxh0WE3xt8FXzPqqzu1A>
    <xmx:G1h2aidkIdhXpSIXvhFWKg3CZpB8k8symBZ5ktRR1EiReQxiwhPpuw>
    <xmx:G1h2aoib0e25UUZrAAwV7JXIqmkE_BoHdoviyziDV35ww030Nz1Q4g>
    <xmx:G1h2amRyWvR4b5sa5FIo9FJqmYQR4BNuEmhB7xETZ5_ny1yjdMUFUg>
    <xmx:G1h2ao2LFTi87VpXyhAxigdYetHUzHGlVdT3l014fcMuRjUe8subIEwv>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 7 Aug 2026 18:11:39 -0400 (EDT)
Date: Fri, 7 Aug 2026 18:11:38 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: dbus interfaces for removal
Message-ID: <anZYGFJA3mbs-JUR@heinlein>
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
	protocol="application/pgp-signature"; boundary="tHVsARhwbyZpi6Df"
Content-Disposition: inline

--tHVsARhwbyZpi6Df
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I went through and found a number of dbus interfaces which previously
have been defined but have no upstream uses.  I've ignored interfaces
that were added in the last year or so, but there is quite a list here
of interfaces that are entirely unused.

If I do not hear negative feedback by Wednesday Aug 12, 2026 on any of
these I'll go ahead and remove them.

https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93223 com.m=
eta: Remove ManufacturerExt
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93224 Commo=
n.ObjectPath: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93225 Volta=
geRegulatorControl: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93226 Dump.=
Entry.FaultLog: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93227 Dump.=
Entry.NIC: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93313 Loggi=
ng.Syslog.Destination: remove unused interfaces
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93314 Netwo=
rk.Experimental: remove unused interfaces
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93315 Inven=
tory.Decorator.ManufacturerExt: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93316 Inven=
tory.Decorator.VoltageControl: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93317 Inven=
tory.Decorator.CLEI: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93318 Inven=
tory.Decorator.Dimension: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93319 Inven=
tory.Decorator.ThermalDirection: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93320 Inven=
tory.Item.PersitentMemory.*: remove unused interfaces
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93321 Inven=
tory.Item.Rotor: remove unused interface
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/93322 Inven=
tory.Item.IOBoard: remove unused interface


--=20
Patrick Williams

--tHVsARhwbyZpi6Df
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmp2WBgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKsDR8wtAMEZ1ckP/0BvG/DnB6Q6kihx7zaI
DAOlBLPPYFwIKAObFiEajCgFZ8MFisSMnNvhBcTUvyEP1dLKzaPEciVbqR9DfbKR
LTfxipy6P9pWECUWrhb3IIQbWjbp6TYIMNyUwreUq2zqiaaH74MKhLvJ92WjaC80
rkE5c1zMFe/1SLrWCSEDr+VX3jrPRs35wGM8tKBasskEUduyY2iyxsG1HJ07k90j
zKtp6Fl5HgRPrIbZFmyipeMoG8dj3spX5GMe/f+Sz2wQRs/wFtbk2jCkHikAjJfp
RX+vMlxkaeSxgm3TPwJD7U07w8w2PBAWNWcQkw1FDz04olML9RdRsEL68gJZgT05
tBVJQWeD34z2+XNnxGnfNVZ50BLb2hl9VTjRxG3kfQ2+Tj8TUdnBdU/I2ti+09to
5e+rgrT8oNK4H2zUpeeblEqZE1gccCr7JoIBmwiU+lLuSscsAgJ24SdELfBZgFHI
0r08MbPONjzZUyVc1IQoyVEIaaJPpXLotHsAQNfs04eKUaA1wojn3yrZYI47byLc
9rSND/+8XVbeIfaSQTp04XmtorJo4qrAHntpTlxJ5t45ALwFR1WwjZNstdvUBjv+
RGCUOa4z15LS8eifAuH1rz4PyiqqOTqsX2r/+4gDVXxKAV2845pAFXv2QLfLQb9g
zg/32tAqhT9cS7zzy3zQEljY
=UGqO
-----END PGP SIGNATURE-----

--tHVsARhwbyZpi6Df--

