Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6lMf6S0MzDvXj
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:49:18 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C726B160D9
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 07:49:13 +0100 (CET)
Received: from hermes.kaod.org (bad36-1-78-202-132-1.fbx.proxad.net
 [78.202.132.1]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id AC3C82A006C;
 Mon, 31 Oct 2016 07:49:11 +0100 (CET)
Subject: Re: [PATCH 3/3] Add a unit test for RX8900 RTC (time functionality
 only)
To: Alastair D'Silva <alastair@au1.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-4-git-send-email-alastair@au1.ibm.com>
 <CACPK8XfW0VKNaN1dptzMaRQmvw02Uwab0wHcA+m4=cQReWEnTQ@mail.gmail.com>
 <1477542574.2176.90.camel@au1.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3b4e8258-d39c-b158-38a9-972d1917c8be@kaod.org>
Date: Mon, 31 Oct 2016 07:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477542574.2176.90.camel@au1.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16818974287114504962
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrjeekgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 31 Oct 2016 06:49:19 -0000

On 10/27/2016 06:29 AM, Alastair D'Silva wrote:
> On Thu, 2016-10-27 at 14:51 +1030, Joel Stanley wrote:
>>> -         * This I2C device doesn't exist on the real board.
>>> +         * These I2C devices doesn't exist on the real board.
>>>           * We add it here (only on qtest usage) to be able to do a
>>> bit
>>>           * of simple qtest. See "make check" for details.
>>>           */
>>> -        i2c_create_slave((I2CBus *)qdev_get_child_bus(DEVICE(&s-
>>>> soc.i2c[0]),
>>> -                                                      "i2c"),
>>> -                         "ds1338", 0x68);
>>> +        I2CBus *i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&s-
>>>> soc.i2c[0]),
>>> +                "i2c");
>>> +        i2c_create_slave(i2c, "ds1338", 0x68);
>>> +        i2c_create_slave(i2c, "rx8900", 0x32);
>>
>> I'm not sure how upstream will take this.
>>
>> Is there a reason you didn't add them to an aspeed board instead?
>>
> 
> We are currently missing the *_i2c_create and the associated
> send/receive callbacks required to access the i2c bus from the test
> framework. The structure of aspeed_i2c.c was different enough from
> i2c_imx.c & i2c_omap.c that I need more familiarity with the code
> before I could implement it myself.

Could you extend libqos to have these routines ? or you can start an 
aspeed guest which would have the device with your patchset. take a 
look at the m25p80 test.  

Cheers,

C.
