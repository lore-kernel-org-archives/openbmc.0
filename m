Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DXqN1ZBBzF11V;
 Tue, 18 Sep 2018 03:17:03 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2018 10:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,386,1531810800"; d="scan'208";a="70699854"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by fmsmga007.fm.intel.com with ESMTP; 17 Sep 2018 10:17:00 -0700
Subject: Re: [PATCH] i2c: aspeed: Acknowledge most interrupts early in
 interrupt handler
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendanhiggins@google.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linux-i2c@vger.kernel.org
References: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
 <fbf54ca6-16b3-5e35-eac8-b3dab8118543@linux.intel.com>
 <20180917163401.GA1082@kunai>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <037b4cf8-5dfa-d554-b126-a2462ba9c803@linux.intel.com>
Date: Mon, 17 Sep 2018 10:16:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180917163401.GA1082@kunai>
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
X-List-Received-Date: Mon, 17 Sep 2018 17:17:05 -0000

On 9/17/2018 9:34 AM, Wolfram Sang wrote:
> 
>> Looks good to me. Thanks! :)
>>
>> Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Does that mean I need to revert "[PATCH i2c-next v6] i2c: aspeed: Handle
> master/slave combined irq events properly" in i2c/for-next? And apply
> this to i2c/for-current?
> 
> (and please quote only relevat parts of a message when replying)
> 

No need to revert "[PATCH i2c-next v6] i2c: aspeed: Handle master/slave
combined irq events properly". This patch should be applied on top of
the patch.

(Will reduce message size when replying. Thanks!)

Jae
