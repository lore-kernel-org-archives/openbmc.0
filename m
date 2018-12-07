Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BQN62LvhzDvHQ
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 08:19:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Keqduboa"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43BQN523nwz9s3C;
 Sat,  8 Dec 2018 08:19:48 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1544217589; bh=aMYj4ugeF60xybIYAQPITdQ+XVJAI0OJRxH3MHxGI5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KeqduboaMyREUh0dDJfnkE9AajsBSL+p8tEcX0nW8h8rQ+rRl7Hant4AZvCChhY+N
 EwRJxVvDTIUude+MC+K7pLQD3Vmy2kE+vqHMXHs3bbwhw2gKGZoRQbj4FD4SAer+8X
 lesFpze1nESXKbp9DDe3MyEXCLOSiqwo6RKdIKJ3DJuGCznG8kOtNun4HnaWZO+BSh
 Kmjw3+ho6sxUBkhUmFPvXcbGVg0qZj+qgH6sIyWD8h6kDZMnDrtAUGwzBW6BEMu0Bs
 4+pVJuQgR4U9p550/9oqwjtXSoW/8qWIGnnREr/W/Q0ZJKD2r1B/wt2wH9DrXeWPCW
 NE5lZFwIjF5Bw==
Subject: Re: Initial MCTP design proposal
To: Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <supreeth.venkatesh@arm.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>, David Thompson <dthompson@mellanox.com>,
 Dong Wei <Dong.Wei@arm.com>, "Naidoo, Nilan" <nilan.naidoo@intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
 <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
 <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <6aab6690-5318-28f4-ca77-798f58971277@ozlabs.org>
Date: Sat, 8 Dec 2018 05:19:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 07 Dec 2018 21:19:51 -0000

Hi Emily,

> I had a couple comments on the initial draft.

Super, thanks for taking a look.

>      > > A final important point is that this design is for the host <-->
>      > > BMC
>      > > channel *only*. Even if we do replace IPMI for the host interface,
>      > > we
>      > > will certainly need an IPMI interface available for external system
>      > > management.
> 
> 
> I'm not sure it's correct to demand external IPMI. Most of OpenBMC 
> community (ourselves excluded :( ) is turning towards Redfish for this 
> role.  The external-facing IPMI specification is insecure at the 
> standard level, so I don't think that we should be encouraging or 
> requiring it anywhere, even in an unrelated doc.
> tl;dr I think you should be more generic here and not specify IPMI for 
> external mgmt

OK. I didn't intend to introduce any requirement on IPMI there, even 
implied, so I'll reword.

However, I think there is still a lot of external dependence on an IPMI 
interface - it'll be a while before everyone rewrites all of those 
custom IPMI-based in-house provisioning systems that are out there.

> Love the idea of the implementation being bidirectional and able to be 
> dropped onto the host side as well, but I must be missing why that 
> requires we write it in C.  Are we targeting some platform missing a C++ 
> cross-compiler implementation? If we're implementing something new from 
> scratch, I'd so much prefer to bump up the maintainability/modernity and 
> write it in C++ if we can.  Or could be I'm missing some key reason that 
> it follows we use C :)

We (and others) have host firmware written in C.

We can always link C to C++, but not the other way around, and it'd be 
fairly straightforward to implement a C++ wrapper for this, which could 
even live in-tree.

Cheers,


Jeremy
