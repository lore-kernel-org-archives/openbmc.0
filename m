Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kffY6qNrzDqFB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 07:10:12 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 12:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,508,1539673200"; d="scan'208";a="118580679"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.119])
 ([10.241.242.119])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jan 2019 12:10:09 -0800
Subject: Re: openbmc Digest, Vol 41, Issue 79
To: openbmc@lists.ozlabs.org
References: <mailman.258.1547836742.21532.openbmc@lists.ozlabs.org>
 <7776b87b.33e1.1686e73dc61.Coremail.fyczy@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <eb00abc8-dc6a-5b5b-2e6e-2c7f0edae9c0@linux.intel.com>
Date: Tue, 22 Jan 2019 12:10:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7776b87b.33e1.1686e73dc61.Coremail.fyczy@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-List-Received-Date: Tue, 22 Jan 2019 20:10:14 -0000



On 1/20/2019 7:28 PM, 刘锡伟 wrote:
> Hi
> 1. I would like to ask any one how to generate BMC logging through 
> phosphor-logging?

Are you looking at internal BMC logging or system event logging to view 
through something like 'ipmitool sel'?

For internal BMC logging, you can simply call the 
phosphor::logging::log<level>() function to add the message to the journal.

I'm not as familiar with it, but phosphor-logging also has report() and 
commit() capabilities to add error objects to D-Bus.  I believe these 
objects can be viewed using 'ipmitool sel' commands.

> 2. When to call the IpmiSelAdd and IpmiSelAddOem methods?

phosphor-sel-logger uses a new approach to log IPMI SEL events to the 
journal instead of as D-Bus objects.  Whenever an IPMI sensor has an 
event, it would call IpmiSelAdd or IpmiSelAddOem to log that entry to 
the journal as a SEL event.

For example, if you have a threshold sensor that crosses a critical 
threshold, that event can be logged to the SEL by calling IpmiSelAdd.

Alternatively, phosphor-sel-logger can be extended to watch for events 
from that threshold sensor and log without calling IpmiSelAdd.

> 3. Write the log to journalctl through phosphor-sel-logger. Could you 
> read it through the ipmiStorageGetSELInfo method of intel-ipmi-oem?

Yes.  Today, however, it is tied to the sensor path on D-Bus to get some 
of the information for the SEL record.  Without that mapping, some of 
the data returned by ipmiStorageGetSELInfo may not be accurate.

> Thanks
> 
