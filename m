Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AQs6BvGo"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q+7zNvE8"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440tRX04d1zDqT2
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 10:50:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EEC72226C;
 Thu, 14 Feb 2019 18:49:57 -0500 (EST)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Thu, 14 Feb 2019 18:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:references:date:in-reply-to; s=fm2; bh=UAU
 65zSSRPBGwgCUeFWTbxpbgaIRuR2VEeXaT6SLqBo=; b=AQs6BvGowP1r+vZtAuS
 UtM1uqwLJoeIhA9k8RbiZjkC3kWv1bgSxYHD+FNJ/iyvVtPOTyMIMw6WxC+FS0PE
 a3CMFA/M5oQFiHWMzZnhtV9bGvXxREdXbFfIzr/9yq4TP9K9XlMOVzUpfSacnmp7
 8xws+cXMSsELxW/iBj48wgogb5DXEgOJm6mOy3JlVC95FOVN2Hb492Gn1TqIgpvp
 mZ4U61ZXl8YP/oor4GeuRX4/Ycx8ZRY24S2H8omXoPlo8po3g7mRsBvKGsOrEMFS
 RouqxmDAbDnhfJYQOwtjsiBAyjysAXwHiB9FGvY01d6FpPmIHTXF0DKvNpGBoczQ
 yOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=UAU65zSSRPBGwgCUeFWTbxpbgaIRuR2VEeXaT6SLq
 Bo=; b=q+7zNvE8q0oYyvt430nVDawWEbmsEDCPP6RD4v0JL8I4TKGWx7N3Na6A7
 jgMz30zK+RywsQRATnEoOSzPYiMrRqZJADgm9BBhZSEjsgqAqw7oGGEe3YTMRB/l
 Zi7ge2uckz7d6F0wWIYb/YEHufo0qfm03ENKYKTZ65MlWUfLc8OHynpVjjhGjZ+9
 H4Ihbao5bs+DYK3ebuaFHGtR9NJ41qju4Av6MF8prV1/2AibEbNh+MlRU3oBB7EX
 r1RXK9nDlfoqRxk+jnDS6L0Bb2+knVWKtuF7NHEsXQ2kaeHbAxfNoh9v2iT2cC4B
 Ar38F+zNCEUKeTmwvjxAt6BboBLyA==
X-ME-Sender: <xms:pP5lXM4To3AKWXscL4arWChVkV9CXT1bfBT30fbIrbka47Om03M_XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledruddtiedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkhffvggfgtg
 foufhfffgjsehtjeertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicu
 oegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprg
 hnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:pP5lXEBmrVwewDGcy-yy5LU5XMrVnNlzNn13Hl9R1h2mQ7Wzgv3_3A>
 <xmx:pP5lXB-748xD8Pmu-lUPe31vxSFqDhviV-rU9B4XG6IhAMtHvhwFHw>
 <xmx:pP5lXLIbQQrmm5rblWL8RQL2r3LyBUkbxR7lPEtI0y9aXlK5qN6K3w>
 <xmx:pf5lXHb1Ruvj3BE4auukjuKYcR9i6aeHmxrCjbYaGDl1kruCBTVkFw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 3AA9F94513; Thu, 14 Feb 2019 18:49:56 -0500 (EST)
Message-Id: <1550188196.4146662.1658273928.7C23EE25@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Wim Vervoorn <wvervoorn@eltan.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-e97eb308
Subject: Re: Building intel s2600wf image
References: <5beefafbdca24738a72f243e667823fe@Eltsrv03.Eltan.local>
Date: Fri, 15 Feb 2019 10:19:56 +1030
In-Reply-To: <5beefafbdca24738a72f243e667823fe@Eltsrv03.Eltan.local>
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
X-List-Received-Date: Thu, 14 Feb 2019 23:50:00 -0000

Hi Wim,

On Fri, 15 Feb 2019, at 02:51, Wim Vervoorn wrote:
> Hello,
> 
> We are trying to build the Intel s2600wf image using the latest OpenBMC 
> tree. If we do that we are running into build errors.
> 
> Before digging into this can you tell me which commit of the tree can be 
> used to build an image for  this device without errors. This allows us 
> to have a stable version for reference.

Sorry to say this, but what you've written is a textbook example of how not
to ask for help :/

Things I don't know from the above:

1. What "the latest" OpenBMC tree is
2. What environment you're trying to build it in
3. How you are configuring and invoking the build
4. What error you are actually hitting
5. Whether you have searched the issue tracker for others reporting the
same problem

Regarding 1, we have a very definite way of identifying versions: The
commit ID of the openbmc/openbmc repository. OpenBMC is a fast
moving project, and your "latest" tree might not look like my "latest"
tree. Please make sure to provide the output of `git rev-parse HEAD`
from your working directory with your issues/queries.

Regarding 2, are you building on a physical or virtual machine? What
OS are you running? How much RAM and disk space do you have
available for the build (at a guess you should probably have at least
8GiB of RAM and 50GiB of disk space free). Which OS you're running
influences which compilers you have available for bootstrap and if
they're too old or too new they may cause issues. Please describe
your full environment.

Regarding 3, it's not clear if you've even configured yourself to build
a s2600wf image like you're claiming, or if you're correctly invoking
bitbake. Please provide the exact commands you used to configure
and build your image.

Regarding 4 there's literally nothing we can do to help you other than
say "Commit ID X works for me" in response. This may even be the
same commit that you're failing to build. If we know the details of 
the problem then if it is something unexpected we can help fix it.
This means you need to provide the failure output from bitbake,
*and* any logs that output might reference.

Finally, regarding 5, the best way to get help is often to help yourself.
Please make sure you've searched the issue tracker before asking
for help on the mailing list. In fact, typically, you'll get a better response
by actually opening a new issue if you have a new problem, as it gives
us a central point to collaborate around to resolve your problem.

I hope the above isn't too much of an affront, but I'm trying to help
you help us help you. We'll all be better off if you can provide us with
more information and make proper use of the systems we have in
place to deal with bugs.

Cheers,

Andrew
