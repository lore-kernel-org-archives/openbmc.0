Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmxbb4FLVzF120
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 12:29:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2018 17:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,376,1515484800"; d="scan'208";a="206056238"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.109.12])
 ([10.254.109.12])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2018 17:29:27 -0800
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, joel@jms.id.au, andrew@aj.id.au,
 arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
 <20180222003720.GA25250@lunn.ch>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
Date: Wed, 21 Feb 2018 17:29:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180222003720.GA25250@lunn.ch>
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
X-List-Received-Date: Thu, 22 Feb 2018 01:29:32 -0000

On 2/21/2018 4:37 PM, Andrew Lunn wrote:
>> But even with this change, it still needs to use delayed creation
>> because BMC side kernel doesn't know how many DIMMs are populated on
>> a remote server before the remote server completes its memory
>> training and testing in BIOS, but it needs to check the remote
>> server's CPU temperature as immediate as possible to make
>> appropriate thermal control based on the remote CPU's temperature to
>> avoid any critical thermal issue. What would be a better solution in
>> this case?
> 
> You could change this driver so that it supports one DIMM.  Move the
> 'hotplug' part into another driver which creates and destroys
> instances of the hwmon DIMM device as the DIMMS come and go.
> 
> Also, do you need to handle CPU hotplug? You could split the CPU
> temperature part into a separate hwmon driver? And again create and
> destroy devices as CPUs come and go?
> 
> 	Andrew
> 

That seems like a possible option. I'll rewrite the hwmon driver again 
like that.

Thanks for the good idea. :)

Jae
