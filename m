Return-Path: <clg@kaod.org>
X-Greylist: delayed 8388 seconds by postgrey-1.36 at bilbo;
 Sat, 11 Mar 2017 22:40:54 AEDT
Received: from 6.mo1.mail-out.ovh.net (6.mo1.mail-out.ovh.net [46.105.43.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vgMdf34k7zDqXf
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 22:40:53 +1100 (AEDT)
Received: from player730.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C6BD65FD45
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 09:02:05 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 61B8344006E;
 Sat, 11 Mar 2017 09:01:57 +0100 (CET)
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170310122135.29827-1-andrew@aj.id.au>
 <1e540c49-0053-087b-0021-3ca259d2ca32@kaod.org>
 <5dbd1db7-f1a0-f070-add0-c16d5b658f5a@kaod.org>
 <1489183143.26468.7.camel@aj.id.au>
Cc: miltonm@us.ibm.com, wghoffa@us.ibm.com, patrick@stwcx.xyz,
 xow@google.com, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5265babd-dbe9-9e05-fd14-585f6478ba2a@kaod.org>
Date: Sat, 11 Mar 2017 09:01:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489183143.26468.7.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12609234532422224642
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrgeelgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Sat, 11 Mar 2017 11:40:54 -0000

On 03/10/2017 10:59 PM, Andrew Jeffery wrote:
> On Fri, 2017-03-10 at 15:20 +0100, Cédric Le Goater wrote:
>> On 03/10/2017 02:38 PM, Cédric Le Goater wrote:
>>> On 03/10/2017 01:21 PM, Andrew Jeffery wrote:
>>>> Protect against suspect hardware causing the bus to read off more data
>>>> than defined in the SMBus specification.
>>>>
>>>> Some investigation that suggests that the DEVICE_ID command (0xfd) to
>>>> a UCD9000 occasionally returns all 0xff, causing the bus driver to
>>>> overrun the 34-byte data buffer provided by the I2C core with a 255-byte
>>>> broken response. This patch should prevent trashing the stack and also
>>>> cause the UCD9000's probe to fail.
>>>>
>>>> The I2C core doesn't help itself in this case as it does not provide any
>>>> means for the bus driver to sanity check the caller-provided
>>>> response-buffer length against the device-provided payload length. At
>>>> the point where we perform the I2C transfers for the SMBus protocol
>>>> we've lost the information about what type of transaction is being
>>>> performed (i.e. that we're performing an SMBus block transfer), so we
>>>> cannot in general make assumptions about the buffer size based on the
>>>> protocol (i2c, SMBus, PMBus).  Further, struct i2c_msg is defined in the
>>>> uapi headers so no further members (e.g. a length field) can be added
>>>> without breaking userspace.
>>>>
>>>> Instead, let's expand the buffers such that they will fit any payload
>>>> length reported by the bus.
>>>>
>>>> The patch has been tested on a Zaius system, consecutively unbinding and
>>>> binding the UCD9000 driver over 1000 times. Whilst errors were reported
>>>> during probe in some cases ("ucd9000: probe of 0-0064 failed with error
>>>> -74"), the BMC remained stable and did not reboot. Triggering the bug
>>>> without the patch typically at most requires in the order of 100
>>>> unbind/bind attempts, often significantly less.
>>>
>>> I could not reproduce the issue on a witherspoon after a 1000 unbind/bind
>>> but there were some errors still :
>>
>> It failed after 1720 unbind/bind ... So I applied the patch but with it, the 
>> device as a weird id :  
>>
>> [  165.830000] ucd9000 11-0064: Device ID �
>> [  165.830000] ucd9000 11-0064: Unsupported device
> 
> A couple of notes were missing from the commit message - the warning of
>  stack corruption and stack trace that Xo mentioned, and that the
> driver will produce this message when we see the failure that the patch
> is working around. If the kernel didn't panic/reboot after seeing this
> then the workaround was successful.
> 
> The bus driver can't determine whether the buffer is invalid or not at
> the point of assembling the response, and so can't error out. Instead,
> we pass the buffer back out to the ucd9000, which errors out during
> probe as the response is not what it was expecting.
> 
> I can send again with an updated commit message if there's no other
> feedback.

No. It looks good to me.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 
