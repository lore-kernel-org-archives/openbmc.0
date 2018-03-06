Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwqBD6vbCzF1b8
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 08:08:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2018 13:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,433,1515484800"; d="scan'208";a="206015644"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga005.jf.intel.com with ESMTP; 06 Mar 2018 13:08:16 -0800
Subject: Re: [PATCH v2 6/8] [PATCH 6/8] Documentation: hwmon: Add a document
 for PECI hwmon client driver
To: Randy Dunlap <rdunlap@infradead.org>, joel@jms.id.au, andrew@aj.id.au,
 arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com,
 linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
 <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <27a5a530-6083-89fb-3258-bc29fb71d30f@linux.intel.com>
Date: Tue, 6 Mar 2018 13:08:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
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
X-List-Received-Date: Tue, 06 Mar 2018 21:08:21 -0000

Hi Randy,

On 3/6/2018 12:28 PM, Randy Dunlap wrote:
> Hi,
> 
> On 02/21/2018 08:16 AM, Jae Hyun Yoo wrote:
> 
>> +temp<n>_label		Provides DDR DIMM temperature if this label indicates
>> +			'DIMM #'.
>> +temp<n>_input		Provides current temperature of the DDR DIMM.
>> +
>> +Note:
>> +	DIMM temperature group will be appeared when the client CPU's BIOS
> 
> 	                       will appear when
> 

I'll fix this description as you suggested. Thanks a lot!

Jae

>> +	completes memory training and testing.
>>
> 
> 
