Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.42.102; helo=4.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net
 [46.105.42.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vKxB6cHczF3JV
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 19:07:41 +1100 (AEDT)
Received: from player726.ha.ovh.net (unknown [10.109.143.249])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id BE69F31CDA
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 08:28:00 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id C5BB72A00BD;
 Tue, 13 Nov 2018 08:27:58 +0100 (CET)
Subject: Re: [PATCH qemu aspeed-3.1 0/2] aspeed: Guest to exit on shutdown
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20181113030421.6264-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <67d2c53b-f6c2-6454-a788-d690295e32b0@kaod.org>
Date: Tue, 13 Nov 2018 08:27:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113030421.6264-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9007199257853004546
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrledtgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 13 Nov 2018 08:07:43 -0000

On 11/13/18 4:04 AM, Joel Stanley wrote:
> With this change to qemu and CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> enabled in the kernel, the guest will cause qemu to exit when performing
> a shutdown. This is useful for detecting the end of a successful CI job.

Excellent !

> This is only relevant when passing the device tree to Qemu with the -dtb
> option.

Can't we find a way to inform Linux that it's running on a "virtual" 
QEMU Aspeed machine ? 

> It only supports the ast2500 so far.

I pushed the patches in aspeed-3.1

Thanks,

C. 

> 
> Joel Stanley (2):
>   aspeed: Add syscon-poweroff to system
>   aspeed/scu: Implement power off command
> 
>  hw/arm/aspeed.c      | 35 +++++++++++++++++++++++++++++++++++
>  hw/misc/aspeed_scu.c |  5 +++++
>  2 files changed, 40 insertions(+)
> 
