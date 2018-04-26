Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40X3GL1RVbzF24t
 for <openbmc@lists.ozlabs.org>; Fri, 27 Apr 2018 03:00:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Apr 2018 10:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,330,1520924400"; d="scan'208";a="223613378"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2018 10:00:03 -0700
Subject: Re: [PATCH linux dev-4.13] clk:aspeed: Fix reset assert logic
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180425223321.9290-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8XeDctYa3m9+waTbuSOzEppDd5W_XDMVvuQ75CZ=9feX6A@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9971d9de-b299-53a9-f0a5-daebf07d98c5@linux.intel.com>
Date: Thu, 26 Apr 2018 10:00:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeDctYa3m9+waTbuSOzEppDd5W_XDMVvuQ75CZ=9feX6A@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Apr 2018 17:00:11 -0000

On 4/25/2018 6:56 PM, Joel Stanley wrote:
> On 26 April 2018 at 08:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit fixes a bug in aspeed_reset_assert() which determines
>> the second reset register using condition.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Thanks. This patch has not been applied upstream, so I will send a V2
> that incorporates your fix.
> 
> I've applied this patch to dev-4.13.
> 
> Cheers,
> 
> Joel
> 

Thanks a lot for your review.

Jae

>> ---
>>   drivers/clk/clk-aspeed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index de8e1dba6eec..c5d2af2ace2e 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -349,7 +349,7 @@ static int aspeed_reset_assert(struct reset_controller_dev *rcdev,
>>          u32 reg = ASPEED_RESET_CTRL;
>>          u32 bit = aspeed_resets[id];
>>
>> -       if (bit >= ASPEED_RESET_CTRL2) {
>> +       if (bit >= ASPEED_RESET2_OFFSET) {
>>                  bit -= ASPEED_RESET2_OFFSET;
>>                  reg = ASPEED_RESET_CTRL2;
>>          }
>> --
>> 2.17.0
>>
