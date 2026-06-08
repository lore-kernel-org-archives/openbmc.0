Return-Path: <openbmc+bounces-2049-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBE9CD8C9D
	for <openbmc@archiver.kernel.org>; Mon,  8 Jun 2026 16:10:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gYxpV5kb6z3bpP;
	Tue, 09 Jun 2026 02:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780935026;
	cv=none; b=ernMUCL7PhAJeDE/JjDabYAK047QehaB4KjyOciu0lhYUQTj1mrtk9LoujH0GEb1PmSNzl0/UOJztG2Ms7Z6/ntBH9BDodCTfcd2J8DXgEHWg2G+VKOs4gJA8RAaUDjjNh/NTM+gR7dfG8z9P8Rq6TmjM0ugmBy/Knvyr1W/CC/kqaDeYH1ORDRc1faRQ878QUtHkUCbOZMmrU2D8r6/ePM5Y5/ugtOxYMVFF/EhyjODEQpq9QuW5fs6Jv2JnIa6WvQiAGzpNQc1puMNhl15crX6KNNlICUI5hY33t/5izQJ/YPAfA+bMzw+IDxkasQlO3Rumw/HTiNVQHsawBMNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780935026; c=relaxed/relaxed;
	bh=+AL8NTnROdkOiV20ERPxmoL9P7WnHi9wGFsXYSk5pGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nc59xlU52hJQye8KF1HTEZ7Npirolwcwi0JuK9oMGcqcizkeFxOfLeqJThDQG/Hcp4PcwhReMugP4jX4UU26EoEBuMX790VTzrEOH/4nDpceEEBXiQjE4TN93sUiBbtOR3LPofy/sOILS+ZFkM4DLaVOUvnIwOuqIRgt949HNUFtE/rPcCzfx4u9Ukn1ow0K5hOMmREmanxqFE8iLi0l7Dzl2bgE9vCu3cn1j9TeIaBDL5esQIBIHe5j/5/G9yKcvdJIlkpgHI42Qh0kFueua4/O3LxZ3MiFH1IZuo5+3AAkaMDGWjC5D1+rxPCGK4ylg/kjVPuI9K3ZQaxLSrOwmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=q1BqSbuX; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JUA3TlWy; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=q1BqSbuX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JUA3TlWy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gYxpR0zcFz30FP
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 02:10:23 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id ED37EEC003B;
	Mon,  8 Jun 2026 12:10:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 08 Jun 2026 12:10:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1780935019; x=1781021419; bh=+AL8NTnROd
	kOiV20ERPxmoL9P7WnHi9wGFsXYSk5pGs=; b=q1BqSbuXpVxeKFhi0KB5exSBXY
	lTKy39A0RIKSKV+Eo0ZKtEcAoC6cZr1QiwCi+7IJYUNyauuL3dygh3iDE2x7XjzT
	4lKXYbQR0NNS9HGZy21lUEgMCPj17JU1YDptgeKW7vf8HIPuqfN0pgeR1Rfy9cCt
	3zuzLyHA7UK3uxVTZbBdxet67OLtYp/FV7J8IMbW/CpR/q7gu5vlVu8RNDBoz6E+
	1dcCptG0VGMZ0uHFn9K9jVngvZBWFg3t5vMM8Xjvb91dk9anmKRJQ6euR8mZL8wW
	UF2RobrfCZz4qdpnBF3mnoMy7hAYeOx4OKEAA3g/ZSHi28F3tgWSGxFCRmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780935019; x=1781021419; bh=+AL8NTnROdkOiV20ERPxmoL9P7WnHi9wGFs
	XYSk5pGs=; b=JUA3TlWyQckWdUhTo1TwrFpeewZpR9PzSCLBxcH8IkASozcWhI6
	lAfAFVLSdzOlfrOMn+EmjLPjHC4xIvuiKWydywQc+Pl7a9WEVs+t8YB/GCSRvt5c
	hSCidahDAvNjpRf5RUzgcBpsfhfkvFtlzycdlWk52y0DMxk4iOTxvZxEZgtTZOoo
	D9ICIDPACpwTekEIUu8xHJz7cMMDuebV/PIS/5QNhY6Gj/y7Zl+NKv1dX476+mdJ
	LH3gRsK1dKi8vTV7+hrBKfwHRGFw9oNzYI6m85QTPztkOajj29ockpjjkzW6hQPd
	0TpgVZN/mmY1Ha32ki9289xsHMI83TfX5iA==
X-ME-Sender: <xms:a-kmaltM5lTvbOOHTMRbhDbuHdE_mhhRTHAOiWVgOIJGeH_0xdBz4w>
    <xme:a-kmakfkHzWmCdVW4UtLceAtIOD3u3vzcAIeB8xdGZieRi-P7qwOJJdrm7ISh-D1D
    6Uj99MsRBtJfmMmiXjnIF0IXmUV4YejDcW1JLNtp7kLhnmYhqjgtEE>
X-ME-Received: <xmr:a-kmambyaH0MzofnSxuAm42pL_Yw0wnPCKJI-Zh_6a2MRQwHHxgsP-sDi3k>
X-ME-Proxy-Cause: dmFkZTF/5snE7S+idBo/qADnHUoaa0abPSFl1CI/v17QoOJYv9xM49R5mM+Bo90ir4TwBY
    z0DUMlVpJoUAG9av+pddnpY9BtppCYeTIBaWRfExO9uioaYleMw2Y1ckQDvYKolI5oOPeo
    rJ6NI9Esiu6YXMeHs5H23+tOKTTWRcxHvJ+LaYBJq9cE8s3/4ZunlR6MADb+5G5S4i5XGr
    j/kZ7sA+eRX/6j82bVD917ZUxzlDhcgV0wEc09stYw6TEjR7aq+prQJzXtFutpmQFvC+de
    63ICrT9EJHC02XikGQypWVIME+AoNgjZnk2FfU8AZGrKXUNISXM7LeZ+8VM95KInllz/eB
    4BwR3G4it50W74AGHp4TLyCuWrf6k2naiEz59k6fKRf8w8AosNA0EunayP3haccTP8hmjI
    xlJhmG8DVxleEPUs90IofCIZGp0TlDrnTqj6A4IIJ0cJkz5gYMNFjtvtnZDrl6mGPU5AYB
    cRoHieGWw/yXIqsRqjcbCoYsnwJfWE8Uby7jJdbxxobfNfEZrs7xnH2zoM/pkPSggsMbwo
    saTe1zcU9m5bP/sNcA+Xi5wcsHnl+0ki4FP1tcEXtF2AxXCxn4YjmiDdRegpzeYjyAnJWy
    XYQ67bd+VKtVBgZ3lpPJl3yIvI9GG9EF+ML60jGbUX/eVOJsLG5bcTLYC5DA
X-ME-Proxy: <xmx:a-kmanUiWcE_8LsvL5fWLGiaRk7XDEMYZNbxHsO9_uz1nPzBEEIMeg>
    <xmx:a-kmaohHi4sgsA5oIfXStvD0Mm6xC-lOiEs4ouEfeaQKGzMk39T6ZQ>
    <xmx:a-kmalWQiQtz3EADQ4QXftbyo4KXkPYV93UpVqbKz9gCbFQu4wddnQ>
    <xmx:a-kmavOELyHtUjeS2IRdflfUQwiw4vVP_pnh3GnGuxEHx_bnoucp4g>
    <xmx:a-kmai8hFxMM1naazfKBsb7ju2XrKLAs-ACQ9ttEdIhz26qjhU3fi2Ix>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Jun 2026 12:10:19 -0400 (EDT)
Date: Mon, 8 Jun 2026 12:10:18 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Yash Patel <yash.pateltx@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Proposal: Utilizing Container Registry for Shared BitBake
 Sstate-Cache
Message-ID: <aibpanHZagb39G4t@heinlein>
References: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="wO2QjoPd7aVOvLEn"
Content-Disposition: inline
In-Reply-To: <CAGwee5_2x89EVnnkXpV3_NXNAPqqjOx1sknC7aegU5Zui+bjVA@mail.gmail.com>


--wO2QjoPd7aVOvLEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 09:15:42AM -0500, Yash Patel wrote:
> Hello Team,
>=20
> My name is Yash Patel and I'm a summer intern at IBM working with
> Andrew Geissler.=20

Welcome Yash.

> My goal is to start storing the sstate for our
> bitbake builds into containers and upload them to a container registry
> that the openbmc CI process can utilize as well as other openbmc
> developers. This will make it much easier to bring new build nodes
> online and to reset bad ones. It will also allow openbmc developers to
> be able to quickly spin up a container and do bitbakes quickly for a
> target machine with the sstate already pre-loaded.

Sounds like a good idea.

One of the issues we have right now is that we do not have a good way to
clean up the sstate/downloads directories out of each Jenkins node.
Eventually they run out of space.  Managing it through containers will
hopefully make it easier to prune old state and keep the nodes from
running out of space.

> There would be a container per machine type. The default machines
> supported would be what we run CI for up at
> https://jenkins.openbmc.org/job/ci-openbmc/. Supporting only a single
> machine per container will keep the size of the container down and
> most use cases are just building a single machine. Also, a lot of the
> free opensource container registries have size limits on the
> containers.

In addition to per-platform containers, you'll also need the branch
included there.  We should make sure to build this for Wrynose since
that is the Yocto LTS branch and we've committed to supporting that for
a few years.

>=20
> We are thinking that the
> https://jenkins.openbmc.org/job/latest-master/ job will be what
> generates and uploads the containers. Currently this job runs once a
> day and builds whatever is in master at the time (we could tweak this
> schedule if needed).=20

I would suggest a separate job for two reasons:
    - Ideally we need to trigger this more often than once per day if
      you want other Jenkins nodes to use that for a starting point of
      their sstate / downloads cache.

    - You are going to want to create sub-jobs per machine / branch (and
      like I mentioned, we should do this at least for the Wrynose
      branch in addition to master).

> We would then update
> https://github.com/openbmc/openbmc-build-scripts/blob/master/build-setup.=
sh
> (script used by openbmc CI) to look for an available container and use
> it if available, otherwise just default to the standard flow.

When you create these containers, ideally you'd use the
most-recent-previous container's sstate and downloads directory as a
mirror for bitbake.  This will let you do incremental rebuilds of these
sstate containers much faster.  If you try to build it fresh all the
time, you're going to consume hours of CI time per platform we're
trying to build (plus the x86/arm duplication).

Make sure when you do this that you don't use 'FROM: <old container>'
because that will just create a chain of container subsets that will
grow monsterrously large over time.  You have to create a build
container and a final container.  The build container uses the 'FROM' to
pull the previous container, but then the final container just takes the
resulting final sstate/downloads as a directory.

One tricky thing in the `build-setup` is that you're going to have to
figure out what the "latest best container" is to use.  You're going to
have to traverse the git history of what you're trying to build looking
for a docker tag that exists somewhere in the history as your starting
point.  That could be the previous commit or it could be dozens of
commits old.

> We would generate containers for both x86 and arm as they will have
> different sstates.
>=20
> We've done some research and it appears that github provides a free
> container registry for open source projects so this is the direction
> we're thinking.

Have you done any experimentation on if the GHCR will rate limit us in a
way to make this non-useful?  Do we have enough space on the Jenkins
server to run a container repository there?  There are a few smaller
ones that are self-contained in containers like how we run
Jenkins/Gerrit.

We might want a Jenkins job on each node that is continuously pulling
the latest images from the container repository so that each node is
already "up to date" when a CI job kicks off.

> Any thoughts or comments appreciated!
> Yash
>=20

--=20
Patrick Williams

--wO2QjoPd7aVOvLEn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmom6WgbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKsDR8wtAMEZtiYP/RYjR9Q/cHjYa/xni0c7
gMaxLyYC7FLKmdKQSvTUGsKWVDCwT+jRUqXw8NseZmzB6SB2BM3AYA7bo7RtDhh/
jYxdUjZ2OliCLhF/qv+RXXYvpboGBwPF1y0RR17R7Qk0xXr4dMSKtn7oPaVB6xEv
Adi0fxt8825PgrwlQ1Z6E4EJOsIc/CkaCrrHt958+ZVklzXmg+08vaIJquaBhDM6
dVtvZ53HbzIxkyUA9O0ao0dniRZWfWoJEsstoAIfRZ98oV3o0y7LMoK/hiVWYGb4
A4a3coC7CBhea4AZe39xSXsmQWj6s8C5UU1aAeMndhmXpeMU3DYhCbo/VPSqwpjz
z/rwQdehqMiUheR+sxSfzfXXuQA3TtMdhjPkHMWJPQStNYWrRr1H3/TXbusoy+Wh
tz0pLi5xN7DUex6j6HIbBUCy+MhsOxi/sX5+KwvVngbOIGu2qHO4X78fQvcFMxlH
kR8TiAec+eE1Z53rDfPb1M6Jnv9jZ58z19HTYcgCNAazpG9MMDtpzlCcxMkRIyU7
1XKOOQAXQwDeL2KXaxOgCEfNVB4Bua2CUiaznXfDXIQWumvi/0w3zMWUUMCl+IZy
iQ+Q/raXHZdpbyEfijksuY6LL2YHAelje+9F/3r75ljRkwupakeiMI+Fw2QsOHkQ
uTNYEKpDmeafQaCN8Sc85zbF
=u9Lm
-----END PGP SIGNATURE-----

--wO2QjoPd7aVOvLEn--

