Return-Path: <clg@kaod.org>
Received: from 4.mo1.mail-out.ovh.net (unknown [46.105.76.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYgxP0WrtzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 18:34:01 +1000 (AEST)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 6CD8DFF9D0A
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:58:32 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id B1D243C0070;
 Tue, 21 Jun 2016 09:58:28 +0200 (CEST)
Subject: Re: [u-boot 1/3] ast-g5: Simplify config and board file
To: Joel Stanley <joel@jms.id.au>, teddy.reed@gmail.com, andrew@aj.id.au
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
 <1466494185-24459-2-git-send-email-joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bbb0ddc2-2dcf-7d3e-a33b-66d3f04f45e9@kaod.org>
Date: Tue, 21 Jun 2016 09:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466494185-24459-2-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17557283149625723650
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrleeigdduvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 21 Jun 2016 08:34:01 -0000

On 06/21/2016 09:29 AM, Joel Stanley wrote:
> These cleanups make these files easier to adapt for supporting the
> ast2400.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  board/aspeed/ast-g5/ast-g5.c |  1 -
>  include/configs/ast-g5.h     | 85 ++++++--------------------------------------
>  2 files changed, 11 insertions(+), 75 deletions(-)
> 
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index 4643ef37c13c..4d68dd0b5878 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -75,7 +75,6 @@ int dram_init (void)
>  	gd->ram_size = (dram - vga);
>  
>  	return 0;
> -
>  }
>  
>  #ifdef CONFIG_CMD_NET
> diff --git a/include/configs/ast-g5.h b/include/configs/ast-g5.h
> index 6c05e6d216cd..8787a8af7974 100644
> --- a/include/configs/ast-g5.h
> +++ b/include/configs/ast-g5.h
> @@ -26,8 +26,6 @@
>  #define CONFIG_MAC_NUM 2
>  #define CONFIG_EXTRA_ENV_SETTINGS AST2500_ENV_SETTINGS
>  
> -/* #define DEBUG	1 */
> -/* #define  CONFIG_SKIP_LOWLEVEL_INIT */
>  #define CONFIG_AST_FPGA_VER 4 /* for arm1176 */
>  
>  /*
> @@ -36,37 +34,29 @@
>   */
>  #define CONFIG_ARCH_CPU_INIT
>  #define CONFIG_MISC_INIT_R		1
> -#define CONFIG_MACH_TYPE				MACH_TYPE_ASPEED
> -#ifdef CONFIG_ARCH_AST1070
> -#define CONFIG_AST_GPIO
> -#endif
> +#define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
>  
>  
>  #include <asm/arch/platform.h>
>  
>  /* Misc CPU related */
> -/* #define CONFIG_ARCH_CPU_INIT */
>  #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
>  #define CONFIG_SETUP_MEMORY_TAGS
>  #define CONFIG_INITRD_TAG
>  
>  #define CONFIG_CMDLINE_EDITING		1	/* command line history */
> -/* #define CONFIG_SYS_HUSH_PARSER		1 */	/* Use the HUSH parser		*/
> -
> -/* ------------------------------------------------------------------------- */
>  
>  /* Enable cache controller */
>  #define CONFIG_SYS_DCACHE_OFF	1
> -
>  /* ------------------------------------------------------------------------- */
>  /* additions for new relocation code, must added to all boards */
> -#define CONFIG_SYS_SDRAM_BASE			(AST_DRAM_BASE)
> -#define CONFIG_SYS_INIT_RAM_ADDR		CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
> -#define CONFIG_SYS_INIT_RAM_SIZE		(32*1024)
> -#define CONFIG_SYS_INIT_RAM_END     (CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
> +#define CONFIG_SYS_SDRAM_BASE		(AST_DRAM_BASE)
> +#define CONFIG_SYS_INIT_RAM_ADDR	CONFIG_SYS_SDRAM_BASE /*(AST_SRAM_BASE)*/
> +#define CONFIG_SYS_INIT_RAM_SIZE	(32*1024)
> +#define CONFIG_SYS_INIT_RAM_END		(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE)
>  #define CONFIG_SYS_INIT_SP_ADDR 	(CONFIG_SYS_INIT_RAM_END - GENERATED_GBL_DATA_SIZE)
>  
> -#define CONFIG_NR_DRAM_BANKS	1
> +#define CONFIG_NR_DRAM_BANKS		1
>  
>  #define CONFIG_SYS_MEMTEST_START		CONFIG_SYS_SDRAM_BASE + 0x300000
>  #define CONFIG_SYS_MEMTEST_END			(CONFIG_SYS_MEMTEST_START + (80*1024*1024))
> @@ -85,18 +75,12 @@
>   */
>  #define CONFIG_ASPEED_TIMER_CLK		(1*1000*1000) /* use external clk (1M) */
>  
> -/*
> - * Hardware drivers
> - */
> -
> -/* #define CONFIG_FARADAYNIC */
> -/* #define CONFIG_DRIVER_ASPEED_I2C */
>  
>  /*
>   * NS16550 Configuration
>   */
>  #define CONFIG_SYS_NS16550_SERIAL
> -#define CONFIG_SYS_NS16550_REG_SIZE		-4
> +#define CONFIG_SYS_NS16550_REG_SIZE		(-4)
>  #define CONFIG_SYS_NS16550_CLK			24000000
>  #define CONFIG_SYS_NS16550_COM1			AST_UART0_BASE
>  #define CONFIG_SYS_LOADS_BAUD_CHANGE
> @@ -104,11 +88,6 @@
>  #define CONFIG_CONS_INDEX				1
>  #define CONFIG_BAUDRATE					115200
>  
> -/* #define CONFIG_SYS_BAUDRATE_TABLE		{ 9600, 19200, 38400, 57600, 115200 } */
> -
> -/* #define CONFIG_SYS_MAX_FLASH_BANKS      1 */
> -/* #define CONFIG_SYS_MAX_FLASH_SECT       (256) */           /* max number of sectors on one chip */
> -
>  /*
>   * BOOTP options
>   */
> @@ -137,23 +116,18 @@
>  #define CONFIG_SYS_MAXARGS	16		/* max number of command args */
>  #define CONFIG_SYS_BARGSIZE	CONFIG_SYS_CBSIZE /* Boot Argument Buffer Size */
>  
> -#define CONFIG_SYS_LOAD_ADDR		0x83000000	/* default load address */
> +#define CONFIG_SYS_LOAD_ADDR	0x83000000	/* default load address */
>  
>  #define CONFIG_BOOTARGS		"console=ttyS0,115200n8 ramdisk_size=16384 root=/dev/ram rw init=/linuxrc mem=80M"

May be we could change these CONFIG_BOOTARGS to a OpenBMC one, which is more 
standard :

	"console=ttyS4,115200n8 root=/dev/ram rw"

That can be other patch.


>  /* ------------------------------------------------------------------------- */
> -
> -/* ------------------------------------------------------------------------- */
>  #define CONFIG_AST_SPI_NOR    /* AST SPI NOR Flash */
>  
>  #ifdef CONFIG_AST_SPI_NOR
>  
>  #define CONFIG_FMC_CS			1
> -/*#define CONFIG_SPI0_CS		1 */
>  
> -/*#define CONFIG_FLASH_DMA */
>  #define CONFIG_SYS_MAX_FLASH_BANKS 	(CONFIG_FMC_CS)
> -/*#define CONFIG_SYS_MAX_FLASH_SECT	(1024)	*/	/* max number of sectors on one chip */
>  #define CONFIG_SYS_MAX_FLASH_SECT	(8192)		/* max number of sectors on one chip */
>  #define CONFIG_ENV_IS_IN_FLASH		1
>  #define CONFIG_ENV_ADDR				(AST_FMC_CS0_BASE + 0x60000)
> @@ -161,16 +135,15 @@
>  #endif
>  
>  /* ------------------------------------------------------------------------- */
> -#define CONFIG_ENV_OFFSET				0x60000	/* environment starts here  */
> -#define CONFIG_ENV_SIZE					0x20000		/* Total Size of Environment Sector */
> +#define CONFIG_ENV_OFFSET		0x60000	/* environment starts here  */
> +#define CONFIG_ENV_SIZE			0x20000	/* Total Size of Environment Sector */
>  
>  #define CONFIG_BOOTCOMMAND	"bootm 20080000 20300000"
>  #define CONFIG_ENV_OVERWRITE
>  
> -#define AST2500_ENV_SETTINGS					\
> +#define AST2500_ENV_SETTINGS \
>  	"verify=yes\0"	\
>  	"spi_dma=yes\0" \
> -	"update=tftp 80800000 ast2500.scr; so 80800000\0" \
>  	""
>  
>  /* ------------------------------------------------------------------------- */
> @@ -183,48 +156,12 @@
>  #define CONFIG_PHY_ADDR			0
>  #define CONFIG_PHY_REALTEK
>  #endif
> -
>  #ifdef CONFIG_CMD_NET
> -/* #define CONFIG_MAC_NUM	2 */
>  #define CONFIG_FTGMAC100
>  #define CONFIG_PHY_MAX_ADDR	32	/* this comes from <linux/phy.h> */
> -/* #define CONFIG_SYS_DISCOVER_PHY */
>  #define CONFIG_FTGMAC100_EGIGA

So the aspeednic is only in the witherspoon branch ? (which is better if so)


> -#define CONFIG_GATEWAYIP		192.168.0.1
> -#define CONFIG_NETMASK			255.255.255.0
> -#define CONFIG_IPADDR			192.168.0.45
> -#define CONFIG_SERVERIP			192.168.0.81
> -#define CONFIG_ETHADDR			00:C0:A8:12:34:56
> -#define CONFIG_ETH1ADDR			00:C0:A8:12:34:57

yeah. no really needed.

Thanks,

C.

> -#endif
>  
> -#ifdef CONFIG_PCI
> -#define CONFIG_CMD_PCI
> -#define CONFIG_PCI_PNP
> -#define CONFIG_PCI_SCAN_SHOW
> -#define CONFIG_PCI_CONFIG_HOST_BRIDGE
> -
> -#define CONFIG_SYS_PCIE1_BASE		0x8c000000
> -#define CONFIG_SYS_PCIE1_CFG_BASE	0x8c000000
> -#define CONFIG_SYS_PCIE1_CFG_SIZE	0x01000000
> -#define CONFIG_SYS_PCIE1_MEM_BASE	0x8d000000
> -#define CONFIG_SYS_PCIE1_MEM_PHYS	0x8d000000
> -#define CONFIG_SYS_PCIE1_MEM_SIZE	0x01000000
> -#define CONFIG_SYS_PCIE1_IO_BASE	0x8e000000
> -#define CONFIG_SYS_PCIE1_IO_PHYS	0x8e000000
> -#define CONFIG_SYS_PCIE1_IO_SIZE	0x00100000
> -
> -#define CONFIG_SYS_PCIE2_BASE		0x8f000000
> -#define CONFIG_SYS_PCIE2_CFG_BASE	0x8f000000
> -#define CONFIG_SYS_PCIE2_CFG_SIZE	0x01000000
> -#define CONFIG_SYS_PCIE2_MEM_BASE	0x90000000
> -#define CONFIG_SYS_PCIE2_MEM_PHYS	0x90000000
> -#define CONFIG_SYS_PCIE2_MEM_SIZE	0x00100000
> -#define CONFIG_SYS_PCIE2_IO_BASE	0x91000000
> -#define CONFIG_SYS_PCIE2_IO_PHYS	0x91000000
> -#define CONFIG_SYS_PCIE2_IO_SIZE	0x00100000
>  #endif
>  
>  /* -------------------------------------------------------------------------
> 
