Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44GF3r300WzDqJT
 for <openbmc@lists.ozlabs.org>; Sat,  9 Mar 2019 04:34:08 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2019 09:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,456,1544515200"; d="scan'208";a="174755457"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga001.jf.intel.com with ESMTP; 08 Mar 2019 09:34:05 -0800
Subject: Re: How to upload proposal and code for specifying and customizing
 projects?
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <86e053918f1541f3a7b8f9264355080f@quantatw.com>
 <20190307041941.22vujoizv5prib57@thinkpad>
 <417a986a10d340148fdc010a703ded2e@quantatw.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <f6916b49-6af2-e78b-9e1a-918aaf8f5d61@intel.com>
Date: Fri, 8 Mar 2019 09:34:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <417a986a10d340148fdc010a703ded2e@quantatw.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 08 Mar 2019 17:34:17 -0000



On 3/7/19 6:49 PM, Tony Lee (李文富) wrote:
> Hi Brad,
> 
> 
>> I can certainly create a quanta-dbus-interfaces repository if you'd like.  But first - I'm just curious about what sorts of DBus APIs you have?  Are they actually specific to Quanta machines, or could they be put in phosphor-dbus-interfaces?  
> Understood. It can also be used for the machine has NVMe drives on it. The APIs could be put in phosphor-dbus-interfaces.
> for example, "xyz.openbmc_project.Nvme.Information”. The properties will be SerialNumber, VendorID, SmartWarnings, StatusFlags, DriveLifeUsed.

There is already some initial work to do this, and this is definitely
not a quanta specific feature.  It should not be put in
quanta-dbus-interfaces.  The design document below is laying the ground
work to enable NVMe-MI.  It be great if you could help to review it
before implementing anything, or pushing your own design doc.
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/18031/

The long term intention is that this will be implemented as part of the
xyz.openbmc_project.Asset interface, and leave the NVMe information to
an NVME-specific API.

> 
>> Could you briefly talk about what some of the applications that present/would present these APIs do?
> The application is to retrieve information of the NVMe devices by NVMe-MI commands via SMBus directly.
> 
> Thanks
> Best Regards,
> Tony

It would help a lot if you could help to review some of the code reviews
in progress that are working through NVMe-MI.  That will accelerate NVMe
support faster than starting over from scratch.

-Ed
