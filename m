Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B4DJ2M1PzDrg5
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 18:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="oRV8pejk"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43B4DG56p3z9s0n;
 Fri,  7 Dec 2018 18:41:50 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1544168511; bh=H1GqbXqnPM8RwFjSWF9LeZmHT8AcjR1Ke17MmmbAY3o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oRV8pejkuodowpqzyaBOM12Fae4Xla2CeNRLHvARxTlaDpwck/L5EplnpjMuS8tly
 7g/mBunJdZltSMLJEo3ggM57ofCeBM252FaqlL740R3mgOy29wmH60hxU3MPgNSO2e
 DX2Ff/4dZ7MLx4GcLYX+ysdcoruJC+TToQYulYxith548Y+QxnASriHFcytOd6twVb
 vd0b9ihQPUSU7ln++zKQu7aETpA0r5HJ/7Q8smKgrD41Z45JEftQw3OVy+LlKvXZ4L
 9fRxJEuqJ4To+jD4UAqTm5Ri0DTtNh2qcjr/cmIcEB3RhEgGjYZoc/JiQzfTe2qPkO
 NCFczrEVTpZ+w==
Message-ID: <0836fa0be44c76b7d33115c2c8c834db03b94aad.camel@ozlabs.org>
Subject: Re: Initial MCTP design proposal
From: Jeremy Kerr <jk@ozlabs.org>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, openbmc
 <openbmc@lists.ozlabs.org>
Cc: Emily Shaffer <emilyshaffer@google.com>, David Thompson
 <dthompson@mellanox.com>, Dong Wei <Dong.Wei@arm.com>, Supreeth Venkatesh
 <Supreeth.Venkatesh@arm.com>, "Naidoo, Nilan" <nilan.naidoo@intel.com>
Date: Fri, 07 Dec 2018 15:41:49 +0800
In-Reply-To: <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
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
X-List-Received-Date: Fri, 07 Dec 2018 07:41:53 -0000

Hi Deepak,

Thanks for the feedback! From your comment:

> > I see two options for the "inbound" or "application" interface of
> > the
> > MCTP daemon:
> > 
> >   - it could handle upper parts of the stack (eg PLDM) directly,
> > through
> >     in-process handlers that register for certain MCTP message
> > types; or
> 
> We'd like to somehow ensure (at least via documentation) that the 
> handlers don't block the MCTP daemon from processing incoming
> traffic. The handlers might anyway end up making IPC calls (via D-Bus) 
> to other processes. The second approach below seems to alleviate this
> problem.

There are two design elements there:

 - requiring that the handlers do not block; and

 - whether the handlers are implemented in-process, or remotely over IPC

and I think that while they're related, the non-blocking-behaviour
doesn't necessarily require either in-process or IPC. As long as we have
the right interfaces, we can make that decision separately.

IUf we use IPC, we'd still need to make sure that the IPC mechanism
doesn't block, so we'd have similar issues either way.

Cheers,


Jeremy
