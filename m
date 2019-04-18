Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AOfS7+1I"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UGnv/QT7"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44l6yk1PS4zDqQB
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 15:26:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 75069217DD;
 Thu, 18 Apr 2019 01:26:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 18 Apr 2019 01:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=thIEl3s89YRkbBDH3/2O5qlRobvjjAk
 NGt1NcymB/0I=; b=AOfS7+1IOihF3So6BO9ujasDWB1yiwRKmzsfyX3vay3R+KV
 UKMVTybEp6svwLNGFlyQEMwk7ip9hx2isdqIkrlnONYwjH6CLahN/oveNUTET/G1
 TwrkfcizLTLjDUDCa5BjljmWGIHqCQkE09YAK3dzMcHoVJgFQ8Zf4kkk1dvTf4eY
 5C9bn/znMQQbj5MsgorxjRiAK070lnaVuxtqXCDmHxrJ09OM6Kn35g/pnMFvBsRP
 EvGtbZ+L5c29TrkefKng9bkz53yJQMnb1gtpH42JBztbxNCxfBiwasEffPqBk2gs
 4ffVs3JHe7JmliH+yUGirUPHAfUIsLiMZQl7IWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=thIEl3
 s89YRkbBDH3/2O5qlRobvjjAkNGt1NcymB/0I=; b=UGnv/QT7nwU+eS3nn7P9fT
 d2wSc4CXLex26HCnQRKt/jJZyGBDv0OjgXaWhGG/tLxq08T58SMryzIpvKqnlNwI
 IedPyrefBdPlLaMcQIxic+L2lHEKZMyZ1lFLakQaFWRxCmi5Ex1EWoBUMR63WV3O
 5XmeF+E43ebtSZpo6acU8kNRzyG7vq/ir0UgMONFx9f1fZmW7S+RfZgC3QsMtBfU
 4QjpAMfmqPyV69Zrv713/eGShZqgTwuhdu+y+IXwFi5JczpXocqmy37G7SsSWdZR
 riwM0Jbw1FdP7QkoD0jt8btNj5bqXD9Li9wu8eXPiJ5mzNQs5DVNtWxBgDT38lOQ
 ==
X-ME-Sender: <xms:aAq4XCpe_0NE-X5KeR6b6qXKcEjJGAyRgvbabMhUkrwGugXMONIXPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeggdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddujedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 pdhgihhthhhusgdrtghomhdpihgvthhfrdhorhhgnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:aQq4XP4Lw8F0D11f1a3Wwe_vFeeUwnzdp8tWqTSMPFl7-AOiy_Gdhw>
 <xmx:aQq4XKBDWSlSwPhGsNJIhzhbb1gDHfnj2mRj5iWjlMuAyWqGMbqt8A>
 <xmx:aQq4XJZiFWJG2ZqToEAaBGN00ZebZGBHMcwzdFPccWAO14-tPmEjwA>
 <xmx:aQq4XFR-LeC1OtnYuqp_OVnHQXPGlWc4iQPvIX2CNq1eDE7V0kUzsA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D3DE87C132; Thu, 18 Apr 2019 01:26:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-443-g918f9d3-fmstable-20190416v3
Mime-Version: 1.0
X-Me-Personality: 52947553
Message-Id: <643f8054-6232-4857-b06a-fbb04fdfb8ad@www.fastmail.com>
In-Reply-To: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
Date: Thu, 18 Apr 2019 01:26:00 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: Redfish OEM commands in OpenBMC
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
X-List-Received-Date: Thu, 18 Apr 2019 05:26:09 -0000



On Wed, 17 Apr 2019, at 04:33, Andrew Geissler wrote:
> Greetings,
> 
> As more and more of us are implementing Redfish within OpenBMC we are starting
> to run into situations where the function we need to implement is not available
> in the current Redfish schemas.
> 
> We've been joining DMTF workgroups and starting to get familiar with the process
> but, if OpenBMC upstreaming is considered slow, it's looking like upstreaming
> to the DMTF could be even slower.
> 
> So my question is, are we taking a no OEM policy within OpenBMC? Or are we going
> to take a more flexible approach. Similar to openbmc/linux, as long as you're
> working upstream with the DMTF on your changes, OEM would be acceptable?

I'd be more cautious here - breaking the OpenBMC kernel ABI due to carrying
patches that are not yet upstreamed isn't great, but we can adapt userspace
without breaking the external interface to OpenBMC. Breaking the external
interface to OpenBMC is much worse from a user perspective. Essentially, you
need to be prepared to support the OEM extensions well beyond standardisation
of the non-OEM equivalent.

RFC6648[1] seems informative here:

Deprecating the "X-" Prefix and Similar Constructs in Application Protocols

At least, that's my $0.02.

Andrew

[1] https://tools.ietf.org/html/rfc6648

> 
> From what I've seen so far, it looks like a lot of companies have gone the OEM
> route initially. They then use that experience to guide the discussion with the
> DMTF workgroups.
> 
> There could be some gray areas. For example, I want to add a Priority
> property to the UpdateService [1]. Maybe this would be ok to carry as an OEM
> for a bit? Adriana wants to propose a whole new backup and restore design [2].
> Maybe that needs a bit more traction upstream to ensure it's going in the right
> direction for something DMTF would approve first? If we start limiting ourselves
> as a community on what DMTF has approved, I think we're going to struggle to
> deliver certain new functions.
> 
> Andrew
> 
> [1] https://github.com/DMTF/Redfish/issues/3357 (can only see with DMTF access)
> [2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18163
>
