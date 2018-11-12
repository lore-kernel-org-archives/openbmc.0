Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.1; helo=3.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4691 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Nov 2018 06:55:30 AEDT
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net
 [46.105.34.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42v1hL2VYJzF3Bf
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 06:55:28 +1100 (AEDT)
Received: from player795.ha.ovh.net (unknown [10.109.159.248])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 4A55DDFF4B
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 19:37:12 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 6A5C01200B3;
 Mon, 12 Nov 2018 19:37:07 +0100 (CET)
Subject: Re: [PATCH] qemu: aspeed_timer: Use signed muldiv for timer resets
To: Christian Svensson <bluecmd@google.com>, openbmc@lists.ozlabs.org
Cc: blue@cmd.nu, joel@jms.id.au, andrew@aj.id.au
References: <20181112142137.160970-1-bluecmd@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21acbd66-c75c-d5e3-fcfb-fa75421a7879@kaod.org>
Date: Mon, 12 Nov 2018 19:37:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181112142137.160970-1-bluecmd@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14436288608637324203
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrkeelgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
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
X-List-Received-Date: Mon, 12 Nov 2018 19:55:30 -0000

On 11/12/18 3:21 PM, Christian Svensson wrote:
> If the host decrements the counter register that results in a negative
> delta. This is then passed to muldiv64 which only handles unsigned
> numbers resulting in bogus results.
> 
> This fix ensures the data being operated on is signed before it is
> ultimately casted to the final unsigned value.
> 
> Test case: kexec a kernel using aspeed_timer and it will freeze on the
> second bootup when the kernel initializes the timer. With this patch
> that no longer happens and the timer appears to run OK.
> 
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> ---
>  hw/timer/aspeed_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 9acd1de485..1a54d85e9d 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -253,7 +253,7 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
>              int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
>              uint32_t rate = calculate_rate(t);
>  
> -            t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
> +            t->start = (int64_t)t->start + ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);

isn't QEMU using the helpers from :

	include/qemu/host-utils.h

which do about the same ?

Thanks,

C. 

>              aspeed_timer_mod(t);
>          }
>          break;
> 
