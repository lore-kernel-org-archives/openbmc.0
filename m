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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43h7mQ6J4HzDr6x
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 04:51:30 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jan 2019 09:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,491,1539673200"; d="scan'208";a="109324448"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.104])
 ([10.241.242.104])
 by orsmga006.jf.intel.com with ESMTP; 18 Jan 2019 09:51:27 -0800
Subject: Re: couple questions for Event Log
To: openbmc@lists.ozlabs.org
References: <5aff6ce7.7e70.168604a8925.Coremail.fyczy@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <7bf8dc07-5146-ffd9-870a-ba74c0cb36d9@linux.intel.com>
Date: Fri, 18 Jan 2019 09:51:26 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5aff6ce7.7e70.168604a8925.Coremail.fyczy@126.com>
Content-Type: text/plain; charset=gbk; format=flowed
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
X-List-Received-Date: Fri, 18 Jan 2019 17:51:35 -0000

On 1/18/2019 1:28 AM, ÁõÎýÎ° wrote:
> Hi
> 
> 1.How to debug the system event log, how to configure it, and what 
> modules are related to the log function?

Can you provide more detail?  Are you looking specifically for IPMI SEL 
or general BMC logging through phosphor-logging?

> 
> 2.When is the phosphor-sel-logger registration method (IpmiSelAdd, 
> IpmiSelAddOem) invoked? How to use DBUS to read journalctl?

phosphor-sel-logger runs as a service and exposes the IpmiSelAdd and 
IpmiSelAddOem methods on D-Bus.  When either of those methods is 
invoked, the phosphor-sel-logger creates an IPMI SEL entry in the system 
journal using the provided data.  The journal can then be parsed to 
extract the SEL entries as found in 
https://gerrit.openbmc-project.xyz/c/openbmc/intel-ipmi-oem/+/16280.

journalctl is a command-line utility to read the system journal, so it 
isn't used over D-Bus.  Details on journalctl can be found here: 
https://www.freedesktop.org/software/systemd/man/journalctl.html.

If you want to read the journal in source, you can use the sd_journal 
APIs here: 
https://www.freedesktop.org/software/systemd/man/sd_journal.html#. 
Example usage is in the gerrit review above.

> 
> 3.Could anyone share a description of the yaml file about phosphor-logging?
> 
> Thanks
> 
> 
> 

Thanks,
-Jason
