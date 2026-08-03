Return-Path: <openbmc+bounces-2355-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1426C55179
	for <openbmc@archiver.kernel.org>; Mon,  3 Aug 2026 15:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hDKdJ3ZYvz3bqV;
	Tue, 04 Aug 2026 01:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1785769300;
	cv=none; b=jqBVtuYwPiBmj0ZnhtlIUEenfT1PJG4/2AxV6cIjafUBJ+U1l7GZxz+3IbwaWIYorvDt1MuPEvXOoFcbWAMGGjpoS3Egc2hKN00A4yoWP5ulsQ/+eUflYI4mK3e52eQZ7OO6jsOB2M9FD9L46+igC+Y08F8wzLFPe3YmKK4Aq1WQ3pxqNjB2+6OP/r2cqlOUU56034YxWIVOgkNHkWv/hUNukK1Sr5vAbB6n5rebU1+XUErFvvk/u/IwPWbOmgO9BSV/BYW1C8ClRKCuK6L7BJhheLQP0UficW4eC0PUZ04thOMCnjzcQ9rc7RQ/6GslOwGK1l7p19AKP6/rWEk85g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1785769300; c=relaxed/relaxed;
	bh=jQ3lgBiXKP+md7al46gfKhm+cPI4A3fPUVOoqUSoX7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb8bwxU+7gc+fWXplA/PPER2QB7GDELEu/0SpFcMtQu1ChlWBqOeZcFX6qz7yjfdJtGOfASit0BIREn9VdCvRs3k5abGRiTIztgPkWkVtq4IRZBM545myyh+D2+hgm/t0vt5GPh+1EJpSgCZP/sY02j3woUAhSQVdem/L4k8jSa9MyNs3ReLgxiXcbES4BhimFxXb0nuSx4Magw/3Tz+JZgp5zH5LPo+VUQ8ibrmjRqkLIyaQcunCvi+R/MTz+bgujIz9XKphpv3R7h1WufPHEjfH5fC9eJMfmbCgu5JJBUJ9ayjyH+TrKWD+JrlYR/12ybBxCS5gbzYkpXEb/kK0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=MEs5t5Kn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IVkMA/eS; dkim-atps=neutral; spf=pass (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=MEs5t5Kn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IVkMA/eS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hDKdF6JpHz3bps
	for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2026 01:01:37 +1000 (AEST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 824B214000FD;
	Mon,  3 Aug 2026 11:01:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 03 Aug 2026 11:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785769293; x=1785855693; bh=jQ3lgBiXKP
	+md7al46gfKhm+cPI4A3fPUVOoqUSoX7U=; b=MEs5t5KnEX0cs7V2vALxVxwwcH
	CokIewZ80jEHXYs5DggwrUtj+K84f7uYUhhD6FmbWfB8glk3BiVux2OcOEPJfFPL
	rIlgSoFIhwsNs97sfq1Cc+aIhSxt71E0AhpSkzppAI+AKiv+DLUaFyvaMqjzxZ/0
	JXdgGF7WbzAt5XA2YxhvCcJW+TFU5n9V218qTpVLtR0Sl4yYKADq46vISytXJr09
	XuoObGL8/zKjE5LDjFLCxoIXWROtec7LNk+UvIG8KMshCGVg+y6VoDgUwHuDuytw
	JilvvNp5ZS9GVuuHWnxA+DtYVtLdmUy+9cRESpCEh3MDyoSG9kUI+7160EIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785769293; x=1785855693; bh=jQ3lgBiXKP+md7al46gfKhm+cPI4A3fPUVO
	oqUSoX7U=; b=IVkMA/eS3d98rEfOPnd4PFXGKlZhgDCTosye9kYHQRy4flb65tr
	YbYOXkKMdiK2tg3vfkQXdH/VOBGsSJXNhd4LLhTMCMtGTp9RlIpgsbHpJuNqTzmg
	3kfCVzFjBs/RzSFDVeKwJaNJa5bikM/puCcssXwqYjWcbjRmoihQtfuZHQM+idv4
	duPDg1mzJcJqoaLUZ6uynCSeJUP8X5YF4otU3QoO5cPcjSvI/2LiLgJ/8uVpQtA6
	yXxT4iel62kKhg/OEet5w2n9r891lZi1q0AeOqRvgYPJnnGPVdmSC1lqe6y7OwbI
	QHTwDUjj7xU1ExsuxTT4hMJJ+nKs11rlrXg==
X-ME-Sender: <xms:Ta1watqGMwG0FCqlxDapUKGmwOrDmtqXr609hejRlVb4hqKydDZnGw>
    <xme:Ta1walrmowPUDF2QKdKVjGe2X_bIdRvIqN11rNNySLvsK-1Z4b_GnKJN8DW48HMur
    gi_XC8T_lx_Jc90BIY5o6h_kPhQh6ZipUdB0qglHpmLNWFJ1Kze0nY>
X-ME-Received: <xmr:Ta1wan3m_mi-JtXK7A0kxxro56tM1lL9dmN4asiwNEB3dRmTRR2t3sYDqkc>
X-ME-Proxy-Cause: dmFkZTE/kQ3lZB4eOYhah+98GsVFqYFhtmxPm79xnwEun+WRvhOayXjSE4PjQOwjuLczMv
    ZY4vzMFWrmYRqu81vQ/62Kca1ruiyy+nedlSLZHjdghOE8vCAuoEjN5oj6BAJoq4BF73Il
    dU8jH2exwrEmctcLcjZYw/3yAVGT2dAlJrepEZyX8qaAiDS0Hp+MK/t9ANm6K/SofR2yU/
    ndb17tp0GDqyGJupyI3VnhqLoddf22SGrKiWKhUEZnUu/acDEVKsaih5sRcgmeVXwCDL0M
    EgBgZYlwOegZNrHLVK88er9L++LRY3dZ4mOJTC8OsTz1n5Ftpodz3NPCrifxWmKw3XMBbk
    ftwI/1HUS6e16k0vSnu/vneGgNfEJUWxtJZZwwY151vQ43/m907dB56ZDSER3/TmCtLV4J
    h4HnJ9DL7FjYPt9em0baIcHvWleBJhdaJorPGa9J/egkLahUDI9O1aNykgNX6R+A9ZblRA
    UQLhnb5AFRZ6/ypoOVPU1a0AVSlSDhQxuvqQqjidL3u1CxZH39YAT4Rg61GCGILy7YHhzc
    2xIwT5qS9/q6q3Bisvj9P/F72rUnAKxbVe35tTl33gJM4x7SzGQAENJc+sHg3uQtkqwEYI
    QtXf5FSlXUpiwWizKtIkFgTI3kQX3lAUtkaKAzseW97IejieB3mXi99TQyKw
X-ME-Proxy: <xmx:Ta1wakC6ssCbPAfRPUO9xpGxHFZR3oVJIF_LpKzCiVsmBaI5bEdXsA>
    <xmx:Ta1wavdKNbxJ_4GfcqumZOSND81Z7pFzBanaaNtcUYqy6qTVqQN2hw>
    <xmx:Ta1wapjAVu89-ZB641MYMhUGRuqcfpSJjD7a0bIV6UxV9p9ZCYQaQg>
    <xmx:Ta1wanpDrRAmIj1J3oJMlheFyvUIktO_VN2LL4ci4b0gCbnuX6v6WA>
    <xmx:Ta1waqxSVKK532pk4MFHIhugw_g02RwR6WI7sIqkvNUrJYSGKfGfvCxB>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 11:01:33 -0400 (EDT)
Date: Mon, 3 Aug 2026 11:01:32 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Zhang Yingjie <zhangyj2007@outlook.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Update BMC version fail-20260620
Message-ID: <anCtSk3f9q3-ilNj@heinlein>
References: <OS3PR01MB100080DB03D4F9074A91726E4B0E12@OS3PR01MB10008.jpnprd01.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="A6mnYql3hDAPU3xa"
Content-Disposition: inline
In-Reply-To: <OS3PR01MB100080DB03D4F9074A91726E4B0E12@OS3PR01MB10008.jpnprd01.prod.outlook.com>

--A6mnYql3hDAPU3xa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2026 at 10:16:13AM +0000, Zhang Yingjie wrote:
> Hi=EF=BC=8CAll=EF=BC=9A
>=20
>         I user Amd Server,bmt update this device bmc verion fail at BMC w=
eb,the old version is V6.40.3, want to update new version is V8.06.1.

Since no one else has responded in the last few weeks, please be aware
that the public mailing list is not used for debugging downstream forks.
We cannot help you debug an AMD BMC version.


--=20
Patrick Williams

--A6mnYql3hDAPU3xa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmpwrUobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEKsDR8wtAMEZmC4P/31PvhGTP3mjZ1iY+KZA
qY/WMrtJbZMcbs+6UYzhAhbQDCyVxBNprBptRNIkQ8foioReRT/nXp3a0ziKthNs
12V2SPHklOavJ+HB5vaH36owilCtXA47QvH2x4dibVRgE/rzOspHp6oIbUFX/dlJ
maBEtpAIG6qkjeLlb/wNqmKhBVyGPT8/+mnZkRJqiqxlPm8YAuefzmAjaWtPiuoN
HoahXhZLEBxe2JLHVzINjIaK9QtOF582o57Tun67pyAEoVt7ULsbDg3WYHyIvTJH
WV/CyfIa8CIySv2aIAgfUuw7XaE2y9HDG4ssFz9eMHCnGvtge/wXsT+hEfJF2/n1
231ZzhHjZtgQdDbfAJFqTiqL7z9aE2B2TYcamH3dhlf1sp3GfOBIqQJ0JWvcfUHN
4P6LBgy/Tb0mHMCE0sOJAl2IDkYs0Mi2gV3f8hZiYRzk15s+RFlbsMqcHzmgyLD6
u2RmR6X2WYwYq5m1ZAp3gbF6bptjhbw2PoGeRX4k16UXAGsARq15/K5l8scoR877
1oLalPWkF3f0qWVUS7vbju/o/MOjGN0bTG/aGhB92dwPutfk6S0p4zNv407STwlg
U29Q7OXzYwslqD2w7B2CvaqZ6ueAFE6pXUQgDY4QY4TqcaPjIb6HSgp40c6g/CV0
k60R4cWRDKC3Q4nKkrBvHHAp
=Slxp
-----END PGP SIGNATURE-----

--A6mnYql3hDAPU3xa--

