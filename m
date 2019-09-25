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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dk81217bzDqjd
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 02:30:55 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 09:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="201301220"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150])
 ([10.7.153.150])
 by orsmga002.jf.intel.com with ESMTP; 25 Sep 2019 09:30:52 -0700
Subject: Re: LPC irq nobody cared errors
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XcK+_ZSgYxpzyFVZgFTxv_11XsBUwQD7SLNgz6zyk0Duw@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f4befed1-1612-785b-9d02-cdc0c516918d@linux.intel.com>
Date: Wed, 25 Sep 2019 09:30:52 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcK+_ZSgYxpzyFVZgFTxv_11XsBUwQD7SLNgz6zyk0Duw@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 Sep 2019 16:30:58 -0000

Hello Joel,

On 9/25/2019 12:39 AM, Joel Stanley wrote:
> Hello Jae,
> 
> I noticed that Intel has a sizable out of tree kernel patch set. It 
> would be great if you could contribute this code to the OpenBMC kernel 
> tree (and upstream) so the community can benefit from your hard work.
> 
> In particular, I hit an issue today that is fixed by these three patches:
> 
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0044-misc-Add-clock-control-logic-into-Aspeed-LPC-SNOOP-d.patch
> 
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0043-char-ipmi-Add-clock-control-logic-into-Aspeed-LPC-BT.patch
> 
> https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0045-char-ipmi-Add-clock-control-logic-into-Aspeed-LPC-KC.patch
> 
> If you could clean them up and submit them that would be appreciated.

Yes, those patches are only in Intel branch currently. Will upstream
the patches soon.

Cheers,

Jae
