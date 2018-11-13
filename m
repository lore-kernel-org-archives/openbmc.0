Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.78.111; helo=9.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4197 seconds by postgrey-1.36 at bilbo;
 Tue, 13 Nov 2018 19:55:32 AEDT
Received: from 9.mo68.mail-out.ovh.net (9.mo68.mail-out.ovh.net
 [46.105.78.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vM0N6y05zF3DG
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 19:55:31 +1100 (AEDT)
Received: from player791.ha.ovh.net (unknown [10.109.159.159])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id C77DE10488C
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 08:36:38 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id A00724200B3;
 Tue, 13 Nov 2018 08:36:36 +0100 (CET)
Subject: Re: [PATCH qemu aspeed-3.1 1/2] aspeed: Add syscon-poweroff to system
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20181113030421.6264-1-joel@jms.id.au>
 <20181113030421.6264-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c3b9c2b3-4b8a-68f2-012e-c68014815e5c@kaod.org>
Date: Tue, 13 Nov 2018 08:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113030421.6264-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9152721819412564738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrledtgdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 13 Nov 2018 08:55:33 -0000

On 11/13/18 4:04 AM, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e7b87e355f12..66d6e9ed4551 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -21,8 +21,10 @@
>  #include "hw/i2c/smbus.h"
>  #include "qemu/log.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/device_tree.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
> +#include <libfdt.h>
>  
>  static struct arm_boot_info aspeed_board_binfo = {
>      .board_id = -1, /* device-tree-only board */
> @@ -126,6 +128,38 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>      g_free(storage);
>  }
>  
> +static void fdt_add_shutdown_node(void *fdt)
> +{
> +    /* TODO: Support 2400 */

You could add a 'const char* property' parameter to fdt_add_shutdown_node()
and use a AspeedBoardConfig.modify_dtb() method to call it.

> +    const char *scu = "aspeed,ast2500-scu";
> +    const char *nodename = "/syscon-poweroff";
> +    uint32_t phandle;
> +    int offset;
> +
> +    /* Find the scu phandle */
> +    offset = fdt_node_offset_by_compatible(fdt, -1, scu);
> +    if (offset < 0) {
> +        error_report("%s couldn't find %s, guest shutdown unavailable: %s",
> +                     __func__, scu, fdt_strerror(offset));
> +        return;
> +    }
> +    phandle = fdt_get_phandle(fdt, offset);
> +
> +    /* Add syscon-poweroff node and use 0x1A0, an un-used SCU register */
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
> +    qemu_fdt_setprop_cells(fdt, nodename, "regmap", phandle);
> +    qemu_fdt_setprop_cells(fdt, nodename, "offset", 0x1A0);
> +    qemu_fdt_setprop_cells(fdt, nodename, "value", 1);
> +}
> +
> +static void aspeed_board_modify_dtb(const struct arm_boot_info *binfo,
> +                                    void *fdt)
> +{
> +    fdt_add_shutdown_node(fdt);
> +}
> +
> +
>  static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
>                                        Error **errp)
>  {
> @@ -235,6 +269,7 @@ static void aspeed_board_init(MachineState *machine,
>      aspeed_board_binfo.kernel_cmdline = machine->kernel_cmdline;
>      aspeed_board_binfo.ram_size = ram_size;
>      aspeed_board_binfo.loader_start = sc->info->sdram_base;
> +    aspeed_board_binfo.modify_dtb = aspeed_board_modify_dtb;
>  
>      if (cfg->i2c_init) {
>          cfg->i2c_init(bmc);
> 
