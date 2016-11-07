Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tC1B73zFVzDsyY
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 16:25:51 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 0BB0417A12
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 06:18:40 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id D40E73C006E;
 Mon,  7 Nov 2016 06:18:38 +0100 (CET)
Subject: Re: U-Boot upstreaming
To: Maxim Sloyko <maxims@google.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <7a5ddb25-a5d6-104b-b81e-3d92d43b26e6@kaod.org>
 <CAFR_W8oez8r9qX1A8KD-egFbcBZrWLmNc0hwagmM+XyjKvmiWQ@mail.gmail.com>
 <CAFR_W8q+A+V3RyUGO-cNqqYLnzOA_jJaj-eMiYFbtJcN5uN=Dg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <410725c0-c6da-6d7c-9dc7-b5dfe044e4c7@kaod.org>
Date: Mon, 7 Nov 2016 06:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFR_W8q+A+V3RyUGO-cNqqYLnzOA_jJaj-eMiYFbtJcN5uN=Dg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1058064437562411778
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrleefgddvgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 07 Nov 2016 05:25:51 -0000

Hello,

> OK, so I actually tried this and it works! I did it on my branch 
> so that I can just quickly give it a try and don't really have time 
> to prepare proper patch today (this being Friday and all), but this 
> is the summary of required changes: (the patch is also attached,
>  just in case, but you won't be able to apply it)

nice one :) 

but do we need any of this if we are to remove lowlevel_init ?

> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -33,10 +33,10 @@
>  #define CONFIG_SYS_DCACHE_OFF1
> 
> // Config changes -- this is the most important part. U-Boot will use these to setup stack and heap for us.
>  
>  #define CONFIG_SYS_SDRAM_BASEAST_DRAM_BASE
> -#define CONFIG_SYS_INIT_RAM_ADDRCONFIG_SYS_SDRAM_BASE
> -#define CONFIG_SYS_INIT_RAM_SIZE(32*1024)
> +#define CONFIG_SYS_INIT_RAM_ADDR(AST_SRAM_BASE)
> +#define CONFIG_SYS_INIT_RAM_SIZE(36*1024)
>  #define CONFIG_SYS_INIT_RAM_END(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
> -#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
> +#define CONFIG_SYS_INIT_SP_ADDR (CONFIG_SYS_INIT_RAM_END)

That is a fix I have included in my branch.

Thanks,

C.

[ is it possible to configure gmail to wrap lines at a reasonable 
  width ? ] 
