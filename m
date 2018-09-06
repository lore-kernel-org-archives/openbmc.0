Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425q342vhTzF3Qm;
 Fri,  7 Sep 2018 04:33:51 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2018 11:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,339,1531810800"; d="scan'208";a="261330520"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2018 11:33:47 -0700
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-aspeed@lists.ozlabs.org, james.feist@linux.intel.com,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, vernon.mauery@linux.intel.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g46fRrYW8E8FsPB=5fWSGxemgc4ENc4D2fT7yBfH6p4ERg@mail.gmail.com>
 <eab56d58-0703-d201-dc9a-f9fd257e96cf@linux.intel.com>
 <20180906180837.GA8607@kunai>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0e844fc2-777b-7aee-2402-9fe579cbcf51@linux.intel.com>
Date: Thu, 6 Sep 2018 11:33:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180906180837.GA8607@kunai>
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
X-List-Received-Date: Thu, 06 Sep 2018 18:33:54 -0000

> 
> Please don't quote the whole message. Everyone else has to scroll down
> a lot to find the relevant information. Thanks!
> 

Will keep that in mind. Thanks Wolfram!
