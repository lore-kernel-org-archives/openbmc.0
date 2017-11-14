Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybSP860HCzDqfx
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 11:02:19 +1100 (AEDT)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2017 16:02:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,392,1505804400"; 
   d="scan'208";a="1558489"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.84]) ([10.54.51.84])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2017 16:02:16 -0800
Subject: Re: [PATCH linux dev-4.10 1/1] arm: dts: Add Wfp BMC Machine
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <d011d483-b02d-b2ad-6b70-eb278a21fc33@linux.intel.com>
 <CACPK8Xfi_OV9sjQRauH_JbYP4H8mXFYWjfG8kAF8R5WxQZ7SKg@mail.gmail.com>
 <74db8309-6d27-d951-53fb-c3252af9403c@linux.intel.com>
 <CACPK8XcH99Fqp-kHE--wpXtGsE9_fkgUmevWdKVX4RwDSzLvVg@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <fbe96e31-3ffd-1615-671f-935652e3ae04@linux.intel.com>
Date: Mon, 13 Nov 2017 16:02:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcH99Fqp-kHE--wpXtGsE9_fkgUmevWdKVX4RwDSzLvVg@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Nov 2017 00:02:21 -0000

On 11/13/2017 03:43 PM, Joel Stanley wrote:
> On Tue, Nov 14, 2017 at 4:16 AM, James Feist
> <james.feist@linux.intel.com> wrote:
>> On 11/12/2017 11:36 PM, Joel Stanley wrote:
>>>
>>> This is the same as aspeed-bmc-opp-flash-layout.dtsi. Is there any
>>> reason we can't reuse that file?
>>>
>>
>> We could, however it seems a bit awkward to have this platform lumped in
>> with open power, as it is not an open power platform. Also if we decide to
>> modify the flash layout then this would have to be done anyways. I am fine
>> either way, it just seemed to make more sense having them separate. Another
>> alternative would be to rename aspeed-bmc-opp-flash-layout.dtsi to something
>> more openbmc related instead of openpower.
> 
> I'd be happy to accept a patch that renames it. I was never a fan of
> the opp string in the device tree files; it's namespacing that
> upstream dts and dtsi tend not to have.
> 
> Cheers,
> 
> Joel
> 
Does aspeed-bmc-phosphor-flash-layout.dtsi sound reasonable?

Thanks,

James
