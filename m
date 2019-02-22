Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DDNS0ZUs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gALjIK4T"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445LCk6T6pzDqSD
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 16:55:14 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E6612222E;
 Fri, 22 Feb 2019 00:55:12 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 22 Feb 2019 00:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type:content-transfer-encoding; s=fm2; bh=iAikT9FKYZ6tE
 suT9yT5shpOYYlvvHQVo6pRFixe9bw=; b=DDNS0ZUsIF8Q23X5ha6RZysAOxYpO
 0e3rigeBRyZgWI8hYwOf03MMAr5j26iArOprNFtPDGn9X2+PwIb2mxMVzAaxU7AR
 Y2ph5Tqo4t+N89vEw3A2AEXpPxIJW05+smjT6bGgZaEeqSwbi16conezpQEDGnX+
 aOu4nuI8IuuX4rS6FllSia3jiiGaoj3wJqsQhLsVGlUSmArx9tJ6nIuvKxF87zf3
 kJk77i1DbiAmVYGge1XBTGkxKrzSwm4PFxQ+AlBzEmvkgvf99sDrMsYh/EgPq5Rn
 V9OaMXxQ08KxptHqZRdPWpocVC9js6Whh22zB+dbe6+WJzXVzm5PX84CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iAikT9FKYZ6tEsuT9yT5shpOYYlvvHQVo6pRFixe9bw=; b=gALjIK4T
 Tt5cjitcz7OnohNAddYRsrKhfOtH9N88ReoXo/5juWxue7gSWzXl53crjJSPvGMj
 aBy1N71N2kACYwZ7cyd5VIe8PyfOJYmLsRZ5kxZFNxhSrJwp9gWjtef6MMq+xMXb
 nGSZW8vFsWWM0vd3esASUx01d7Hmz5o2pKjRoKduZsEKrSC8inIxefci7EgyLIBf
 kFPjDk/6PCgejPj19lnB4GazUKlm7cYwB45fauqDk0qUONZbOfaGaoA7gAwykI2H
 jgy/IAwg+cHx7erBY622CV+a0dTk2XJXsIORVci3TyGDqwblLNjaADVR8rF4UM4U
 xJ7JN/Qmkb4mqA==
X-ME-Sender: <xms:v45vXB6Y91FC8svtuMx3Ouybb0pSj2R6gt0RyocO8Bm84wYGKL_dUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdelgdekkeculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:v45vXPVuYKqr_MBIfUNgjA1_NC7Nh26xMgQL_4rMVMyoLI8tw9Pnsg>
 <xmx:v45vXJJYorepR5Ortfw6Pnj8j-ed36bAc70Miu5CSIYPvUw4THmYcg>
 <xmx:v45vXBvJFsZE-bbpqYz0YCRh2udhxk_Pf2h9XrTNpQvUEc2upFdyvg>
 <xmx:wI5vXK1YNtdCBS-YsppT69i46f1JN1DNTMuzKkzZhjRzIIjEj64kkQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 450137C1EB; Fri, 22 Feb 2019 00:55:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <f2602a79-6d08-4154-936d-d23e5641a7ec@www.fastmail.com>
In-Reply-To: <EC804DC2-940C-431E-A358-B803CDE93F5C@cisco.com>
References: <88e05768447d466ca674e12e20c650dc@quantatw.com>
 <96605da0-113a-4d43-994a-f081f30af71e@www.fastmail.com>
 <66dac7974c444060a9b4b1052b00d072@quantatw.com>
 <8b3b8d3a-9cf5-4f7d-9993-e71fd3cd6e07@www.fastmail.com>
 <8f0d3dec56434a0484f6d5172c036ed4@quantatw.com>
 <EC804DC2-940C-431E-A358-B803CDE93F5C@cisco.com>
Date: Fri, 22 Feb 2019 00:55:10 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Will_Liang_=28=E6=A2=81=E6=B0=B8=E9=89=89=29?=
 <Will.Liang@quantatw.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Stefan M Schaeckeler" <sschaeck@cisco.com>
Cc: "dkodihal@in.ibm.com" <dkodihal@in.ibm.com>
Subject: Re: ECC memory of BMC  
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
X-List-Received-Date: Fri, 22 Feb 2019 05:55:18 -0000

On Fri, 22 Feb 2019, at 16:22, Stefan Schaeckeler (sschaeck) wrote:
> Hi Will,
>=20
> =EF=BB=BFOn 2/21/19, 6:00 PM, "Will Liang (=E6=A2=81=E6=B0=B8=E9=89=89=
)" <Will.Liang@quantatw.com> wrote:
>=20
> > > > What we want to do is to record the ECC events to SEL.
> > > >
> > > > we are considering to create new dbus and a service.
> > >=20
> > > Right; I think you need to create a new service that polls the sys=
fs interface for
> > > the EDAC device, and then use phosphor-logging to create error log=
s.=20
> >
> > We consider creating the following objects for D-Bus:
> > -bus name : /xyz/openbmc_project/ECC
> > -object path : /xyz/openbmc_project/ECC/status
> > -interface : xyz.openbmc_project.Memory.MemoryECC
> >
> > and error types for xyz::openbmc_project::Memory::Ecc::Error::ceCoun=
t and "ueCount"
> > and "isLoggingLimitReached" for phosphor-logging error message.
>=20
>=20
> Note, the driver also logs the addresses of the recoverable and un-rec=
overable
> errors. Perhaps you want to expose them, too?
>=20
> The edac framework is unfortunately not exposing them through sysfs. T=
hey get
> printed through "edac_mc_handle_error()" as printk(KERN_WARNING, ...) =
and look
> like
>=20
> root@aspeed-arm:# dmesg | grep EDAC
> [ 1718.900000] EDAC MC0: 1 CE address(es) not available on=20
> mc#0csrow#0channel#0 (csrow:0 channel:0 page:0x0 offset:0x0 grain:0=20=

> syndrome:0x0)
> [ 1718.900000] EDAC MC0: 1 CE on mc#0csrow#0channel#0 (csrow:0=20
> channel:0 page:0x80000 offset:0x0 grain:0 syndrome:0x0)
>=20
>=20
> I'm not sure if there is an elegant way for userspace to retrieve mess=
ages from
> the kernel ring buffer.
>=20

Lets not start scraping dmesg. It's not considered part of the kernel AB=
I.
