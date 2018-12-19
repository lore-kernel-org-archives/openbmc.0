Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KFbk4bNXzDqf6
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:08:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2018 16:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,370,1539673200"; d="scan'208";a="99779702"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga007.jf.intel.com with ESMTP; 18 Dec 2018 16:08:32 -0800
Subject: Re: [PATCH linux dev-4.19 00/12] PECI device driver introduction
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
References: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
Message-ID: <de74fcec-78dd-f7fa-24b5-a3c861539daa@linux.intel.com>
Date: Tue, 18 Dec 2018 16:08:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181219000236.30812-1-jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Wed, 19 Dec 2018 00:08:35 -0000

Hi Joel and Andrew,

I'm sending this patch series to try pushing it to OpenBMC linux
dev-4.19 branch. It is still getting review from upstream through
http://lkml.iu.edu/hypermail/linux/kernel/1812.2/02368.html but
some OpenBMC platforms need it at this moment to include dbus-sensors
repository which uses this PECI kernel driver implementation. Actually,
I cannot expect when it could be accepted by upstream but we need it
now for OpenBMC development.

Can you please consider cherry-picking this patch series into OpenBMC
linux dev-4.19 meanwhile it gets upstream review? I rebased and tested
it on dev-4.19.

Thanks,
Jae

<snip>
