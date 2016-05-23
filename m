Return-Path: <clg@kaod.org>
Received: from mo69.mail-out.ovh.net (mo69.mail-out.ovh.net [178.32.228.69])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rD3BY1dXPzDqMb
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 01:59:16 +1000 (AEST)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 41078FF976D
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 17:21:27 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id DCF59540097;
 Mon, 23 May 2016 17:21:19 +0200 (CEST)
Subject: Re: Aims for BMC emulation in qemu
To: andrew@aj.id.au, Chris Austen <austenc@us.ibm.com>
References: <1463638966.2703.209.camel@aj.id.au>
 <20160521223211.26848C6042@b03ledav006.gho.boulder.ibm.com>
 <1463981199.2703.286.camel@aj.id.au>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, patrick@stwcx.xyz,
 teddy.reed@gmail.com
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57431FE2.3000506@kaod.org>
Date: Mon, 23 May 2016 17:21:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1463981199.2703.286.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2303028260960111487
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrfeelgdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 15:59:17 -0000

Hello,

On 05/23/2016 07:26 AM, Andrew Jeffery wrote:
> Hi Chris,
> 
> On Sat, 2016-05-21 at 22:32 +0000, Chris Austen wrote:
>> So in short I think we want to create a build environment that allows
>> for inaccurate systems.  Over time that environment should grow from
>> palmettoish to wedgeish, Zaius and witherspoonish
> 
> I tend to agree. 
> 
> My thoughts are that in general we should try to work upstream first,
> and to only send upstream something that's an accurate reflection of
> the hardware. However, sometimes there are work-arounds with desirable
> short-term benefits, and we should be able to accommodate these too.

yes. mainline qemu can also live with a slightly inaccurate model which 
we can patch later.

> As an alternative to a number of machines with different levels of
> accuracy, we can give the qemu fork on github a defined role: To host
> our integrated short-term work-arounds as we develop the right models
> to send upstream. As a concrete example, whilst the ftgmac100 model
> isn't functional, have the fork provide the Cadence GEM as a NIC. Once
> the ftgmac100 model is functional, send it upstream and replace the
> GEM.
>
> Any work-arounds included in the fork should have an obvious immediate
> benefit and a plan to phase them out, and if that's not the case then
> they should be rejected. If it's more work to maintain the hack than to
> implement an accurate model, then we should do the latter.

Are we planning to use travis to boot the generated flash image with qemu ?
and eventually run some tests in the guest ? 

> Is there any opposition to this approach?

Looks good to me. 


Here are some thoughts on devices we could work on to complete the model :

- uarts : quick one to get rid of the "serial8250: too much work for irq23"

- occ sensor model : to stress the kernel and user space.

- ftgmac100 : to be done.    

- bt : it would be interesting to establish a link with a powernv guest 
  or an ipmi host simulator. there is already a ipmi bmc similator.  

- smc : rfc available in my github. boots uboot. Mostly accurate I would
  say but a little ugly in some parts.  

- ...

Cheers,

C.
