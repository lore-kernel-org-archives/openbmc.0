Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VnyD5ZhlzF1RV
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 01:56:48 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Apr 2018 08:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,323,1520924400"; d="scan'208";a="222955339"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2018 08:56:38 -0700
Message-ID: <1524585397.21176.502.camel@linux.intel.com>
Subject: Re: [PATCH v3 09/10] drivers/hwmon: Add PECI hwmon client drivers
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Alan Cox
 <alan@linux.intel.com>,  Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn
 <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,  Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>, Greg KH
 <gregkh@linuxfoundation.org>,  Guenter Roeck <linux@roeck-us.net>, Haiyue
 Wang <haiyue.wang@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>, Jason M Biils
 <jason.m.bills@linux.intel.com>,  Jean Delvare <jdelvare@suse.com>, Joel
 Stanley <joel@jms.id.au>, Julia Cartwright <juliac@eso.teric.us>,  Miguel
 Ojeda <miguel.ojeda.sandonis@gmail.com>, Milton Miller II
 <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>, Randy Dunlap
 <rdunlap@infradead.org>, Stef van Os
 <stef.van.os@prodrive-technologies.com>, Sumeet R Pawnikar
 <sumeet.r.pawnikar@intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Date: Tue, 24 Apr 2018 18:56:37 +0300
In-Reply-To: <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-10-jae.hyun.yoo@linux.intel.com>
Organization: Intel Finland Oy
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.5-1+b1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 24 Apr 2018 15:56:53 -0000

On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:

>  drivers/hwmon/peci-cputemp.c  | 783
> ++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/peci-dimmtemp.c | 432 +++++++++++++++++++++++

Does it make sense one driver per patch?

> +#define CLIENT_CPU_ID_MASK    0xf0ff0  /* Mask for Family / Model
> info */

> +struct cpu_gen_info {
> +	u32 type;
> +	u32 cpu_id;
> +	u32 core_max;
> +};
> 

> +static const struct cpu_gen_info cpu_gen_info_table[] = {
> +	{ .type = CPU_GEN_HSX,
> +	  .cpu_id = 0x306f0, /* Family code: 6, Model number: 63
> (0x3f) */
> +	  .core_max = CORE_MAX_ON_HSX },
> +	{ .type = CPU_GEN_BRX,
> +	  .cpu_id = 0x406f0, /* Family code: 6, Model number: 79
> (0x4f) */
> +	  .core_max = CORE_MAX_ON_BDX },
> +	{ .type = CPU_GEN_SKX,
> +	  .cpu_id = 0x50650, /* Family code: 6, Model number: 85
> (0x55) */
> +	  .core_max = CORE_MAX_ON_SKX },
> +};

Are we talking about x86 CPU IDs here?
If so, why x86 corresponding headers, including intel-family.h are not
used?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
