Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHd9z3TYpzF0Zm
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 07:43:02 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 12:42:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,346,1511856000"; d="scan'208";a="10549031"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2018 12:42:57 -0800
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, joel@jms.id.au,
 andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
 jdelvare@suse.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <1515661583.31850.34.camel@kernel.crashing.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <7a038bd0-b2e0-2261-deea-f37a3e1810ba@linux.intel.com>
Date: Thu, 11 Jan 2018 12:42:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515661583.31850.34.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 20:43:04 -0000

On 1/11/2018 1:06 AM, Benjamin Herrenschmidt wrote:
> On Tue, 2018-01-09 at 14:31 -0800, Jae Hyun Yoo wrote:
>> +struct peci_rd_ia_msr_msg {
>> +       unsigned char target;
>> +       unsigned char thread_id;
>> +       unsigned short address;
>> +       unsigned long value;
>> +};
> 
> Those types are representing messages on the wire ?
> 
> In that case those types aren't suitable. For example "long" will have
> a different size and alignment for 32 and 64-bit userspace. There are
> size-explicit userspace types available.
> 
> Also I didn't see any endianness annotations in there. Is that expected
> ? IE are those wire format packets ?
> 
> Cheers,
> Ben.
> 

Only the 'peci_xfer_msg' struct is representing messages on the wire. 
All userspace messages which is using other struct definitions will be 
copied into the 'peci_xfer_msg' for each member variable in driver, but 
anyway, type definitions of each member variable should be fixed as you 
said. Will fix it.

Thanks,
Jae
