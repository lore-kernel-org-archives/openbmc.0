Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="S6gNnUlb"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NzFRkHqH"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xln02gygzDrbS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jun 2018 10:38:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A4DB021CE3;
 Thu, 31 May 2018 20:38:25 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Thu, 31 May 2018 20:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=X12bzrrkzwAktGVzqDMhmLmnun7r6
 1KpAJfoM3nNqt8=; b=S6gNnUlbcQV/op1sqWuto4vaZc23G4VOrfq1obv/LpJ5z
 YKn6uhqTW6o5W9TlBAul/GDcU5s5IlIa55RLjO9gWNrjmlf7TlSfxBGA5ai5erSp
 c+gSxiXlVprnzv9nfEvP54nEA3JyebCAPNVwTpLQm2LliUAS2ZSGjAvDCI/O9UlN
 xofyRiYfs5qQNq98qpWTxpHfJh1aVz/VsQnX5ASp5aE4FZXYH5kmtsq0eYAAxOi4
 TDhcVCphzoGFOgM5Zy2XunJQWMAMg60cAEHH4kiMLy8VY/H8g3Xu3gn0lpQPZO7Z
 EbE40Z3+eeL5ehQxzDGbdB/FJX2Y/KwP0+fR3Sv9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=X12bzr
 rkzwAktGVzqDMhmLmnun7r61KpAJfoM3nNqt8=; b=NzFRkHqHnbICroFPi4jaOh
 533GMS3Rx0u8ov+K3SdKKOSf9niGbd5tBvBS16eUNWmJZzhAGEIn5K7FIeCzN39H
 EQXKShx39qBpCkOvpPtlunTwS1EAnyY7Gfr2nzLqfqTlcRN4QwC3RXLsvNmn+pFH
 tLtUXYoIvINerqXrii+9rbrZVpkwkXr2Z4+NSThcRIDTy9iL1De/TsyP39su7eOE
 VZmDUK6GEymTF0Kko5YyGQZu9sRvtI8xPxuJA9spsIuoWrwT2zWj4OtUy3tpafpr
 b3ffgkx9GlO233mZhhWybI0j+bJcbRVquo5nbc1k8SeR1TlcjKJEt2vYqSYdMI3w
 ==
X-ME-Proxy: <xmx:gZUQWxIlATgIJuf8apUguW2CTmfxS04ZUF5lV2Svrl0LbT4LUsxqBw>
X-ME-Proxy: <xmx:gZUQW1ZPx3sTVykEGueUlplEmlEKRrLKHt8G29Rcx2BkJCIIYH32FA>
X-ME-Proxy: <xmx:gZUQW3hu1gOXqbfcFmmYr-IRf1EgfPRBoV8ZDNyh2TEdkwcikiFYyg>
X-ME-Proxy: <xmx:gZUQW3UdBoWJw3rmessmfwBNBEko_8BYGHP0wOU0h18-lVE4GcY4NQ>
X-ME-Proxy: <xmx:gZUQWy6Xf7Zjv6m76YymYYlGaSNl8jpvMhQFKXdLNv1Eh-FOxzG7MQ>
X-ME-Proxy: <xmx:gZUQW3iKjuJEp6X20GEYv27V6is8daM09UOQrxl4B3tqspIAtdwzuw>
X-ME-Sender: <xms:gZUQW6pRSObuBsOBunWshNKbs216Fgo-IIgpwO3V5a5VKhwK8s6sBg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 754D1BA780; Thu, 31 May 2018 20:38:25 -0400 (EDT)
Message-Id: <1527813505.462430.1392457368.418CFB45@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Stewart Smith <stewart@linux.ibm.com>, Nancy Yuen <yuenn@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
 <87efhs43uo.fsf@linux.vnet.ibm.com>
Date: Fri, 01 Jun 2018 10:08:25 +0930
Subject: Re: OpenBMC Security Working Group Kick Off
In-Reply-To: <87efhs43uo.fsf@linux.vnet.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 00:38:30 -0000

On Thu, 31 May 2018, at 18:08, Stewart Smith wrote:
> Nancy Yuen <yuenn@google.com> writes:
> > The OpenBMC Security Work Group kick off meeting is scheduled for Thurs May
> > 31, 9AM PDT.  This first meeting is by invite only.  Please email me if you
> > are interested in participating in this working group.
> 
> Would topics like "security of the BMC from a hostile host" be part of
> this?

I vote yes, and I'm picking up the work to shut down some of the obvious holes again now, at least from an OpenPOWER perspective.

> 
> A design of OpenPOWER systems is that the BMC and the Host don't have to
> trust each other, and this should extend to a host that's hostile
> towards the BMC.
> 
> I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
> we started fuzzing those interfaces.

I've have a neglected branch floating around that adds an AFL harness for mboxd. I should start hacking on that again :)

Andrew
