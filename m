Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zRWkp1WcnzDqy5
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 04:05:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2018 09:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,408,1511856000"; d="scan'208";a="12724646"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga007.fm.intel.com with ESMTP; 24 Jan 2018 09:05:15 -0800
Message-ID: <1516813514.7000.1235.camel@linux.intel.com>
Subject: Re: [PATCH arm/aspeed/ast2500 v2] ipmi: add an Aspeed KCS IPMI BMC
 driver
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Haiyue Wang <haiyue.wang@linux.intel.com>, minyard@acm.org,
 joel@jms.id.au,  avifishman70@gmail.com, openbmc@lists.ozlabs.org, 
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2018 19:05:14 +0200
In-Reply-To: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
Organization: Intel Finland Oy
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.3-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 27 Jan 2018 13:15:28 +1100
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
X-List-Received-Date: Wed, 24 Jan 2018 17:05:23 -0000

On Thu, 2018-01-25 at 00:06 +0800, Haiyue Wang wrote:
> The KCS (Keyboard Controller Style) interface is used to perform in-
> band
> IPMI communication between a server host and its BMC (BaseBoard
> Management
> Controllers).
> 
> This driver exposes the KCS interface on ASpeed SOCs (AST2400 and
> AST2500)
> as a character device. Such SOCs are commonly used as BMCs and this
> driver
> implements the BMC side of the KCS interface.

> +config IPMI_KCS_BMC
> +	tristate 'IPMI KCS BMC Interface'
> +	help
> +	  Provides a device driver for the KCS (Keyboard Controller
> Style)
> +	  IPMI interface which meets the requirement of the BMC
> (Baseboard
> +	  Management Controllers) side for handling the IPMI request
> from
> +	  host system software.

Now time to split to two patches.

> +config ASPEED_KCS_IPMI_BMC
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on IPMI_KCS_BMC
> +	select REGMAP_MMIO
> +	tristate "Aspeed KCS IPMI BMC driver"
> +	help
> +	  Provides a driver for the KCS (Keyboard Controller Style)
> IPMI
> +	  interface found on Aspeed SOCs (AST2400 and AST2500).
> +
> +	  The driver implements the BMC side of the KCS contorller,
> it
> +	  provides the access of KCS IO space for BMC side.

> +obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> +obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> \ No newline at end of file

Do something with your text editor. The end of text file is a \n at the
end.

> +/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
> +#define KCS_STATUS_STATE(state) (state << 6)
> +#define KCS_STATUS_STATE_MASK   KCS_STATUS_STATE(0x3)

GENMASK(8, 6)

> +
> +

Remove extra line in such cases

> +static inline u8 read_data(struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> +}
> +
> +static inline void write_data(struct kcs_bmc *kcs_bmc, u8 data)
> +{
> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> +}
> +
> +static inline u8 read_status(struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> +}
> +
> +static inline void write_status(struct kcs_bmc *kcs_bmc, u8 data)
> +{
> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> +}
> +
> +static void update_status_bits(struct kcs_bmc *kcs_bmc, u8 mask, u8
> val)
> +{
> +	u8 tmp;
> +
> +	tmp = read_status(kcs_bmc);
> +
> +	tmp &= ~mask;
> +	tmp |= val & mask;
> +
> +	write_status(kcs_bmc, tmp);
> +}

Shouldn't be above some kind of regmap API?

> +int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> +{
> +	unsigned long flags;
> +	int ret = 0;
> +	u8 status;
> +
> +	spin_lock_irqsave(&kcs_bmc->lock, flags);
> +
> +	status = read_status(kcs_bmc) & (KCS_STATUS_IBF |
> KCS_STATUS_CMD_DAT);
> +
> +	switch (status) {
> +	case KCS_STATUS_IBF | KCS_STATUS_CMD_DAT:
> +		kcs_bmc_handle_command(kcs_bmc);
> +		break;
> +
> +	case KCS_STATUS_IBF:
> +		kcs_bmc_handle_data(kcs_bmc);
> +		break;
> +
> +	default:

> +		ret = -1;

Use proper errno.

> +		break;
> +	}
> +
> +	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(kcs_bmc_handle_event);
> +
> +static inline struct kcs_bmc *file_kcs_bmc(struct file *filp)
> +{
> +	return container_of(filp->private_data, struct kcs_bmc,
> miscdev);
> +}

Such helper we call to_<smth>() where <smth> in your cases kcs_bmc

> +static ssize_t kcs_bmc_write(struct file *filp, const char *buf,
> +			     size_t count, loff_t *offset)
> +{
> +	struct kcs_bmc *kcs_bmc = file_kcs_bmc(filp);
> +	ssize_t ret = count;
> +
> +	if (count < 1 || count > KCS_MSG_BUFSIZ)
> +		return -EINVAL;

Is the first part even possible?

> +}


> +struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
> u32 channel)
> +{
> +	struct kcs_bmc *kcs_bmc;

> +	int rc;

What compiler does think about this?

> +
> +	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv,
> GFP_KERNEL);
> +	if (!kcs_bmc)
> +		return NULL;

> +	dev_set_name(dev, "ipmi-kcs%u", channel);
> +
> +	spin_lock_init(&kcs_bmc->lock);
> +	kcs_bmc->channel = channel;
> +
> +	init_waitqueue_head(&kcs_bmc->queue);

> +	kcs_bmc->data_in  = devm_kmalloc(dev, KCS_MSG_BUFSIZ,
> GFP_KERNEL);
> +	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ,
> GFP_KERNEL);
> +	if (kcs_bmc->data_in == NULL || kcs_bmc->data_out == NULL) {
> +		dev_err(dev, "Failed to allocate data buffers\n");
> +		return NULL;
> +	}

Split checks per allocation.

> +	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> +	kcs_bmc->miscdev.name = dev_name(dev);
> +	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
> +
> +	return kcs_bmc;
> +}
> +EXPORT_SYMBOL(kcs_bmc_alloc);
> 

> +/* Different phases of the KCS BMC module */
> +enum kcs_phases {
> +	/* BMC should not be expecting nor sending any data. */
> +	KCS_PHASE_IDLE,

Perhaps kernel-doc?

> +};


> +/* IPMI 2.0 - 9.5, KCS Interface Registers */
> +struct kcs_ioreg {
> +	u32 idr; /* Input Data Register */
> +	u32 odr; /* Output Data Register */
> +	u32 str; /* Status Register */

kernel-doc

> +};
> +
> +struct kcs_bmc {
> +	spinlock_t lock;
> +
> +	u32 channel;
> +	int running;
> +
> +	/* Setup by BMC KCS controller driver */
> +	struct kcs_ioreg ioreg;
> +	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
> +	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
> +
> +	enum kcs_phases phase;
> +	enum kcs_errors error;
> +
> +	wait_queue_head_t queue;
> +	bool data_in_avail;
> +	int  data_in_idx;
> +	u8  *data_in;
> +
> +	int  data_out_idx;
> +	int  data_out_len;
> +	u8  *data_out;
> +
> +	struct miscdevice miscdev;
> +
> +	unsigned long long priv[];

unsigned long is enough.

> +};
> +
> +static inline void *kcs_bmc_priv(const struct kcs_bmc *kcs_bmc)
> +{
> +	return kcs_bmc->priv;
> +}
> +
> +extern int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
> +extern struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int
> sizeof_priv,
> +					u32 channel);

Drop extern.

> +#endif

Next one could be reviewed when you split this patch to two.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
