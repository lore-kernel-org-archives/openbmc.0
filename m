Return-Path: <SRS0=1wl0=JR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914DAC433ED
	for <openbmc@archiver.kernel.org>; Tue, 20 Apr 2021 09:01:00 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3424611C9
	for <openbmc@archiver.kernel.org>; Tue, 20 Apr 2021 09:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3424611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPd2K5szNz3026
	for <openbmc@archiver.kernel.org>; Tue, 20 Apr 2021 19:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.3005.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 399 seconds by postgrey-1.36 at boromir;
 Tue, 20 Apr 2021 19:00:38 AEST
Received: from smtpout1.3005.mail-out.ovh.net
 (smtpout1.mo3005.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPd1y32zjz2xZW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 19:00:37 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 842D213B07F;
 Tue, 20 Apr 2021 08:53:51 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Apr
 2021 10:53:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004fdf0c8d3-8122-49c1-b8eb-0bc5d68a64c7,
 DF274AAB1A9B4D3B64F66B8EDF216EFC144C74F9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 01/10] configs/ast2600:
 Make early malloc pool larger
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>, Klaus Heinrich
 Kiwi <klaus@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
References: <20210420064648.994075-1-joel@jms.id.au>
 <20210420064648.994075-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <310b1c39-5cb4-4fd8-1540-0ef1ba88ce66@kaod.org>
Date: Tue, 20 Apr 2021 10:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420064648.994075-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4dc12b76-e8ba-49b9-b56d-a902bd3b2d2e
X-Ovh-Tracer-Id: 10853393627865320416
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello,

On 4/20/21 8:46 AM, Joel Stanley wrote:
> The size of the early (pre-DRAM) SRAM heap in u-boot proper is extended
> to 8KB.
> 
> Testing found that the DRAM driver would perform an allocation that
> exceeded the limits, due to the probing of the HACE driver increasing
> memory presssure. As SRAM is unused when u-boot proper is running, it
> can all be allocated.
> 
> (In theory the entire 88KB of SRAM is free, but testing showed more than
> 60KB would break booting. Finding out why is TODO).

Could it be a HW problem ? 


C. 

> 
> The SPL early heap is fixed to 0x800, the default before this change.
> Testing shows that:
> 
>   SPL malloc() before relocation used 0x794 bytes (1 KB)
> 
> So 2KB should be enough.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  configs/ast2600_openbmc_spl_emmc_defconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
> index 6daf6343478b..5a4d66da1cea 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -24,12 +24,13 @@ CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
>  CONFIG_TARGET_EVB_AST2600A1=y
>  CONFIG_SPL_LIBCOMMON_SUPPORT=y
>  CONFIG_SPL_LIBGENERIC_SUPPORT=y
> -CONFIG_SYS_MALLOC_F_LEN=0x800
> +CONFIG_SYS_MALLOC_F_LEN=0x2000
>  CONFIG_SPL_MMC_SUPPORT=y
>  CONFIG_SPL_SERIAL_SUPPORT=y
>  CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>  CONFIG_ENV_SIZE=0x10000
>  CONFIG_ENV_OFFSET=0x5000
> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
>  CONFIG_SPL=y
>  CONFIG_SPL_STACK_R_ADDR=0x90300000
>  CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
> 

