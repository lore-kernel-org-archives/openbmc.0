Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHczS0r15zF0dg
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 07:33:55 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 12:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,346,1511856000"; d="scan'208";a="10547333"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2018 12:33:51 -0800
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org,
 andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <20180110101840.GB5822@kroah.com>
 <1515661373.31850.31.camel@kernel.crashing.org>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <538056d0-dacc-b27e-db37-9b956dc06496@linux.intel.com>
Date: Thu, 11 Jan 2018 12:33:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515661373.31850.31.camel@kernel.crashing.org>
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
X-List-Received-Date: Thu, 11 Jan 2018 20:33:56 -0000

On 1/11/2018 1:02 AM, Benjamin Herrenschmidt wrote:
> On Wed, 2018-01-10 at 11:18 +0100, Greg KH wrote:
>> On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
>>> This commit adds driver implementation for Aspeed PECI. Also adds
>>> generic peci.h and peci_ioctl.h files to provide compatibility
>>> to peci drivers that can be implemented later e.g. Nuvoton's BMC
>>> SoC family.
>>
>> We don't add code that could be used "sometime in the future".  Only
>> include stuff that we use now.
>>
>> Please fix up this series based on that and resubmit.  There should not
>> be any need for any uapi file then, right?
> 
> No Greg, I think you misunderstood (unless I misread myself).
> 
> What Jae means is that since PECI is a standard and other drivers
> implementing the same ioctl interface and messages will eventually go
> upstream, instead of having the ioctl definitions in a driver specific
> locations, they go in a generic spot, as they define a generic API for
> all PECI drivers, including the one that's getting merged now.
> 
> IE. This doesn't add unused stuff, it just puts the API parts of it
> into a generic location.
> 
> At least that's my understanding from a, granted cursory, look at the
> patch.
> 
> That said, I do have a problem with the structure definitions of the
> various packet types as they use "long" which has a variable size and
> unclear alignment. It should be using __u8, __u16 and __u32...
> 
> Cheers,
> Ben.
> 

Thanks for your clear explanation. That is what I actually intended to. 
However, the structure definitions you and Greg pointed out need to be 
corrected. I will fix it.

Thanks,
Jae
