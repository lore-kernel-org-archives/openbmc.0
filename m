Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40QYV63J57zF1r1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 04:21:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Apr 2018 11:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,464,1517904000"; d="scan'208";a="192236637"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150])
 ([10.7.153.150])
 by orsmga004.jf.intel.com with ESMTP; 17 Apr 2018 11:21:14 -0700
Subject: Re: [PATCH v3 06/10] drivers/peci: Add a PECI adapter driver for
 Aspeed AST24xx/AST25xx
To: Robin Murphy <robin.murphy@arm.com>, Alan Cox <alan@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann
 <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Haiyue Wang
 <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-7-jae.hyun.yoo@linux.intel.com>
 <93e7f93c-a2e4-1e16-be4c-b908f88b9897@arm.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <684d1e9e-b07d-ef79-4333-e47d11326e7f@linux.intel.com>
Date: Tue, 17 Apr 2018 11:21:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <93e7f93c-a2e4-1e16-be4c-b908f88b9897@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 17 Apr 2018 18:21:19 -0000

Hi Robin,

On 4/17/2018 6:37 AM, Robin Murphy wrote:
> Just a drive-by nit:
> 
> On 10/04/18 19:32, Jae Hyun Yoo wrote:
> [...]
>> +#define PECI_CTRL_SAMPLING_MASK     GENMASK(19, 16)
>> +#define PECI_CTRL_SAMPLING(x)       (((x) << 16) & 
>> PECI_CTRL_SAMPLING_MASK)
>> +#define PECI_CTRL_SAMPLING_GET(x)   (((x) & PECI_CTRL_SAMPLING_MASK) 
>> >> 16)
> 
> FWIW, <linux/bitfield.h> already provides functionality like this, so it 
> might be worth taking a look at FIELD_{GET,PREP}() to save all these 
> local definitions.
> 
> Robin.

Yes, that looks better. Thanks a lot for your pointing it out.

Jae
