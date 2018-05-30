Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jjl7IHF/"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RgOCmcU3"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wWtJ1pdRzDr30
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 10:38:47 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F58A21BAB
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 20:38:45 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 29 May 2018 20:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=uHnVY1lhqMQ/U4DbRUkX0ZsXqU0Pc
 HwkOmRQnL7G/bM=; b=jjl7IHF/kaMHuAyeD2QWWb1hfQ3FZ98EuH58vvCDpWcbs
 mP/WXwJIyYKedN1eySoKSYA0tQTZV+UQ4RrWcfGK7vs9pYMXlCSmTqCzxiioxiAb
 bI7dXnEobEhxDjNEnNfHD03r/vx+Tt8k1de8xySrSz1p+7c3iFgC464P3gIciP23
 /WRlW1sme1irsvislGYFIgL4A0w2wNYjEHpl4jGkPk4Wf1r08rbiLW4/CW3+ygWK
 c1AaY++29L/zfOhrXe8MPpI6jZB1qh3m7kUKrE+Fki4fEDQF6s26KxfsqXm7DEIH
 6PWZbWsKhmnTvG4Vks32mNtGG7EUl5w6tWf12LABA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uHnVY1
 lhqMQ/U4DbRUkX0ZsXqU0PcHwkOmRQnL7G/bM=; b=RgOCmcU3eu6TQIdCgJVRTR
 1/EIFc4r42tH2ORCP7Z1KRxl2i7yTJOYOr8tIZNu3edO6ThPxTL4j5w1nq2hKLiT
 37kuOekHLaXdaYnHc2gAUUp/OhUdjJ202KJuy06+2dT6Kj1p0Rz6tqYgEUbFKmSk
 f2iIEGfXICPZMwsmlvThH6/8Bk59fFuMgXTBK8r06sVVyhd1kYisTWl2CnMrf1Rd
 IazqvAiP8BgCFWfGDsgLOpOzXMBlhER2n0FrCckJF6cY2A4ErJrkKxyN+VhZavq8
 +Os0iUrJCR7zB1DIyDu5epWOHWkbPR9k1JFtqfjChJLv3aemF0Te5ufS1HxfdNPw
 ==
X-ME-Proxy: <xmx:lfINW_dkPM6OzWbRgsZUDg3KOwClI016G-VCBny06NIeMeTJY-54Mg>
X-ME-Proxy: <xmx:lfINW-JFhUeGt0PJ4rxNReTPgmyJtpWNdt8aF5vplOKsxq9gFRMN3g>
X-ME-Proxy: <xmx:lfINW107mDrbCtvevk2VZa13WrRNDNJvCgoLvvt2UZUAPdFfi6rCsg>
X-ME-Proxy: <xmx:lfINW0qHgAZgXA4sQBPXfzgHFwlIk4Jrc2c3AbyDfvH5fMY1HYJIQg>
X-ME-Proxy: <xmx:lfINW9rSJVqO5Dl5oku34brPcJ0xUEv0ubvApEfhbltWjIkI_iGb-g>
X-ME-Proxy: <xmx:lfINW9iKwdfzqcqko3beytkC5D5r2UgDNXNzCRHdkPzeWs9c94gqOw>
X-ME-Sender: <xms:lfINW0dE4SZb4wGWogz2lWc8wRk-HM950Ae8B2KNVnsLhLI1JRBWig>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 428E5BA780; Tue, 29 May 2018 20:38:45 -0400 (EDT)
Message-Id: <1527640725.1548539.1389826896.64777E84@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
In-Reply-To: <CACPK8Xc_gTiJaCUzDiG6aNOu7rF6gU3e_oc-bd19bOswju7yTw@mail.gmail.com>
Date: Wed, 30 May 2018 10:08:45 +0930
Subject: Re: Gerrit +1 policy
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
X-List-Received-Date: Wed, 30 May 2018 00:38:49 -0000



On Tue, 29 May 2018, at 22:23, Joel Stanley wrote:
> I get frustrated by Gerrit removing +1s from patches when I make a
> small change to the commit message.
> 
> This is a configurable option in Gerrit:
> 
> https://gerrit-review.googlesource.com/Documentation/config-labels.html#label_copyAllScoresIfNoCodeChange
> 
> I would like to propose we change this setting to true.
> 
> The downside is someone could radically change the content of their
> commit message that you've +1'd. However the maintainer still gets a
> chance to pull someone up on this if they think someone has pulled a
> swift one.
> 
> If there are some repositories that would like to maintain the status
> quo, this could be done at the top level, so that all repositories
> inherit the new default, but would allow for individual projects to
> override the setting if they desired.
> 
> Cheers,
> 
> Joel

Jumping on the bandwagon here: +1 from me!

Andrew
