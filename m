Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ha4ye/Bk"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="EmP7jLZQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 427pRX4cnszF3B8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 10:13:28 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6291420C9A;
 Sun,  9 Sep 2018 20:13:21 -0400 (EDT)
Received: from web2 ([10.202.2.212])
 by compute4.internal (MEProxy); Sun, 09 Sep 2018 20:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=ZV4dKtJgqGQ0Av9s0RWEiihWWXCU1
 3tld7p1gvYcFjw=; b=Ha4ye/BkjWSWhY/T2FkhtSzK2u160m5NWXbmsWStMHEwb
 /Lq78vYmf16+XAtYQoorIxadCqZzY7F6XCXCi5n8j8AnAB/qOSwGs7VislbfBoT+
 4D4ejtdx7pQCvnOaGBt47g/+OPvuVBKvGvvWsWrHjI+7s0FKm4ZHx7aPmztNKSPu
 jHd9LLl+GG2gghY0d3WFdQfkRQmmeiX7fk2WW7w6u6bMIGRb2tktiXyXwIjDjtdN
 FAY1UIudimtmpaax8gU2ZXggupFE+AK5h9C46CmXmivIVrNeLOtHAOnMeGgUuoQW
 7DW/Jl+yUk9W0Uq6i9Mke9kUm9uLkuHtgN5g8Wh0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZV4dKt
 JgqGQ0Av9s0RWEiihWWXCU13tld7p1gvYcFjw=; b=EmP7jLZQnwECRqcCBr4kfW
 a5LSmSnxEfvwO1OVZWmOOIVqeRNZbPPl/81Z4YF0kUrAQbJjjqvKLW2ItmVDTS6f
 40lRkenYv7408Jsu0iYMwD+MCQ78qdoZKsLkvW/GeJd77dnMTvhRm8zrHv8+4f8O
 wPmAH1nYq2oQQccDPOsgacJ4afXrTw9gJucky0yc8sEA74sN2C/pPL6BrVcGB2W4
 sI2D99i0moUQUor6La9QYbSiQsYZPn4nCSgcdEL484X5baUGkueWRRTbDONaoqO3
 ag2Q66r3qomycb9IUdsCz0XWr1ju33r9gmmzdS1dMRgkzveMmjROIvYGj+KGQqbw
 ==
X-ME-Proxy: <xmx:ILeVWwIyjc2X6M8Zf4DdX9MS6QLwfxj748V8P6B105EHPHMpKEwT7g>
 <xmx:ILeVWwUNLWr7MDTeBq2t3hfJzOPVpgha1kwqcJ_jvXsI--VxVQi79w>
 <xmx:ILeVWyhSVy1wTTWuINsi3cTsqCDOkNhEHDd8ug2pucE1jZ5hpqXYsg>
 <xmx:ILeVW79opBhcliibXefGWNmbEZQM4rQYz_2A2BVSk5SutB2-xg3vKw>
 <xmx:ILeVW8AeyAPMcMRtHCQ2O7IrSboi7RjuVbPVWhPruAfNLa0PIgBmqA>
 <xmx:IbeVW-FWA_r8EgRqVHepyP2lFt8gdE4Aj8e7YQReWT3rpFARooFSTg>
X-ME-Sender: <xms:ILeVW02kwfL3al4tt2gz1pc-RCJqu7N51kZKob3baTjOqU4SL2gLwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id BA7D462673; Sun,  9 Sep 2018 20:13:20 -0400 (EDT)
Message-Id: <1536538400.4158781.1502248808.2193625F@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Patrick Venture <venture@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-1234af23
References: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
Date: Mon, 10 Sep 2018 09:43:20 +0930
In-Reply-To: <CAO=notxW6Yq+uct7quRtNjFfp0DeyrsqXuYJh1uuBx-cDEa_MQ@mail.gmail.com>
Subject: Re: tiny package --
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 00:13:32 -0000

On Sun, 9 Sep 2018, at 01:31, Patrick Venture wrote:
> Brad;
> 
> I was looking at publishing a single-header file from a package
> containing only that header file.  In this case, "oemgoogle.hpp" into
> the same place that phosphor-host-ipmid installs its headers so that
> any google-ipmi-* packages could store their OEM numbers in one file
> (upstream).
> 
> Downstream we store that file in our phosphor-host-ipmid mirror.
> 
> The advice I seek is -- it doesn't seem worth creating a separate
> repository for one file, but I know it's a frowned upon practice to
> store code in the bitbake repository -- but in this case, I feel like
> it may be appropriate.  Does that make sense?
> 
> I'm thinking:
> meta-google/recipes-google/ipmi/google-ipmi-header.bb
> meta-google/recipes-google/ipmi/google-ipmi-header/configure.ac
> meta-google/recipes-google/ipmi/google-ipmi-header/Makefile.am
> meta-google/recipes-google/ipmi/google-ipmi-header/oemgoogle.hpp

I think it makes sense, so +1 from me.

Andrew
