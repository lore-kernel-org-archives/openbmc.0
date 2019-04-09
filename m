Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="FKrE/Goi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ni0LJw+u"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dTBL2f9fzDqGc
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 10:46:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3753C23622;
 Mon,  8 Apr 2019 20:46:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 08 Apr 2019 20:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=FmGK3
 FLjEWCCZVzVNWncMoohaIV/E9LTRLWwP6wQTVQ=; b=FKrE/GoiKi3CRRil/lJm6
 ZLqxaSL9DiG1wiuxNcy3KL8NzCcUEsc/+LDThbZ3qjH4Mj349OB5vIe/OsLI9pTD
 JsRL2M8jJcVvtlUWRIjIQXx7CR+3Ef29UN48lV0prrdjeSElrfWk+Qr7MO7cFVX3
 b02c4yoRmIrf2uqwAY4c10uNewMKXFThU5y6R9W2AozryQUyQNavCkfzZSOFgZB8
 261t+SAFrjQ47AiQZlAYNhc6BqK/s8NJskAaIr51Ph+0aDlg8mul2aFKfR8VcnRV
 /TYUeOU/oPP1cd9fuBzxgg/Mu9+R4hvtNPWoH1oigdRL06mWrCM0nIiJ7idpwaKf
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=FmGK3FLjEWCCZVzVNWncMoohaIV/E9LTRLWwP6wQT
 VQ=; b=ni0LJw+uPTbadvhcSL1niHpzEUnzhSnrqh4TxeOXb6YHfhBcsDAtuLC2Q
 yhR0BnUrxRNlT4ul//WvWAeYXsS+KekC0DtwOiAWlCyNMIov94TUjR9WmkLoH5m2
 y9LPzU+Fx06BEaTme0i6TmCIVMu+0TeBzh9gOraexdZUVl3fLgL0STy6Wq6HsQy7
 NAZMTS+36kyZKbQdZyopxruLW+fnCk5ySb5XLCEQOuL8iq8to9NlSr5NWzE3qhJh
 psr09qOHvAXIfKxwXQrv3Tsf2pXpY2ZIClUFN82FJL/vKyYaT4FSmI3scI04B1hS
 Uw/OJyM9xHhcePL4Ye2VjCuDmh61w==
X-ME-Sender: <xms:ZOurXMcejMXvAGuLybzakuw2GXn_t_hRO6ja5u4LDNFfHJ05JgoYIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ZOurXEtaUONF0UbJ0qo6cV7zzGYBY_QDBTgyKgeUOcevrvvMJaAV8A>
 <xmx:ZOurXAt1dqCRVmfsFBnzSHOcCA4Hitrwcq_3Zh7TWyhbZd8eUO17uA>
 <xmx:ZOurXL9MHG4SIt7rhcu63Y6El1v-WhsnOcgLutiTo5frm0_TGSXXew>
 <xmx:ZeurXMAf46F8KukF_6KTIuJcPvDT9NNLbJ_tMKNLHtm7ULuxrgFiNg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 51B3E7C1B9; Mon,  8 Apr 2019 20:46:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-329-gf4aae99-fmstable-20190329v1
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <03df9961-3cb8-467b-adab-743544a05963@www.fastmail.com>
In-Reply-To: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
References: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
Date: Mon, 08 Apr 2019 20:46:27 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: QEMU and CI
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
X-List-Received-Date: Tue, 09 Apr 2019 00:46:38 -0000

Hi Jason,

On Tue, 9 Apr 2019, at 04:56, Bills, Jason M wrote:
> Hello,
>=20
> I'm looking into what it might take to get the Intel S2600WF (Wolf Pas=
s)=20
> board running in QEMU and possibly CI.
>=20
> In the OpenBMC docs, it points to a QEMU fork here:=20
> https://github.com/openbmc/qemu.  Is this the right place for me to=20=

> start looking at what is currently implemented for QEMU in OpenBMC?

Yes, with the note that most of the support is already upstream.
openbmc/qemu contains the patches that haven't quite yet made it. If
you're planning to add S2600WF support to QEMU I suggest you send
your patches upstream first (like we do for the kernel), and we can
backport them to our fork once they're accepted.

It's mainly C=C3=A9dric, Joel and myself hacking on it - if you have WIP=
 patches
that you want to run past people before sending upstream then Cc us
and the OpenBMC list for some quick feedback.

Hope that helps!

Andrew

>=20
> Thanks!
> -Jason
>
