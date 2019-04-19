Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.165.38; helo=6.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 6.mo2.mail-out.ovh.net (6.mo2.mail-out.ovh.net [87.98.165.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lnBQ5Sj1zDqT7
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 17:08:26 +1000 (AEST)
Received: from player726.ha.ovh.net (unknown [10.108.35.12])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 9C99618D564
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 09:08:21 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id C63004DBCBE7;
 Fri, 19 Apr 2019 07:08:16 +0000 (UTC)
Subject: Re: [PATCH dev-5.0 0/4] spi-nor: aspeed: add support for the 4B
 opcodes
To: Milton Miller II <miltonm@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
References: <20190417133941.22962-1-clg@kaod.org>
 <OFCF240B5C.80D7E82E-ON002583E0.007C1F22-002583E0.007CAC95@notes.na.collabserv.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8af23086-0008-ee32-567b-b9c085402561@kaod.org>
Date: Fri, 19 Apr 2019 09:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <OFCF240B5C.80D7E82E-ON002583E0.007C1F22-002583E0.007CAC95@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8351081086579805099
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrfeeigdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 19 Apr 2019 07:08:31 -0000

On 4/19/19 12:41 AM, Milton Miller II wrote:
> About  04/17/2019 08:55AM in some timezone, Cédric Le Goater wrote:
> 
> 
>>Here is a little series providing cleanups on the Aspeed SMC
>>Controller
>>driver and adding support for the 4B opcodes which were recently
>>added
>>to the Linux kernels 5.0.x.
>>
>>The use of the 4B opcodes was breaking the read of the golden buffer
>>done at slow speed in the optimization read sequence. The code
>>assumed
>>that the chip was in 4B address mode, as if a EN4B opcode had been
>>sent, but this is not the case anymore with 4B opcodes. The golden
>>buffer is now read with a SPINOR_OP_READ_4B (0x13) when the chip
>>supports 4B opcodes.
>>
>>It should fix accesses to the palmetto PNOR and the Witherspoon BMC
>>flash modules.
>>
>>
>>*Please test !*
> 
> 
> Cedric,
> 
> did you notice that spi_nor_read_sfdp is now calling the nor->read method?

yes. 

> Since the read method is hard-coding the opcode, this means that we are
> returning random flash contents instead of the flash parameter block, which
> probably confuses the kernel.

I see your point. but, at the time of the sfdp read, the controller settings 
are very basic :

  [    7.537426] aspeed-smc 1e630000.spi: default control register: 00000300

and the sfdp values are fine. 

Here is what we get for sfdp on a palmetto PNOR "mx25l25635e" :

  w5:fffffffe w6:ff00ffff w7:eb44ffff w8:520f200c w9:ff00d810 w10:00000000

This looks consistent with the mx25l25635f specs and with the test being
done in Linux in mx25l25635_post_bfpt_fixups().


This driver needs a rewrite because the SPI-NOR layer has been changing 
a lot. I have started a new one on top of spi-mem but the core layer 
misses support for link training. So this is still work in progress.
Help welcomed. The initial target should be *mainline*.


Also,


If someone had some time to model SFDP in QEMU, it would really help. 
We would have caught this regression earlier. 

One way to reproduce the problem in QEMU is to force 4B opcode in Linux 
but that's only useful when one knows about the problem already. useful 
to work on the fix but not to track regressions.


Thanks,


C. 


> 
> milton
> 
> 
