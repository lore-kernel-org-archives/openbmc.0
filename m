Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JcNg4aJf"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="auUQahOy"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lGbh4Kt7zF2bT
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 09:09:03 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D30A122487;
 Mon, 14 May 2018 19:09:00 -0400 (EDT)
Received: from web6 ([10.202.2.216])
 by compute4.internal (MEProxy); Mon, 14 May 2018 19:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=TsDkNXZozu32ncDTHzwF0NN0Tj3J6
 xECMk7vbJnRaSI=; b=JcNg4aJfHTLn9SrfOMxJcWNRh8f2H5IpDEttbswaefoS8
 sZj804eKDocQ+6L2tsG2fTB7AqMQWoVQ4X/uxy1c8EiPQmcJZagRx4IzfWNr2l1u
 EQsf9+j2oerVxSl+7YDHCdqzqTj4+wOdT3fbc/PpXNYGmXBXD/3Y83vPEnTjDOjV
 R4Aw4IbgqsAFmgXQdAQ0Cd8Kk/OWp4xIG7RHI85taZOrlimtmoyIFuPFguZD3Fr3
 3hcnugXXdUM7mCgTrhyws+g6CHbe43qiBBApVzSOY3RiHoYB/5XRUlS7suc0mMMI
 2MCHNG1vc79vf3Cl4S7ZE4j2NscmOGihDBGPDeELQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=TsDkNX
 Zozu32ncDTHzwF0NN0Tj3J6xECMk7vbJnRaSI=; b=auUQahOyIrE9DRqcI2KlYv
 jiUDCOxUzsQh1NSn3U6UAtfXJyNRvbhZXilMWGZgC321j8e+MUyqv/cL26tUyrFb
 wxbYURtyQ//sLLK26KQzI/ymv9eRookmtZoWZEA10hW8KUaKU2HwBMhpma/7iO9U
 ZyYBCoDmBJBsSMfQ6IiSU4fCAH+Y2MNF5KCZzgGB/KGDYEYKDQmsxwPg55bCO6xW
 x+nF3cheN4BCyZZQWxDEwFHBdXY2jhUmgy4gkPUtZCQriRI49W0hAb8lzdzB6Zyz
 pyvcHwZTyJ7DmZmcBU1iwubbPhZwtTis0vLgBVzs9DOXyGFW2sUsDqcCqwk+btwg
 ==
X-ME-Sender: <xms:DBf6Wli9Uo5Di8YLZxAHQfOrS0Dc2ulZwA1XQPIzWEbJ0IFLWk2iqA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 94053422D; Mon, 14 May 2018 19:09:00 -0400 (EDT)
Message-Id: <1526339340.3483421.1372054976.4F9E0D27@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-29fe4c42
Subject: Re: [PATCH linux dev-4.13 0/2] Fix SBEFIFO chardev read behaviour
Date: Tue, 15 May 2018 08:39:00 +0930
In-Reply-To: <b73439a1-ea2e-0352-d7b1-440bdf2243f6@linux.vnet.ibm.com>
References: <20180514061809.11487-1-andrew@aj.id.au>
 <b73439a1-ea2e-0352-d7b1-440bdf2243f6@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 14 May 2018 23:09:06 -0000

Hi Eddie,

On Tue, 15 May 2018, at 07:57, Eddie James wrote:
> 
> 
> On 05/14/2018 01:18 AM, Andrew Jeffery wrote:
> > Hello,
> >
> > read() on the SBEFIFO chardevs is currently unusuable as it will always return
> > -EAGAIN on a read subsequent to the EOT flag being observed. This breaks reads
> > using short buffers as we now have no way to know when we have received the
> > entire message. This is made infinitely worse by the protocol, which as
> > defined, means we cannot know how much data must be read, and therefore all
> > buffers are effectively short*.
> >
> > These two patches help by at least returning 0 for a read subsequent to one
> > which drains the last byte from the transfer buffer. A read subsequent to one
> > returning 0 will then return -EAGAIN if necessary, under the expectation that a
> > write() has been issued.
> 
> Thanks Andrew, I haven't dug into the diffs too much but I just tested 
> the series and it appears to have made the in-kernel API less reliable. 
> I'm getting some errors when attempting to use the OCC driver.

Thanks for testing. What errors are you sometimes seeing? I need some more info to reproduce and understand what might be going wrong.

Cheers,

Andrew
