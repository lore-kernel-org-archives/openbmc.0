Return-Path: <cheng.c.yang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=cheng.c.yang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fg18634RzDqV7
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 19:12:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 00:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,485,1539673200"; d="scan'208";a="110270900"
Received: from cyang29-mobl1.ccr.corp.intel.com (HELO [10.239.197.35])
 ([10.239.197.35])
 by orsmga008.jf.intel.com with ESMTP; 16 Jan 2019 00:12:22 -0800
Subject: Re: Need help to create a new repo for MDR
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, ed.tanous@intel.com
References: <7c7d2165-d53d-6a33-0fec-069fdfbbbeda@linux.intel.com>
 <20190115171928.ilyfajso343ha2xh@thinkpad>
From: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
Message-ID: <8fcfba7b-3da7-eb35-6434-40bc9130f3b3@linux.intel.com>
Date: Wed, 16 Jan 2019 16:12:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20190115171928.ilyfajso343ha2xh@thinkpad>
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
X-List-Received-Date: Wed, 16 Jan 2019 08:12:29 -0000

How about "managedDataRegion" or "smbios-mdr" ?

Thank you very much!

On 1/16/2019 1:19 AM, Brad Bishop wrote:
> On Wed, Jan 09, 2019 at 11:50:01AM +0800, Yang, Cheng C wrote:
>> Hi Brad,
>>
>>      Intel platform has a feature called MDR which used for BIOS transfer SMBIOS table to BMC.
>>
>> There are two version in MDR, MDR V1 and V2.
>>
>> MDR V1 is based on ipmi commands, BIOS will send SMBIOS table in pieces through ipmi  oem commands.
>>
>> MDR V2 use VGA shared memory, BIOS will send whole SMBIOS table to VGA shared memory in ast2500 before post complete, and then BMC can get the SMBIOS table from VGA shared memory.
>>
>> During the post phase,  our BIOS will first try to send SMBIOS table through MDR V2, and if not succeed, BIOS will try to send MDR V1 then.
>>
>> After BMC get SMBIOS table, BMC will put CPU and DIMM information to dbus interface and then Web page can show these CPU DIMM information  to users.
>>
>> I have implemented the MDR feature and hope to upstream it, so do you mind help to create a repo for MDR feature?
>>
>> Thank you very much!
> Hi Cheng
>
> What would you like the MDR repository to be called?
>
> thx - brad
