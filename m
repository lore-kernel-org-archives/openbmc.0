Return-Path: <clg@kaod.org>
X-Greylist: delayed 5100 seconds by postgrey-1.35 at bilbo;
 Mon, 27 Jun 2016 20:26:05 AEST
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdQ7x4v5VzDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 20:26:05 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 61214FF9355
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 12:17:18 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id DBE2B240087;
 Mon, 27 Jun 2016 12:17:16 +0200 (CEST)
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc/v2016.05-ast2500] aspeed:
 fix compile warning in memmove_dma()
To: Joel Stanley <joel@jms.id.au>
References: <1467017008-18792-1-git-send-email-clg@kaod.org>
 <CACPK8XejZmKUXpb0PO6xS6y-0rqUmkDVsBXh15=x3u1nsaqVYA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0eb397f4-58c7-2a58-3751-5970ac317ad1@kaod.org>
Date: Mon, 27 Jun 2016 12:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XejZmKUXpb0PO6xS6y-0rqUmkDVsBXh15=x3u1nsaqVYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18243519143737789186
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 27 Jun 2016 10:26:06 -0000

On 06/27/2016 12:05 PM, Joel Stanley wrote:
> On Mon, Jun 27, 2016 at 6:13 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> arch/arm/mach-aspeed/flash.c: In function 'memmove_dma':
>> arch/arm/mach-aspeed/flash.c:1390:55: warning: assignment makes integer from pointer without a cast [enabled by default]
>>   *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) = (ulong *) (src);
>>                                                        ^
>> arch/arm/mach-aspeed/flash.c:1391:54: warning: assignment makes integer from pointer without a cast [enabled by default]
>>   *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) = (ulong *) (dest);
>>                                                       ^
>> There is no need to cast with a pointer type. memmove_dma() is not used
>> today but let's keep it as this is a supported feature we could use.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks! Now we build warning free.

exactly. at last :)

Thanks,

C. 


> Applied at https://github.com/openbmc/u-boot/commit/69e4384a0973fb7895fdc6176605fa7431fec5bb
> 
> Cheers,
> 
> Joel
> 
