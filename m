Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lR42ymsh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ddqJ1GgY"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 411VHw0tRzzF2yr
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jun 2018 12:44:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D82E921C48;
 Wed,  6 Jun 2018 22:44:40 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Wed, 06 Jun 2018 22:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=+kVDwIRIGXopPpnEgmB/lOemVjC5U
 FPIQew9eQcWV0Q=; b=lR42ymsh0NeLfqTjTmsTxy0E/gjJ4ISvZUK+qprP9uDPK
 ZZWougx4xWFD4xg4NSWFpmLYtxhQ34IDqxsBJmUMbTHQm69M/B2GfKi7PFeeLOPg
 8eLIwdJVLliHK6IAJlP3ivig0SJikGKAfaDneSlSPkq4RjhkOYpVjX45tkUnE1E/
 Dh3JvTzzQ0WSk+qixDK6chp0GmgRFKLL4/D6Hd3xfkAbkPfgMd5euz++rcO1rRyk
 03+aT7pD6Pho07naSWUNBjWY3tQWiFskXtifotZEGXIfQ1z2RXmXBsuJG5Zb/Tb4
 PpUcSRKq3LGIr4KIrkS67z8WkiGoIB9TNclQmw3XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+kVDwI
 RIGXopPpnEgmB/lOemVjC5UFPIQew9eQcWV0Q=; b=ddqJ1GgYYP6sBXPIcuT+zx
 n5jeMW724rSIRwkQTtMW7U+KFXn0bnxKaEVl4tctVqyU3eFGm+1BAGA/UXCn+hFF
 CSwuoA3Wqk5O0f0nuMKaQsuex2zUOQ+QmCSfQ3dfJMjx9iakdBvZ73mAmnIyKc9I
 335tDOMh1QPYo8meMLKsLrGPOmSd6+LV7/EPSPqGe51d6rVlaPdrMyCD2nNI0T1s
 XwzmYP6zrAArAt9QpAIQWozk2j/E/2qumEk7f+paSgDB5HA49XT0cpCXBqzafjvT
 U4zPpQknd97VH1ehih2JXKOa0C6HYgbVdPCWFsxRBDJqZxG3KTiojSdtU5YxnesQ
 ==
X-ME-Proxy: <xmx:GJwYW2AC8ZekgZZVXa_0sif7RwsCNLB7YHXKNOqaw4PpoFUy5dzPJA>
X-ME-Proxy: <xmx:GJwYW_CAxolMFKcVH4is038kN8RABj3sM257HfRq7DxiuIza-SXEgg>
X-ME-Proxy: <xmx:GJwYWwaimHQw9-8JZSnjdUY-7JxYbh_cVApIncFO-bQSGEu6bSRIUw>
X-ME-Proxy: <xmx:GJwYW0ysfCnLNJHzHQtYrZDagglyN5WJNlocN1GLsAFQX9GPnc8mow>
X-ME-Proxy: <xmx:GJwYWzfi8DpHX_XAGkx2ScRFzevm6ILAas7L7oFIBcR-MzKUvy9Yxw>
X-ME-Proxy: <xmx:GJwYWzbOTrw2AO7tAoz3Cfp5a12d9vXDUEpsIdY1N0eSPeKIM0BuuA>
X-ME-Sender: <xms:GJwYW3ObDZ8j4qKQBLmECbLWJintxXYo6DRM-UB4hP02HOHwn5r37A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 67EFEBA50D; Wed,  6 Jun 2018 22:44:40 -0400 (EDT)
Message-Id: <1528339480.1598007.1399228472.4A1E3E5C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Nancy Yuen <yuenn@google.com>
Cc: Stewart Smith <stewart@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-fb4a77ea
Subject: Re: OpenBMC Security Working Group Kick Off
In-Reply-To: <CADfYTpEbEE3sbbgNFvEwrqOAX+xv8jtSGG=Trpva6=-r1OVrgw@mail.gmail.com>
References: <CADfYTpFTzVbnSpZn+J74fHNCDZ0QAKKyNLXMzbPKT2JK3fTefQ@mail.gmail.com>
 <87efhs43uo.fsf@linux.vnet.ibm.com>
 <1527813505.462430.1392457368.418CFB45@webmail.messagingengine.com>
 <CADfYTpEbEE3sbbgNFvEwrqOAX+xv8jtSGG=Trpva6=-r1OVrgw@mail.gmail.com>
Date: Thu, 07 Jun 2018 12:14:40 +0930
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
X-List-Received-Date: Thu, 07 Jun 2018 02:44:46 -0000

> > > A design of OpenPOWER systems is that the BMC and the Host don't have to
> > > trust each other, and this should extend to a host that's hostile
> > > towards the BMC.
> > >
> > > I'd be surprised if we didn't find bugs in both mboxd and host ipmi if
> > > we started fuzzing those interfaces.
> >
> > I have a neglected branch floating around that adds an AFL harness for
> > mboxd. I should start hacking on that again :)
> >
> 
> Maybe for OpenBMC Fix it next week? :D

Added it to the list

Andrew
