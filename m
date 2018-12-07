Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BJSS2mDnzDsZ0
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 03:53:11 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2018 08:53:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,326,1539673200"; d="scan'208";a="98922483"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 07 Dec 2018 08:53:09 -0800
Subject: Re: Split and join. The preferred way.
To: vishwa <vishwa@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <e39c8977-b81b-d9ce-96c4-14dcd17bb508@yadro.com>
 <163f3f05-2438-585a-3c9f-28d3780d86cc@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <425a24e7-63f5-04ec-a65e-45344bedb0d4@linux.intel.com>
Date: Fri, 7 Dec 2018 08:53:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <163f3f05-2438-585a-3c9f-28d3780d86cc@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2018 16:53:13 -0000

On 12/6/18 11:51 PM, vishwa wrote:
> When I had to tokenize before, I believe to have used std::stringstream 
> / std:strtok_r and no library that I am aware of.
> 
> I believe someone initiated this discussion a while ago and I am not 
> sure where that went. Brad ?
> 
> !! Vishwa !!
> 
> On 12/06/2018 02:41 PM, Alexander Amelkin wrote:
>> Hi all!
>>
>> As we all know, it's a common programming task to split/tokenize 
>> strings and join tokens back together. Those trivial methods are 
>> however not implemented in STL for C++. There is a Boost way to do it, 
>> but as far as I understand, Boost is not endorsed in OpenBMC for 

This has changed, boost is allowed if it is header only. We've use 
boost::split before.

https://github.com/openbmc/docs/blob/master/cpp-style-and-conventions.md#boost

Thanks,

James

>> understandable reasons of space-saving. Is there any openbmc-blessed 
>> method to split and join? Any commonly used library with the methods 
>> to perform the task? I hate code duplication and wouldn't like to 
>> reinvent the bicycle.
>>
>> Thank you.
>>
>> Alexander.
>>
>>
> 
