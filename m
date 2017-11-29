Return-Path: <james.feist@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yn6FW4kL4zDr4p
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 03:59:10 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2017 08:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,338,1508828400"; 
   d="scan'208";a="7660439"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.84]) ([10.54.51.84])
 by orsmga003.jf.intel.com with ESMTP; 29 Nov 2017 08:59:07 -0800
Subject: Re: [PATCH linux dev-4.10 v2 2/2] ARM: dts: Add Wfp BMC Machine
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
 <1511897285-23022-2-git-send-email-james.feist@linux.intel.com>
 <CACPK8Xe9Uk3jPi3L6XR9SmXdU9Z7NZHSaYJdbPt-z5aQVV-_YQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <944d4309-19a4-ab99-fd58-ae6a36964ff1@linux.intel.com>
Date: Wed, 29 Nov 2017 08:59:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe9Uk3jPi3L6XR9SmXdU9Z7NZHSaYJdbPt-z5aQVV-_YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 16:59:12 -0000

On 11/29/2017 01:20 AM, Joel Stanley wrote:
> On Wed, Nov 29, 2017 at 5:58 AM, James Feist
> <james.feist@linux.intel.com> wrote:
>> Wfp is a Intel system with an Aspeed ast2500 BMC.
> 
> Is WFP an acronym? It would be good to spell it out in the commit message.
> 
It is not an acronym, it is a short name to describe current generation 
Intel boards.

> Andrew, can you please review the bits of the device tree that you're
> familiar with (mostly pinmux)?
> 
> 
>> +
>> +       chosen {
>> +               stdout-path = &uart5;
>> +               bootargs = "115200 earlyprintk";
> 
> I don't think 115200 will do anything. Can you explain your intent here?

Will delete.

> 
>> +       };
>> +
>> +       memory {
>> +               reg = <0x80000000 0x20000000>;
>> +       };
> 
> There's no reserved region for the VGA framebuffer, but you enable the
> GFX node below.
> 
> With the openbmc u-boot tree the size of the memory is adjusted to
> account for the framebuffer at the top of memory, but I was lead to
> believe Intel machines use their own u-boot fork.
> 
We don't use u-boot, but I will fix this.

> Cheers,
> 
> Joel
> 

Thanks,

James
