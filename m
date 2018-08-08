Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m5KC0FSKzDrZC
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 08:14:37 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2018 15:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,212,1531810800"; d="scan'208";a="78702889"
Received: from parzival.jf.intel.com (HELO [10.54.51.103]) ([10.54.51.103])
 by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2018 15:14:34 -0700
Subject: Re: Managing openbmc with subtree
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
 <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
 <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, prashanth.giri@dell.com, sachit_bakshi@dell.com
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <8b4c11b3-d6d7-c586-5d10-9c028d3fefb2@linux.intel.com>
Date: Wed, 8 Aug 2018 15:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 08 Aug 2018 22:14:39 -0000


>> On Aug 7, 2018, at 1:16 PM, Dave Cobbley <david.j.cobbley@linux.intel.com> wrote:
>>
>> I do agree that we can find a scriptable solution to this, however, I feel using the OWNERS plugin provides a much easier workflow for all developers, i.e. nothing changes from their perspective.
> Hrm, while I agree that the OWNERS plugin preserves the existing workflow
> I’m not convinced that is the best path forward.
I suppose it does only give us one of the two goals, where as moving 
straight to subtrees fulfills all of the goals.
>
>>> This gives us the same process for all subtrees, whether or not they are
>>> openbmc hosted subtrees.  It also does not require people hacking on a
>>> subtree to clone OpenBMC when it doesn’t make sense for them to do that,
>>> such as someone just using the Aspeed BSP layer.
>
> I still have these concerns.
I understand your concerns and agree - Here is what I would propose for 
the subtree folder structure:

Splat * represents a subtree

Yocto & more:
import-layers/
     *meta-openembedded/
     *meta-virtualization/
     *poky/
     *meta-security/

BSP:
meta-openbmc-bsp/
    *meta-ibm/
    *meta-aspeed/
    *meta-nuvoton/
    *meta-raspberrypi/

MACHINES:
meta-openbmc-machines/
    meta-arm/
        *meta-qualcomm/
    meta-openpower/
        * meta-ibm/
        * meta-ingrasys/
        * meta-inventec/
        * meta-rackspace/
    meta-x86/
        *meta-intel/
        *meta-mellanox/
        *meta-portwell/
        *meta-quanta/

REFERENCE:
meta-phosphor/


-Dave
