Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSSHd2Pg6zF0RK
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 16:33:30 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2018 21:33:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,415,1511856000"; d="scan'208";a="12730595"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.254.215.59])
 ([10.254.215.59])
 by orsmga007.jf.intel.com with ESMTP; 25 Jan 2018 21:33:23 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v2] ipmi: add an Aspeed KCS IPMI BMC
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, minyard@acm.org,
 joel@jms.id.au, avifishman70@gmail.com, openbmc@lists.ozlabs.org,
 openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <1516810009-16353-1-git-send-email-haiyue.wang@linux.intel.com>
 <1516813514.7000.1235.camel@linux.intel.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <793dbcc0-4d28-cddb-c5eb-bf491dff4d92@linux.intel.com>
Date: Fri, 26 Jan 2018 13:33:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516813514.7000.1235.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 26 Jan 2018 05:33:34 -0000



On 2018-01-25 01:05, Andy Shevchenko wrote:
> On Thu, 2018-01-25 at 00:06 +0800, Haiyue Wang wrote:
>> The KCS (Keyboard Controller Style) interface is used to perform in-
>> band
>> IPMI communication between a server host and its BMC (BaseBoard
>> Management
>> Controllers).
>>
>>
>> +config ASPEED_KCS_IPMI_BMC
>> +	depends on ARCH_ASPEED || COMPILE_TEST
>> +	depends on IPMI_KCS_BMC
>> +	select REGMAP_MMIO
>> +	tristate "Aspeed KCS IPMI BMC driver"
>> +	help
>> +	  Provides a driver for the KCS (Keyboard Controller Style)
>> IPMI
>> +	  interface found on Aspeed SOCs (AST2400 and AST2500).
>> +
>> +	  The driver implements the BMC side of the KCS contorller,
>> it
>> +	  provides the access of KCS IO space for BMC side.
>> +static inline u8 read_data(struct kcs_bmc *kcs_bmc)
>> +{
>> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
>> +}
>> +
>> +static inline void write_data(struct kcs_bmc *kcs_bmc, u8 data)
>> +{
>> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
>> +}
>> +
>> +static inline u8 read_status(struct kcs_bmc *kcs_bmc)
>> +{
>> +	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
>> +}
>> +
>> +static inline void write_status(struct kcs_bmc *kcs_bmc, u8 data)
>> +{
>> +	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
>> +}
>> +
>> +static void update_status_bits(struct kcs_bmc *kcs_bmc, u8 mask, u8
>> val)
>> +{
>> +	u8 tmp;
>> +
>> +	tmp = read_status(kcs_bmc);
>> +
>> +	tmp &= ~mask;
>> +	tmp |= val & mask;
>> +
>> +	write_status(kcs_bmc, tmp);
>> +}
> Shouldn't be above some kind of regmap API?
It is KCS spec defined IO access for hidden the low level, if the low 
level supports regmap, such as in kcs_bmc_aspeed.c,
aspeed_kcs_inb & aspeed_kcs_outb.
>
>> +/* Different phases of the KCS BMC module */
>> +enum kcs_phases {
>> +	/* BMC should not be expecting nor sending any data. */
>> +	KCS_PHASE_IDLE,
> Perhaps kernel-doc?
Code + inline comments should be better than kernel-doc ? Or move it out 
like :

/* The interface for checksum offload between the stack and networking 
drivers
  * is as follows...
  *
  * A. IP checksum related features
  *
  * Drivers advertise checksum offload capabilities in the features of a 
device.
  * From the stack's point of view these are capabilities offered by the 
driver,
  * a driver typically only advertises features that it is capable of 
offloading
  * to its device.
  *
  * The checksum related features are:
  *
  *    NETIF_F_HW_CSUM    - The driver (or its device) is able to 
compute one
  *              IP (one's complement) checksum for any combination
  *              of protocols or protocol layering. The checksum is
  *              computed and set in a packet per the CHECKSUM_PARTIAL
  *              interface (see below).
  *
  *    NETIF_F_IP_CSUM - Driver (device) is only able to checksum plain
  *              TCP or UDP packets over IPv4. These are specifically
  *              unencapsulated packets of the form IPv4|TCP or
  *              IPv4|UDP where the Protocol field in the IPv4 header
  *              is TCP or UDP. The IPv4 header may contain IP options
  *              This feature cannot be set in features for a device
  *              with NETIF_F_HW_CSUM also set. This feature is being
  *              DEPRECATED (see below).
>> +};
>
>> +/* IPMI 2.0 - 9.5, KCS Interface Registers */
>> +struct kcs_ioreg {
>> +	u32 idr; /* Input Data Register */
>> +	u32 odr; /* Output Data Register */
>> +	u32 str; /* Status Register */
> kernel-doc
>> +};
>> +
>> +static inline void *kcs_bmc_priv(const struct kcs_bmc *kcs_bmc)
>> +{
>> +	return kcs_bmc->priv;
>> +}
>> +
>> +extern int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
>> +extern struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int
>> sizeof_priv,
>> +					u32 channel);
> Drop extern.
After dropping extern, it truly passed compilation, have any special 
reason to drop 'extern' ?
I saw in kernel still use extern like : extern void printk_nmi_init(void);
>> +#endif
> Next one could be reviewed when you split this patch to two.
Got it!
