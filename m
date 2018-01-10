Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGzjr5dxwzF0jb
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 06:34:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2018 11:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,341,1511856000"; d="scan'208";a="22994845"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2018 11:34:54 -0800
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <20180110102011.GC5822@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d0977a2f-485c-f425-0a3b-7a20d0292273@linux.intel.com>
Date: Wed, 10 Jan 2018 11:34:54 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180110102011.GC5822@kroah.com>
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
X-List-Received-Date: Wed, 10 Jan 2018 19:34:57 -0000

On 1/10/2018 2:20 AM, Greg KH wrote:
> On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
>> +#pragma pack(push, 1)
>> +struct peci_xfer_msg {
>> +	unsigned char client_addr;
>> +	unsigned char tx_len;
>> +	unsigned char rx_len;
>> +	unsigned char tx_buf[MAX_BUFFER_SIZE];
>> +	unsigned char rx_buf[MAX_BUFFER_SIZE];
>> +};
>> +#pragma pack(pop)
> 
> For any structure that crosses the user/kernel boundry, you _HAVE_ to
> use the "__" variant.  So for here you would use __u8 instead of
> "unsigned char" in order for things to work properly.
> 
> I'm guessing you didn't test this all out on a mixed 32/64 bit system?
> 
> Please fix up and test to ensure that it all works properly before
> resubmitting.
> 
> thanks,
> 
> greg k-h
> 

Thanks for your pointing it out. I'll fix this.

Thanks a lot,
Jae
