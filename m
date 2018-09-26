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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L3Qz0BGKzF3Lb;
 Thu, 27 Sep 2018 02:33:30 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2018 09:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,306,1534834800"; d="scan'208";a="76398876"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by orsmga008.jf.intel.com with ESMTP; 26 Sep 2018 09:32:48 -0700
Subject: Re: [RFC PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: Add
 'idle-wait-timeout-ms' setting
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20180910214519.14126-1-jae.hyun.yoo@linux.intel.com>
 <20180910214519.14126-2-jae.hyun.yoo@linux.intel.com>
 <a81a6092-a9d0-78d5-3596-cddc5d6a0713@linux.intel.com>
 <20180924215850.GD18592@kunai>
 <2c8563fd-0641-5237-0026-f559c480ad91@linux.intel.com>
 <20180925082717.GB2270@kunai>
 <7b4e5715-3a87-8f77-8d0d-4647f02c87a8@linux.intel.com>
 <f20a2e1d-e1db-1e63-3df8-ad650b931f7d@linux.intel.com>
 <20180926162701.GB2736@kunai>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3b5c4322-291a-c11b-a2ee-6256ba7441df@linux.intel.com>
Date: Wed, 26 Sep 2018 09:32:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180926162701.GB2736@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Wed, 26 Sep 2018 16:33:31 -0000

On 9/26/2018 9:27 AM, Wolfram Sang wrote:
> 
>> Should I use timeout in struct i2c_adapter instead just like i2c-mpc
>> does?
> 
> I would accept that.
> 

Okay, I will submit a new patch set. Thanks!

Jae
