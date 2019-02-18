Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OTOe4M3Z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="7hA4IVvf"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442pFP5dr9zDqLc
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 13:47:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 698582108A;
 Sun, 17 Feb 2019 21:47:51 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 17 Feb 2019 21:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:date:in-reply-to:subject:references; s=fm2; bh=Utx
 MKFVbf3SjMcRWWEk0ZLi79OXYKU9TJwMWVMOujH8=; b=OTOe4M3Z0T8jJSY+inH
 yaYF3rfcH/HbJFJ5g2QOypXVzBmNJXTJrOQHZQDMdpQpAH+7EwQZUpb2i43xEhTr
 fWUMApvU2LXVBf8WtBWblMsfeOWicQhkH77TR1DI6/40IRPM6BgaqfmnBcdPava7
 thMnlQTyGUKuRn+pr4TvJd3JUyUBd6yhRUGuQZWf2sBWc4nCRaf04+wcIhmGC4qG
 DHdN+/Cgtf4066wGRw0f144vocOs1IhO8fPsy0UfgLXUk/LfZumG7UKkL+FsbKew
 TQpdDqNvNNwHUAsKJrGAiaFWDNmnlHBxe7vSBrPGu0eTk4qguVdH5yr2b6ANYGlS
 ctg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UtxMKFVbf3SjMcRWWEk0ZLi79OXYKU9TJwMWVMOuj
 H8=; b=7hA4IVvfdOWY0aG1DvwFUSg+HpZa4cu/7h5xF89a1LpcpgSRc4GYhPY9E
 NgTdJcndItWjfwrWGx7lMrzmhXrnEc06zJDsRBBVIfSx1QwH+spz/QKPIr8GbJ7/
 pYukjAPnQABkpb9KNIo/sa+YdCSPQjE/sAfJ0QydMs2FtNq7v4KhqpkR7enblBYh
 uj4pG+aim8Wg/tmrLqBAVM5VtwtI5UoP3b6dgJQY5UIotIjBgf+enx2HcumEXDv0
 E4IA1PYkQfbMKCn9c1ndXBE7O6UD8JSbLAtadpy0X4TL1suO5KmeV3s7Hwx6wtUP
 idVcd6WEmg4jPF96KwfBvw+XYSvCA==
X-ME-Sender: <xms:1hxqXM5_SMv6bI8lsuhJmYS3oe3Sr7oENG80uf_LpIqFwin5NX5yAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduvddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 foffgjufhfsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:1hxqXP4FBib0Psg-MvtZclP1Qd0QvomCXb6AaR-m1i96a_1FKN1hyw>
 <xmx:1hxqXPx1VRY3bYJ5eLJiFIlCjrccJ1dL8a0wBIwsO5oJ6gg5Xt4NxA>
 <xmx:1hxqXJXAl7gqnVip43P3EicE0tFeP5u7of_r-dvYOgWQNIx-TMvz3g>
 <xmx:1xxqXAIuPVD7LQa52hKvtnOpY0x2r9lIfiqOnadnjdseQLxknEua9g>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id A1894941EB; Sun, 17 Feb 2019 21:47:50 -0500 (EST)
Message-Id: <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Date: Mon, 18 Feb 2019 13:17:50 +1030
In-Reply-To: <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
Subject: Re: Increase ARCH_NR_GPIO for ARCH_ASPEED?
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
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
X-List-Received-Date: Mon, 18 Feb 2019 02:47:54 -0000



On Fri, 15 Feb 2019, at 12:31, Tao Ren wrote:
> On 2/14/19 5:42 PM, Andrew Jeffery wrote:
> > I don't know that there's much other choice, but beware that changing
> > the value will impact userspace if you're using the sysfs interface (which
> > you  ideally you shouldn't be, as it's deprecated), as the base addresses
> > of the gpiochips will change.
> > 
> > Andrew
> 
> Thank you Andrew for the comments. Hopefully nobody in the community 
> will be impacted by the patch; if unfortunately some apps are broken 
> (due to the dependency on sysfs-gpio), I'm happy to help with the fix.

It's not necessarily an easy thing to fix if userspace is relying on fixed
numbering (which isn't ideal, but it may). You can't fix netbooting a
new kernel containing the change with an old userspace that isn't
aware of it.

However, there's no reason you can't narrow the change to only apply
to your system (rather than do it in the base defconfig and affect all
systems).

Andrew

> 
> Thanks,
> 
> - Tao
