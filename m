Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNCsr0D5PzDqkJ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 03:59:42 +1100 (AEDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Oct 2017 09:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,301,1505804400"; d="scan'208";a="1235695909"
Received: from parzival.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2017 09:59:13 -0700
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: IPMI - get device ID
Message-ID: <e1f79a27-ea39-90d5-3cb9-c55f8e1d68ec@linux.intel.com>
Date: Thu, 26 Oct 2017 09:59:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Oct 2017 16:59:45 -0000

I noticed a bit of the get-device-id information in 
phosphor-ipmi-host/apphandler is hard coded.

Much of this info should be determined at compile time - would the 
inventory manager be the appropriate place that all platforms under the 
OpenBMC umbrella would like to store this information?

•   Device ID
•   Device Revision
•   IANA
•   Product ID
•   Auxiliary

Thanks,

-Dave Cobbley
