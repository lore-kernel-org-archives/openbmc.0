Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znLp963LTzF1cN
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 04:25:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2018 09:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,378,1515484800"; d="scan'208";a="32800035"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2018 09:25:02 -0800
Subject: Re: [RFC PATCH] drivers/peci: peci_match_id() can be static
To: fengguang.wu@intel.com
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, andrew@lunn.ch, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180222070111.GA22310@lkp-ne02>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f5f9afd0-a5ce-346f-772a-e8dec78bd872@linux.intel.com>
Date: Thu, 22 Feb 2018 09:25:02 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180222070111.GA22310@lkp-ne02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 17:25:06 -0000

On 2/21/2018 11:01 PM, kbuild test robot wrote:
> 
> Fixes: 99f5d2b99ecd ("drivers/peci: Add support for PECI bus driver core")
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> ---
>   peci-core.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/peci/peci-core.c b/drivers/peci/peci-core.c
> index d976c73..4709b8c 100644
> --- a/drivers/peci/peci-core.c
> +++ b/drivers/peci/peci-core.c
> @@ -770,8 +770,8 @@ peci_of_match_device(const struct of_device_id *matches,
>   }
>   #endif
>   
> -const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> -					   struct peci_client *client)
> +static const struct peci_device_id *peci_match_id(const struct peci_device_id *id,
> +						  struct peci_client *client)
>   {
>   	if (!(id && client))
>   		return NULL;
> 

Hi Fengguang,

Thanks a lot for the fix. I'll merge your patch in v3 submission.

BR,
Jae
