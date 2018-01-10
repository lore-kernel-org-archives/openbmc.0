Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zGzcL4Q93zF0kF
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 06:30:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2018 11:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,341,1511856000"; d="scan'208";a="22993976"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2018 11:30:05 -0800
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
 linux@roeck-us.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
Date: Wed, 10 Jan 2018 11:30:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180110191703.GA20248@kroah.com>
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
X-List-Received-Date: Wed, 10 Jan 2018 19:30:11 -0000

On 1/10/2018 11:17 AM, Greg KH wrote:
> On Wed, Jan 10, 2018 at 11:14:34AM -0800, Jae Hyun Yoo wrote:
>> On 1/10/2018 2:17 AM, Greg KH wrote:
>>> On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
>>>> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
>>>>
>>>> Hello,
>>>>
>>>> This patch set provides support for PECI of AST2400/2500 which can give us PECI
>>>> functionalities such as temperature monitoring, platform manageability,
>>>> processor diagnostics and failure analysis. Also provides generic peci.h and
>>>> peci_ioctl.h headers to provide compatibility to peci drivers that can be
>>>> implemented later e.g. Nuvoton's BMC SoC family.
>>>
>>> What is the "dev-4.10" in the subject for?  4.10 is really old and
>>> obsolete :(
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>
>> I made this patch set on top of the v4.10 which OpenBmc project is currently
>> using. I'll rebase this patch set onto the current kernel.org mainline.
> 
> What is "OpenBmc", and why are they using an obsolete and insecure
> kernel for their project?  That seems like a very foolish thing to do...
> 
> thanks,
> 
> greg k-h
> 

OpenBmc is an open source project to create a highly extensible 
framework for BMC (Board Management Controller) software for data-center 
computer systems:
https://github.com/openbmc

Its current mainline is v4.10 but it is being kept upgrading so it will 
be upgraded to the latest stable or long-term version soon.

Thanks,
Jae
