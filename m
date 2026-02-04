Return-Path: <openbmc+bounces-1317-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB0DE83F1F
	for <openbmc@archiver.kernel.org>; Wed,  4 Feb 2026 14:05:59 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5hw0269Tz2xqD;
	Thu, 05 Feb 2026 01:05:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770213952;
	cv=none; b=HN+t/ZlzgPk7XHsa3PCSZEqzjc+rCQnErWcoPIMz1GQpHJBzoIv8IVRhriVMc6gl1dWhCoz3Du9KD4DVI2OJLZfc3aoEVnUTXdN08MpIbptdmW2GxiZBBjXGC29BIZCeUuVzjtdpNRse1F85jfWAt38FcqWBA5wTNQ+AB0VOpSM2Oa5h6Nf0/TGZQEX0rFTdPzMOVgUxQiowkGeDrehBer7rATE1CF2kAw80daCC3VosfVSfGwvzaee6/PSNRZo+IIjzuQSwELXXhkXJoXjR3k4E0zW/IvmmaWxzHfd2mEkcw7qz+NiT0Wr3C9j5ExyY7E7yVnXVLrorEn4bbuoURg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770213952; c=relaxed/relaxed;
	bh=2xdLmwQrHNg+VQlWScNX1tKkuNawZW020GFIWxRO0Bo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eqrlb2LVgrL9nprN5PS8kso+8o5c8tHAFwt6QNK/NJaYkg5BIn47j1n5O9jDiKn/RRjIU9PiUkLRwxmay0c3oCZq6rz9WiOWbY3G5V96L8FMH3Lfw5LX4tCHh7XvxZhgst1a9cCGaHbBXQggT8zdH87szXYXOnALspBhqyaOXnlWMZmgAcTCx1ZoZpbyOn9IsDFeeqJZ5YFcEsBeM+dTmCrjZdyy/MPg4g1Cg1ylL7uJrsLNg13nlQIM4w6fcKHhFL2GwwC9Qz7QlkHVejrIWOj90SpWc+EjbxEY6h9AWudbRK8tQwZFzX3+LxCBNe8aiHe2H42cY6xxe3L32jqc9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=I8jJmZ8/; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cPKlRTjH; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=I8jJmZ8/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=cPKlRTjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5hvx6Jfjz2xJ5
	for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 01:05:49 +1100 (AEDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 8CABC1D0009A
	for <openbmc@lists.ozlabs.org>; Wed,  4 Feb 2026 09:05:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 04 Feb 2026 09:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770213946; x=1770300346; bh=2xdLmwQrHN
	g+VQlWScNX1tKkuNawZW020GFIWxRO0Bo=; b=I8jJmZ8/XxZtLzKlFfZr7yauhq
	9iRQRNw5KzZviI/Na8+gVKqU+m96X2Yyh/YZU8AYFMVM34yPMaCE/nafqKm+FTpF
	Iw4QdRi1PkW4Ms24UMRaZ9ci/diT1bN/4pgJ52Cm28vZRAZYQrsWcBywxqaCegoh
	iCrRyLVvYRoe9A6hbwVqessbKV067K2EE8VLFHNepaKiumgkI/DIlhwJrhRH+No/
	kj/t6LI5AOkgqhZ5dm+aED/p/Ld1a30IYTzt0nQWSahTSlhicZ6tpPzTgzQX1Eiw
	NpFBuRxeClRa1Ph2gkRkxA//D075OQ7bt8tYoe+lC6apKzqrb5ppHUgQPhSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770213946; x=1770300346; bh=2xdLmwQrHNg+VQlWScNX1tKkuNawZW020GF
	IWxRO0Bo=; b=cPKlRTjHMRbKDsrr9uwBwlsZaJhHz5NIHv1ScdlG5SLFV0h15HB
	PnF6ZH5YGIL8JjzsLPscVxDwVLXJBRKT3FVS8XblvoXxe9DXTkhOI+ulUKNzeGVM
	xF3doJkX9xsvvznNNMRkyE9orSakctkuHSa2o9BNzaSE07fki9aCcLtCBpbcKw+5
	NmB1k/aTThIXaeCO52SjPbQ4r7qV0lxdfjVr3waBiDhwvEveWA75mlpwphnqCAPu
	eMhlrd5H5wktPWESwIz5S6aL4VXQHqb2yTSGBlexMIvVldkT7bo1XUaHyCRwpOLI
	pMU2o9MV8NIHOeEdhe/pNTNS3rUzK2SxWXA==
X-ME-Sender: <xms:OVKDaZyJeaL8bRvi9jMYCTqff_MCCs9SxLMYG3JhizlwiDEM5R9bYA>
    <xme:OVKDaQPU0SlloPdUNpz0qtD17KTcAucJV5kArukw-7ADxhb68wV6842Sc-hfaiutu
    bPf8ATchOD0-u7ZLUduqZibvjG2kpQ7eZZf96moyf1XksiY-gCmTO4>
X-ME-Received: <xmr:OVKDaY9iuNtFVANPD6xSQRwDkO-IUBbkLX4Qi1bHcrcHM2xuVwXC2NDAvvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfhgeef
    gfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghr
    tghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtg
    eslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:OVKDaQryV3z3g9-kkSIdpPryljO2ApG2ciBJgtLy0P5pw9Wz3_GyuA>
    <xmx:OVKDaa7_Q2NEJi4xcOvPdqdFsUWs6JPmpWZm85tyQa_fGxPXvKLg0w>
    <xmx:OVKDaQMevbVKbCV6rccXi_JbEVGLCCtB2gdmifhdd0G_9ei1fT4TYw>
    <xmx:OVKDacOCP56XGxPFgQiyQ2X7yXthb2Wi8lOjQfWSRQZWTvzElN0Pcg>
    <xmx:OlKDacBg_CcKUcPkq6mdDB4xSC3wp9xcCol1-wUoNFM_rOaJYkP6tE_G>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 4 Feb 2026 09:05:45 -0500 (EST)
Date: Wed, 4 Feb 2026 09:05:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Message-ID: <aYNSOGXXDaj1MJ1X@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein>
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
	protocol="application/pgp-signature"; boundary="vSLEsc6V1ApmxG2w"
Content-Disposition: inline
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>


--vSLEsc6V1ApmxG2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 09:44:27AM -0500, Patrick Williams wrote:

> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
>=20
> Nominations are due by Sunday Feb 15, 2026.  The election, if
> required, will be held beginning March 1st with more details to follow.

I will also self-nominate for re-election.

--=20
Patrick Williams

--vSLEsc6V1ApmxG2w
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmmDUjcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZgLMP/3/N0H+pqbj9wbNKKqDl
WZDqTXivvrvhVKlLHTl+ySPF9RYBcR2CNhJ1AfkfppcJfDbnGsdiIz41RM9AEY53
FT8D+oJI4RdCTqTSgIhLa3N303JAB/Ni1ikAVmCvXKagoNHLZO/6D8IY7g2peB7n
5o8NZ6xwAJC3t8SXvB3KJhy+Zj34+z8/NdgOWbypJjkc88bH0EDqnDonxY09u3i7
iuh2Mn9QJGPf/LBpzDy52johPEgQS3ckFc5V2vnV6xPdQ88j9XJ+XnH+i6n6bcch
GRrkUgp3ufbX93ikJLOaa8+bhpyEXM9rgK6nL/8ZV8uCI2OfvE7o4MVCphNSs0Md
xF/W9XDZ7pozJ0lf7XNv8qHtfpVpKHOhCRhUawVReZDmFEmtBERPQH/RYMLSN5tR
+QmKoUOv9xOgWhbHJyDvpgmSS+DhNJg+KZ7ShrjR3I9bcYnDF/kCPUYIrqMFDvg7
Ug/Akr7Ml2MjE6ZAqpHzmje2TIlExuvj3G7s7HSbGagg30y+pgP8xnWObchHATK6
pczDFfaKE8KKKAwdQ8FHl7QCacY6G8c/7yJQvJKyStJx8m0RSSxgrojv2hOGopDz
H22Q4NR0r2P5vGvNyYNldoZC4BB5NL1OrbehQLH9kKtXA8LWwifykLNcWRwZ8SHa
f51tj8iysDpJT++ERc5yGBfE
=+VQi
-----END PGP SIGNATURE-----

--vSLEsc6V1ApmxG2w--

