Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kg1x1r06zDqJt
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 07:27:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2019 12:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,508,1539673200"; d="scan'208";a="118584241"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.119])
 ([10.241.242.119])
 by fmsmga008.fm.intel.com with ESMTP; 22 Jan 2019 12:26:56 -0800
Subject: Re: couple questions for Event Log
To: openbmc@lists.ozlabs.org
References: <421daf7d.7dda.1686fcac66d.Coremail.fyczy@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <01fb8bcf-87a7-2f12-b9b1-fe3be9896ea6@linux.intel.com>
Date: Tue, 22 Jan 2019 12:26:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <421daf7d.7dda.1686fcac66d.Coremail.fyczy@126.com>
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
X-List-Received-Date: Tue, 22 Jan 2019 20:27:02 -0000



On 1/21/2019 1:43 AM, George Liu wrote:
> Hi:
> 1. Could anyone use impitool sel list to read values after calling the 
> sd_journal_send method?

No, not really.  sd_journal_send only adds a log entry with metadata to 
the journal.

phosphor-sel-logger adds special metadata to identify the entry as an 
IPMI sel record.  A special implementation of the 'Get SEL Entry' IPMI 
command is needed to find the journal entries with SEL metadata and 
construct the IPMI SEL records.  An example implementation is here: 
https://gerrit.openbmc-project.xyz/c/openbmc/intel-ipmi-oem/+/16280.

> 2. Calling the startThresholdEventMonitor method of the 
> phosphor-sel-logger module, why get the values of max, min, sensorVal 
> are all 0? But I can get the correct values through dbus.

Calling startThresholdEventMonitor() should start a D-Bus match to watch 
for any changes to 'xyz.openbmc_project.Sensor.Threshold' properties. 
The 'Alarm' properties are used to know when a sensor threshold is 
crossed and log that event automatically.

When the match is triggered, the callback uses the same bus and path to 
get the properties from the 'xyz.openbmc_project.Sensor.Value' interface 
which has the MaxValue, MinValue, and Value properties for the sensor.

So, is the issue you see that after the match is triggered and the 
'xyz.openbmc_project.Sensor.Value' properties are read from that path, 
they are all 0, but if you manually read the properties from the same 
path, they are correct?

> Thanks
> 
> 
