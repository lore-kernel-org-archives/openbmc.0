Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43D8M86cLTzDqnr;
 Tue, 11 Dec 2018 03:54:59 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2018 08:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,339,1539673200"; d="scan'208";a="117597982"
Received: from unknown (HELO [10.7.153.143]) ([10.7.153.143])
 by orsmga001.jf.intel.com with ESMTP; 10 Dec 2018 08:54:56 -0800
Subject: Re: KCS device tree patch
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <F652C9ED-FC48-4C31-9A71-EE67CE8FAEA9@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9711a2f5-4844-20b7-9fa0-a1f975681412@linux.intel.com>
Date: Mon, 10 Dec 2018 08:54:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <F652C9ED-FC48-4C31-9A71-EE67CE8FAEA9@fb.com>
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
X-List-Received-Date: Mon, 10 Dec 2018 16:55:02 -0000

On 12/7/2018 5:17 PM, Vijay Khemka wrote:
>   Hi Jae,
> When are you planning to push kcs device tree change for aspeed g5. Because I need to update our facebook device tree and it refers to this kcs change. If you want I can push it along with my change.
> 

Hi Vijay,

I'm not planning to push kcs dt change because we checked that the
clocks property is not needed for the kcs node. If you have something to
push, please go ahead pushing your dt changes.

Thanks,
Jae

> Regards
> -Vijay
> 
