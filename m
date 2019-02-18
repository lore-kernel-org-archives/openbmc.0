Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="X72fgQuv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="zszPmMhn"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442sRP4Pz3zDqJs
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 16:11:45 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 231832D3A;
 Mon, 18 Feb 2019 00:11:40 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 18 Feb 2019 00:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type:content-transfer-encoding; s=fm2; bh=x6LHHL/JyUl1r
 cfPNFznlm0Gb9i46mkLNF2+WVqgvgI=; b=X72fgQuvYuRLo/fRKXzgKwcTXwXFw
 mFeKGevX/jNtmAdjHOYhgBL8hCn4QXHf5ZHKJOweKQ5Zvkzd3uGNQNVdS8jU3+Oo
 YZ7t5e+ddOdli/w9UciWuEkN/R6KSK95A8znnqje1ScbWRUyZ4AA7P8Rv1/TXvxU
 Cou/5dGVfREfHSCgIaZe6EkKYT9y8BhOEXfgmPVk6aRL8d498Mp6CRityRGkD2LL
 PZBF0OAY+KgcJvU93sNP1sgxq6ul4dyzgL5OVKH/+sn/fL88qcOgnR21tGNi6tuP
 Lt0OjPuEvTXHuiDMVzwU3mQvQhnav0tXKHt1RyaRPo0Xw1/dnXvuYHpKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=x6LHHL/JyUl1rcfPNFznlm0Gb9i46mkLNF2+WVqgvgI=; b=zszPmMhn
 vCymMoSRr9DJdR8SAwdSRRxKpQYx3MgT93QpINGS8QptEueXML3PS49UvgKVsqv6
 B5j9fO7z6Ltdm0Y/HrCnjROuXFgwkfeoSl2rHb5w/bOsTNSBAVphn1x6j66SGk0a
 DHVr9oxm86I7QUYufQ2AiWwd5vDqyDImak/Ny6YNkz34oA/FNKSRGX0H7zcNCS2k
 MC93WcJDGnu8uLZoV/R+wZ2w2lIYRfu+Fd2gRm+pQaBDNb6O8cAwx9Etuj5w2hBG
 cjCO/ZWp96suChMBig9a+/HsiKRa5Xs6Y5aDVq+6hMqX7MOfBnIikZc4U18mM51p
 0AFMr2lV8ZawBA==
X-ME-Sender: <xms:ij5qXL2-zPchMuB960zqY-hm_CDAPuFV5YUwjoxD36VTmLkgaJpTSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduvddgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefofgfkjghfff
 fhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhih
 fdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
 necuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ij5qXMaowM4fyyg64EedfpHYnls0eKSE8GKfgXP22gdcic5ZY0WCFw>
 <xmx:ij5qXKkdBYd9scUZ48Tm-a21V2-n6knSp_6kiuIZ2DPoq7sXDtPGXw>
 <xmx:ij5qXNyMzHQ8_1ImzCpJemVc6emXcy4v7eIzUEcHVBIOL-eQKD1jFg>
 <xmx:iz5qXOeOroPqlsuTgTkgNjj3GlVQ-UkiNxIvPNx3W-KyppFM6kNGNQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4C75C7C1EB; Mon, 18 Feb 2019 00:11:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
In-Reply-To: <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
Date: Mon, 18 Feb 2019 00:11:23 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Tao Ren" <taoren@fb.com>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
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
X-List-Received-Date: Mon, 18 Feb 2019 05:11:49 -0000

On Mon, 18 Feb 2019, at 15:26, Tao Ren wrote:
> Hi Andrew,
>=20
> =EF=BB=BFOn 2/17/19, 6:48 PM, "Andrew Jeffery" <andrew@aj.id.au> wrote=
:
> > However, there's no reason you can't narrow the change to only apply=

> > to your system (rather than do it in the base defconfig and affect a=
ll
> > systems).
>=20
> Perhaps it's my lack of greater knowledge on kconfig; I actually tried=
=20
> a few options but couldn't find a nice way to apply the change to my=20=

> system only.
>=20
> At first, I tried to customize ARCH_NR_GPIO in my <old.config> file,=20=

> but the value was set to default (or ignored) by running "make=20
> olddefconfig".
>=20
> Then I added "input prompt" for ARCH_NR_GPIO option: customized value=20=

> in <old.config> was applied while running "make olddefconfig", but my=20=

> concern is the approach may impact more users?
>=20
> My third approach is what I proposed in this email thread (setting=20
> default ARCH_NR_GPIO to 1024 for ARCH_ASPEED).
>=20
> I'm looking forward for your suggestions. Thank you again.

As an example, for Tiogapass, you should be able to define `CONFIG_ARCH_=
NR_GPIO =3D 1024` in tiogapass.cfg:

https://github.com/openbmc/meta-facebook/blob/master/meta-tiogapass/reci=
pes-kernel/linux/linux-aspeed/tiogapass.cfg

Andrew
