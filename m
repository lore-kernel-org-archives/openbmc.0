Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47y0Kr4MLyzDqRK
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 06:06:06 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 11:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,319,1574150400"; d="scan'208";a="273402756"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 11:06:01 -0800
Subject: Re: multiple device trees
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c0fdaf26-29c0-b210-dd00-675bd8827132@linux.intel.com>
Date: Tue, 14 Jan 2020 11:06:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <02A2EB59-111F-43D2-8CDE-6DFDE75EF292@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 14 Jan 2020 19:06:09 -0000

On 1/13/20 5:56 PM, Brad Bishop wrote:
> Does anyone have any experience supporting multiple system configurations in a monolithic flash image with multiple device trees?  Did you consider this and do something else instead?

We haven't thought about implementation yet, but someone on our team did 
some research into multiple dtb. In your conf file yocto lets you set 
multiple device trees:

KERNEL_DEVICETREE = "${KMACHINE}-one.dtb \
                      ${KMACHINE}-two.dtb"


Then you can pick which one to boot into in u-boot:

bootm 20080000#conf@two.dtb

At some point we were going to put some more research into this method, 
but we haven't yet.



> 
> thanks!
> 
> -brad
> 
