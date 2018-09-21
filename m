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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H1Hq4CLrzF3RC;
 Sat, 22 Sep 2018 03:46:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Sep 2018 10:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,285,1534834800"; d="scan'208";a="71889326"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2018 10:46:35 -0700
Subject: Re: [PATCH] i2c: aspeed: fixed invalid clock parameters for very
 large divisors
To: Brendan Higgins <brendanhiggins@google.com>, benh@kernel.crashing.org,
 joel@jms.id.au, andrew@aj.id.au
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20180920232820.243734-1-brendanhiggins@google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <07af0253-1efc-2ae1-93fb-ebcc1996d768@linux.intel.com>
Date: Fri, 21 Sep 2018 10:46:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180920232820.243734-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 17:46:48 -0000

Hi Brendan,

nit:
Title in imperative mood. I'd put 'fix' instead of 'fixed'.

On 9/20/2018 4:28 PM, Brendan Higgins wrote:
> The function that computes clock parameters from divisors did not
> respect the maximum size of the bitfields that the parameters were
> written to. This fixes the bug.
> 
> This bug can be reproduced with (and this fix verified with) the test
> at: https://kunit-review.googlesource.com/c/linux/+/1035/
> 
> Discovered-by-KUnit: https://kunit-review.googlesource.com/c/linux/+/1035/
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

[....]

> +	if (base_clk > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> +		base_clk = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
> +		clk_low = clk_high_low_mask;
> +		clk_high = clk_high_low_mask;

Yes, it fixes these parameters to the lowest bus speed setting with the
maximum base clock divisor value and the maximum SCL timing cycle value
when a low bus-frequency is requested which exceeds the range of this
H/W supports. This exceptional case handling is needed to prevent making
invalid settings on it. Nice fix!

One minor issue is, 'base_clk_divisor' instead of 'base_clk' could avoid
misreading on this code.

With that, it looks nice to me. Thanks!

Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
