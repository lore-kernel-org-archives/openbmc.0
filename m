Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Rnl41YxGzF21j
 for <openbmc@lists.ozlabs.org>; Fri, 20 Apr 2018 04:36:42 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Apr 2018 11:36:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,297,1520924400"; d="scan'208";a="34677634"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2018 11:36:37 -0700
Date: Thu, 19 Apr 2018 11:36:37 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, emilyshaffer@google.com,
 tomjose@linux.vnet.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI Firmware Firewall
Message-ID: <20180419183637.GT113334@mauery>
References: <1d827b60-27cf-25f9-3df0-07f28de9fdf5@linux.vnet.ibm.com>
 <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1d8664d8-d3ad-0be8-7237-535ed0f6ea34@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 18:36:49 -0000

On 19-Apr-2018 03:52 PM, Alexander Amelkin wrote:
>Well, although I've never seen this feature actually implemented
>anywhere, I can imagine that it can be useful for cases when the host OS

Back in 2006, some IBM servers had BMCs that supported this. I guess 
their BMC developers got really excited about the new IPMI 2.0 spec and 
went all out.

>is "owned"/managed by a different entity than the hardware. E.g. in a
>dedicated server hosting or similar scenarios. The owner of the hardware
>may not want to allow the tenants to be able to perform destructive or
>potentially destructive operations on the BMC. I can think of
>prohibiting firmware updates (even with good firmwares), user
>management, network configuration, SEL and PEF/PET manipulation, et al.

The firmware firewall mechanism as is does not really do much good. I 
spent a while writing up the ipmitool implementation in 2006. The 
biggest trouble with it is that the configuration of it happens as the 
admin user, so if your untrusted user has admin privileges, they could 
potentially just change the firmware firewall. The nice part is that it 
makes the ipmi commands more discoverable.

But as part of the rework of the ipmi daemon, I was thinking of adding 
in a filter layer that allows ipmi providers to hook in whatever command 
filtering that they want. This is where the ipmi firmware firewall would 
exist (if it was to be implemented) and where the current IBM 
"Whitelist" could be hooked in.

--Vernon

>Sincerely,
>Alexander.
>
>19.04.2018 13:17, Deepak Kodihalli wrote:
>> Hi All,
>>
>> The Firmware Firewall is something that the OpenBMC stack does not
>> implement today. Do you know how useful this is to an IPMI user? Is
>> this something we must implement in the IPMI stack?
>>
>> It seems to apply to malicious firmware running on the BMC in a blade
>> server/multi-bmc environment, but aren't those concerns addressed by
>> signed images and/or other modern security features?
>>
>> Thanks,
>> Deepak
>>
>
>
