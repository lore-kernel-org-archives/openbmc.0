Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQhgx15mYzDr6p
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 19:45:00 +1100 (AEDT)
Received: from localhost (LFbn-1-12258-90.w90-92.abo.wanadoo.fr [90.92.71.90])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 77B6210F4;
 Tue, 23 Jan 2018 08:44:58 +0000 (UTC)
Date: Tue, 23 Jan 2018 09:44:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: joel@jms.id.au, arnd@arndb.de, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com
Subject: Re: [PATCH arm/aspeed/ast2500 v1] eSPI: add Aspeed AST2500 eSPI
 driver to boot a host with PCH runs on eSPI
Message-ID: <20180123084457.GE21463@kroah.com>
References: <1516103552-19601-1-git-send-email-haiyue.wang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1516103552-19601-1-git-send-email-haiyue.wang@linux.intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 08:45:01 -0000

On Tue, Jan 16, 2018 at 07:52:32PM +0800, Haiyue Wang wrote:
> When PCH works under eSPI mode, the PMC (Power Management Controller) in
> PCH is waiting for SUS_ACK from BMC after it alerts SUS_WARN. It is in
> dead loop if no SUS_ACK assert. This is the basic requirement for the BMC
> works as eSPI slave.
> 
> Also for the host power on / off actions, from BMC side, the following VW
> (Virtual Wire) messages are done in firmware:
> 1. SLAVE_BOOT_LOAD_DONE / SLAVE_BOOT_LOAD_STATUS
> 2. SUS_ACK
> 3. OOB_RESET_ACK
> 4. HOST_RESET_ACK
> 
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
>  .../devicetree/bindings/misc/aspeed-espi-slave.txt |  20 ++
>  Documentation/misc-devices/espi-slave.rst          | 114 +++++++++

DT files need to be split out into a separate patch so that the DT
maintainers can properly review them.

> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -471,6 +471,17 @@ config VEXPRESS_SYSCFG
>  	  ARM Ltd. Versatile Express uses specialised platform configuration
>  	  bus. System Configuration interface is one of the possible means
>  	  of generating transactions on this bus.
> +config ASPEED_ESPI_SLAVE

You need a blank line above this one please.

> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	select REGMAP_MMIO

Select or depend?

> +	tristate "Aspeed ast2500 eSPI slave device"
> +	---help---
> +	  This allows host to access Baseboard Management Controller (BMC) over the
> +	  Enhanced Serial Peripheral Interface (eSPI) bus, which replaces the Low Pin
> +	  Count (LPC) bus.
> +
> +	  Its interface supports peripheral, virtual wire, out-of-band, and flash
> +	  sharing channels.

What is the module name?

>  
>  config ASPEED_LPC_CTRL
>  	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 5ca5f64..a1081f4 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_GENWQE)		+= genwqe/
>  obj-$(CONFIG_ECHO)		+= echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)		+= cxl/
> +obj-$(CONFIG_ASPEED_ESPI_SLAVE) += aspeed-espi-slave.o

Why no tab?

thanks,

greg k-h
