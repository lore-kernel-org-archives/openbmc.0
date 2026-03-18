Return-Path: <openbmc+bounces-1610-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF2B1077610
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 20:18:25 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbgBM5CNtz2ynT;
	Thu, 19 Mar 2026 07:18:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773865099;
	cv=none; b=WOpr+6rbWlM1MB5wBzBv35ggxPzk9niDiGw17V0OS/K8nqjDNF5Tr2uda2f/hRkxi6KAzzm1/9Q93SUxV9bSZYX66ehHAM8pDC58TW1Zm6ERme9YRmlc+vL/acehyxDKmbUgpeHgEZZ3FoK7p2KmrdW8uniMhZ3XnOhZ3akaSzICKQRATEKX3v1iSfAThW2SFIQNJP8cS9Fel/cDRpcyPO5YmSeplXAgN818ws0FMrnDYQYU3CUEWzUOZpAlQlQ4Xab98bc6fxw7JJ5AsTMv+E7x9KYrTp9TjepZ3SxH7e0IUvHlWUNdl7n+s+SUht0LjAWtbBOiM4zza+YG1R1T0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773865099; c=relaxed/relaxed;
	bh=k64el+qQAWL27CX2Jjqad4PDW12YWCijh0TENy91zCs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GndlCU8ZhOyybya2z9AX/ttsd2ftANxsa5ML6yt7fig8kB4/6QdKD2KoYMu7MDgD9FQMtaaByhC6U6g5QysA8+GCbK8BokLABjr7hacqHa1+NNHM8T6DKHPlzov9JN3/PH7NhE/+gkcTSu54sDPuoUeTh/Rgm7FbmOopeOxTe85p/Uhz9CbcHg3YVga81JDdVMpbxMQMeNSW8JYlfzr10iPsC3TNpWdTXK871lFVU/yII7Q7cBbLHQdDavR9Pe6+1aN8Cu6fzxF80eUYzKnVNCYxJxMIPw1DZ7sUy/xKT2zM6PlVrlO1s9sZaoO7EOyB1/GefKQAr80WsZBkpk4aMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=RkUtk6i1; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XxMUIHlT; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=RkUtk6i1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XxMUIHlT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 387 seconds by postgrey-1.37 at boromir; Thu, 19 Mar 2026 07:18:16 AEDT
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbgBJ4rBPz2xYk
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 07:18:16 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E0FE7A00D4
	for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 16:11:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 18 Mar 2026 16:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1773864704; x=1773951104; bh=k64el+qQAW
	L27CX2Jjqad4PDW12YWCijh0TENy91zCs=; b=RkUtk6i1OrpK5Nqds5g/aforO+
	6+Nq28Z0RDGi1/e4KyCdvEBDx8/BBTniJblr8VnJZdcgm3jFynVpVNENc7ZX7HI/
	FYhlAljuMLMmEiVI16SK+LQBEyUMKQSGtUCzMBrANlktFDSRhDt+0Wfu3ydFwGag
	9T3Dxw1S3KP0K+yMpFMFLqUkDOPhmc3xDt/fyTAKbYnra/BEQkb6hYelMehne+yK
	7Ie6mAsAXWNkDw4AGrh/D2KpjUYl+5e7g+v909VQe1dnN1Ie1OENDtl5Q8MXraYU
	BGmanCX0asqhuQOzTaBVKwETv4wmR5/6uV8srwxmcKCmO2ewipuUIc/2cerg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773864704; x=1773951104; bh=k64el+qQAWL27CX2Jjqad4PDW12YWCijh0T
	ENy91zCs=; b=XxMUIHlTAxK/vuleonuAI9QRXaNklgXmoEdx1FnWlrBvV8DS7h3
	Wd7Hg4mILpzmNXG6RwMbEN0agZU2XrvaKcybYqwOIYzAv5puENzz00sjjxrhjnnQ
	Uw3oSrj2cMeMJyoahLyw/thS6bfCGF29MdsEo8hcVGk1vgVcCqb/69m6dk6nBxiO
	EVuvmnTK8mSH8uChT3de6MSzrFVk9d96wFu/oxexsH7oh4Q1tH3+7rUYNBHz3sXJ
	TzSEWTvZh/YFBunDttorKkuJ1Fi6ChcPM+7LXRnF3baiIdfq3zmi0/Tt58QPid+N
	bgP+bcwacug7M1LyK01t2GZHwNaqEBi5Qig==
X-ME-Sender: <xms:AAe7acsj1ROjugap0krlkor5bVp0_GlpBt8F3oOoM2M1AMPS2BdpLw>
    <xme:AAe7aQa0rJ9Zu2oYnufF9cRIpa3sYqjkKOeoX88rZ9oYDG96cvI7HWvHS68zom0AK
    Tdzw4MLLhpXU-TgW0I7NhZQURJgjqlMPg8ZucNKMKm2pLZRItI6HA0>
X-ME-Received: <xmr:AAe7adZ18MvDsMFHhbzDzXNn6NO55Y7UdCoUdFvzhtBiBJ-pJLpVOttY50Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdehtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehueeltdejvdegtdetlefgveeigfev
    feejudfgueeghfdvveeljefghfduteevnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    dpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgupdifihhkihhpvgguihgr
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsg
    hsrdhorhhg
X-ME-Proxy: <xmx:AAe7aUXx_XyWMuHcYfvZgUqQrYe6Zt1Atl-0gtjTrZdwpdpS7L2QBQ>
    <xmx:AAe7ac2tpEG1F_yD5mQyhHAbYxVae1U-O9VC3xyEkjhLcuAqrNcD4A>
    <xmx:AAe7aTYb66epVO8rYmAmiz89K1BYt7hSDpKyaxSKnqVYQW2m6LKYhA>
    <xmx:AAe7aXojVLJLzVLGacKMgFr8R5YQ5S5B4via0UanAfUjhP0gY6G8EA>
    <xmx:AAe7aWsJP8ivPuJlLFqHvOvkoK3F8X7GXAAH7XK6t4ofpXlyiL3YlVUv>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2026 16:11:44 -0400 (EDT)
Date: Wed, 18 Mar 2026 16:11:43 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Message-ID: <absG_8pQilMHGMnO@heinlein>
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
	protocol="application/pgp-signature"; boundary="hLANepoibmdWEjjz"
Content-Disposition: inline
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>


--hLANepoibmdWEjjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

For the TOF elections for this half, we had 7 qualified individuals
nominated and there are 4 seats expiring.  Therefore, we are going to
have to hold an election for the half.=20

The 7 nominated developers[1] are (alphabetical by Github IDs):
    * Andrew Jeffery
    * Brad Bishop
    * Deepak Kodihalli
    * Jagpal Gill
    * Jayanth Othayoth
    * Alexander Hansen
    * Patrick Williams

A few key points about the election:
    - Voting is by Ranked Choice Voting.  The order you give as your
      preference matters [2,3].

    - TOF members represent the development community and not their
      companies.

    - Since there are 4 seats up for election, you may submit a vote
      with up to 4 candidates.

With this being the most nominated-for election in TOF history, I would
strongly encourage candidates to reply to this email with a [brief]
campaign: who are you, what work have you done for the community, why do
you want to be on the TOF, etc.

Votes will be accepted until April 1st, 2026 at 12:00 GMT from qualified
votes[4].

As with the last election, we have a tool to facilitate voting[5].  You are
expected to fork the Github repository, run the tool, commit the
resulting JSON file, and create a Pull-Request to submit your vote.

If you have the `gh` tool this would be as follows:
```
gh repo fork --clone openbmc/tof-election
cd tof-election
=2E/vote --user <github-id>
# make your selections with 'vote N', 'save', 'quit'
git add 2026H1/votes/<github-id>.json
git commit -s -m "2026H1: <github-id>: add vote"
git push origin
gh pr create
```

[1]: https://github.com/openbmc/tof-election/blob/main/2026H1/candidates.js=
on
[2]: https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md#terms-and-elections
[3]: https://en.wikipedia.org/wiki/Instant-runoff_voting
[4]: https://github.com/openbmc/tof-election/blob/main/2026H1/rollcall.json
[5]: https://github.com/openbmc/tof-election

--=20
Patrick Williams

--hLANepoibmdWEjjz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmm7Bv0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZuXYP/AhtP6/Zm/BY2Qed+Liw
xTtuOE86r/iPWgXaysisYPmeL+Lt+D5J2ZqGW+g/YZj+6hG7nG7Eeqcy2dg/4Yj1
JZiX+JXKCbL5nLUrDub9pKM9D+tX3WfuOBXP9fF0cK+cJkCYp6S92hodLa3PA0uy
BiPRB14bfVCCiN1E23kyAomeDdDisVXI1VU6N6pa3Dz/DClJOPlIilTt2UQUuWhA
3PGmZeelyuPooM1X/FJ9bDmURjRR2+ZvScdOoHtb10eTpYOJF+dA3Fey8uR7bWuF
MYFJ4sMiW7ag519lzkP7sTsnc9OxbtTJBx3rca5kkuvHsHStaFEu/1LYPjZpsr/F
VEsFmAtvcyC/YC4XB/gYpopED58WP8X+hVmdmbceiefiiGt5xviRMyxkEUQDkLXA
xvpKQDOipExAKOjGtBb/9+IRgzvshobU9G09mSr1znOI11vc5YpOlyGBCUk3/Gfe
F9rTwe0LaDiZ+g9RqsvXVi2+4Aco7RTcYMfaOfILVTl+hIudAKUPYYUcLMttN9vf
iAlSGrC3q7lA//1RFg33/A7lUOjgLsGWRaq2fHd57GaVxw0nhEYxTN/OimcQzVGE
OBc4gE/w6AKCxD3j/RmFJ9we/rqoWnJQvBv9ocI6v9HVeNFW1vjiRyHdyYQGc6/6
UqbO3m+F3uAoCJ9bh0mY3QMH
=dMxq
-----END PGP SIGNATURE-----

--hLANepoibmdWEjjz--

