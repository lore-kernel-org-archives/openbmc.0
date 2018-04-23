Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VDJq6l3rzDqhm
 for <openbmc@lists.ozlabs.org>; Tue, 24 Apr 2018 03:40:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2018 10:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,319,1520924400"; d="scan'208";a="53015049"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga002.jf.intel.com with ESMTP; 23 Apr 2018 10:40:54 -0700
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
 Julia Cartwright <juliac@eso.teric.us>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
 <20180423105224.GA1444@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <09b1a8af-4d47-0714-8f68-d7fe35cc7a72@linux.intel.com>
Date: Mon, 23 Apr 2018 10:40:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180423105224.GA1444@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Mon, 23 Apr 2018 17:41:00 -0000

On 4/23/2018 3:52 AM, Greg KH wrote:
> On Tue, Apr 10, 2018 at 11:32:05AM -0700, Jae Hyun Yoo wrote:
>> +static void peci_adapter_dev_release(struct device *dev)
>> +{
>> +	/* do nothing */
>> +}
> 
> As per the in-kernel documentation, I am now allowed to make fun of you.
> 
> You are trying to "out smart" the kernel by getting rid of a warning
> message that was explicitly put there for you to do something.  To think
> that by just providing an "empty" function you are somehow fulfilling
> the API requirement is quite bold, don't you think?
> 
> This has to be fixed.  I didn't put that warning in there for no good
> reason.  Please go read the documentation again...
> 
> greg k-h
> 

Hi Greg,

Thanks a lot for your review.

I think, it should contain actual device resource release code which is
being done by peci_del_adapter(), or a coupling logic should be added
between peci_adapter_dev_release() and peci_del_adapter().

As you suggested, I'll check it again after reading documentation and
understanding core.c code more deeply.

Jae
