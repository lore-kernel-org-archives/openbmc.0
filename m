Return-Path: <andriy.shevchenko@intel.com>
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y7YD3BnDzDqhD
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 07:18:35 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 12:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="216044742"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 12:18:20 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1if8R7-0005cv-Vn; Wed, 11 Dec 2019 22:18:17 +0200
Date: Wed, 11 Dec 2019 22:18:17 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>,
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
 Philippe Ombredanne <pombredanne@nexb.com>,
 Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 Gavin Schenk <g.schenk@eckelmann.de>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 Alan Cox <alan@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Yunge Zhu <yunge.zhu@linux.intel.com>
Subject: Re: [PATCH v11 03/14] peci: Add support for PECI bus driver core
Message-ID: <20191211201817.GC32742@smile.fi.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-4-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211194624.2872-4-jae.hyun.yoo@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:05 +1100
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
X-List-Received-Date: Wed, 11 Dec 2019 20:18:41 -0000

On Wed, Dec 11, 2019 at 11:46:13AM -0800, Jae Hyun Yoo wrote:
> This commit adds driver implementation for PECI bus core into linux
> driver framework.
> 
> PECI (Platform Environment Control Interface) is a one-wire bus interface
> that provides a communication channel from Intel processors and chipset
> components to external monitoring or control devices. PECI is designed to
> support the following sideband functions:
> 
> * Processor and DRAM thermal management
>   - Processor fan speed control is managed by comparing Digital Thermal
>     Sensor (DTS) thermal readings acquired via PECI against the
>     processor-specific fan speed control reference point, or TCONTROL. Both
>     TCONTROL and DTS thermal readings are accessible via the processor PECI
>     client. These variables are referenced to a common temperature, the TCC
>     activation point, and are both defined as negative offsets from that
>     reference.
>   - PECI based access to the processor package configuration space provides
>     a means for Baseboard Management Controllers (BMC) or other platform
>     management devices to actively manage the processor and memory power
>     and thermal features.
> 
> * Platform Manageability
>   - Platform manageability functions including thermal, power, and error
>     monitoring. Note that platform 'power' management includes monitoring
>     and control for both the processor and DRAM subsystem to assist with
>     data center power limiting.
>   - PECI allows read access to certain error registers in the processor MSR
>     space and status monitoring registers in the PCI configuration space
>     within the processor and downstream devices.
>   - PECI permits writes to certain registers in the processor PCI
>     configuration space.
> 
> * Processor Interface Tuning and Diagnostics
>   - Processor interface tuning and diagnostics capabilities
>     (Intel Interconnect BIST). The processors Intel Interconnect Built In
>     Self Test (Intel IBIST) allows for infield diagnostic capabilities in
>     the Intel UPI and memory controller interfaces. PECI provides a port to
>     execute these diagnostics via its PCI Configuration read and write
>     capabilities.
> 
> * Failure Analysis
>   - Output the state of the processor after a failure for analysis via
>     Crashdump.
> 
> PECI uses a single wire for self-clocking and data transfer. The bus
> requires no additional control lines. The physical layer is a self-clocked
> one-wire bus that begins each bit with a driven, rising edge from an idle
> level near zero volts. The duration of the signal driven high depends on
> whether the bit value is a logic '0' or logic '1'. PECI also includes
> variable data transfer rate established with every message. In this way, it
> is highly flexible even though underlying logic is simple.
> 
> The interface design was optimized for interfacing between an Intel
> processor and chipset components in both single processor and multiple
> processor environments. The single wire interface provides low board
> routing overhead for the multiple load connections in the congested routing
> area near the processor and chipset components. Bus speed, error checking,
> and low protocol overhead provides adequate link bandwidth and reliability
> to transfer critical device operating conditions and configuration
> information.
> 
> This implementation provides the basic framework to add PECI extensions to
> the Linux bus and device models. A hardware specific 'Adapter' driver can
> be attached to the PECI bus to provide sideband functions described above.
> It is also possible to access all devices on an adapter from userspace
> through the /dev interface. A device specific 'Client' driver also can be
> attached to the PECI bus so each processor client's features can be
> supported by the 'Client' driver through an adapter connection in the bus.

Nice, we have some drivers under drivers/hwmon. Are they using PECI? How they
will be integrated to this? Can this be part of drivers/hwmon?

> Changes since v10:

It's funny I don't remember previous version(s), but anyway I'll comment on
this later on -- it has at least several style issues / inconveniences.

> - Split out peci-dev module from peci-core module.
> - Added PECI 4.0 command set support.
> - Refined 32-bit boundary alignment for all PECI ioctl command structs.
> - Added DMA safe command buffer handling in peci-core.
> - Refined kconfig dependencies in PECI subsystem.
> - Fixed minor bugs and style issues.
> - configfs support isn't added in this patch set. Will add that using a
>   seperate patch set.

> +config PECI
> +	tristate "PECI support"
> +	select CRC8

> +	default n

As for beginning, this one is redundant.
If you have more, drop them.

> +#include <linux/bitfield.h>
> +#include <linux/crc8.h>
> +#include <linux/delay.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>

> +#include <linux/of_device.h>

What about ACPI? Can you use fwnode API?

> +#include <linux/peci.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/sched/task_stack.h>
> +#include <linux/slab.h>

-- 
With Best Regards,
Andy Shevchenko
