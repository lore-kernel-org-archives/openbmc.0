Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41S4Nx4BBnzF35d;
 Sat, 14 Jul 2018 06:37:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jul 2018 13:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,349,1526367600"; d="scan'208";a="64537315"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2018 13:37:17 -0700
Subject: Re: [PATCH] i2c: aspeed: Adjust spinlock scope in the irq handler
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, james.feist@linux.intel.com,
 vernon.mauery@linux.intel.com
References: <20180702214011.16071-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g47nBCbF0mcYqEnQkDpz0Dhh0F0S1-wEL_yBHgs1b3yE5w@mail.gmail.com>
 <59538d26-f025-28da-63df-f675e80fd68b@linux.intel.com>
 <20180713203327.47yq4gucidbzn2hd@katana>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0840cfe8-e18a-ae7c-5593-fc43b9b47291@linux.intel.com>
Date: Fri, 13 Jul 2018 13:37:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180713203327.47yq4gucidbzn2hd@katana>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 20:37:22 -0000

On 7/13/2018 1:33 PM, Wolfram Sang wrote:
> 
>> BTW, to whom should I ask applying this patch? Should I send v2 after
>> adding your reviewed-by tag?
> 
> Not needed, thanks. I use 'patchwork' and this tool collects all the
> tags for me. If I see a patch reviewed by a driver maintainer, I'll pick
> it up in the next queue.
> 

Oh, I see. Thanks a lot Wolfram!
