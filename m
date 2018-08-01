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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ghKV3VWPzF19q;
 Thu,  2 Aug 2018 04:14:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2018 11:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,432,1526367600"; d="scan'208";a="61596310"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga008.jf.intel.com with ESMTP; 01 Aug 2018 11:14:35 -0700
Subject: Re: [PATCH i2c-next v2] i2c: aspeed: Add an explicit type casting for
 *get_clk_reg_val
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, james.feist@linux.intel.com,
 vernon.mauery@linux.intel.com
References: <20180724203615.5770-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g44L+-6wtV4+Kn5-j8zRXA1aNamR2pV0EaFpcoshgQ4bTQ@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <fe205b04-3c27-9a27-fdeb-0b6c5a971df2@linux.intel.com>
Date: Wed, 1 Aug 2018 11:14:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g44L+-6wtV4+Kn5-j8zRXA1aNamR2pV0EaFpcoshgQ4bTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Wed, 01 Aug 2018 18:14:39 -0000

On 7/31/2018 11:56 PM, Brendan Higgins wrote:
> On Tue, Jul 24, 2018 at 1:39 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit fixes this sparse warning:
>> drivers/i2c/busses/i2c-aspeed.c:875:38: warning: incorrect type in assignment (different modifiers)
>> drivers/i2c/busses/i2c-aspeed.c:875:38:    expected unsigned int ( *get_clk_reg_val )( ... )
>> drivers/i2c/busses/i2c-aspeed.c:875:38:    got void const *const data
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> Changes since v1:
>> - Fixed title and added Reported-by tag.
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index efb89422d496..a4f956c6d567 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -872,7 +872,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>>          if (!match)
>>                  bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
>>          else
>> -               bus->get_clk_reg_val = match->data;
>> +               bus->get_clk_reg_val = (u32 (*)(u32))match->data;
>>
>>          /* Initialize the I2C adapter */
>>          spin_lock_init(&bus->lock);
>> --
>> 2.18.0
>>
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 

Thanks a lot Brendan for your review!

Hi Wolfram,

I forgot adding 'Reported-by: Wolfram Sang <wsa@the-dreams.de>'. Please
add this tag when you apply this patch, or let me know if I need to
submit v3 for adding the tag.

Thanks,

Jae
