Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IXOZ2/5j"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gDhFWc8l"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449T0p0NKWzDqLJ
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 10:15:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE10222D16;
 Thu, 28 Feb 2019 18:15:00 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 28 Feb 2019 18:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:in-reply-to:references:date:from:to:cc:subject
 :content-type; s=fm2; bh=XRlTN0+ARhHKWP4hSMuc/WJ1nuuoHl5vKtnUdhM
 v3QE=; b=IXOZ2/5jwvmsWpQV38/xZtbaj+GC6EcCiTibiIj3VkVoQ4iuEMvYDgk
 i0+/d5LJUAQMtgzcD2YSoFUVWUJevIJLJM6iOZEm5s6oRPy9fKH39ml0XxJi70HF
 tqle068F/ccxhdpcIP19qg6a8GXljvaQCgCBvZl9yb5XpZaf91ghYrvu3XUoxOks
 PJElTu3nG3nSvjwQNDeABKs9tkOmm2F9H3cm13GBuFWs/zTiVhNXPhMWX19oO+V8
 fzvcV5UK0U3eJ3JSFRxDPiV9UrDMHksb1klxu/vNPyxwsIkUL5ag3gjYTwTut1RZ
 Ez4Fp2iACgQzbOgLkE6gupc3ysYS4IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XRlTN0+ARhHKWP4hS
 Muc/WJ1nuuoHl5vKtnUdhMv3QE=; b=gDhFWc8lCKzzlwjjGiQQO3DAsP7AG8hyr
 BM2HAZsr9sc/plRrWyf0FIplORoaQ/oBE1yUSZ7hnMuWENT2pYzzUvaNbF+fRV9x
 HI0xOAJTqJ0Ott7L5x7tf7zK7r+ULNSJoVGRhnLtvZSnZlP+q2QHb7VajZU24fIk
 vrsvVKkjS793ys9RzIex5bqaLHTJTgaNZznGm8uWGkHOL6WdFpEWvrJFnug4lkox
 zv+7reiomaTT9TuDaj6UkFCqqVChQR5buIOoXIspwp+yOqpEZYUUSwAj1EQonMXb
 +diZaa/GYzv41ZrpkSKNe4eUVp2fS1kJcpTZ9o5NiP79xcgLxblQw==
X-ME-Sender: <xms:c2t4XA-xh4MwXTx-PGZX60_S_FV-u8pX5YjCJ58MekyRdcGXrBkMng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrvdeggddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddujedmnecujfgurhepofgfkfgjfhffhffvufgtsehttdertderredt
 necuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrd
 hiugdrrghuqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidp
 ghhithhhuhgsrdgtohhmpdhoiihlrggsshdrohhrghenucfrrghrrghmpehmrghilhhfrh
 homheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:c2t4XLUco7nrKa9taa4DaiLLdWCcsP_IkyfUGcba51zHphvGRHOJeA>
 <xmx:c2t4XFiFM10kCFSzHJ0VkJmLhwy9NxD1U8OhAwdshPGwq48RySQWTQ>
 <xmx:c2t4XBzKYuUBIsRnAFfDei0c6kDbxNLv9lcnsIVHKF7MeuE6sOgoLA>
 <xmx:dGt4XNzza_Pxok07DLtFMUfdE5JKp2EsFAU6p7NGtQh9Tl2l37jCdg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D19977C1EB; Thu, 28 Feb 2019 18:14:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-925-g644bf8c-fmstable-20190228v5
X-Me-Personality: 52947553
Message-Id: <17672106-f35f-44d6-b10f-1e7b95fc0578@www.fastmail.com>
In-Reply-To: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
References: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
Date: Thu, 28 Feb 2019 18:14:59 -0500
From: "Andrew Jeffery" <andrew@aj.id.au>
To: Mine <mine260309@gmail.com>, "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Cc: "Alexander Amelkin" <a.amelkin@yadro.com>
Subject: Re: Static layout PNOR support in openpower-pnor-code-mgmt
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
X-List-Received-Date: Thu, 28 Feb 2019 23:15:09 -0000



On Thu, 28 Feb 2019, at 17:47, Lei YU wrote:
> As a follow up of [VPNOR discussion][1], the static layout PNOR
> support in openpower-pnor-code-mgmt is implemented and pushed to gerrit
> starting from 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18747/
> 
> Code reviews and tests are welcome.
> 
> To test the feature:
> 1. Pick the above gerrit commits and build with --disable-ubifs_layout

This is a monstrous nitpick, but any chance we can avoid mixing '-' and '_' in the option
name? I very much prefer just using '-' for visual consistency.

> 2. Generate pnor in static.tar.gz format, by below command:
>     ./generate-squashfs <xxx.pnor>   # xxx.pnor.static.tar.gz will be generated
>    This tar.gz will be used to do the code update.
> 3. Do code update, gard reset, factory reset the same as VPNOR, described in
>    [host-code-update.md][2] and [REST-cheatsheet.md][3]
> 
> I only tested it on Romulus, and will test it on Palmetto. Hopefully it will
> be tested on other OpenPOWER machines before the patches are merged.

Awesome work! Thanks for sorting this out.

> 
> Note: image verification feature is not implemented yet.
> 
> [1]: https://lists.ozlabs.org/pipermail/openbmc/2019-February/015104.html
> [2]: https://github.com/openbmc/docs/blob/master/code-update/host-code-update.md
> [3]: https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md
>
