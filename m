Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNqj63Cy6zDqfh
 for <openbmc@lists.ozlabs.org>; Sat, 28 Oct 2017 03:54:15 +1100 (AEDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Oct 2017 09:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236205986"
Received: from parzival.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 09:54:09 -0700
Subject: Re: IPMI - get device ID
To: tomjose <tomjose@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: chinari@us.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <e1f79a27-ea39-90d5-3cb9-c55f8e1d68ec@linux.intel.com>
 <59F31DFE.50809@linux.vnet.ibm.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <338bb0f3-a024-d402-f7d0-8febdd83aca9@linux.intel.com>
Date: Fri, 27 Oct 2017 09:54:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <59F31DFE.50809@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 27 Oct 2017 16:54:19 -0000

Sounds great!

Looking forward to seeing the pull request in gerrit.


Thanks,

-Dave


On 10/27/2017 04:52 AM, tomjose wrote:
> Hello Dave,
>
> https://github.com/openbmc/openbmc/issues/495
>
> We had this issue open to fix the hardcoded Product ID, Manufacturing 
> ID..etc. Since these fields are IPMI specific, we do not plan to 
> create D-Bus properties for that.
>
> The solution we have in mind is to have these values specified in a 
> yaml in the openbmc machine specific layer. This gives the advantage 
> that we have these values as machine specific and can be taken care at 
> compile time. We would add code in phosphor-host-ipmid, to generate 
> code out of this yaml file and serve the Get Device ID command.
>
> Dinesh is working on this and he would share the code on gerrit to 
> solicit your feedback. Let me know your thoughts.
>
> Regards,
> Tom
>
> On Thursday 26 October 2017 10:29 PM, Dave Cobbley wrote:
>> I noticed a bit of the get-device-id information in 
>> phosphor-ipmi-host/apphandler is hard coded.
>>
>> Much of this info should be determined at compile time - would the 
>> inventory manager be the appropriate place that all platforms under 
>> the OpenBMC umbrella would like to store this information?
>>
>> •   Device ID
>> •   Device Revision
>> •   IANA
>> •   Product ID
>> •   Auxiliary
>>
>> Thanks,
>>
>> -Dave Cobbley
>>
>
