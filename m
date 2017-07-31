Return-Path: <clg@kaod.org>
X-Greylist: delayed 4200 seconds by postgrey-1.36 at bilbo;
 Mon, 31 Jul 2017 19:52:17 AEST
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLZVn5RmZzDqpc
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 19:52:16 +1000 (AEST)
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 5FF3A71FA2
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 09:26:26 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id CF04826006C;
 Mon, 31 Jul 2017 09:26:21 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v6 2/2] drivers/leds: pca955x count LED
 lines as GPIO
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-3-cbostic@linux.vnet.ibm.com>
 <16278DBF-DA73-4BFB-AEEE-1D07E7A89DEE@fuzziesquirrel.com>
 <CACPK8XdhG7Jks3m0v7yrXShQCSW0Zv8Ad_ymdepF-kKJk5javw@mail.gmail.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <21b55916-b1b3-f417-05f6-64e08e704920@kaod.org>
Date: Mon, 31 Jul 2017 09:26:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdhG7Jks3m0v7yrXShQCSW0Zv8Ad_ymdepF-kKJk5javw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15825930568758168322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrieeigdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jul 2017 09:52:18 -0000

On 07/31/2017 04:16 AM, Joel Stanley wrote:
> On Sun, Jul 30, 2017 at 10:20 AM, Brad Bishop
> <bradleyb@fuzziesquirrel.com> wrote:
>>
>>> On Jul 29, 2017, at 2:36 PM, Christopher Bostic <cbostic@linux.vnet.ibm.com> wrote:
>>>
>>> In order for gpio-keys-polled driver to properly register pins
>>> connected to the pca955x chip it is necessary to count 'LED' lines
>>> as part of the total gpio count.  The assocated gpio_chip struct
>>> for the pca955x is then set to all available I/O (LEDS and 'GPIO').
>>> Failure to do so will cause any pin # > GPIO pin count to fail
>>> gpio-keys-polled probe/registration as it falls outside the bounds
>>> of what the gpio_chip struct indicates is available.
>>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> Tested-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>
>>> ---
>>> drivers/leds/leds-pca955x.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>>> index 9216742..4fa58b9 100644
>>> --- a/drivers/leds/leds-pca955x.c
>>> +++ b/drivers/leds/leds-pca955x.c
>>> @@ -472,6 +472,8 @@ static int pca955x_probe(struct i2c_client *client,
>>>                       ngpios++;
>>>                       break;
>>>               case PCA955X_TYPE_LED:
>>> +                     ngpios++;
>>> +
> 
> Hey Cedric, does this look like the correct fix?
> 

At first glance, I would say no. I will take a look.

C.
