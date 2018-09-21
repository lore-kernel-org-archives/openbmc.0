Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H7y86fSKzF3PR;
 Sat, 22 Sep 2018 08:46:55 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Sep 2018 15:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,286,1534834800"; d="scan'208";a="71942241"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.151])
 ([10.7.153.151])
 by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2018 15:46:42 -0700
Subject: Re: [PATCH v3] i2c: aspeed: fix invalid clock parameters for very
 large divisors
To: Brendan Higgins <brendanhiggins@google.com>, benh@kernel.crashing.org,
 joel@jms.id.au, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20180921223446.82685-1-brendanhiggins@google.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <1f6b9bcd-f93c-4fa6-3abf-762d54c63dc0@linux.intel.com>
Date: Fri, 21 Sep 2018 15:46:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180921223446.82685-1-brendanhiggins@google.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 22:46:57 -0000

On 9/21/2018 3:34 PM, Brendan Higgins wrote:
> @@ -142,7 +142,8 @@ struct aspeed_i2c_bus {
>   	/* Synchronizes I/O mem access to base. */
>   	spinlock_t			lock;
>   	struct completion		cmd_complete;
> -	u32				(*get_clk_reg_val)(u32 divisor);
> +	u32				(*get_clk_reg_val)(struct device *dev,
> +							   u32 divisor);

I realized that you changed *get_clk_reg_val type in v2. You probably
need to fix below code in aspeed_i2c_probe_bus() as well to remove
a sparse warning.

bus->get_clk_reg_val = (u32 (*)(u32))match->data;

-Jae
