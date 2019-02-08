Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wm3F4Fb3zDqVb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 17:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="XYFzxcTn"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43wm3D08Qnz9s4Z;
 Fri,  8 Feb 2019 17:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1549608489; bh=LUBvZR+OfIp0b9NPP7uc89/U1eV8XEU6Q/8YLxVLhGc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=XYFzxcTn+Eld2G/3Yc58oXFxprkz2ElZY6Ku03at1wjyhkxm0xsLy/MdZgF2HpBJc
 61suuH5i1jBaEp6fmP/AIj08ycKUmYh2j5ce2rZeo1Zny4JFcY8pIXsjFRlGzkbYkr
 Tz1dgcKMOllu9YgtMs7xedeUEtIQNQg2bmRGMXGb3UsiKdCWIPFS16wAQ//auAtB+p
 yG6iyQnglRnxBlMnEgSenuB4zfe2hJ71GOE+lK5B6n/rnenrSxjYDc+WADn8Z99hwM
 vwRpmcFQXnvRbSEfvEX5qQaRqFUDkA8HKL4eVZjs0EVudnnIHk3MaVI3QIxEy98x7V
 eJIJu7RdOdZZw==
Message-ID: <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
Subject: Re: Initial MCTP design proposal
From: Jeremy Kerr <jk@ozlabs.org>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, Emily Shaffer
 <emilyshaffer@google.com>,  David Thompson <dthompson@mellanox.com>, Dong
 Wei <Dong.Wei@arm.com>, Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>,
 "Naidoo, Nilan" <nilan.naidoo@intel.com>
Date: Fri, 08 Feb 2019 14:48:05 +0800
In-Reply-To: <20190207155131.gzntyqoflqfw5vld@thinkpad>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 08 Feb 2019 06:48:10 -0000

Hi Brad,

> Were you planning on submitting this to the docs repository as a
> design?

Yes! :)

> Do you need some help with that?

Just a nudge into doing so, which your email provided!

I've just pushed to gerrit:

  https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18089

- this is the doc that I'd originally sent out (top of this thread), and
incorporating suggestions discussed there.

In the meantime, I've mainly been working on the prototype sketches for
the MCTP library, and I've just pushed that too:

  http://github.com/jk-ozlabs/libmctp

It's very prototypey at this stage, and I'm open to input and pull
requests. I'm going to be quite permissive with accepting changes at
this early stage...

If we go ahead with the MCTP designs, and want to use this, I'd propose
moving it from my personal github repo into /openbmc/ (after suitable
updates to get it into OpenBMC standards, of course). Patches welcome!

Cheers,


Jeremy
