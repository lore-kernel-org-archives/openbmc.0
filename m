Return-Path: <SRS0=iKkM=M2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28C4C4338F
	for <openbmc@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:53 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D7E604AC
	for <openbmc@archiver.kernel.org>; Tue,  3 Aug 2021 21:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28D7E604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfSsC2ZXlz30NX
	for <openbmc@archiver.kernel.org>; Wed,  4 Aug 2021 07:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=gHYmM5oE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZLFs5Dhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=gHYmM5oE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZLFs5Dhz; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfSrd0PZlz304j
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 07:37:20 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D72245C00F8;
 Tue,  3 Aug 2021 17:37:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 03 Aug 2021 17:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xMkDl2sDOMhIacwyA9aFu97CxGw
 C1S8mFcBE/XCFAxw=; b=gHYmM5oEY+/ZTvIqMdnnOWj0iZmh10FVh9afbGHJiE2
 Wq9eI478/Ok8LD1cOuxYfpUgAo2o7L2/C1ZbheAM7W5ptjNy3qr8t3wTY9fYUHWG
 2QkRw4uFWrXRvt7L58LNolqwZnNi3qjCo//QzhE2FJ7QdYypdfdROFP4t+gFid7a
 np2QUcLOB6SzaPYc52m5whM9XB+kNBC3Qp6pLM9izjkdlcKLbcxqbi2xYwthr9TY
 QwryLJyjND9JlK5N1GnhmynqD0F9bNHBsLPGtooKlEeqvgyU64j2AHnTKvMJwLNK
 RZp+fPYLQVTgRrpRhKE461jC3MC6ERQAyPu7TOJjxcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xMkDl2
 sDOMhIacwyA9aFu97CxGwC1S8mFcBE/XCFAxw=; b=ZLFs5Dhzaz+G+5eGljssl4
 wO2BwUFZ16wyMSIEENV7Nwg+s7u3SQAeWB/+8eYl9eVhJcuFr2jMmgIRGDsT8WhZ
 TLmNTzcuGad4MeSFVNFGecRLuFZx/TdE7EQI1uOYX/6mionDGPZbKENkHRqGIcX/
 oIIUr1bBmy+PH+2gEuRxtPi7hj+ludrmGEaPj5b/MWsXSPK4nzrsqxrxxJXmHgiv
 k9VIrzGIfq3sr8IEQoRsGlqVjUAE/YZkjGjuD8UVXqMHrr+5iOwJSQTgCWjAYBwc
 tcaYcazO/rMdNVSg9M9iKHpN5fMe2PoBMtjbA1OKv+dD07+b5TftE4SCO+SNfZ8A
 ==
X-ME-Sender: <xms:DLcJYc445fMb4VdVdzo4Bv3_4mmPLaNnHuN-wFmQDXkDJ3WGP9_n1w>
 <xme:DLcJYd5fgBM4tVY14wAAavRkQPucn6x3fbee90moLLbjhiQflP1ObJlthHdjvPVAv
 eY7MnG0nfZFtlA38ok>
X-ME-Received: <xmr:DLcJYbed0n88yJdu8C2w8XOVdw2Yx3fkMvlNI8r9UBImu9nbQa0QIUYs-yJIdOlJXwGfYGj7o86G476Rxi1vjlA8ttfTBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:DLcJYRL99gHPYIUGs4dsCw0DIZtnCo6RpdJ6wd4ddYNb4M4S6Dulxw>
 <xmx:DLcJYQKxY-I17SXNKofLHyuU1e1kX1hAgZEcinoH3e5QbrqG44ljUQ>
 <xmx:DLcJYSzGOGA9TVCY6LPtLY3cX-_-gTKgutInX8fz7kfL3TUvZNxqKg>
 <xmx:DLcJYajY9YQ-YpwnC87YI4CfnSdK59mk3dEvJp8rtHCCXV9n3CMrnw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 17:37:16 -0400 (EDT)
Date: Tue, 3 Aug 2021 16:37:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Patrick Venture <venture@google.com>
Subject: Re: Aspeed BMCs using KCS?
Message-ID: <YQm3Cgf5XrpkIwWF@heinlein>
References: <CAO=notyh_UQ8WJktb7ffhkZyeP+btqHJ_JSR28coXqrq3XZAsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G0Epb6EfCTf5rhIQ"
Content-Disposition: inline
In-Reply-To: <CAO=notyh_UQ8WJktb7ffhkZyeP+btqHJ_JSR28coXqrq3XZAsg@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Titus Rwantare <titusr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--G0Epb6EfCTf5rhIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 01:15:20PM -0700, Patrick Venture wrote:
> Patrick et al;
>=20
> As you may know, my team is working on enabling lots of stuff with Qemu a=
nd
> we dont' have any platforms using KCS with aspeed.  However, we wanted to
> enable this testing because we have other KCS configurations.  I wanted to
> ask if you have an openbmc image that uses aspeed kcs?

I thought most x86 machines use KCS, but certainly Tiogapass does.

meta-facebook/conf/machine/include/facebook-withhost.inc:PREFERRED_PROVIDER=
_virtual/obmc-host-ipmi-hw ?=3D "phosphor-ipmi-kcs"

A default build of Tiogapass should get you something that attempts to use =
the
KCS interface.

--=20
Patrick Williams

--G0Epb6EfCTf5rhIQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEJtwgACgkQqwNHzC0A
wRn3OA/9E9okhP/DgkhyKMOPupYKMXHshVj261GtVqxEPollnC0DxCai3non7Jz1
9r9+wPlt2Lopj2S/SAgHJDQi9v+kJX5loJh6c+gL42ymA6bmz/X4yXg3LGSccp6n
rAdxDp+ldOLcLOJW60wrv0dVqmm1tRwraeE7IWmmGXlESt+jqRlk9M6o03GTiut3
ZiWanjeT5bRz61uhetaNKaevAlKVCw5dk7S0H/M0g+ahprKqFgJaE6RMnlHHoBB/
sz3av5MVXjol6vogcHuPggL+MxjB+nrYdIq282kkaaYNM4HmRKGSgegmKckZHWCD
MDhhIo5j4RXSp0OK8qtGKeIL0AkjXxvG0ZKkWSOx2HvkefTL/c1m1e8emCVdrXlJ
G5TdLzhwXr1cYrT2cmHOcqZw3TQEtRLskJuSQ5cWDiTdY7toJ7SwrHZtWHWexC3h
D78rfqt10FRKo0nhtgc4QstjEY6FASyN8l0GaowPUJ2/BInub/+Z/ks2C2xzMizb
tHtOBGuGYHP2zz8Xa2RXao79kxwAq9tVLIUxhmE7jfOIzKrHXspyJETYvExpeKq0
ySuO3Aj4MqtmUlGBI+vZdRsBsN5BMLHYvEvSO5haSvZy/NYs50ZpYa4B7Hg0VOWR
nQGq0com/5m7nbguIrYPpbNln1NGV+86fiiwDJEZ6gcpUt6ZNhQ=
=SPSq
-----END PGP SIGNATURE-----

--G0Epb6EfCTf5rhIQ--
