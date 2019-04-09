Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.75.36; helo=2.mo3.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at bilbo;
 Tue, 09 Apr 2019 16:20:57 AEST
Received: from 2.mo3.mail-out.ovh.net (2.mo3.mail-out.ovh.net [46.105.75.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dcc95HtFzDq96
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 16:20:54 +1000 (AEST)
Received: from player755.ha.ovh.net (unknown [10.109.160.239])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id D8FDF2079BA
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 08:12:32 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-40-22.w86-201.abo.wanadoo.fr
 [86.201.133.22]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id 7DD744A630ED;
 Tue,  9 Apr 2019 06:12:28 +0000 (UTC)
Subject: Re: QEMU and CI
To: Joel Stanley <joel@jms.id.au>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
 <03df9961-3cb8-467b-adab-743544a05963@www.fastmail.com>
 <CACPK8XdpUh52GVEfH6KYrNV7zgLhLVuJtmpg4dNpQ2CdNfGVhg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e90ee19f-99b0-cdfb-fdf0-48a53be3098a@kaod.org>
Date: Tue, 9 Apr 2019 08:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdpUh52GVEfH6KYrNV7zgLhLVuJtmpg4dNpQ2CdNfGVhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4021714470475696898
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Tue, 09 Apr 2019 06:20:58 -0000

On 4/9/19 4:55 AM, Joel Stanley wrote:
> On Tue, 9 Apr 2019 at 00:46, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Hi Jason,
>>
>> On Tue, 9 Apr 2019, at 04:56, Bills, Jason M wrote:
>>> Hello,
>>>
>>> I'm looking into what it might take to get the Intel S2600WF (Wolf Pass)
>>> board running in QEMU and possibly CI.
> 
> You can boot your wolf pass image in the current qemu. To demonstrate
> I grabbed a tiogapass flash image from CI and booted it:
> 
> $ arm-softmmu/qemu-system-arm -M ast2500-evb -drive
> file=flash-tiogapass,format=raw,if=mtd -serial mon:stdio  -nographic
> ...
> root@tiogapass:~# cat /etc/os-release
> ID="openbmc-phosphor"
> NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
> VERSION="2.7.0-dev"
> VERSION_ID="2.7.0-dev-347-gd631110d4"
> PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference
> Distro) 2.7.0-dev"
> BUILD_ID="2.7.0-dev"
> OPENBMC_TARGET_MACHINE="tiogapass"
> 
> As Andrew said, your next step would be to add a wolfpass machine type
> to upstream qemu. Take a look at the aspeed_boards array in
> hw/arm/aspeed.c.

Yes. it should be relatively easy to add the machine.   

> From there the next step is to add the peripherals that your machine
> has. This will involve writing models for the i2c devices you have
> attached, and perhaps emulators for host connected devices (PECI?).
> This could be more involved so please use the list to discuss your
> plans.

Yes please. It would be nice to have better support for I2C devices
and work on a simple interface (QMP based) to interact with them, so
that we can exercise the monitoring done by OpenBMC. PSU devices are
a good topic for that.

> There are also a large number of peripherals inside the ASPEED SoC
> that lack models. Let us know on the list if you think you will start
> working on one so we don't duplicate efforts.
> 
> Submit your patches against the upstream qemu tree. Andrew, Cedric and
> I are the upstream maintainers so we will be on cc there.

We are keeping the models in development under in this tree :
  
   https://github.com/openbmc/qemu

Some have been there a bit too long because we lacked time to make
them ready but please prefer mainline. We rebase quite often anyhow.
I should push today a new version on 4.0-rc3.  

Check out this page before sending :

   https://wiki.qemu.org/Contribute/SubmitAPatch


Thanks,

C.   
