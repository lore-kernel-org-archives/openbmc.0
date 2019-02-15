Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440tjN4Wz4zDqTn
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 11:01:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 16:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,370,1544515200"; d="scan'208";a="122556115"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2019 16:01:57 -0800
Subject: Re: Building intel s2600wf image
To: openbmc@lists.ozlabs.org
References: <5beefafbdca24738a72f243e667823fe@Eltsrv03.Eltan.local>
 <1550188196.4146662.1658273928.7C23EE25@webmail.messagingengine.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0af603f9-33e6-0dcb-7e9c-2cfa13cc2a02@linux.intel.com>
Date: Thu, 14 Feb 2019 16:01:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1550188196.4146662.1658273928.7C23EE25@webmail.messagingengine.com>
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
X-List-Received-Date: Fri, 15 Feb 2019 00:02:01 -0000

On 2/14/19 3:49 PM, Andrew Jeffery wrote:
> Hi Wim,
> 
> On Fri, 15 Feb 2019, at 02:51, Wim Vervoorn wrote:
>> Hello,
>>
>> We are trying to build the Intel s2600wf image using the latest OpenBMC
>> tree. If we do that we are running into build errors.
>>
>> Before digging into this can you tell me which commit of the tree can be
>> used to build an image for  this device without errors. This allows us
>> to have a stable version for reference.

I tried to build today with latest trunk and there were some issues, I 
fixed them all today but all the bumps have to go through first. 
Specifically this one: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-intel/+/18410/

Then it needs to get synced into openbmc-openbmc, or you can checkout 
the patch with the above version of meta-phosphor and it should build.

Thanks

-James
