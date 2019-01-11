Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.36.149; helo=4.mo179.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1046 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Jan 2019 21:32:13 AEDT
Received: from 4.mo179.mail-out.ovh.net (4.mo179.mail-out.ovh.net
 [46.105.36.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bfLj4RghzDr1C
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 21:32:12 +1100 (AEDT)
Received: from player763.ha.ovh.net (unknown [10.109.146.240])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 009551103FE
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 11:14:41 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 4625218CE262;
 Fri, 11 Jan 2019 10:14:36 +0000 (UTC)
Subject: Re: [RFC qemu legoater/aspeed-3.1 0/4] Handle short timer periods
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190111035638.19725-1-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a0e97564-63de-0820-d550-d2b45e92bee0@kaod.org>
Date: Fri, 11 Jan 2019 11:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190111035638.19725-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7823034030718159717
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 11 Jan 2019 10:32:14 -0000

Hello Andrew,

On 1/11/19 4:56 AM, Andrew Jeffery wrote:
> Hello,
> 
> We've had an issue for a while, since the introduction of 4451d3f59f2a
> ("clocksource/drivers/fttmr010: Fix set_next_event handler") in Linux, where
> our qemu instances have a "sticky" behaviour. The VM becomes unresponsive at
> unexpected times for unpredicable but often long periods of time.
> 
> This series, along with the associated patch to Linux's fttmr010 driver[0],
> aims to resolve it.
> 
> [0] http://patchwork.ozlabs.org/patch/1023363/

I gave the whole a try and on a x86 host, QEMU reaches :

[    8.282333] systemd[1]: Set hostname to <romulus>.

on a ppc64el :

[   11.497910] systemd[1]: Set hostname to <romulus>.

which is much better than before.

As the QEMU patchset does not seem to impact support for older images, 
I have updated the aspeed-3.1 branch and also created a new branch for 
dev : aspeed-4.0.

> The series an RFC series because it doesn't fix all the cases, just
> demonstrates a potential way forward. The approach is to provide back-pressure
> - to test if the reload value is set to a value that's smaller than some
> experimentally determined value (in this case, 20us), and if so, configure a
> period of at least 20us. The MAX() of the requested and minimum values is then
> set in the reload register rather than the requested value, which can then be
> read back by Linux. The fttmr010 driver, upon observing the greater value,
> starts pushing back on the clock event subsystem, which then iteratively
> determines a minimum acceptible event period before proceeding with the boot
> process.
> 
> The implementation does not take care of the match register cases, but at the
> moment they are unused by Linux on Aspeed SoCs. The match register case is not
> taken care of because I'm not sure if this implementation is what we want to
> use going forward, or whether we want to do something that's completely hidden
> in the qemu model. However taking advantage of Linux's existing support for
> determining minimum timer periods seemed like easy solution.
> 
> The stickiness turns out to be a consequence of Linux configuring a very short
> timer period (1us, mostly due to the timerio_rng driver), which causes qemu to
> spend a large chunk of its timeslice handling the host timer interrupt rather
> than executing guest code.
> 
> Please critique!

We are adding another QEMU HW tweak in Linux. We need feedback from the
Linux maintainers I would say.

Thanks,

C. 
 
> 
> Andrew
> 
> Andrew Jeffery (4):
>   timer: aspeed: Fire interrupt on failure to meet deadline
>   timer: aspeed: Status register contains reload for stopped timer
>   timer: aspeed: Fix match calculations
>   timer: aspeed: Provide back-pressure information for short periods
> 
>  hw/misc/aspeed_scu.c            |  6 ++++++
>  hw/timer/aspeed_timer.c         | 37 ++++++++++++++++++++++++++-------
>  include/hw/timer/aspeed_timer.h |  1 +
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
