Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zRmFJ23QczDrJV
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 13:29:07 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2018 18:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,409,1511856000"; d="scan'208";a="24537126"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.11])
 ([10.239.196.11])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2018 18:29:03 -0800
Subject: Re: [PATCH arm/aspeed/ast2500 v1] eSPI: add Aspeed AST2500 eSPI
 driver to boot a host with PCH runs on eSPI
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, arnd@arndb.de, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com
References: <1516103552-19601-1-git-send-email-haiyue.wang@linux.intel.com>
 <20180123084457.GE21463@kroah.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <b1584518-2938-7faa-cd83-d0245d1ba88f@linux.intel.com>
Date: Thu, 25 Jan 2018 10:29:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180123084457.GE21463@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 25 Jan 2018 02:29:08 -0000



On 2018-01-23 16:44, Greg KH wrote:
> On Tue, Jan 16, 2018 at 07:52:32PM +0800, Haiyue Wang wrote:
>> When PCH works under eSPI mode, the PMC (Power Management Controller) in
>> PCH is waiting for SUS_ACK from BMC after it alerts SUS_WARN. It is in
>> dead loop if no SUS_ACK assert. This is the basic requirement for the BMC
>> works as eSPI slave.
>>
>> Also for the host power on / off actions, from BMC side, the following VW
>> (Virtual Wire) messages are done in firmware:
>> 1. SLAVE_BOOT_LOAD_DONE / SLAVE_BOOT_LOAD_STATUS
>> 2. SUS_ACK
>> 3. OOB_RESET_ACK
>> 4. HOST_RESET_ACK
>>
>> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> ---
>>   .../devicetree/bindings/misc/aspeed-espi-slave.txt |  20 ++
>>   Documentation/misc-devices/espi-slave.rst          | 114 +++++++++
> DT files need to be split out into a separate patch so that the DT
> maintainers can properly review them.
>
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -471,6 +471,17 @@ config VEXPRESS_SYSCFG
>>   	  ARM Ltd. Versatile Express uses specialised platform configuration
>>   	  bus. System Configuration interface is one of the possible means
>>   	  of generating transactions on this bus.
>> +config ASPEED_ESPI_SLAVE
> You need a blank line above this one please.
Fixed.
>> +	depends on ARCH_ASPEED || COMPILE_TEST
>> +	select REGMAP_MMIO
> Select or depend?
Before, I used "depends on". I was told to to change "select". I'm not 
sure which is more better by practice ?
>> +	tristate "Aspeed ast2500 eSPI slave device"
>> +	---help---
>> +	  This allows host to access Baseboard Management Controller (BMC) over the
>> +	  Enhanced Serial Peripheral Interface (eSPI) bus, which replaces the Low Pin
>> +	  Count (LPC) bus.
>> +
>> +	  Its interface supports peripheral, virtual wire, out-of-band, and flash
>> +	  sharing channels.
> What is the module name?
You means the --help-- description is not clear and specific ?
>>   
>>   config ASPEED_LPC_CTRL
>>   	depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 5ca5f64..a1081f4 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -52,6 +52,7 @@ obj-$(CONFIG_GENWQE)		+= genwqe/
>>   obj-$(CONFIG_ECHO)		+= echo/
>>   obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
>>   obj-$(CONFIG_CXL_BASE)		+= cxl/
>> +obj-$(CONFIG_ASPEED_ESPI_SLAVE) += aspeed-espi-slave.o
> Why no tab?
Fixed, thanks.
> thanks,
>
> greg k-h
