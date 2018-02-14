Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhQyM6TtnzF1JB
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 04:15:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 09:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,513,1511856000"; d="scan'208";a="18107936"
Received: from parzival.jf.intel.com (HELO [10.54.51.76]) ([10.54.51.76])
 by orsmga008.jf.intel.com with ESMTP; 14 Feb 2018 09:14:58 -0800
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Subject: IPMI Set LAN Configuration Parameters
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
Date: Wed, 14 Feb 2018 09:14:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 14 Feb 2018 17:15:08 -0000

I noticed that when using ipmitool lan set <channel> <parameter>, the 
openbmc stack does not apply the settings. This seems like a 
non-standard implementation. While using ipmitool as the standard is not 
quite correct, customers do expect it to work.

After sending any sort of lan set command with ipmitool, the changes 
don't appear to stick and this message shows up in the journal:
     "Use Set Channel Access command to apply"

I know IPMI 2.0 is a little ambiguous about implementation specifics, 
but I believe the intention was to utilize the "Set In Progress" bit 
(Parameter 0) while doing work, and use "Set Complete" when you are 
finished to flush the changes.

To work around ipmitool constantly setting and unsetting the "Set In 
Progress" bit in between every parameter applied, some BMC stacks 
accumulate network changes over a period of time and apply after a 
timeout - this is also compatible with ipmitool's non-standard use of 
the "Set In Progress" bit.


Is there a plan to circle back and change this functionality to work 
with ipmitool in the future?

Thanks,
-Dave Cobbley
