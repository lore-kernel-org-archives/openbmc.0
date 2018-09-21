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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H7VK71BTzF3Ql;
 Sat, 22 Sep 2018 08:26:17 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Sep 2018 15:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,286,1534834800"; d="scan'208";a="71938764"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2018 15:26:14 -0700
Subject: Re: [PATCH v2] i2c: aspeed: fix invalid clock parameters for very
 large divisors
To: Brendan Higgins <brendanhiggins@google.com>, benh@kernel.crashing.org,
 joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20180921221025.75003-1-brendanhiggins@google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f5943177-6f1b-9344-3821-2aac001ff45d@linux.intel.com>
Date: Fri, 21 Sep 2018 15:26:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921221025.75003-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 22:26:18 -0000

Hi,

On 9/21/2018 3:10 PM, Brendan Higgins wrote:
> The function that computes clock parameters from divisors did not
> respect the maximum size of the bitfields that the parameters were
> written to. This fixes the bug.
> 
> This bug can be reproduced with (and this fix verified with) the test
> at: https://kunit-review.googlesource.com/c/linux/+/1035/
> 
> Discovered-by-KUnit: https://kunit-review.googlesource.com/c/linux/+/1035/
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   - v2 updates the title of the patch, renames a local variable, and
>     prints an error when the clock divider is clamped.
> ---

[....]

> +	if (base_clk_divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> +		base_clk_divisor = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
> +		clk_low = clk_high_low_mask;
> +		clk_high = clk_high_low_mask;
> +		dev_err(dev,
> +			"clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.",

Please put a newline character at the end of the string.

Thanks,
Jae

[....]
