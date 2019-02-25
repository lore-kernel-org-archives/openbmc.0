Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W+pBEqQ0"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="CFArg8Qq"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447dWx2LkHzDqL0
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 10:32:13 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D7AA21B5A;
 Mon, 25 Feb 2019 18:32:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 25 Feb 2019 18:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=LTfEqyJyjo43Pq9nM7Q1Q2BaJr4nZvGaPiVzgve
 Yz2U=; b=W+pBEqQ0VicGtu9ugZCqbG68zu1fqJ6+MAVA9BhbTza0xo6O/hdruVb
 ztgWJxEUbH4W09jxn0MeDLIOxM8qGmdjsR69jdxtRrsZaNstP6Nym0XkfzlEvB1i
 WJsIafj8klTz1bULPv1RF+gyWEEgBe1aDPfZjTsJcS/cTzwYnoKnS/MMq6zl/S0y
 9Y4fTPoGk8DG10iUU0+Od3+vllVUJ+52jwqN2MNSYfrjdYi4s8hHjInSgEyu/iPh
 l7M3RG9p56/XnjtWGqgYmoV7092dXrc6fm9qWIxCm675wz7CiWNspdcP+Lvl0iBx
 /XEqw8LnI6B5AMuLUnNV+ZIBIsfW4kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LTfEqyJyjo43Pq9nM
 7Q1Q2BaJr4nZvGaPiVzgveYz2U=; b=CFArg8Qqu1jpNBcczr5otVjItQT+S8RJB
 b/PzIqUabM3mKqQPDspbPCwCWwUW3B2VQ3gy21pZomx24c1HqWV6372h1ISRBbIF
 Toc4g8XJszOXNOeGRzeWwYfyh7SvrH4Gm/JqFA/bMGjgDjQ5GC0V5Ig5WjgC7zAO
 pNLbKcDOAadyS/Wg/i1KjpZow9ALJhOjFPCIRqEReYPj6ylXwD1d0Nmm1jWRNyO1
 ZPIa+cAdG6cPqUklsj20euurRyZ1y4WzF1wBECU1jBz89rh/r/msNgNoj+o80x52
 t8ZBFIWr3V6j261vvMRgrwN2w6PNg4ksKYGEPPAFCIt9C7Fm58DQQ==
X-ME-Sender: <xms:-Xp0XBAVzFnynTy7905XVyS7Z6Numeo0wWi7Hz2ar6HrZZVT66OB5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudekgddutdculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:-Xp0XB38in4DWKNO3rvbDldJl9OvI1ndSi7M0yqDma_aX_TkeEZtyQ>
 <xmx:-Xp0XLTDPm33XFqU28AzLMmvmyjai1hJRwLNsL65jZYhIWFANf2Scg>
 <xmx:-Xp0XIshquJJTkY5eXQlktlnXaSQCrF26IQxlz6QChGpMyVFAz5btg>
 <xmx:-np0XJo8NcPrakxj6iupX3v0gAWQpUbpDcY2WL09rvRC5zndvGwW8g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8F1897C1A3; Mon, 25 Feb 2019 18:32:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <b3407e65-3823-4e5d-b855-35a115e88d55@www.fastmail.com>
In-Reply-To: <875a36fb-29ef-f456-11cc-bf247a648e61@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
 <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
 <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
 <b4431660-b369-4a09-a432-9f12d6117a00@www.fastmail.com>
 <7b9a51ea-5715-b82c-79d9-6d65d07a3e42@fb.com>
 <0a995630-6ec4-4340-8511-31cd868ee7ef@www.fastmail.com>
 <875a36fb-29ef-f456-11cc-bf247a648e61@fb.com>
Date: Mon, 25 Feb 2019 18:32:09 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <taoren@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
Content-Type: text/plain
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
X-List-Received-Date: Mon, 25 Feb 2019 23:32:14 -0000



On Tue, 26 Feb 2019, at 05:34, Tao Ren wrote:
> Hi Andrew,
> 
> Thank you for looking into the issue.
> 
> On 2/24/19 5:55 PM, Andrew Jeffery wrote:
> > 
> > On Fri, 22 Feb 2019, at 11:25, Tao Ren wrote:
> >> Hi Andrew,
> >>
> >> On 2/19/19 4:15 PM, Andrew Jeffery wrote:
> >>> On Wed, 20 Feb 2019, at 10:43, Tao Ren wrote:
> >>>> Hi Andrew,
> >> Manually editing "ARCH_NR_GPIO" in <platform>.cfg doesn't work because 
> >> ARCH_NR_GPIO symbol is "invisible" and user defined value will be 
> >> ignored by "scripts/kconfig/conf". I compared a few other ways to 
> >> fix/workaround the issue, but IMHO, increasing default ARCH_NR_GPIO for 
> >> ARCH_ASPEED is better than other solutions. Please suggest.
> > 
> > Hrm. That's really unfortunate. Can you patch it in on your platform for the
> > moment? We're going to have to come up with some more long term strategy.
> > Whether that's making the symbol visible or migrating everyone off sysfs
> > (which they should be doing anyway) I'm not sure. If we don't do either of
> > those then I think we're going to have to audit userspace to find what will
> > break.
> 
> Make sense. I will keep the patch in my local tree as of now.

You can still send a patch to meta-facebook that applies your change to the
kernel tree. Don't keep it to yourself :D

> 
> >> BTW, "CONFIG_GCC_PLUGINS=y" in 
> >> meta-aspeed/recipes-kernel/linux/ast2500/defconfig is not included in 
> >> the final .config because its dependency option PLUGIN_HOSTCC is not 
> >> set.
> > 
> > Can you open an issue in https://github.com/openbmc/linux ?
> 
> Sure. Opened issue https://github.com/openbmc/linux/issues/170

Thanks.

> 
> 
> Cheers,
> 
> - Tao
>
