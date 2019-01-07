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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YL153GsFzDqHk
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 03:08:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jan 2019 08:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,451,1539673200"; d="scan'208";a="107915886"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.68.190])
 ([10.252.68.190])
 by orsmga008.jf.intel.com with ESMTP; 07 Jan 2019 08:08:49 -0800
Subject: Re: About the usage of ipmi user management
To: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAARXrtniNa3XejKfasL-YwhVtu9siXLQk0b6hN71XzUbX7xDBQ@mail.gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <dbfffa82-52f3-b09f-a6a9-ac909a98c749@linux.intel.com>
Date: Mon, 7 Jan 2019 21:38:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtniNa3XejKfasL-YwhVtu9siXLQk0b6hN71XzUbX7xDBQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Jan 2019 16:08:58 -0000

Hi Lei Yu

There was an issue, when libuser commands was decoupled (which was 
caused by another commit not merged). Same has been merged on Jan 5 US 
time https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/16934/

Can you please confirm, whether you have tested it after this. When i 
tested the same is working fine. Please check.

if your openbmc SHA is after 4b04e1fff12efc02ef234b37293958f7fc1c11f5 
then it should include the fix 
(https://github.com/openbmc/openbmc/commit/4b04e1fff12efc02ef234b37293958f7fc1c11f5)

regards,

Richard

On 1/7/2019 1:30 PM, Lei YU wrote:
> This mail is to ask questions about how to set the ipmi user in build time.
>
> With a recent OpenBMC master build, one can NOT use below net ipmi commands:
>
>      ipmitool -I lanplus -H $bmc -U root -P 0penBmc
>      ipmitool -I lanplus -H $bmc -P 0penBmc
>
> Both gets `Error: Unable to establish IPMI v2 / RMCP+ session`, and the
> OpenBMC logs `User not found`, which is related to the IPMI user management
> changes.
>
> So my question is:
> 1. How to specify the user at build time, to make either of the above commands
> to work?
> 2. Or (if the above commands are not expected) what is the correct way to use
> ipmi net commands?
>
> Thanks!
