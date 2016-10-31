Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (4.mo1.mail-out.ovh.net [46.105.76.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lCH2WzGzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:42:03 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C9E961735B
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 07:41:58 +0100 (CET)
Received: from hermes.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id AFF6F2A0070;
 Mon, 31 Oct 2016 07:41:56 +0100 (CET)
Subject: Re: [PATCH 2/3] Connect an RX8900 RTC to i2c12 of the AST2500 SOC at
 address 0x32
To: alastair@au1.ibm.com, openbmc@lists.ozlabs.org
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-3-git-send-email-alastair@au1.ibm.com>
Cc: Alastair D'Silva <alastair@d-silva.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78ec53b1-5d42-27dd-c880-f829c8468b79@kaod.org>
Date: Mon, 31 Oct 2016 07:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477535233-7760-3-git-send-email-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16696532672809306903
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrjeekgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 31 Oct 2016 06:42:03 -0000

On 10/27/2016 04:27 AM, alastair@au1.ibm.com wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  hw/arm/aspeed.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c7206fd..8ccac3e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -100,6 +100,7 @@ static void aspeed_board_init(MachineState *machine,
>  {
>      AspeedBoardState *bmc;
>      AspeedSoCClass *sc;
> +    I2CBus *i2c12;
>  
>      bmc = g_new0(AspeedBoardState, 1);
>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> @@ -137,6 +138,9 @@ static void aspeed_board_init(MachineState *machine,
>      aspeed_board_binfo.ram_size = ram_size;
>      aspeed_board_binfo.loader_start = sc->info->sdram_base;
>  
> +    i2c12 = aspeed_i2c_get_bus((DeviceState *)&bmc->soc.i2c, 11);
> +    i2c_create_slave(i2c12, "rx8900", 0x32);
> +

hmm, so that is a board device ? or a SoC ?

C. 


>      arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
>  }
>  
> 
