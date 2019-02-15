Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RktMJOfS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1q2Y6zxX"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440wxb6kBJzDqVS
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 12:42:43 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 255B22226C;
 Thu, 14 Feb 2019 20:42:40 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 14 Feb 2019 20:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:subject:references; s=fm2; bh=ru7
 GFZUhYtzc37V3n4NguYitda4sDJfEWtYqndMBaaY=; b=RktMJOfSWckOc7p4k5C
 sfCCTd1x1nKfTt4+lXjamS5JV3m2+ZC1h0BdjmW2whHHQUNThvyjfluvd9zMeb9a
 nbr26PiG1e04qgs2Au8LRCUP1xK1UnfHH1W6445Z3MyO6AWPBoEkfQkQpCso7oel
 v/r8+xuReexiqoraXKVsIB83ofmkkbLxRvrJHiy5p4mwTRg9qtxB7avX7Uvl5ZnJ
 PV3YMlf+482TO/w2McUKuYrTCCstLVS4mOhheF1wDuzM2wl38Bb070TvMShNACIG
 UKnWzV0DYKsLgKdn/ioacWGV4R7faFzrsgl4xinRvlItdfu6/WFEnpbcY+S1B1KZ
 xFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ru7GFZUhYtzc37V3n4NguYitda4sDJfEWtYqndMBa
 aY=; b=1q2Y6zxX5U7fy+MZUk4Pc+kwZjUshQQsMbCYK5DC0sJ0eOaKI/TnXU7IV
 QOU0GJ4dJK6DqVb6t5Z8+Ol94xESEO/J+kW6oqhQglK1KWkIRNNngA7e/sjL+TLJ
 OwgcycsdwKkBIKQPq1wmsB+lP15dFBWqmWaiUV9tz4/qlhFyLp1RjTTrZuVaaHOm
 9hpyZqoGh3Ycmz2gE52PnKZDJML1d4TtnqlpaRN6DI1Z9HbNpqgQyWwaJj24rORY
 JmhKjP8T8Eg950hIMggTvvHEmStsnqOcOSSZfMfJ+jVs6hEQEF7Mm3SvJZRPPg5y
 ypRSM8oG9znvx6QVltokP9wJGu/GQ==
X-ME-Sender: <xms:DxlmXEmKhS_vJlXHiyDmTi6HuV_E5O-JjpPCNMn3ra3qOF8bVODFEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtiedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 fojgffufhfsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DxlmXOh8Et6sIVG_5fdVnQ9S7sbmmyC43_G1ml7HUcLFKQZuG151iQ>
 <xmx:DxlmXLVoeS1Nrqe9v2t8M8C1gG1how-YSKKbQ94e8SvaLTZvm_hG4Q>
 <xmx:DxlmXHvVlacZG58p6K2NJPKVitfNPZEeL1kNCt9i47dWK1Fkr0nyaQ>
 <xmx:EBlmXAEvTdWNPaVf21ALTf6FQpmFF_NjSivXq5vNij0FH0luE5k-RA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7619194513; Thu, 14 Feb 2019 20:42:39 -0500 (EST)
Message-Id: <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
In-Reply-To: <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
Date: Fri, 15 Feb 2019 12:12:39 +1030
Subject: Re: [Potential Spoof] Increase ARCH_NR_GPIO for ARCH_ASPEED?
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
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
X-List-Received-Date: Fri, 15 Feb 2019 01:42:47 -0000

On Fri, 15 Feb 2019, at 11:36, Tao Ren wrote:
> On 2/14/19 3:16 PM, Tao Ren wrote:
> > Hi,
> > 
> > I got following error while booting up openbmc linux 4.18 on Facebook YAMP BMC (ast2500 based), and it's because total 594 GPIO pins are provided by aspeed soc and i/o expanders on YAMP board:
> > 
> > gpiochip_find_base: cannot find free range
> > gpiochip_add_data_with_key: GPIOs 0..15 (pca9555) failed to register
> > 
> > I'm wondering if it's good idea to increase ARCH_NR_GPIO default value to the "next level" (1024) for ARCH_ASPEED? If not, any other suggestions for this problem?

I don't know that there's much other choice, but beware that changing
the value will impact userspace if you're using the sysfs interface (which
you  ideally you shouldn't be, as it's deprecated), as the base addresses
of the gpiochips will change.

Andrew
