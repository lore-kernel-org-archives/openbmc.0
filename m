Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XtUzGVdK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cWIZZFQp"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448HYS6NnGzDqGb
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 12:05:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 12FBA21E44;
 Tue, 26 Feb 2019 20:05:46 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 26 Feb 2019 20:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type:content-transfer-encoding; s=fm2; bh=fQa6dsp9LzPiu
 lLHcU4h4IVR3l3NQZdgoJrpRfwf0vM=; b=XtUzGVdKF3GUM0XOU1uqT+f1OEBBu
 oMzGBeNJodMzdKvpVUDX2mnqqjDMZ3wrUbBl9Xsb1rdrjPRpmN5uPoEprvcb48zw
 uGE1vViw+fKAXwNs4Vp8Jq82cNp0zzTBSkOj52L/Z6DTcwv7adAkfvD2h4sSD+e3
 piiiz7A6Nc500kCFVRfiDL9yz0lESh0GGUCsrDR6qmL6Ct/gRRLVjE+ZrW86qMvG
 dQhnco+7xiC4SAY4mNy/2ynDPJq6gkJw3Cwp5Qg3s3CdeLUzoou8ulufU8DCB64F
 oQ0OmBsWintBWRJySYmSsbYI7lG2IuFkTCBsJ7o/BWDphB+RkNYk43eMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fQa6dsp9LzPiulLHcU4h4IVR3l3NQZdgoJrpRfwf0vM=; b=cWIZZFQp
 Lka9s+c5eV/59FrxhP7fxAq/PGOo5WIDxUVoSVGFm++9hffLhNBFalph+eCp7bAd
 mAmrRq3HVcM8ZW8kNYAhA6q65j9Qlds8DCIn0Tc06X7BtrKGkj/EsoqQ0Fv/quCH
 gU61fNVPJ/KcfGMZaqFPJ2JOKcv/4NEdtqD8KqjtKrUM4pS+EMOQusxa3m1UG9VA
 gq6blGDdgedJl8rpxnAKs8A/Oyq1lyYRgh94T7Zo9qYGJBfOlO3ItTs96XtgC0OR
 rOLjRwrrfhdyW/v0ddvBqjiXKTyMIe2zr//LLTmMe11qhHWsqQ/iQDTjElNXiSLQ
 647smN8cNV8eNA==
X-ME-Sender: <xms:aeJ1XNA9UQxfVxS6zYpN5Xtt8suqJ9ucXtoyezFEHXfUfsqLyExltw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvddtgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:aeJ1XA_HeGhaA5iL5CUMQBOJlsbog29JbSZTdm9d3AiwD3NkYypM1A>
 <xmx:aeJ1XNVaH1UgO2cqcdmkzskzi_poumQg8POoH2OA1DxTG1BpnjF-7w>
 <xmx:aeJ1XItzxCD6VlsOi0IP-dirTnqm6pwHIuLOp-enkodh31Pxd8BYOg>
 <xmx:auJ1XNvUgdryRYcQjlt-ukT25CL2ej6w5bm6JvCuVq-qdOh2aKV3JQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B2CB57C1EB; Tue, 26 Feb 2019 20:05:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <82094808-a679-45b6-88ae-cf46b32fba87@www.fastmail.com>
In-Reply-To: <VI1PR0502MB3869BAA419AF15A98BAB340DDD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <VI1PR0502MB38692DFF848268A3BB778560DD7A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <60aeb06f-9885-4b17-bbfc-4071bce56276@www.fastmail.com>
 <VI1PR0502MB3869BAA419AF15A98BAB340DDD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Date: Tue, 26 Feb 2019 20:05:45 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "David Thompson" <dthompson@mellanox.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: Patches for U-Boot v2016.07-aspeed-openbmc?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 27 Feb 2019 01:05:49 -0000



On Wed, 27 Feb 2019, at 10:04, David Thompson wrote:
> Correct, for my BMC project I have made changes to OpenBMC's U-Boot=20=

> image (v2016.07-aspeed-openbmc branch).
>=20
> My goal is to "upstream" these changes to OpenBMC so that
> I don't need to carry them around in my private repo.
>=20
> I had already sent in one patch for review, addressed to Joel.
> I will add you Andrew to that same email, since I did not know Joel wa=
s=20
> on leave.

Great, I'll take a look when I get a chance.

>=20
> Thank you,
> - Dave
>=20
>=20
> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>=20
> Sent: Monday, February 25, 2019 6:30 PM
> To: David Thompson <dthompson@mellanox.com>; OpenBMC Maillist=20
> <openbmc@lists.ozlabs.org>; Joel Stanley <joel@jms.id.au>
> Subject: Re: Patches for U-Boot v2016.07-aspeed-openbmc?
>=20
>=20
>=20
> On Tue, 26 Feb 2019, at 04:59, David Thompson wrote:
> > =20
> > The latest OpenBMC 2.6 is based on U-Boot v2016.07-aspeed-openbmc.
> >=20
> >=20
> > I have a few patches I=E2=80=99m considering upstreaming,
>=20
> "Upstream" in this case being OpenBMC, or to the actual u-boot project=
?
>=20
> > one of which is a new
> >=20
> > U-Boot machine/board. Should I send in patches based off this older,=

> >=20
> > but currently used, U-Boot branch?
>=20
> If you're planning to send to the u-boot project you certainly can't=20=

> base it on OpenBMC's fork :)
>=20
> > Or, should I just be sending in
> >=20
> > patches based on latest upstream U-Boot, with the intent that
> >=20
> > eventually OpenBMC will be picking up a newer version of U-Boot?
>=20
> Our u-boot is in a pretty bad state at the moment, and no-one really=20=

> seems to have the time to improve it. Several factors make it a bit of=
=20
> a pain:
>=20
> * Aspeed's chip team produces a monolithic platform.S file to=20
> initialise hardware and work around chip bugs where they can
> * platform.S includes DRAM initialisation
> * upstream u-boot includes a C implementation of DRAM initialisation=20=

> that is almost but not quite entirely unlike the strategy used in=20
> platform.S
>=20
> An easy way forward would be to dump platform.S for each generation=20=

> into upstream, but the suspicion is we'd need a pretty damn convincing=
=20
> argument for it and for the removal of the C-based DRAM initialisation=
.=20
> Converting it all to C doesn't really seem feasible either, as we'd=20=

> need to analyse all the assembly for each release of the SDK and port=20=

> the new fixes on each release.
> That's a pretty tedious task. Maybe some middle ground can be found=20=

> though?
>=20
> I do know that Joel is keen to turn the situation around andmay have=20=

> some feedback when he comes back from leave.
>=20
> In the mean time I guess you can send the patches here? At least that=20=

> way you won't be carrying them in the yocto tree.
>=20
> Andrew
>=20
> >=20
> >=20
> > Thanks in advance,
> >=20
> >  * Dave
> >=20
> >=20
> > David Thompson
> >=20
> > Sr. Staff Engineer, System SW
> >=20
> > Mellanox Technologies
> >=20
> > 1900 West Park Drive, Suite 290
> >=20
> > Westborough MA USA 01581
> >=20
> > Direct: +1 508-475-6375
> >=20
> >=20
> >
>
