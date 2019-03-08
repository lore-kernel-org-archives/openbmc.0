Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Fv6S0drbzDqGb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 15:05:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 20:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,454,1544515200"; d="scan'208";a="120682042"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.67.163.239])
 ([10.67.163.239])
 by orsmga007.jf.intel.com with ESMTP; 07 Mar 2019 20:05:10 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ratagupt@linux.vnet.ibm.com, 
 bradleyb@fuzziesquirrel.com
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Reg removal of un-used Set Password D-Bus method API
Message-ID: <045f6137-a7ff-81f1-8f16-bc97ce4c9dd1@linux.intel.com>
Date: Fri, 8 Mar 2019 09:35:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 08 Mar 2019 04:05:21 -0000

All,

As part of clean-up, planning to remove unused SetPassword D-Bus method 
API exposed through password.interface.yaml. OpenBMC master code doesn't 
rely on this API anymore, and uses pam_chauthtok() API to update the 
password (for security purposes). Even phosphor-user-manager don't 
expose SetPassword D-Bus method API. Following 2 commits are in review 
which will remove the same permanently.

Please let us know, if you have any concerns or require any further 
clarifications.

1. 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-user-manager/+/18940/

2. 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/18943/

Regards,

Richard
