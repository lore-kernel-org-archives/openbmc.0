Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="tyLo7/pD"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gFtgwU+T"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4474lM2mvYzDqPY
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 12:55:11 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CB7FC22109;
 Sun, 24 Feb 2019 20:55:08 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Feb 2019 20:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=PvH6m9/L59io0TUHczC9ltt2riWp3DIRQSNLqg3
 x+qc=; b=tyLo7/pDvM56N/B2YrtCdByE/JkPl+EasReOggdk7eLgqpWEJWZwcS4
 A4fKXSqr6SApVg7+W31NyqreYvIovAWgkwqUfI1EdeHQi6PQuF3V3LQcDeXneuzr
 cbw3/iArn3IaJPIR4pr5mWE3yI6pUuKC4QHkgN9Wz36GRn9XMpjJ8NjOQArGD+OM
 g7Dq8bnmQRFgUF7jzppxw/Q6mIeEebh2NU3wWPOgF6QY+eGszSb+PhRdnQnNmxcC
 IkMsuvqt0v5ve4wOkzOWXsPzfr2/cIjlz00AOhGY8CfKWUOs68pGvlH9/yeTHdtH
 EsQRC8jq1bkO+RoFSePIAUmaqvf9L5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PvH6m9/L59io0TUHc
 zC9ltt2riWp3DIRQSNLqg3x+qc=; b=gFtgwU+T5iUbk+06CdIxIMi93upYeQOkZ
 rt9UXW9jdzjiBdaWR9QMg2ggtMaqJaisGgcVAILH4lth+yB0m0YuTE8Z8aPOJiy0
 6Grxq4HmHmxbfCOc8/Py1oDiqsNe56KB/z2Qh24e7aH5AWbCiq/HreSSD57ln4mD
 nxRWfWfWDzXjVg5Qb8kIUNhyskLoMTVqSpHRZhGbPESoCMqwUeFbBqjnzLD9KN+E
 HdtJz6zPrOkgbuGiYRGVxiC7dnFlNFp1MoJQyiPDpxGHwn2PnA/wlbaX3LcOCqRH
 tcZBr/XLdR2GruKumHLtlUUh2E16+e2JdxMEraTNTDg83CyvL5JyQ==
X-ME-Sender: <xms:_EpzXGVabgItWzC1nN5ovJxCqilfsPZbRZuWs3aLYFhvSjlUJpyE4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudehgdefjeculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:_EpzXO2VZS3WwFJG9ntzTLIFOLjrbik3mMArPzaKnZ2gnFFO9mGYWQ>
 <xmx:_EpzXAqCByPwIw3Y11R6O5kAeBgqqM2t_CCOAPLJ4NVKc-Nv2umG-Q>
 <xmx:_EpzXK_78pOevmvzya6oPhuQptVenlAAeAJAuiR27h249vShIYgryQ>
 <xmx:_EpzXGCWmeIDhbJSqyp-UfJpkmS_Q-Qp-BqHpQRNl9onGmrFZ5kjSw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E93417C1EB; Sun, 24 Feb 2019 20:55:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <0a995630-6ec4-4340-8511-31cd868ee7ef@www.fastmail.com>
In-Reply-To: <7b9a51ea-5715-b82c-79d9-6d65d07a3e42@fb.com>
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
Date: Sun, 24 Feb 2019 20:55:07 -0500
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
X-List-Received-Date: Mon, 25 Feb 2019 01:55:12 -0000


On Fri, 22 Feb 2019, at 11:25, Tao Ren wrote:
> Hi Andrew,
> 
> On 2/19/19 4:15 PM, Andrew Jeffery wrote:
> > On Wed, 20 Feb 2019, at 10:43, Tao Ren wrote:
> >> Hi Andrew,
> >>
> >> On 2/17/19 9:11 PM, Andrew Jeffery wrote:
> >>> As an example, for Tiogapass, you should be able to define `CONFIG_ARCH_NR_GPIO = 1024` in tiogapass.cfg:
> >>>
> >>> https://github.com/openbmc/meta-facebook/blob/master/meta-tiogapass/recipes-kernel/linux/linux-aspeed/tiogapass.cfg
> >>
> >> I tried to define 'CONFIG_ARCH_NR_GPIO=1024' in <platform>.cfg, but 
> >> still, it's reset to 0 by "make olddefconfig".
> >>
> >> Below are my steps (using the latest openbmc tree), and kindly let me 
> >> know if I missed something:
> >>
> >> 1) added 'CONFIG_ARCH_NR_GPIO=1024' in 
> >> meta-ibm/meta-romulus/recipes-kernel/linux/linux-aspeed/romulus.cfg
> >> 2) export TEMPLATECONF=meta-ibm/meta-romulus/conf
> >> 3) . openbmc-env
> >> 4) ran "bitbake linux-aspeed"
> >> 5) checked 
> >> build/tmp/work/romulus-openbmc-linux-gnueabi/linux-aspeed/4.19.21+gitAUTOINC+d808d27f70-r0/linux-romulus-standard-build/.config: CONFIG_ARCH_NR_GPIO is reset to 0.
> > 
> > Ugh. I didn't try it myself, was just hoping that would work. Are you okay
> > to keep digging into why?
> 
> Manually editing "ARCH_NR_GPIO" in <platform>.cfg doesn't work because 
> ARCH_NR_GPIO symbol is "invisible" and user defined value will be 
> ignored by "scripts/kconfig/conf". I compared a few other ways to 
> fix/workaround the issue, but IMHO, increasing default ARCH_NR_GPIO for 
> ARCH_ASPEED is better than other solutions. Please suggest.

Hrm. That's really unfortunate. Can you patch it in on your platform for the
moment? We're going to have to come up with some more long term strategy.
Whether that's making the symbol visible or migrating everyone off sysfs
(which they should be doing anyway) I'm not sure. If we don't do either of
those then I think we're going to have to audit userspace to find what will
break.

> 
> BTW, "CONFIG_GCC_PLUGINS=y" in 
> meta-aspeed/recipes-kernel/linux/ast2500/defconfig is not included in 
> the final .config because its dependency option PLUGIN_HOSTCC is not 
> set.

Can you open an issue in https://github.com/openbmc/linux ?

Cheers,

Andrew

> 
> 
> Thanks,
> 
> - Tao
>
