Return-Path: <cheng.c.yang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=cheng.c.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZFWj6Xm6zDqLZ
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 14:50:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2019 19:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,455,1539673200"; d="scan'208";a="290035530"
Received: from cyang29-mobl1.ccr.corp.intel.com (HELO [10.239.197.214])
 ([10.239.197.214])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2019 19:50:02 -0800
To: openbmc@lists.ozlabs.org
Cc: bradleyb@fuzziesquirrel.com, ed.tanous@intel.com
From: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Subject: Need help to create a new repo for MDR
Message-ID: <7c7d2165-d53d-6a33-0fec-069fdfbbbeda@linux.intel.com>
Date: Wed, 9 Jan 2019 11:50:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
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
X-List-Received-Date: Wed, 09 Jan 2019 03:50:10 -0000

Hi Brad,

     Intel platform has a feature called MDR which used for BIOS transfer SMBIOS table to BMC.

There are two version in MDR, MDR V1 and V2.

MDR V1 is based on ipmi commands, BIOS will send SMBIOS table in pieces through ipmi  oem commands.

MDR V2 use VGA shared memory, BIOS will send whole SMBIOS table to VGA shared memory in ast2500 before post complete, and then BMC can get the SMBIOS table from VGA shared memory.

During the post phase,  our BIOS will first try to send SMBIOS table through MDR V2, and if not succeed, BIOS will try to send MDR V1 then.

After BMC get SMBIOS table, BMC will put CPU and DIMM information to dbus interface and then Web page can show these CPU DIMM information  to users.

I have implemented the MDR feature and hope to upstream it, so do you mind help to create a repo for MDR feature?

Thank you very much!
