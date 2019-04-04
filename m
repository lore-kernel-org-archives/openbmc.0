Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZqNq6PJtzDqGv
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 04:16:27 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Apr 2019 10:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,309,1549958400"; d="scan'208";a="140017191"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga003.jf.intel.com with ESMTP; 04 Apr 2019 10:16:24 -0700
Subject: Re: ikvm refresh failed on host screen 1680x1050 resolution
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>,
 ed <ed@tanous.net>, Eddie James <eajames@linux.vnet.ibm.com>
References: <tencent_2EF1C4452C43ADF74A37DF04@qq.com>
 <fa618273-b2e8-3d53-9c28-91f01fd83c05@linux.intel.com>
 <tencent_77BC148C0E378EFD5F488CE6@qq.com>
 <tencent_5AE0AA7B303EB67F5ABF0001@qq.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <aeb75f12-b36e-73bf-29c9-2e64692ea3fc@linux.intel.com>
Date: Thu, 4 Apr 2019 10:16:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <tencent_5AE0AA7B303EB67F5ABF0001@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Thu, 04 Apr 2019 17:16:29 -0000

On 4/3/2019 10:21 PM, xiuzhi wrote:
> Hi Jae, Ed,
>      The ikvm screen cann't refresh on ikvm webui screen when setting 
> the host screen resolution to 1680*1050 . I must click the "Refresh" 
> button to get the new host screen.  Other resolutions works very well.
>    Please check it.

Hi Xiuzhi,

I can't see the resolution option in Ubuntu 18.03. What host OS did you
use for the test? Let me clarify one more. Do you mean the "Refresh"
button in KVM web page, or reload button of the web browser?

Thanks,
Jae

> Best,
> xiuzhi
