Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dL3Z4scCzDqHm
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 05:25:13 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Apr 2019 12:25:10 -0700
X-IronPort-AV: E=Sophos;i="5.60,326,1549958400"; d="scan'208";a="132524034"
Received: from unknown (HELO [10.241.242.36]) ([10.241.242.36])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
 08 Apr 2019 12:25:10 -0700
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: QEMU and CI
Message-ID: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
Date: Mon, 8 Apr 2019 12:24:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 08 Apr 2019 19:25:15 -0000

Hello,

I'm looking into what it might take to get the Intel S2600WF (Wolf Pass) 
board running in QEMU and possibly CI.

In the OpenBMC docs, it points to a QEMU fork here: 
https://github.com/openbmc/qemu.  Is this the right place for me to 
start looking at what is currently implemented for QEMU in OpenBMC?

Thanks!
-Jason
