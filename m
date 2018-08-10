Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mmJl3jHmzDqww
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 10:31:34 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2018 17:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,217,1531810800"; d="scan'208";a="79061397"
Received: from parzival.jf.intel.com (HELO [10.54.51.103]) ([10.54.51.103])
 by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2018 17:31:30 -0700
Subject: Re: Managing openbmc with subtree
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, prashanth.giri@dell.com, sachit_bakshi@dell.com
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
 <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
 <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
 <8b4c11b3-d6d7-c586-5d10-9c028d3fefb2@linux.intel.com>
 <27F75378-E985-47F6-8516-086CF8197D85@fuzziesquirrel.com>
 <d20b9c39-38b1-dd91-4847-1a65479c0f51@linux.intel.com>
Message-ID: <fe79284e-e3d6-a71f-f055-6bcbe899fbd5@linux.intel.com>
Date: Thu, 9 Aug 2018 17:31:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d20b9c39-38b1-dd91-4847-1a65479c0f51@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2018 00:31:36 -0000


>> So to net these all out:
>>
>> *poky/
>>
>> *meta-openembedded/
>> *meta-virtualization/
>> *meta-security/
>> *meta-arm/
>> *meta-openpower/
>> *meta-x86/
>> *meta-phosphor/
>>
>> *meta-aspeed/
>> *meta-nuvoton/
>> *meta-raspberrypi/
>>
>> *meta-intel/
>> *meta-mellanox/
>> *meta-portwell/
>> *meta-quanta/
>> *meta-ibm/
>> *meta-ingrasys/
>> *meta-inventec/
>> *meta-rackspace/
>> *meta-qualcomm/
> Just to clarify - *meta-intel would contain our machine specific 
> configurations for particular intel platforms, while *meta-x86 would 
> contain image-like things that are generic to all x86 server platforms?
> Not sure I understand why meta-x86 exists if 
> meta-intel/mellanox/portwell/quanta are all on the top level. Meta-x86 
> was simply a folder in my proposal.
Looking at this further, I believe I understand the difference:
meta-intel is our actual baseboard products
meta-x86 is all things that relate specifically to baseboards that 
contain x86 processors.

Does that sound right?
> -Dave
