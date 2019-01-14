Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dnlp0QtqzDqGC
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 09:12:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 14:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,479,1539673200"; d="scan'208";a="291531361"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga005.jf.intel.com with ESMTP; 14 Jan 2019 14:12:48 -0800
Subject: Re: [PATCH v10 05/12] ARM: dts: aspeed: peci: Add PECI node
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, James Feist <james.feist@linux.intel.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8e3e2dd8-b1fc-7746-f7bb-d95676b20ba0@linux.intel.com>
Date: Mon, 14 Jan 2019 14:12:48 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 22:12:54 -0000

Hi Joel,

On 1/13/2019 9:45 PM, Joel Stanley wrote:
> Hi Jae,
> 
> On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
>> aspeed-g4 and aspeed-g5.
> 
> This looks good, aside from the alias.
> 
> It will go via my aspeed tree once the bindings are merged. Send them
> to linux-aspeed@lists.ozlabs.org at that time.
> 
> In the future I suggest leaving the changes to arch/arm/boot/dts until
> after the bindings and driver patches have landed. They will rarely go
> in before hand as the bindings need to be agreed on.
> 

I thought that it would be helpful if it shows an actual example in this
series because it is trying to add a new subsystem. In the future, I'll
submit a dts patch separately from bindings and drivers, but I'd like
to keep this dts changes in this series because it has been already
submitted. I'll CC linux-aspeed list from the next version. Thanks!

> 
>>                  serial3 = &uart4;
>>                  serial4 = &uart5;
>>                  serial5 = &vuart;
>> +               peci0 = &peci0;
> 
> I don't think this is necessary. Can you explain why you think you need it?
> 

You are right. This alias is not necessary at all. Will drop it.

Thanks,
Jae

> Cheers,
> 
> Joel
> 
