Return-Path: <haiyue.wang@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Mm8j1c29zDr5X;
 Fri, 13 Apr 2018 15:11:29 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2018 22:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,444,1517904000"; d="scan'208";a="220081981"
Received: from haiyuewa-mobl1.ccr.corp.intel.com (HELO [10.239.196.80])
 ([10.239.196.80])
 by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2018 22:11:24 -0700
Subject: Re: openbmc Digest, Vol 32, Issue 32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 openbmc@lists.ozlabs.org, openbmc-request@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <mailman.355.1523511154.2391.openbmc@lists.ozlabs.org>
 <45b6959c-5743-744f-d4d6-4f40984f1323@linux.intel.com>
 <1523521249.11062.168.camel@kernel.crashing.org>
 <5b09c4c7-e730-df2a-9b48-9787f5dcb620@linux.intel.com>
 <1523594598.11062.191.camel@kernel.crashing.org>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <94260b45-7adc-a9ff-6300-e5bd3bd359bb@linux.intel.com>
Date: Fri, 13 Apr 2018 13:11:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523594598.11062.191.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 13 Apr 2018 05:11:34 -0000



On 2018-04-13 12:43, Benjamin Herrenschmidt wrote:
> On Thu, 2018-04-12 at 16:42 +0800, Wang, Haiyue wrote:
>> I means the device tree merge time, putting things in kernel need long time
>> to be passed code review. And people may want to export different range of
>> registers, then they need to change the device tree, the development cycle
>> may be long.
> But that's not a big issue in practice though, you don't*need*  all
> your device-trees to be upstream and up to date especially if it's
> stored separately from the kernel.
>
> Keep in mind this should be strictly limited to a few registers that
> need that sort of manipulation, maybe a handful or two, that's it.
>
> Most things need proper kernel drivers.
>
Understood, NOT exposing like /dev/mem makes sense for security.

-Haiyue
