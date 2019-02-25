Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PRCGq9Wn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="J1+k4soZ"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4474vp68jFzDqNV
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 13:02:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B22C2220E2;
 Sun, 24 Feb 2019 21:02:27 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Feb 2019 21:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type:content-transfer-encoding; s=fm2; bh=aO55Cy74BG+a/
 13fvzXZz+xKngjZNvp8Qk4egySlWnQ=; b=PRCGq9WnTAN7XMswKrqZa5XmOTHJv
 5RsRM1bD2J5IIlW8xeY2HCFehTfK+CTW0P7PneurXf3Uc3IsvddG456CiNWKQh75
 x0KTxjffSy+Dwx2obEqrBw/C1UvnLf6ONH/NjhPU4nWIEtGfsPdioXUrQyLDjqp8
 4kAB+IJ0n+7SOZS/7A+A4FYrptYAN4cuCONxLPB/Rn5Zv/gP0AZ70g6wskilpbh4
 3DuGfWdVUAKYbfcO8dxZI9HLgDVJWkTNWe031kJrV+mplJG0ed+Uh+8qoxN1axmj
 RdYYbifcm4e/vraqwWAc45hYJrul/3OWxuncrxrUr593BPr3+pXQStC/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=aO55Cy74BG+a/13fvzXZz+xKngjZNvp8Qk4egySlWnQ=; b=J1+k4soZ
 /Ub8fBIZHTcUj45XFcrU12CJ7KVgbNDSehjnOBEZt3mgQ/2LbaEgyd3QoW9ZYYgL
 cQf1xlOqFsYmDpYkiFfAXqK9BYjHpxEc//arQ2uLsH1Ptm2fbjUBidFDFHB5qW2M
 OmlC4y+jaS6fWlZaPh9W57YPPkkE2ItuR9I/eOcN631G7civAsHtqSRl430Bgx05
 Z55qYSJk8dKaTHmQmvfuTilOw9xtmOaDSn6kcNnUfcdxyGh1Xqrzl826wiQPulvh
 a+rwYATTzHBfejl5sYDBVsh+Y1G6/U0vnesLHEDVJcuabzaNE8NP3q6N8RMapY/t
 kCQnQSqcqok6fA==
X-ME-Sender: <xms:skxzXP9vaZ7FWZs6I3LUSxfL6XP9_Vy8QbYaTgJS9UNMw2VcPA96eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudehgdefleculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:skxzXA7Mm2q4N5BT6skSt0HLgGB3rA6HJtpyWtJG7pgSJzatcjv4Lw>
 <xmx:skxzXNYAWuEMVdLiZRSs6t37HRK3wWcCzHhjooxm6I-5QvS_jmS2Uw>
 <xmx:skxzXEjufIzbssH8QiFI1rtRamvH76oXpA3lBcLb2sDAClmffymLoQ>
 <xmx:s0xzXNw9WH7FJ-A3M2GGkQ_OIaMOcyIfZR7T0fLu3jZ8bMibRO-vRg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E47007C1EB; Sun, 24 Feb 2019 21:02:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 52947553
Message-Id: <283c57e3-108a-4417-b44c-6c5064c191f7@www.fastmail.com>
In-Reply-To: <31b8f5a5c7bb46f69a15ad91cdd450d2@quantatw.com>
References: <31b8f5a5c7bb46f69a15ad91cdd450d2@quantatw.com>
Date: Sun, 24 Feb 2019 21:02:25 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?Duke_Du_=28=E6=9D=9C=E7=A5=A5=E5=98=89=29?=
 <Duke.Du@quantatw.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: Add driver MAX31725/6 to linux kernel 4.19 
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
X-List-Received-Date: Mon, 25 Feb 2019 02:02:31 -0000

On Fri, 22 Feb 2019, at 19:56, Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) wro=
te:
> Hi,=20
> 	The driver MAX31725/6 is added to the linux kernel 4.20 but I want to=
=20
> add driver MAX31725/6 to linux kernel 4.19, how can I do ?

Send a patch backporting the driver to the 4.19 kernel. There's a write-=
up
on sending kernel patches for OpenBMC here:

https://github.com/openbmc/docs/blob/master/kernel-development.md

That document is pretty out of date (from a quick read), so have a brows=
e
through the wiki as well:

https://github.com/openbmc/linux/wiki

However I expect we'll be moving to the 5.0 kernel once it's released, a=
nd
that will solve your problem. I've added Joel on To: who might be able t=
o
elaborate on the timing for 5.0 in OpenBMC. 5.0-rc8 was pushed 69
minutes ago, so there's still probably another week or so before the
upstream release.

Andrew
