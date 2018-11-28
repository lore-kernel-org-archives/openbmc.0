Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 434xVb5vXRzDr1g
 for <openbmc@lists.ozlabs.org>; Thu, 29 Nov 2018 10:21:23 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2018 15:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,292,1539673200"; d="scan'208";a="96749173"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.31])
 ([10.241.242.31])
 by fmsmga008.fm.intel.com with ESMTP; 28 Nov 2018 15:21:21 -0800
Subject: Re: IPMI SEL refactoring comments
To: openbmc@lists.ozlabs.org
References: <551365ea-c6e2-b3d6-c9a5-2b9cdced6120@linux.vnet.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <87ce0ee0-8ac8-829f-29a4-1a9803985ef0@linux.intel.com>
Date: Wed, 28 Nov 2018 15:21:20 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <551365ea-c6e2-b3d6-c9a5-2b9cdced6120@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 28 Nov 2018 23:21:28 -0000



On 11/26/2018 5:26 AM, Tom Joseph wrote:
> Hello Jason,
> 
> I reviewed the patches for the IPMI SEL refactoring and wanted to 
> summarize the concerns with the proposed design. There are some current 
> features that are broken.
> 
> 1) The sensor numbers are arbitrary in the proposed implementation and 
> does not account for the presence/error corresponding to inventory 
> objects. On IBM systems the host firmware does not rely on the SDR 
> repository in BMC to figure out the sensor numbers, rather the sensor 
> numbers are programmed into the  host firmware at the build time. So the 
> sensor numbers cannot be arbitrary.
> 
I think this is the main issue: mapping sensor paths to sensor numbers 
in a flexible way.  Once we can find a way to allow custom sensor number 
mapping, it should allow all types of sensors to be mapped as needed.

One idea we've had would be to somehow add the sensor number into the 
sensor D-Bus object which would mitigate arbitrary numbering as needed.

>  > I know you are working on a proposal to have a customizable map of 
> sensor number to path. The support is only for threshold based sensors( 
> targeting only /xyz/openbmc_project/sensors namespace) , it needs to 
> extend support for discrete sensors. The sensor types are limited to few 
> types(temperature, voltage,current, fan_tach, power), need to support 
> other sensor types in the specification. It might not be possible to 
> deduce the sensor type from the D-Bus object path for all sensors.
> 
> 2)  OpenPower systems like Witherspoon and Zaius relies on eSEL(extended 
> SEL format) to report debug data from the host firmware. The eSEL data 
> is added to the D-Bus native error log via the Add SEL entry command. 
> This is not handled with the refactoring.
> 
>  > This is an openpower requirement and needs to be handled in an 
> openpower IPMI OEM library/application and not in the phosphor 
> implementation. A D-Bus error log containing eSEL can be created on 
> completion of transfer of eSEL and not depend on Add SEL entry. The 
> callouts associated with the eSEL can be added to the D-Bus error log by 
> keeping a watch on the IPMI SEL entries. This might need changes to 
> phosphor-logging API to support adding callout after creation of error 
> log. This is a proposal and looks viable.
> 
> 3) The current implementation the Get SEL entry is translating the D-Bus 
> error log to IPMI SEL format. If there is a FRU callout associated with 
> the D-Bus error log(D-Bus object paths in the inventory namespace) it is 
> mapped to the sensor number associated with FRU and reported through SEL.
> 
>  > The implementation of the Get SEL entry needs to adapt to include all 
> the objects paths(the patchsets target only /xyz/openbmc_project/sensors 
> namespace) and map the D-Bus object path to the sensor numbers(based on 
> the proposed customizable map).
> 
This should also be solved by fixing the sensor number mapping.

> 4) In the current implementation all the D-Bus error logs have 1x1 
> mapping in the IPMI SEL. In the proposed solution the users will have to 
> rely on both D-Bus error logs and IPMI SEL to get the complete picture. 
> The customers cannot rely only on IPMI SEL as an event repository.
> 
>  > In the current proposal D-Bus error logs reported by BMC will not be 
> shown by SEL commands. I am okie with Jason's proposal to set up a D-Bus 
> match (either by ipmid or phosphor-sel-logger) that will watch for new 
> logging D-Bus objects to be created and add a SEL record for them on 
> creation.
> 
Another thought would be to abandon D-Bus-based logging and see if the 
same information could be placed in the journal.

> https://gerrit.openbmc-project.xyz/#/q/status:open++topic:%22IPMI+SEL%22
> 
> Regards,
> Tom
> 

More work is needed to come up with a flexible generic sensor numbering 
scheme that will work with the various sensor implementations.  I have 
been assigned to a different task and will not be working on this for a 
while.  So, as discussed in the call this week, as a stop-gap, I plan to 
move the journal-based SEL implementation into intel-ipmi-oem for now. 
We can revisit this as we make progress on the sensor numbering issue. 
This will also allow everyone to see the full working implementation 
which may help resolve some questions.

Thanks,
-Jason
