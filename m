Return-Path: <openbmc+bounces-1771-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA04D3517C
	for <openbmc@archiver.kernel.org>; Wed,  1 Apr 2026 12:43:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fm4Qz474Tz2yhv;
	Wed, 01 Apr 2026 23:43:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775047403;
	cv=none; b=BCNaZKRBC3JvSS8LGpeFU1Lb4sp3AQcK+jPbeu2EkqI6U9IKonsLX68I4aeNRdy8+YiIpnESS+dVC8EHFC8VJfjHuid2xruDhtVuDSaWwSB1m/fTlooUWFyWywUzGsDArAXpCH+Hr8zhQbhCvXVYPEg+5mIObPNhdIK5feGHy21l0v6mrT5uP/lknVvG/fzk05XqdcZubFi4pa+FfoAysrU7vtR1qadOdtCLm+3TV/DqECSfHI73G6/ZZ5n8yqbgnHp3MEupNmlI5O9nP1BsJfbARugdiPOWsfuZTojgdjrNVyLhHYwLcSNTqqT2I8G18hqcvnqAd939H598Rd2A1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775047403; c=relaxed/relaxed;
	bh=FsQFZyCQoWl1gjKrfVo6M3Ot96uM+Tr29qLVsMaykAQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnPluOkEuDFH89H9hwoiuzM2Rg7CbKxh9oFk2WfB5XmZYVsnhfMWqBinU3WdFIUmoTYq2nebxHaNhmDKPQqcrLN+oGNg58hfW+Dz0/EqallaqewV1IunDLs8U7fFFu6G1Dmcn4+59vh2Kv10T5ytnLbbdBWTOX+Qdue7qb3rJr5sA9jTc+aUTfBtyeLIaTFWPy7MltaSsfAHHQ9+1z6W+wN+e3CdbLoxBa3Y/YrPo6FIgZtngpXkA4nPJYTcIHAv1eaA7fvfynkO9hzRvT3Oik69h3MVbNTUIyOGlK7oCt55Ni3Tyo/pivz0YC5H5dPLtqnxE2DeRAmFCrh5ufyCug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ptj7DMvZ; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Or8MSnc8; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Ptj7DMvZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Or8MSnc8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fm4Qw0Rrpz2xpk
	for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2026 23:43:19 +1100 (AEDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1E8ABEC017A
	for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2026 08:43:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 01 Apr 2026 08:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775047396; x=1775133796; bh=FsQFZyCQoW
	l1gjKrfVo6M3Ot96uM+Tr29qLVsMaykAQ=; b=Ptj7DMvZdTOQ+8HFBzQTAjSyvX
	G+cWLFCYhZrgYcSj63X50xn39Fl2B3xJLdIWRX20R+ymb0IMDfd/imG5PJwVn8os
	TIQmSeAYuUWDAyavACZ3B99Qb8lqVUuHcSF4ENN9PAfWzr624GTYUldnDUeecIR3
	x0yIzyxZ81D69iQ4ziwhpD3Wwpsnv3AQuYXI9Pdoj/U6iylpJyyc2Vb9yZXh0PJO
	FV/6lnF38bCLXz6pB5SROQVsFbUrnvMJCOeVgxmxWtg2TzPnOf/anIjoSxUp2M4D
	dBbCAjr+oKxiWhOpUL1EamCYB5Pyi4k6U5v3++4KLS3k3thKnX7tHfddM+2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775047396; x=1775133796; bh=FsQFZyCQoWl1gjKrfVo6M3Ot96uM+Tr29qL
	VsMaykAQ=; b=Or8MSnc80vwuw8RIvqe3P5m0I/3F6FB6nhyBRqM5XhL49Ea3/5X
	dsD42I49xdV+Us3WqL57kVwyP8zfHuN1+K7TgZ8hiZdWA4UcdbEBcKGaffZJwgAi
	27PSqrEID/qVdOytR8ujxygvXotvbnFY7K3iTkNY7YXFTJk5IhYeWArGef09cv0Y
	CqFS1nrJHUv+9ZNHT+7rKUnJoCdzB8Iy/JjYyF8jnm9P8jdSoE+LD/opnG1odI7q
	hL4r/6xYYHelFISxHa/L8syd0bL927NzwB2H5MxDm9jXSZUQIcorjQfnJmlSdpFE
	W0HIZsT7MrIz04sFVjClfs8MQPVRvVF8FpA==
X-ME-Sender: <xms:4xLNabcfUGccFi07s9F1MJLSZUWLfZU4xI-cZckoVw8TOA_NJ08CuQ>
    <xme:4xLNaYL_747jXSH-UV0lVpGOxQsjnrIkzHLSrImWN-NsisC3rA7Kx4aqX4Yzi1iaF
    LLvFWCF8Ew7Duk4aCjyY1nkMQcCYWTKj_oUeXkkkCpYmEC9vGdk120>
X-ME-Received: <xmr:4xLNaaIBuT_CmuB9Y6Y0kPKe9lhvsdnYNmzQalI25o1OOLNlO11rTee6GlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhluc
    fvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfh
    rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
    drgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfhgeefgfdt
    hefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghp
    thhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslh
    hishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:4xLNaSG_Cr-Sdr0KfCk7rOWOBfmZHl2UPyo3VfjCyaOyy0nVlPoQWA>
    <xmx:4xLNaXn823D9VQFInkm-YCDscY-NMz8mIJ6Z31Kl9DnFUQn-8b6pYw>
    <xmx:4xLNaXIitiF1U60Awk4dzOFRc3tex4JTyC_fy9eNRXEvaGvvymR1vA>
    <xmx:4xLNaQYglqmT2Ge2drCqsSaktfHVvtURqrodkH3KEUKtrd1oO9_FPQ>
    <xmx:5BLNaQd4MIRd9_2PF3b0luOdFXjjrzs7-dN1n9NTHKx4X6JzFkDoy3td>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2026 08:43:15 -0400 (EDT)
Date: Wed, 1 Apr 2026 08:43:14 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Message-ID: <ac0S4q3Wkl96Uftd@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein>
 <absG_8pQilMHGMnO@heinlein>
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
	protocol="application/pgp-signature"; boundary="RibcnOGFIzVRo4ht"
Content-Disposition: inline
In-Reply-To: <absG_8pQilMHGMnO@heinlein>


--RibcnOGFIzVRo4ht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 04:11:43PM -0400, Patrick Williams wrote:

Hello,

> The 7 nominated developers[1] are (alphabetical by Github IDs):
>     * Andrew Jeffery
>     * Brad Bishop
>     * Deepak Kodihalli
>     * Jagpal Gill
>     * Jayanth Othayoth
>     * Alexander Hansen
>     * Patrick Williams

The results of the election are:
    * Patrick Williams
    * Andrew Jeffery
    * Brad Bishop
    * Jagpal Gill

Those members will be added to the TOF effective immediately.

Full results of the election can be obtained by running
`./tally --election 2026H1` in the tof-election repository.

```
Election for Seat 1
Round 1
Votes this round: {'amboar': 12, 'bradbishop': 1, 'dkodihal': 10, 'jagpalgi=
ll': 7, 'ojayanth': 1, 'pointbazaar': 1, 'williamspatrick': 33}
Elected williamspatrick
Election for Seat 2
Round 1
Votes this round: {'amboar': 34, 'bradbishop': 3, 'dkodihal': 10, 'jagpalgi=
ll': 10, 'ojayanth': 1, 'pointbazaar': 7}
Elected amboar
Election for Seat 3
Round 1
Votes this round: {'bradbishop': 16, 'dkodihal': 10, 'jagpalgill': 24, 'oja=
yanth': 5, 'pointbazaar': 10}
Rejected ojayanth from the next round.
Round 2
Votes this round: {'bradbishop': 21, 'dkodihal': 10, 'jagpalgill': 24, 'poi=
ntbazaar': 10}
Rejected pointbazaar from the next round.
Round 3
Votes this round: {'bradbishop': 24, 'dkodihal': 10, 'jagpalgill': 31}
Rejected dkodihal from the next round.
Round 4
Votes this round: {'bradbishop': 34, 'jagpalgill': 31}
Elected bradbishop
Election for Seat 4
Round 1
Votes this round: {'dkodihal': 17, 'jagpalgill': 30, 'ojayanth': 6, 'pointb=
azaar': 12}
Rejected ojayanth from the next round.
Round 2
Votes this round: {'dkodihal': 17, 'jagpalgill': 31, 'pointbazaar': 12}
Elected jagpalgill
Final election: ['williamspatrick', 'amboar', 'bradbishop', 'jagpalgill']
```

--=20
Patrick Williams

--RibcnOGFIzVRo4ht
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnNEuAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZffwP+we0qe7C4gx5FV5aZ1jm
HaDGnT+HDlvV0kEjQsJEaifbBvqEMop1fZJb9kfEGLmwBZU3UoENK+URu806mg/N
gTqmWcLdU3rY50wmrW3AWHPXQKDdPsWis6Iebdu+/lKfNRxT8l33/3ghpFTZuk6/
D4rPpsDzSaL/MTLqL2eQH2ZiWZGcnYQ4J5szq3MhfIKi/+JOg//gSmbTbbivBzzq
/eEmy6sjxIW9sONNv6AAdixx7RuC4i9oFnVjuwyROuwluPH079h2cEoZkb3BJOGB
1XZwU0E8FSUDkiE2BdOI1CHfhei0yQoBydKVkGGpQOOWJBtHBJ4RQfJJyYhe7iSj
jb1bMV5RlGC4NVCPbwm02FK4usnZwwowo1vfPmCpO9Ib7LjY5uVSdwpsxw1JuCzV
bzdjJkuHAOEstOedHfWyjPB4YtRRIheGHfh00+RNT/qomZyj3Y4lCq2/8EHdTTcM
m1I31i8O6FHn4MSLesE2DisUnsSLndiu00BEXlRNJyBdOMkr4jR1EeUlxKk1CK6M
GUrWLnQ8hCu5NIxLDxd+xjUCtc/nU/a2lBeB5vUXkKbI3Ia1M/2DJOb19MCh3uMh
Pp/g55jIzADkCYdCOrUZTOG3Wr3nky0cjJUzb/pcJ8ua+2Crvc5/ytq5mRih0Dmf
ErlPS7D5wr4xofpgbbNs9ihG
=2nUC
-----END PGP SIGNATURE-----

--RibcnOGFIzVRo4ht--

