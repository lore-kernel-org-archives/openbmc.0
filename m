Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="deybHaG7"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NBPAe4P8"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yYNr1g0VzDqMl
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 15:54:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E4FF421820;
 Sun, 10 Feb 2019 23:54:29 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Sun, 10 Feb 2019 23:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:subject:references:in-reply-to:date; s=fm2; bh=NgV
 mOo3E0ZIOdKbgI5ZEX9yfANcOLDQmSaPpXGp31CA=; b=deybHaG7CKSs85YqTxa
 iGhM6PL6U8P/ot6+ES+rWdHElmAqcfjpmn3HLrMEp1AHEh+aUvdddx3EBBl1jl5u
 rHAXMUmLcyXz21yOVUeJwsCv6YVYMKSknTn9bphIoxubD9L4LCxHGky0zB1hP9YR
 rd2x84b2boJDNYhlf3sS8HKXvUBm+Vrz5mynYqwHTXO6j3JRAn0fbcdL9rahxnYc
 wEORUBWy/8jwVB90DpkR5yM41ukuuS3Xp50aCxupyBwHirLD2NMA/ula5Vk2jCIy
 PH4HBYhTnfKIzhVp5uBOcaDtmXYbnL+IhGzKbIJzeSc94e2G2EOEk+hI7tdKEZUv
 VmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=NgVmOo3E0ZIOdKbgI5ZEX9yfANcOLDQmSaPpXGp31
 CA=; b=NBPAe4P894Jc/WkO+mlvDCNmg9QGSP2y8kRq7/qpzFykWqt0RxVZRi6Oz
 dDDJy4W1gufsX1P1b5OP2ChN4hB7bxW/LyDqIB+vN7MbPGf3OU0FIChgYmuM+/pD
 pV0G8m8uSH7Ca9eGakJvb3orO0+grlaFF0ZFi60H382l9Jduzy7GSnZg98REt/OF
 kQXX3rsLu4VH1WGMJn1CcIoAuwTzMdDgn7xbx4FMNnrFucX4xo089LIpr/TZG2iW
 BPPtvzuwvLqnuDpxPW4w9lzWys2SbxxW8YSCOzTAdNpXbTq3mD5skPq8nQxlKAB5
 OQ18KO8ZjxYZ1iZbMrq6YhzcIKx1Q==
X-ME-Sender: <xms:AwBhXC9v6DiSyOChPwlA7hAa1ovvsN-t7aaaKE54JRzdE_3vql5o0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrleejgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 fufhgjffesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:AwBhXOuO5zDohxzObYW52VmWEfugYwEto1wjNfjNYDWwnjiFvSdrrw>
 <xmx:AwBhXKNMZuoDpZWGWj2t-rcBmQaosieVqoVlNxESEM-8yhd21p13WQ>
 <xmx:AwBhXLjzYOkD0N6Q8qYfM18Va8-lMkbEApd_NirAVfTs7VeBAgswqA>
 <xmx:BQBhXDYcLBkm_Uu9lllTQ63rqI6Ig9_gmh3_U5vRh-Q3w0DI7iK2Ww>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 9F6219E524; Sun, 10 Feb 2019 23:54:27 -0500 (EST)
Message-Id: <1549860867.1161225.1655227592.67A55C10@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Linus Walleij <linus.walleij@linaro.org>, "Wang,
 Kuiying" <kuiying.wang@intel.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery,
 Vernon" <vernon.mauery@intel.com>, "Feist,
 James" <james.feist@intel.com>, "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>,
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>, "Khetan,
 Sharad" <sharad.khetan@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
Subject: Re: Enable buttons GPIO passthrough
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
 <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
 <CACRpkda6PZnoF83mYeTDYxqaFYLTp2jn=E6WJe6KptRuYbFLuQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E451F18@shsmsx102.ccr.corp.intel.com>
 <CACRpkdaiLv94-bcE85E5TyRQWG-EXOCUVu0fLpOr++5_Q0Qqfw@mail.gmail.com>
In-Reply-To: <CACRpkdaiLv94-bcE85E5TyRQWG-EXOCUVu0fLpOr++5_Q0Qqfw@mail.gmail.com>
Date: Mon, 11 Feb 2019 15:24:27 +1030
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
X-List-Received-Date: Mon, 11 Feb 2019 04:54:39 -0000

Hi  Kwin,

On Fri, 8 Feb 2019, at 22:31, Linus Walleij wrote:
> > +static int aspeed_gpio_pass_through(struct gpio_chip *chip, unsigned int offset,
> > +                                   unsigned long usecs)
> > +{
> > +       printk("kwin::aspeed_gpio_pass_through is called");
> > +       return 0;
> > +}
> 
> I guess you want to actually implement this too :D

Something to keep in mind is that the ASPEED pinctrl already supports configuring the
passthrough bits. What we don't want is to cause some inconsistent state between
the GPIO and pinmux subsystems by just whacking the bits directly.

Looks like we should be able to make it work with PIN_MAP_MUX_GROUP() and using
some custom name for the state (maybe "passthrough")? It's a half-baked thought
though so I'm not sure if it's feasible let alone acceptable, but hopefully Linus can
comment.

Andrew
