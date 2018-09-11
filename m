Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.52.162; helo=2.mo68.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1016 seconds by postgrey-1.36 at bilbo;
 Wed, 12 Sep 2018 05:02:36 AEST
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428vRw2LcBzF38k
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 05:02:35 +1000 (AEST)
Received: from player716.ha.ovh.net (unknown [10.109.159.132])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 64603F6F29
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 20:45:34 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id B640F56008E;
 Tue, 11 Sep 2018 20:45:23 +0200 (CEST)
Subject: Re: [PATCH i2c-next v6] i2c: aspeed: Handle master/slave combined irq
 events properly
To: Guenter Roeck <linux@roeck-us.net>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: linux-aspeed@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>, 
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20180823225731.19063-1-jae.hyun.yoo@linux.intel.com>
 <20180911183734.GA21976@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e16aadd4-09ee-19bf-f7ea-10dc1e491112@kaod.org>
Date: Tue, 11 Sep 2018 20:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180911183734.GA21976@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 958703773954706420
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrjedvgddufedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 11 Sep 2018 19:02:36 -0000

On 09/11/2018 08:37 PM, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Aug 23, 2018 at 03:57:31PM -0700, Jae Hyun Yoo wrote:
>> In most of cases, interrupt bits are set one by one but there are
>> also a lot of other cases that Aspeed I2C IP sends multiple
>> interrupt bits with combining master and slave events using a
>> single interrupt call. It happens much more in multi-master
>> environment than single-master. For an example, when master is
>> waiting for a NORMAL_STOP interrupt in its MASTER_STOP state,
>> SLAVE_MATCH and RX_DONE interrupts could come along with the
>> NORMAL_STOP in case of an another master immediately sends data
>> just after acquiring the bus. In this case, the NORMAL_STOP
>> interrupt should be handled by master_irq and the SLAVE_MATCH and
>> RX_DONE interrupts should be handled by slave_irq. This commit
>> modifies irq hadling logic to handle the master/slave combined
>> events properly.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> 
> This patch causes a boot stall when booting witherspoon-bmc with
> qemu v3.0, and all i2c device probes fail with error -110 (timeout).
> Bisect log is attached for reference.
> 
> With the same kernel configuration (aspeed_g5_defconfig),
> ast2500-evb and romulus-bmc are still able to boot.
> palmetto-bmc with aspeed_g4_defconfig also appears to work.
> 
> Is this a problem with qemu ? Should I drop the qemu test
> for witherspoon-bmc starting with the next kernel release ?

The QEMU model for the Aspeed I2C controller does not support 
slave mode or DMA registers. That might be the issue. 

I will check what this patch does when I have sometime. 

Thanks, 


C.
