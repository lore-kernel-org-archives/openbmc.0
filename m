Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.157.236; helo=10.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo6.mail-out.ovh.net (10.mo6.mail-out.ovh.net
 [87.98.157.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42tv3g0M57zF3TS
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 01:56:44 +1100 (AEDT)
Received: from player770.ha.ovh.net (unknown [10.109.146.53])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 06B0419817A
 for <openbmc@lists.ozlabs.org>; Mon, 12 Nov 2018 15:39:11 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id E80ABC00D8;
 Mon, 12 Nov 2018 15:39:05 +0100 (CET)
Subject: Re: [PATCH] qemu: aspeed_smc: Calculate checksum on normal DMA
To: Christian Svensson <bluecmd@google.com>, openbmc@lists.ozlabs.org
Cc: blue@cmd.nu, joel@jms.id.au, andrew@aj.id.au
References: <20181112142231.162425-1-bluecmd@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7b253e90-db3b-1863-613c-8a35edf32944@kaod.org>
Date: Mon, 12 Nov 2018 15:39:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181112142231.162425-1-bluecmd@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10416544466446814123
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrkeelgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
X-List-Received-Date: Mon, 12 Nov 2018 14:56:48 -0000

Hello Christian,

On 11/12/18 3:22 PM, Christian Svensson wrote:
> This patch adds the missing checksum calculation on normal DMA transfer.
> According to the datasheet this is how the SMC should behave.

The datasheet is not very clear on the topic. 

Bit 2 of FMC80 says :

	CheckSum Calculation Only
	0: Normal DMA operation
	1: Checksum accumulation only
	This bit is valid only when the DMA direction = 0
 
and one could understand that under Normal DMA operation, there is 
no Checksum accumulation. 

Anyhow, I am ok for adding the change. 

> Verified on AST1250 that the hardware matches the behaviour.

Did you check under u-boot, did you add DMA support to the Linux driver ? 
do you have a firmware doing so you could share ? I would like to check
for the ast2500.

Thanks,

C. 


> Signed-off-by: Christian Svensson <bluecmd@google.com>
> ---
>  hw/ssi/aspeed_smc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 55ceffe100..0dc22e44cf 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -871,6 +871,7 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
>          s->regs[R_DMA_FLASH_ADDR] += 4;
>          s->regs[R_DMA_DRAM_ADDR] += 4;
>          s->regs[R_DMA_LEN] -= 4;
> +        s->regs[R_DMA_CHECKSUM] += data;
>      }
>  }
>  
> 
