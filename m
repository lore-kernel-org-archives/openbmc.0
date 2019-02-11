Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MR/Lb9FZ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aX0eN0vB"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yYgh1ZCyzDqMk
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 16:07:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A31921B20;
 Mon, 11 Feb 2019 00:07:25 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Mon, 11 Feb 2019 00:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:date:in-reply-to:references; s=fm2; bh=MQ5
 78F+mZdo+XeLkoRu3YzfODsy0ZfpIdtj4HV2g9B8=; b=MR/Lb9FZfH7wtyM2pdk
 2TQZouCFetmlW3BvB1YqdKrQDDBQ/VrWZl9EOD+rG+bIk64y5KuQsC+lmY+SHxuj
 AldD60Em5Pd6/2TiYU0symjm2g3lZ3tQoiBFDdH9BGqq0kXgAvAjOqtbp//0WVov
 BgbR1PzMMwMXCuQGjBSREIQWHRgN6F89TbH8G8L7fPpZsb8GQXAQ+TmLFERjpqnn
 kGTfHSEIYBh1aPZxQuorByCqHVFM5wdUpv7VdWwiQ2fnI1faLX7UOXhiGoR/a5D+
 mcEuOEC44G8TNeEKT3BQfBFhoxw9oGl76m+yiOuXyWp+LLe8m1ff70dFq3qjgRb3
 MUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=MQ578F+mZdo+XeLkoRu3YzfODsy0ZfpIdtj4HV2g9
 B8=; b=aX0eN0vBiUg7jCUXb/uNJt7DuRNOqzoBMnRd/W4EXOZncJ60MogUicTSJ
 IfW431XgOS8jTycjWzK7BGEX7dcU0tS/5ziziGnMCu+soRR4mJJgFv01odajtT99
 0P0513mHuh+uuQR9Pkfe+9aGjUuFALRaBDtIjzMU4l9pHBujULSKSpBQyOrHhiM9
 nziz5374oZ8lccW9X1jVPnb5+urXPpwdkgaYDXyhBRgpVzqhAghcVjWp5oqNHyXP
 ABJmcZ+MGY/FSU6l/1yigli/kvUIZQFJjSeu7JzSGh7p71lAYYTODevb7cCnEjKi
 nJPgSQQ5MmsKdnZIFYnFBYTcdVRkA==
X-ME-Sender: <xms:DANhXA5E9MJ_SL4f8J6C8Czs6E0Rhx8AmG-8k23EbK6w_ZA8ewo8tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrleejgdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffhvfgggfgtof
 fuffgjfhesthejredtredtjeenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceo
 rghnughrvgifsegrjhdrihgurdgruheqnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DANhXMqeObDruwoDei8dcmnImE4aIy-S-eX2J_prGZL66K6StLuTOg>
 <xmx:DANhXOXnDGhS4J6mxmLoYAR9k_1vRvwMpHgTmgCBxtI4AbHio1rVQA>
 <xmx:DANhXL7TOt-ZXPTlrFsCCbL38qo1GxuTThQJIQAt-sC76ozcZZ67PA>
 <xmx:DQNhXDByS-4jfWeENQ_4dhAdrMroWOwGP5wChipYFkcBslWRE9tfzg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8B3019E524; Mon, 11 Feb 2019 00:07:24 -0500 (EST)
Message-Id: <1549861644.1167682.1655236224.441279F1@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Alexander Amelkin <a.amelkin@yadro.com>,
 Stewart Smith <stewart@linux.ibm.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-950b8783
Subject: Re: Romulus to use Virtual PNOR
Date: Mon, 11 Feb 2019 15:37:24 +1030
In-Reply-To: <5b47c893-274b-2d8f-355c-4f565ddc2579@yadro.com>
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <fdc48c10-5dc1-0fca-7b7c-d150307b9a37@yadro.com>
 <87o97piwcp.fsf@linux.vnet.ibm.com>
 <5b47c893-274b-2d8f-355c-4f565ddc2579@yadro.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 05:07:29 -0000


On Thu, 7 Feb 2019, at 01:31, Alexander Amelkin wrote:
> 
> 06.02.2019 3:39, Stewart Smith wrote:
> > Alexander Amelkin <a.amelkin@yadro.com> writes:
> >> 25.01.2019 10:40, Lei YU wrote:
> >>> This email is to notify that Romulus is going to use VirtualPNOR feature, if
> >>> no objections are received.
> >>>
> >>> ...
> >>>
> >>> Any objections?
> >> Well, the main concern is how it will affect vesnin, which is P8-based (like palmetto).
> >>
> >> All this virtual PNOR functionality is based on mbox/hiomap, which is
> >> not supported for P8 in openpower firmware.
> > For various reasons, this is now changing, so you'll be able to do hiomap
> > on P8.
> 
> Could you please elaborate on this? Some GitHub issues or discussion 
> threads anywhere?
> 
> The problem as we see it is that P8 must be supported everywhere 
> throughout op-build components.
> Even if there was no support in hostboot for hiomap being added, we 
> could be able to add it ourselves. But that still wouldn't work with 
> SBE, as while the SBE sources for P8 are public, they nonetheless 
> require a proprietary toolchain to build that, I quote the README.md, 
> "cannot be open-sourced". The op-build framework takes pre-built SBE 
> binaries for P8.
> 
> Anyway, if hiomap support is indeed being added for P8, we'd love to 
> know more about it.

Hostboot support for hiomap on P8 has landed as of[1] (on the master-p8
branch). This should with the latest skiboot stable releases once I've fixed up
the P8 fallback support in skiboot master[2]. From there we need to get the
BMC-side fixed up (add the hiomap daemon) and we should be good to go.

[1] https://github.com/open-power/hostboot/commit/adb33e73b32c133dc9c6d23b695884d0d8c0ec9e
[2] https://github.com/open-power/skiboot/issues/217

> 
> >
> >> As a result, we suspect that palmetto and (what concerns us most)
> >> vesnin will lose firmware update support completely.
> > I think this is a valid concern, and I'd be concerned if there's tight
> > coupling between VPNOR and the firmware update APIs.
> 
> So far it looks to me like there is such tight coupling.

Yes, this is something I've been concerned about since its introduction.
The coupling is unfortunate and should be unravelled IMO, but that's
work that someone needs to take on.

Andrew
