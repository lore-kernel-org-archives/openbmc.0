Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwmqX31FhzF1X7
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 06:21:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2018 11:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,432,1515484800"; d="scan'208";a="205993741"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga005.jf.intel.com with ESMTP; 06 Mar 2018 11:21:57 -0800
Subject: Re: [PATCH v2 0/8] PECI device driver introduction
To: Pavel Machek <pavel@ucw.cz>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, andrew@lunn.ch, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180306124014.GB13950@amd>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <94a31519-8009-b131-4d9e-95631b789931@linux.intel.com>
Date: Tue, 6 Mar 2018 11:21:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306124014.GB13950@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2018 19:22:01 -0000

Hi Pavel,

Please see my answer inline.

On 3/6/2018 4:40 AM, Pavel Machek wrote:
> Hi!
> 
>> Introduction of the Platform Environment Control Interface (PECI) bus
>> device driver. PECI is a one-wire bus interface that provides a
>> communication channel between Intel processor and chipset components to
>> external monitoring or control devices. PECI is designed to support the
>> following sideband functions:
>>
>> * Processor and DRAM thermal management
>>    - Processor fan speed control is managed by comparing Digital Thermal
>>      Sensor (DTS) thermal readings acquired via PECI against the
>>      processor-specific fan speed control reference point, or TCONTROL.
>>      Both TCONTROL and DTS thermal readings are accessible via the processor
>>      PECI client. These variables are referenced to a common temperature,
>>      the TCC activation point, and are both defined as negative offsets from
>>      that reference.
>>    - PECI based access to the processor package configuration space provides
>>      a means for Baseboard Management Controllers (BMC) or other platform
>>      management devices to actively manage the processor and memory power
>>      and thermal features.
>>
>> * Platform Manageability
>>    - Platform manageability functions including thermal, power, and error
>>      monitoring. Note that platform 'power' management includes monitoring
>>      and control for both the processor and DRAM subsystem to assist with
>>      data center power limiting.
>>    - PECI allows read access to certain error registers in the processor MSR
>>      space and status monitoring registers in the PCI configuration space
>>      within the processor and downstream devices.
>>    - PECI permits writes to certain registers in the processor PCI
>>      configuration space.
>>
>> * Processor Interface Tuning and Diagnostics
>>    - Processor interface tuning and diagnostics capabilities
>>      (Intel(c) Interconnect BIST). The processors Intel(c) Interconnect
>>      Built In Self Test (Intel(c) IBIST) allows for infield diagnostic
>>      capabilities in the Intel UPI and memory controller interfaces. PECI
>>      provides a port to execute these diagnostics via its PCI Configuration
>>      read and write capabilities.
>>
>> * Failure Analysis
>>    - Output the state of the processor after a failure for analysis via
>>      Crashdump.
>>
>> PECI uses a single wire for self-clocking and data transfer. The bus
>> requires no additional control lines. The physical layer is a self-clocked
>> one-wire bus that begins each bit with a driven, rising edge from an idle
>> level near zero volts. The duration of the signal driven high depends on
>> whether the bit value is a logic '0' or logic '1'. PECI also includes
>> variable data transfer rate established with every message. In this way,
>> it is highly flexible even though underlying logic is simple.
>>
>> The interface design was optimized for interfacing to Intel processor and
>> chipset components in both single processor and multiple processor
>> environments. The single wire interface provides low board routing
>> overhead for the multiple load connections in the congested routing area
>> near the processor and chipset components. Bus speed, error checking, and
>> low protocol overhead provides adequate link bandwidth and reliability to
>> transfer critical device operating conditions and configuration
>> information.
>>
>> This implementation provides the basic framework to add PECI extensions
>> to the Linux bus and device models. A hardware specific 'Adapter' driver
>> can be attached to the PECI bus to provide sideband functions described
>> above. It is also possible to access all devices on an adapter from
>> userspace through the /dev interface. A device specific 'Client' driver
>> also can be attached to the PECI bus so each processor client's features
>> can be supported by the 'Client' driver through an adapter connection in
>> the bus. This patch set includes Aspeed 24xx/25xx PECI driver and a generic
>> PECI hwmon driver as the first implementation for both adapter and client
>> drivers on the PECI bus framework.
> 
> Ok, how does this interact with ACPI/SMM BIOS/Secure mode code? Does
> Linux _need_ to control the fan? Or is SMM BIOS capable of doing all
> the work itself and Linux has just read-only access for monitoring
> purposes?
> 

This driver is not for local CPUs which this driver is running on. 
Instead, this driver will be running on BMC (Baseboard Management 
Controller) kernel which is separated from the server machine. In this 
implementation, it provides just read-only access for monitoring the 
server's CPU and DIMM temperatures remotely through a PECI connection. 
The BMC can control fans according to the monitoring data if the BMC has 
a fan control interface and feature, but it depends on baseboard 
hardware and software designs.

Thanks,
Jae

> Pavel
> 
> -- (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
