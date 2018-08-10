Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41nHDb5cK4zDrYj
 for <openbmc@lists.ozlabs.org>; Sat, 11 Aug 2018 06:44:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Aug 2018 13:44:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,221,1531810800"; d="scan'208";a="82410749"
Received: from parzival.jf.intel.com (HELO [10.54.51.103]) ([10.54.51.103])
 by orsmga002.jf.intel.com with ESMTP; 10 Aug 2018 13:44:42 -0700
Subject: Re: Managing openbmc with subtree
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
 <fe79284e-e3d6-a71f-f055-6bcbe899fbd5@linux.intel.com>
 <9DC9FBE9-FD4E-48C3-9AA8-423204DCF039@fuzziesquirrel.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <f17ee3e4-d858-f920-2348-082362ab4b26@linux.intel.com>
Date: Fri, 10 Aug 2018 13:44:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9DC9FBE9-FD4E-48C3-9AA8-423204DCF039@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 10 Aug 2018 20:44:48 -0000


On 08/09/2018 08:17 PM, Brad Bishop wrote:
>> On Aug 9, 2018, at 8:31 PM, Dave Cobbley <david.j.cobbley@linux.intel.com> wrote:
>>
>>>> So to net these all out:
>>>>
>>>> *poky/
>>>>
>>>> *meta-openembedded/
>>>> *meta-virtualization/
>>>> *meta-security/
>>>> *meta-arm/
>>>> *meta-openpower/
>>>> *meta-x86/
>>>> *meta-phosphor/
>>>>
>>>> *meta-aspeed/
>>>> *meta-nuvoton/
>>>> *meta-raspberrypi/
>>>>
>>>> *meta-intel/
>>>> *meta-mellanox/
>>>> *meta-portwell/
>>>> *meta-quanta/
>>>> *meta-ibm/
>>>> *meta-ingrasys/
>>>> *meta-inventec/
>>>> *meta-rackspace/
>>>> *meta-qualcomm/
>>> Just to clarify - *meta-intel would contain our machine specific configurations for particular intel platforms, while *meta-x86 would contain image-like things that are generic to all x86 server platforms?
>>> Not sure I understand why meta-x86 exists if meta-intel/mellanox/portwell/quanta are all on the top level. Meta-x86 was simply a folder in my proposal.
>> Looking at this further, I believe I understand the difference:
>> meta-intel is our actual baseboard products
>> meta-x86 is all things that relate specifically to baseboards that contain x86 processors.
>>
>> Does that sound right?
> Yes, exactly.
>
>>> -Dave
Brad,
Can you make new github projects for the following? Just about 
everything else has a repo for subtrees.

meta-arm/
meta-x86/
meta-nuvoton/
meta-intel/
meta-mellanox/
meta-portwell/
meta-quanta/
meta-ibm/
meta-ingrasys/
meta-inventec/
meta-rackspace/

Subtress that already have a repo:
*poky/
*meta-openembedded/
*meta-security/
*meta-openpower/
*meta-phosphor/
*meta-aspeed/
*meta-raspberrypi/
*meta-qualcomm/ -- is this qualcomm-misc?

Should we need to rename qualcomm-mist to meta-qualcomm?

Additionally, looking at next steps for this:
- Modify the build script to run a full yocto build with each individual 
subtree review.
- Need to create a script which will merge code into the top level 
openbmc/openbmc
     Still trying to image what this script will look like, for example:
     $ git clone openbmc/openbmc
     $ git cherry-pick --strategy=subtree -Xsubtree=$SubtreePath $SubtreeSHA
     $ git push #does it need to push for review? I'm assuming at this 
point the build had already run on the subtree repo...
- How to handle existing reviews? Do we need a script to keep the 
subtrees up to date?

Are there any other steps I am missing?

Thanks,
-Dave
