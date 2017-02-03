Return-Path: <alistair@popple.id.au>
Received: from ipmail06.adl6.internode.on.net (ipmail06.adl6.internode.on.net
 [150.101.137.145])
 by lists.ozlabs.org (Postfix) with ESMTP id 3vDzNb4xLjzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 12:11:59 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AcBgCV15NY/wpSY3pdHAEBBAEBCgEBhT2FN4kbkRmTJ4QchiICgy4BAgEBAQEBAmIohGkBAQEEJxM/EAsVAwkVEA8BRxmJcK5YOos8AQEBAQEFAgElizqKMgWPNownknCBEohkhiOTB1eBDQ4PBAgRGYR/HYF1LDUBiR8BAQE
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail06.adl6.internode.on.net with ESMTP; 03 Feb 2017 11:41:58 +1030
From: Alistair Popple <alistair@popple.id.au>
To: eajames@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Eddie James <eajames@us.ibm.com>
Subject: Re: [PATCH v2 1/3] drivers/fsi: Add slave interrupt polling
Date: Fri, 03 Feb 2017 12:11:57 +1100
Message-ID: <2483723.1jBtLvfriP@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1486077964-11346-7-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486077964-11346-7-git-send-email-eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Fri, 03 Feb 2017 01:12:00 -0000

Hi Edward,

Ideally this should also make use of as much existing kernel
infrastructure as possible to avoid remiplementing interfaces that
already exist. In the case of IRQs the kernel already has functions
implementing interfaces like request_irq() to assign interrupt
handlers, etc.

To hook into these calls you need to implement an irqchip. For example
arch/powerpc/platforms/powernv/opal-irqchip.c has a resonable example,
although there are plenty others in the kernel including for I2C
busses. Searching for "struct irq_chip" should turn up more examples.

Regards,

Alistair

On Thu, 2 Feb 2017 05:26:02 PM eajames@linux.vnet.ibm.com wrote:
> From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> Scan slaves present for asserting interrupt signals in the si1s
> register and call a registered client's interrupt handler as
> appropriate.
>
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-core.c        | 99 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/fsi/fsi-master-gpio.c |  1 +
>  drivers/fsi/fsi-master.h      |  2 +
>  include/linux/fsi.h           |  5 +++
>  4 files changed, 107 insertions(+)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 72e0ca3..4df7218 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -15,11 +15,15 @@
>
>  #include <linux/device.h>
>  #include <linux/fsi.h>
> +#include <linux/kthread.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> +#include <linux/jiffies.h>
>
>  #include "fsi-master.h"
>
> +#define DEBUG
> +
>  #define FSI_N_SLAVES	4
>
>  #define FSI_SLAVE_CONF_NEXT_MASK	0x80000000
> @@ -36,7 +40,11 @@
>  #define FSI_PEEK_BASE			0x410
>  #define	FSI_SLAVE_BASE			0x800
>
> +#define FSI_IPOLL_PERIOD		msecs_to_jiffies(fsi_ipoll_period_ms)
> +
>  static const int engine_page_size = 0x400;
> +static struct task_struct *master_ipoll;
> +static unsigned int fsi_ipoll_period_ms = 100;
>
>  static atomic_t master_idx = ATOMIC_INIT(-1);
>
> @@ -60,6 +68,8 @@ static int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
>   * FSI slave engine control register offsets
>   */
>  #define	FSI_SMODE		0x0	/* R/W: Mode register */
> +#define FSI_SI1M		0x18	/* R/W: IRQ mask */
> +#define FSI_SI1S		0x1C	/* R: IRQ status */
>
>  /*
>   * SMODE fields
> @@ -197,6 +207,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  	uint32_t engine_addr;
>  	uint32_t conf;
>  	int rc, i;
> +	uint8_t si1s_bit = 1;
>
>  	INIT_LIST_HEAD(&slave->my_engines);
>
> @@ -253,6 +264,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  			dev->unit = i;
>  			dev->addr = engine_addr;
>  			dev->size = slots * engine_page_size;
> +			dev->si1s_bit = si1s_bit++;
>
>  			dev_info(&slave->dev,
>  			"engine[%i]: type %x, version %x, addr %x size %x\n",
> @@ -507,6 +519,56 @@ static void fsi_master_unscan(struct fsi_master *master)
>  	master->slave_list = false;
>  }
>
> +static void fsi_master_irq(struct fsi_master *master, int link, uint32_t si1s)
> +{
> +	struct fsi_slave *slave;
> +	struct fsi_device *fsi_dev;
> +
> +	if (list_empty(&master->my_slaves))
> +		return;
> +
> +	slave = list_first_entry(&master->my_slaves, struct fsi_slave,
> +				list_link);
> +
> +	list_for_each_entry(fsi_dev, &slave->my_engines, link) {
> +		if (si1s & (0x80000000 >> fsi_dev->si1s_bit) &&
> +		    fsi_dev->irq_handler)
> +			fsi_dev->irq_handler(0, &fsi_dev->dev);
> +	}
> +}
> +
> +static int fsi_master_ipoll(void *data)
> +{
> +	int rc;
> +	uint32_t si1s;
> +	unsigned long elapsed = 0;
> +	unsigned long previous_jiffies = jiffies;
> +	struct fsi_master *master = data;
> +
> +	while (!kthread_should_stop()) {
> +		if (!master->ipoll)
> +			goto done;
> +
> +		/* Ignore errors for now */
> +		rc = master->read(master, 0, 0, FSI_SLAVE_BASE + FSI_SI1S,
> +				  &si1s, sizeof(uint32_t));
> +		if (rc)
> +			goto done;
> +
> +		if (si1s & master->ipoll)
> +			fsi_master_irq(master, 0, si1s);
> +done:
> +		elapsed = jiffies - previous_jiffies;
> +		if (elapsed < FSI_IPOLL_PERIOD) {
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +			schedule_timeout(FSI_IPOLL_PERIOD - elapsed);
> +		}
> +		previous_jiffies = jiffies;
> +	}
> +
> +	return 0;
> +}
> +
>  int fsi_master_register(struct fsi_master *master)
>  {
>  	if (!master || !master->dev)
> @@ -524,9 +586,36 @@ void fsi_master_unregister(struct fsi_master *master)
>  {
>  	fsi_master_unscan(master);
>  	put_device(master->dev);
> +	if (master_ipoll) {
> +		kthread_stop(master_ipoll);
> +		master_ipoll = NULL;
> +	}
>  }
>  EXPORT_SYMBOL_GPL(fsi_master_unregister);
>
> +/*
> + * TODO: move this to master->start_ipoll( ) -each master may have its
> + * own way of doing this
> + */
> +int fsi_master_start_ipoll(struct fsi_master *master)
> +{
> +	if (master_ipoll) {
> +		dev_err(master->dev, "Already polling for irqs\n");
> +		return -EALREADY;
> +	}
> +	master_ipoll = kthread_create(fsi_master_ipoll, master,
> +				"fsi_master_ipoll");
> +	if (IS_ERR(master_ipoll)) {
> +		dev_err(master->dev, "Couldn't create ipoll thread rc:%d\n",
> +			(int)PTR_ERR(master_ipoll));
> +		return PTR_ERR(master_ipoll);
> +	}
> +	wake_up_process(master_ipoll);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsi_master_start_ipoll);
> +
>  /* FSI core & Linux bus type definitions */
>
>  static int fsi_bus_match(struct device *dev, struct device_driver *drv)
> @@ -566,6 +655,16 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
>  }
>  EXPORT_SYMBOL_GPL(fsi_driver_unregister);
>
> +int fsi_enable_irq(struct fsi_device *dev)
> +{
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsi_enable_irq);
> +
> +void fsi_disable_irq(struct fsi_device *dev)
> +{
> +}
> +
>  struct bus_type fsi_bus_type = {
>  	.name		= "fsi",
>  	.match		= fsi_bus_match,
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 83c7cf0..73d9985 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -457,6 +457,7 @@ static ssize_t store_scan(struct device *dev,
>  	/* clear out any old scan data if present */
>  	fsi_master_unregister(&master->master);
>  	fsi_master_register(&master->master);
> +	fsi_master_start_ipoll(&master->master);
>
>  	return count;
>  }
> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
> index 454af2b..3737404 100644
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -25,6 +25,7 @@ struct fsi_master {
>  	struct device	*dev;
>  	int		idx;
>  	int		n_links;
> +	uint32_t	ipoll;
>  	int		(*read)(struct fsi_master *, int link,
>  				uint8_t slave, uint32_t addr,
>  				void *val, size_t size);
> @@ -37,6 +38,7 @@ struct fsi_master {
>
>  extern int fsi_master_register(struct fsi_master *master);
>  extern void fsi_master_unregister(struct fsi_master *master);
> +extern int fsi_master_start_ipoll(struct fsi_master *master);
>
>  /**
>   * crc4 helper: Given a starting crc4 state @c, calculate the crc4 vaue of @x,
> diff --git a/include/linux/fsi.h b/include/linux/fsi.h
> index 2721255..d22d0c5 100644
> --- a/include/linux/fsi.h
> +++ b/include/linux/fsi.h
> @@ -23,9 +23,11 @@ struct fsi_device {
>  	u8			engine_type;
>  	u8			version;
>  	u8			unit;
> +	u8			si1s_bit;
>  	struct fsi_slave	*slave;
>  	uint32_t		addr;
>  	uint32_t		size;
> +	int (*irq_handler)(int, void *);
>  };
>
>  extern int fsi_device_read(struct fsi_device *dev, uint32_t addr,
> @@ -69,4 +71,7 @@ extern void fsi_driver_unregister(struct fsi_driver *);
>
>  extern struct bus_type fsi_bus_type;
>
> +extern int fsi_enable_irq(struct fsi_device *dev);
> +extern void fsi_disable_irq(struct fsi_device *dev);
> +
>  #endif /* LINUX_FSI_H */
>
