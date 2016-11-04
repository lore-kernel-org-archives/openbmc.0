Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9RH33V5JzDvHd
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 02:54:38 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id EF68718F7E
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 16:54:33 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 81B083C0096;
 Fri,  4 Nov 2016 16:54:32 +0100 (CET)
Subject: Re: U-Boot upstreaming
To: Maxim Sloyko <maxims@google.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
Date: Fri, 4 Nov 2016 16:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12626123032003447554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeelgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 15:54:39 -0000

Hello !

On 11/03/2016 09:44 PM, Maxim Sloyko wrote:
> Hi Cedric,
> 
> My manager (Rick Alther) mentioned that you were working on some 
> minimal "upstreamable" commit for Aspeed in U-Boot. How far were 
> you able to get?

Please check :

  https://github.com/openbmc/u-boot/wiki

This is where we track the ugly details and here is my tree : 

   https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc

Patch one is the "minimum" we have been working on with Joel these
last 6 months to :

 * make it compatible with upstream
 * extract all exoticisms 
 * extract funky drivers
 * isolate ugly hacks

I think we are at a point where we need to rewrite bits of lowlevel_init
or move them later on in the code. This big asm routines does : 

 * LPC patching for ast2300 (we can kill that)
 * uart init (if SDRAM calibration is done, easy we can keep)
 * SDRAM calibration (we could use static calibration values instead)
 * SDRAM size calculation (may be we can move that in a C part)
 * video clock setting (one reg setting)
 * JTAG master (one reg setting) 
 * RMII/RGMII clock setting (one reg setting) 
 * GPIO massive reset (not sure if this is useful, should ask Andrew)
 * SPI Calibration (I have done in C so we can move)

> This is also what I was thinking of doing, so we should be able to join forces on this.
> 
> I talked to Simon Glass recently (he's an active contributor to mainline U-Boot)
> and basically that's the path that he also recommended -- just getting minimal amount 
> of code in, that can just boot to a prompt. He also said that DRAM driver would have 
> to be part of it.

yes. See my comments above. 

> So, the way I see it, there are two big chunks of work here:
>  1. Setting up the whole structure. This would include actually adding a board, minimum 
> amount of supporting code, debug serial console init, 

yes. that is patch one above, in which we still need to cleanup 
stuff in the .S part.

>  2. DDR3/DDR4 driver. This is the biggest part of what we have in platform.S now. A lot 
> of work, but relatively straightforward, just rewrite ~1.5k lines of assembly in C.

I am not sure this is feasible, AFAIK, you can not call C. I might
be wrong.

> Personally, I don't have preference on who does what, as long as we don't step on each 
> other's toes. It would probably be easier for me to take (1), because I can easily talk 
> to two people who are in our time zone and have a lot of mainline U-Boot experience.
>
> Thoughts?

you could send patches on top of my tree to cleanup what ever 
part you want in lowlevel_init. when lowlevel_init reaches a 
minimum acceptable level, with a full patchset working on top 
of it, I think we can send for review. Then, we will work on 
the next details :

 * extra settings
 * spi/nor driver
 * ftgmac100 extensions for Aspeed
 * NCSI support
 * DTS support
 * etc. 

There is also a massive hack on the ast2500 mmu disablement in 
the core part of u-boot that I don't understand. So we could 
try to fix now or ask help when the patchset is sent.  


Cheers,

C. 
