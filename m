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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41QlYF4cftzF35g;
 Thu, 12 Jul 2018 02:54:57 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2018 09:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="54274734"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2018 09:54:44 -0700
Subject: Re: [PATCH] i2c: aspeed: Fix initial values of master and slave state
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, james.feist@linux.intel.com,
 vernon.mauery@linux.intel.com
References: <20180702212028.30824-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g45=SkyLWRy=DnYOZCXcmHkrbTdOSBi=n=kUgyvRPoU8Mg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <37586a32-852c-9b18-cb01-a7448072527c@linux.intel.com>
Date: Wed, 11 Jul 2018 09:54:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g45=SkyLWRy=DnYOZCXcmHkrbTdOSBi=n=kUgyvRPoU8Mg@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Jul 2018 16:54:58 -0000

On 7/10/2018 10:47 PM, Brendan Higgins wrote:
> On Mon, Jul 2, 2018 at 2:20 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This patch changes the order of enum aspeed_i2c_master_state and
>> enum aspeed_i2c_slave_state defines to make their initial value to
>> ASPEED_I2C_MASTER_INACTIVE and ASPEED_I2C_SLAVE_STOP respectively.
>> In case of multi-master use, if a slave data comes ahead of the
>> first master xfer, master_state starts from an invalid state so
>> this change fixes the issue.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 60e4d0e939a3..2714c7fbe7c9 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -111,22 +111,22 @@
>>   #define ASPEED_I2CD_DEV_ADDR_MASK                      GENMASK(6, 0)
>>
>>   enum aspeed_i2c_master_state {
>> +       ASPEED_I2C_MASTER_INACTIVE,
>>          ASPEED_I2C_MASTER_START,
>>          ASPEED_I2C_MASTER_TX_FIRST,
>>          ASPEED_I2C_MASTER_TX,
>>          ASPEED_I2C_MASTER_RX_FIRST,
>>          ASPEED_I2C_MASTER_RX,
>>          ASPEED_I2C_MASTER_STOP,
>> -       ASPEED_I2C_MASTER_INACTIVE,
>>   };
>>
>>   enum aspeed_i2c_slave_state {
>> +       ASPEED_I2C_SLAVE_STOP,
>>          ASPEED_I2C_SLAVE_START,
>>          ASPEED_I2C_SLAVE_READ_REQUESTED,
>>          ASPEED_I2C_SLAVE_READ_PROCESSED,
>>          ASPEED_I2C_SLAVE_WRITE_REQUESTED,
>>          ASPEED_I2C_SLAVE_WRITE_RECEIVED,
>> -       ASPEED_I2C_SLAVE_STOP,
>>   };
>>
>>   struct aspeed_i2c_bus {
>> --
>> 2.17.1
>>
> 
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 
> Thanks!
> 
> BTW, sorry for the delay, just got back from vacation. I will review
> the rest tomorrow.
> 

Thanks a lot for the review!

Jae
