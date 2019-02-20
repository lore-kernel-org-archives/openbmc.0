Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nQW+AczZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="b492GZnj"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 443ymC5GdczDqGp
 for <openbmc@lists.ozlabs.org>; Wed, 20 Feb 2019 11:15:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 450A8232C5;
 Tue, 19 Feb 2019 19:15:05 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 19 Feb 2019 19:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=hpKeQXQSQ0nZexWXOz6PK9SK3sEbbC7is9m4GDm
 oEsc=; b=nQW+AczZR3xBFrBUy6NM1z+i8LbpSWchrLwF7GdbrR7RxXdc4IfBV4n
 ubu7EA/ivRxLQsfaoAEbjU3wegyB6pfRuO8VyuXQoXXgZOtCJUO/JheX0Blz9f9V
 mG+LCzKiSw5kbbDm6s754xlJvNWVoTCw6oWi/UiS0Ci2F2HsJbQ68n5YOXVM636s
 S06Nh/xP2Fl6bF/nAoHGaW0E1LHOMhnlHX3ENT1RR5txzwxOWArFiXylSHlKdQJH
 OMALOCFJXhwhrvfL9N2cz2ESDDEBP/vu/Up8y4Q8FslR1prxaky5DlVWi5t1rQoD
 dJhuiGFw4ZW45EvthzPKWB9Ca/QmI9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hpKeQXQSQ0nZexWXO
 z6PK9SK3sEbbC7is9m4GDmoEsc=; b=b492GZnj5MKo/R1TCO1Dh/6LBvG2SRrdu
 t0kSqOlvnCadSq/QZnxPUrf+6E0IU0BAwhyDs09B4O6RyUNQVS123dQfZjKGZfMt
 UB1V7l7EgfowaLWq2jIfL7kGD4FlsqrqsWFJMXcAeWmF/YFCcfkXYkiEs/QxVarD
 O0/zW23CMRO/X1IQbZjQ41UDiHPH7t831k4B8A2O1neBnrcLvFnNdRdzQBVKfpjT
 0wYGMBTgoo5qIMJ/xfh5beJ4b3jiHELEekCqkOyHiRaTptAiWMQbVI2IpGzX/XJX
 ocpJWQGOCm+mQumJ8fhuckWs1VvsDzG9JkcU0wiVyqchxhqvWKlmw==
X-ME-Sender: <xms:CJxsXB9FvNXOPkggAIvlSv-fSvFgJU4KuXAqSGP9QFpb3dn2cR0-kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdehgddvudculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:CJxsXCWUc_6n4uowwrit0tUGbgcGuW2f_LexwIdUrRZ7gTuzhUGdLw>
 <xmx:CJxsXFa3i3qG0aFljkmewQlnKvLoWef9f9YZAxEC_L0HoCUI6F7WCg>
 <xmx:CJxsXPXpCSkKAUH4itl0s4IznL-BNUnhpKD--ddpEyNFGBiehU59qw>
 <xmx:CZxsXIUt30nx4vdhSogA3lnBtvkzY5Yr_1trPyOurUqOEYBZaqJ-sg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 987D47C1EB; Tue, 19 Feb 2019 19:15:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <b4431660-b369-4a09-a432-9f12d6117a00@www.fastmail.com>
In-Reply-To: <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
References: <3d3df19e-ea5e-8086-34ec-5fa1b200a313@fb.com>
 <d30c021d-8586-984e-a4f7-ce7cb88a1b11@fb.com>
 <1550194959.4187502.1658322936.5ED72093@webmail.messagingengine.com>
 <d271e188-e135-eaff-5532-6ba6b95dce5a@fb.com>
 <1550458070.2791184.1659887272.2685E434@webmail.messagingengine.com>
 <8614FF34-6AA3-451A-8B51-2E759A1CDB14@fb.com>
 <be6cd582-6090-49a3-a3db-0f578b1815fd@www.fastmail.com>
 <01a0bdc0-78ba-28d0-6287-9a93e7a93261@fb.com>
Date: Tue, 19 Feb 2019 19:15:04 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Tao Ren" <taoren@fb.com>
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
X-List-Received-Date: Wed, 20 Feb 2019 00:15:08 -0000

On Wed, 20 Feb 2019, at 10:43, Tao Ren wrote:
> Hi Andrew,
> 
> On 2/17/19 9:11 PM, Andrew Jeffery wrote:
> > As an example, for Tiogapass, you should be able to define `CONFIG_ARCH_NR_GPIO = 1024` in tiogapass.cfg:
> > 
> > https://github.com/openbmc/meta-facebook/blob/master/meta-tiogapass/recipes-kernel/linux/linux-aspeed/tiogapass.cfg
> 
> I tried to define 'CONFIG_ARCH_NR_GPIO=1024' in <platform>.cfg, but 
> still, it's reset to 0 by "make olddefconfig".
> 
> Below are my steps (using the latest openbmc tree), and kindly let me 
> know if I missed something:
> 
> 1) added 'CONFIG_ARCH_NR_GPIO=1024' in 
> meta-ibm/meta-romulus/recipes-kernel/linux/linux-aspeed/romulus.cfg
> 2) export TEMPLATECONF=meta-ibm/meta-romulus/conf
> 3) . openbmc-env
> 4) ran "bitbake linux-aspeed"
> 5) checked 
> build/tmp/work/romulus-openbmc-linux-gnueabi/linux-aspeed/4.19.21+gitAUTOINC+d808d27f70-r0/linux-romulus-standard-build/.config: CONFIG_ARCH_NR_GPIO is reset to 0.

Ugh. I didn't try it myself, was just hoping that would work. Are you okay
to keep digging into why?
