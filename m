Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zGQF2lCfzDqL4
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 19:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="ps8Nmka3"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43zGQC6sxrz9s4Z;
 Tue, 12 Feb 2019 19:43:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1549960996; bh=WznQUvUL1Lq2Ur6WRA4xd59OHfNBmpzCoKRu7yCfhKg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ps8Nmka3O1TukyWbDyWZqtKy1BDItUX8j/WDJQusKc0R2Oj+abtRf7du6su4hpx4Q
 JPLmk4zoJJansss6VKp4iwolq12+oJvWOZJGcvYNABoS3JZnhWKksKkbh1/hxnHcn4
 2rDFLwZOwKx4bc0ahyNe1FGs/B2aZuC0RZzK+C/ZskbRAK+srcS8vQGBJqtve2xbJ0
 TBWK/0VrMfirJWjto/jvddSw3KU7kX32rOH+VUXJjOtP/MG0+66/jbc/p/HNTYrKHe
 ufcWxUjsh8Xp0tpeEDmG2Osf3bGgK9oKq/zHuHhq4L2wlr+N4l3/nAnNwhW8RwXMY8
 bzLW4iKCJGZcQ==
Message-ID: <9c1410a1255d49735b7a9879750557bc92acaa47.camel@ozlabs.org>
Subject: Re: Initial MCTP design proposal
From: Jeremy Kerr <jk@ozlabs.org>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Emily Shaffer <emilyshaffer@google.com>, David Thompson
 <dthompson@mellanox.com>, openbmc <openbmc@lists.ozlabs.org>, Supreeth
 Venkatesh <Supreeth.Venkatesh@arm.com>, "Naidoo, Nilan"
 <nilan.naidoo@intel.com>, Dong Wei <Dong.Wei@arm.com>
Date: Tue, 12 Feb 2019 16:43:14 +0800
In-Reply-To: <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
 <20190211185736.dafbfc74n76r33pu@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 12 Feb 2019 08:43:18 -0000

Hi Brad,

> > If we go ahead with the MCTP designs, and want to use this, I'd
> > propose
> > moving it from my personal github repo into /openbmc/ (after
> > suitable
> > updates to get it into OpenBMC standards, of course). Patches
> > welcome!
> 
> There was some interest in performing a formal code review on Gerrit
> of
> what you have written thus far (or intend to distribute).

I'm okay with that, but I expect there to be a lot of churn while we
work out the prototypes, which might make the formal reviews a bit
pointless (if we end up throwing out the code that gets review).

For example, we don't yet have a solid demonstration that the interfaces
are fit for what we need. That'll shake out as part of the prototyping
work that I'm doing now, but there may be changes needed between now and
then.

> To that end I could create an initial empty repository in the openbmc
> namespace and you could push your tree there for review, when you are
> ready.  How does that sound?

Yep, I'd be happy to do this when we decide on a good time to do the
reviews.

Cheers,


Jeremy
