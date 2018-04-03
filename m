Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BPJ/iyqC"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZW8Ei4oW"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40FtpH5q6YzF2C8
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 01:50:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3551820FD4;
 Tue,  3 Apr 2018 11:50:12 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Tue, 03 Apr 2018 11:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=BdAfEmfKKeGDAI70t2u4bauWrYQnY
 3zcnM6nU9fyglA=; b=BPJ/iyqCderAUqM+JBYdrpwjxobBFKpzDjo8grID7gBZs
 ENEUT+3OlOOKXXOvU2D4Ph1mHTJ3eU6XwTyZ7yFYp4q6RnmszOATBXhW8cULf39G
 0SlUhUzO/PZRkz7skqla71t0EromdPrDpSimRa8Q+I6u73RskZXtCuDAVroIBrrB
 WalJuEQIfEFzT9N0/tkb7bjbtbImX+LmNB3OwoeoLa0Jf13ALumGqCq3w0BR8b2I
 QcBF+BMgrr7X7SUH4RvUf3o+0gmSNL3h0oP5L0sSw4HCnxZLwzFn2Gbu8eTAYJ4z
 N/1+0j/M5neCoHpWwbiwxJyzTvLCspn37wh2a2Czg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BdAfEm
 fKKeGDAI70t2u4bauWrYQnY3zcnM6nU9fyglA=; b=ZW8Ei4oWOa1DtxOMzcezMG
 TWcUYjewZoHYVIBGK4ibH1p1WQbu6WNHraEA7QRZMiW6hlzOiDeelnOTU7LKA4NH
 cu1H24FItL8uwUSSKcuEWeKDfXo8n9786ZOulaNNtXneC9VHxS382D3ogwRIMPTI
 iWrlm8nXBeuzRp9DWGXW31hccTzePVgadqg4lfJIFuy0OtTo9mbVG6lA9Zn7qXOl
 ZDyuvkdkJla3g/AjwRSKzdLcRDp74yaIQkJywKWwGDIeDPVzDZahZ+iBMr7K8Rnw
 wfva0bZnRbaslzeH+UTqiJPOVZkJOBeY7xJRhVwMpuA8jhRKIhqpCKq9kIhdnMPA
 ==
X-ME-Sender: <xms:tKLDWn9xCkOXpab2c0g9KTpowcsagdwYCSxbnwpCBT9uQ7Jm1ZTtUA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 0DDCE9E0A6; Tue,  3 Apr 2018 11:50:12 -0400 (EDT)
Message-Id: <1522770611.961373.1325080024.3E7EE463@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-bb419338
In-Reply-To: <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
Subject: Re: Migration to new gerrit server is coming
References: <CALLMt=rhu44zQUK3rv4vzCCzLJ7ehevQ-UQB8ydzdG0AHCvQSw@mail.gmail.com>
 <CACPK8XcFXZb1yyjsQpY8Qb=Yxrst8c4BYPtA2VBNea_bHU5VLA@mail.gmail.com>
 <CALLMt=qWz4eJYN+BzpO1L7ihhvQA=RPQxsKG4AQpyyEB=sk0eg@mail.gmail.com>
Date: Wed, 04 Apr 2018 01:20:11 +0930
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
X-List-Received-Date: Tue, 03 Apr 2018 15:50:18 -0000

On Wed, 4 Apr 2018, at 01:00, Andrew Geissler wrote:
> On Mon, Apr 2, 2018 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
> > On 29 March 2018 at 06:25, Andrew Geissler <geissonator@gmail.com> wrote:
> >> Greetings,
> >>
> >> We've gotten ourselves a nice big server to run our gerrit instance
> >> on.  The virtual machine we're currently running in is going EOL
> >> within the next few months so I've been slowly working on a
> >> transition.  The migration should be pretty painless.  At some point
> >> I'll take down the existing gerrit, migrate the data from it to our
> >> new instance, and move the domain name over to the new server.
> >>
> >> I've got a test instance going now and would appreciate some poking
> >> around for anything obviously wrong.  It's running the latest stable
> >> gerrit, so we'll be getting an upgrade in this process. I synch'd over
> >> the data from the production gerrit this morning.
> >>
> >> https://test-gerrit.openbmc-project.xyz
> >
> > Thanks Andrew!
> >
> > I had a poke around and it looks good. Much snappier than the old instance.
> 
> Thanks for taking a look!
> 
> >
> > Do we have plans to use the gerrit.openbmc.org domain instead?
> 
> In order to reduce what's changing with this first migration, I'll
> keep the old name but yes, Brad got me in touch with someone from the
> Linux Foundation and long term we'll be moving to something like
> gerrit.openbmc.org.
> 
> >
> > Cheers,
> >
> > Joel
> 
> FYI everyone - The migration is tentatively planned for this weekend.

Looking forward to it! Hope it goes smoothly.
