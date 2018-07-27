Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41cbjb49V4zF0h9;
 Sat, 28 Jul 2018 03:36:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jul 2018 10:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,410,1526367600"; d="scan'208";a="219675878"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga004.jf.intel.com with ESMTP; 27 Jul 2018 10:36:16 -0700
Subject: Re: [PATCH v7 08/12] mfd: intel-peci-client: Add PECI client MFD
 driver
To: Lee Jones <lee.jones@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180723214751.1733-1-jae.hyun.yoo@linux.intel.com>
 <20180723214751.1733-9-jae.hyun.yoo@linux.intel.com>
 <20180727082611.GE4628@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <acffdfef-cb20-4208-5297-d94bac5ecb1b@linux.intel.com>
Date: Fri, 27 Jul 2018 10:36:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180727082611.GE4628@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 31 Jul 2018 10:00:13 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 17:36:20 -0000

Hi Lee,

On 7/27/2018 1:26 AM, Lee Jones wrote:
> On Mon, 23 Jul 2018, Jae Hyun Yoo wrote:
> 
>> This commit adds PECI client MFD driver.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: James Feist <james.feist@linux.intel.com>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
>> ---
>>   drivers/mfd/Kconfig                   |  14 ++
>>   drivers/mfd/Makefile                  |   1 +
>>   drivers/mfd/intel-peci-client.c       | 182 ++++++++++++++++++++++++++
>>   include/linux/mfd/intel-peci-client.h |  81 ++++++++++++
>>   4 files changed, 278 insertions(+)
>>   create mode 100644 drivers/mfd/intel-peci-client.c
>>   create mode 100644 include/linux/mfd/intel-peci-client.h
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index f3fa516011ec..e38b591479d4 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -595,6 +595,20 @@ config MFD_INTEL_MSIC
>>   	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
>>   	  devices used in Intel Medfield platforms.
>>   
>> +config MFD_INTEL_PECI_CLIENT
>> +	bool "Intel PECI client"
>> +	depends on (PECI || COMPILE_TEST)
>> +	select MFD_CORE
>> +	help
>> +	  If you say yes to this option, support will be included for the
>> +	  multi-funtional Intel PECI (Platform Environment Control Interface)
>> +	  client. PECI is a one-wire bus interface that provides a communication
>> +	  channel from PECI clients in Intel processors and chipset components
>> +	  to external monitoring or control devices.
>> +
>> +	  Additional drivers must be enabled in order to use the functionality
>> +	  of the device.
>> +
>>   config MFD_IPAQ_MICRO
>>   	bool "Atmel Micro ASIC (iPAQ h3100/h3600/h3700) Support"
>>   	depends on SA1100_H3100 || SA1100_H3600
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index 2852a6042ecf..29e2cacc58bd 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -203,6 +203,7 @@ obj-$(CONFIG_MFD_INTEL_LPSS)	+= intel-lpss.o
>>   obj-$(CONFIG_MFD_INTEL_LPSS_PCI)	+= intel-lpss-pci.o
>>   obj-$(CONFIG_MFD_INTEL_LPSS_ACPI)	+= intel-lpss-acpi.o
>>   obj-$(CONFIG_MFD_INTEL_MSIC)	+= intel_msic.o
>> +obj-$(CONFIG_MFD_INTEL_PECI_CLIENT)	+= intel-peci-client.o
>>   obj-$(CONFIG_MFD_PALMAS)	+= palmas.o
>>   obj-$(CONFIG_MFD_VIPERBOARD)    += viperboard.o
>>   obj-$(CONFIG_MFD_RC5T583)	+= rc5t583.o rc5t583-irq.o
>> diff --git a/drivers/mfd/intel-peci-client.c b/drivers/mfd/intel-peci-client.c
>> new file mode 100644
>> index 000000000000..d7702cf1ea50
>> --- /dev/null
>> +++ b/drivers/mfd/intel-peci-client.c
>> @@ -0,0 +1,182 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2018 Intel Corporation
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/intel-peci-client.h>
>> +#include <linux/module.h>
>> +#include <linux/peci.h>
>> +#include <linux/of_device.h>
>> +
>> +enum cpu_gens {
>> +	CPU_GEN_HSX = 0, /* Haswell Xeon */
>> +	CPU_GEN_BRX,     /* Broadwell Xeon */
>> +	CPU_GEN_SKX,     /* Skylake Xeon */
>> +};
>> +
>> +static struct mfd_cell peci_functions[] = {
>> +	{
>> +		.name = "peci-cputemp",
>> +		.of_compatible = "intel,peci-cputemp",
>> +	},
>> +	{
>> +		.name = "peci-dimmtemp",
>> +		.of_compatible = "intel,peci-dimmtemp",
>> +	},
>> +};
> 
> The more I look at this driver, the less I think it fits into MFD.
> 
> What's stopping you from registering these devices directly from DT?
> 

Because DT doesn't allow 2 nodes at the same address so Rob suggested
MFD for this case.

Thanks,

Jae
