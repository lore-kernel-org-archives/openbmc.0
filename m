Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lFnR3yKDzDqDT
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 06:33:14 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2019 11:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,512,1539673200"; d="scan'208";a="314223841"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.122.130.105])
 ([10.122.130.105])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jan 2019 11:33:11 -0800
Subject: Re: dbus sensors workaround for ADC
To: Vijay Khemka <vijaykhemka@fb.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed.tanous@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Sai Dasari <sdasari@fb.com>, Amithash Prasad <amithash@fb.com>
References: <CC84A2B4-B1BD-417E-998F-F0178FED2569@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d8c8d572-ad00-09dc-ef57-d18caee97875@linux.intel.com>
Date: Wed, 23 Jan 2019 13:33:11 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CC84A2B4-B1BD-417E-998F-F0178FED2569@fb.com>
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
X-List-Received-Date: Wed, 23 Jan 2019 19:33:16 -0000

On 1/23/2019 1:23 PM, Vijay Khemka wrote:

> Any plan for fixing workaround like oemname for ADC sensors
Eventually, yes, but it has not reached the top of my priority. This 
commit did it for fans 
https://github.com/openbmc/dbus-sensors/commit/95b079b785b5db5da502db28f25d989c2ccaf12e#diff-b8bad5fd799b9ecd4b1c9ce665fe5cbb

It's around a day problem, I just haven't gotten to it yet. If you'd 
like to work on it I can give you pointers where to start. Feel free to 
add a github issue if you'd like and I'll update it when I get to it. 
We're still using overlays for the time being so it hasn't been a high 
priority fix for me yet.

Thanks,

James
