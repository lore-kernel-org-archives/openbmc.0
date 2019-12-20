Return-Path: <cheng.c.yang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=cheng.c.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f9hQ3tg2zDqtY
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 12:12:20 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 17:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,333,1571727600"; d="scan'208";a="248525187"
Received: from cyang29-mobl1.ccr.corp.intel.com (HELO [10.239.192.102])
 ([10.239.192.102])
 by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2019 17:12:14 -0800
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
From: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Subject: Power Supply Cold Redundancy
Message-ID: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
Date: Fri, 20 Dec 2019 09:12:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 20 Dec 2019 01:12:23 -0000

Hi Brad & James,

     I am going to upstream an Intel specific feature called Power 
Supply Cold Redundancy which is to keep one PSU in standby mode when 
there are two PSU on the system.

You can get more information about this feature in design doc 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27637

My question is which repo should I push the code, is there any exist 
repo maintain all PSU related features? If not can you help to create a 
repo for this?


Thank you very much!
