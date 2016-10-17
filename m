Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syJp06PqPzDvHv
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 00:24:24 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9E96EE2C0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 15:24:20 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 75F082A0095;
 Mon, 17 Oct 2016 15:24:18 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.7 09/12] mtd: spi-nor: aspeed: add DMA support
 to smc controller
To: Joel Stanley <joel@jms.id.au>
References: <1476448684-6149-1-git-send-email-clg@kaod.org>
 <1476448684-6149-10-git-send-email-clg@kaod.org>
 <CACPK8XcL2JQgxxZEgK4tnO3o_+No4YKo_8edEC1NS5yACvZVMQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Milton Miller <miltonm@us.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a46c0378-0cbe-5051-fe1a-e675536d7922@kaod.org>
Date: Mon, 17 Oct 2016 15:24:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcL2JQgxxZEgK4tnO3o_+No4YKo_8edEC1NS5yACvZVMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15061163054548945819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrhedvgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 17 Oct 2016 13:24:25 -0000

On 10/17/2016 07:03 AM, Joel Stanley wrote:
> On Fri, Oct 14, 2016 at 11:08 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> The Aspeed FMC controller can handle transfers to the flash modules
>> using DMAs. A couple of registers first need to be programmed with the
>> DRAM and flash addresses and the length of the transfer. The transfer
>> is then initiated using a DMA control register and an interrupt
>> notifies the completion.
>>
>> Such transfers can replace the current IO mode in the read/write ops
>> when some conditions are met on the size and the alignment. In case of
>> failure, a timeout for instance, the operation is restarted using the
>> IO mode.
>>
>> DMA support does not seem to be that efficient. So we provide some
>> sysfs files for tuning and to switch it on and off (default is off)
> 
> It looks like this version only has a module parameter, and not the sysfs files.

Ah ? I have these :

	/sys/module/aspeed_smc/parameters/dma_timeout
	/sys/module/aspeed_smc/parameters/min_dma_size
	/sys/module/aspeed_smc/parameters/use_dma

which we can control with the kernel command line at boot  : 

	"aspeed_smc.use_dma=1"

Is there an other API ? 

Thanks,

C. 
