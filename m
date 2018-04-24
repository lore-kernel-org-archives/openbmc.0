Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Vp4J1GmhzF1RV
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 02:02:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Apr 2018 09:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,323,1520924400"; d="scan'208";a="50430491"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2018 09:01:58 -0700
Message-ID: <1524585717.21176.504.camel@linux.intel.com>
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
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
Date: Tue, 24 Apr 2018 19:01:57 +0300
In-Reply-To: <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 24 Apr 2018 16:02:09 -0000

On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:
> This commit adds driver implementation for PECI bus core into linux
> driver framework.
> 

All comments you got for patch 6 are applicable here.

And perhaps in the rest of the series.

The rule of thumb: when you get even single comment in a certain place,
re-check _entire_ series for the same / similar patterns!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
