Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.44.50; helo=5.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 431 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Sep 2017 21:32:08 AEST
Received: from 5.mo4.mail-out.ovh.net (5.mo4.mail-out.ovh.net [188.165.44.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xs2h81T2nzDrJL
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 21:32:07 +1000 (AEST)
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id B459F96877
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 13:24:48 +0200 (CEST)
Received: from zorba.kaod.org (deibp9eh1--blueice1n4.emea.ibm.com
 [195.212.29.166]) (Authenticated sender: postmaster@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 2375C6400AB;
 Tue, 12 Sep 2017 13:24:43 +0200 (CEST)
Subject: Re: QEMU 2.10.0
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
References: <1505200336.4080.3.camel@aj.id.au>
 <f4bc0c68-6fd9-0784-388a-f81e7006b07d@kaod.org>
 <CACPK8Xe2GqA+UwsTcGe3F5b6QWUT=GCOzxRYcaWes8hngXRpQQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7a015ed8-54c3-f3db-1dcd-dd886a5402c2@kaod.org>
Date: Tue, 12 Sep 2017 13:24:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe2GqA+UwsTcGe3F5b6QWUT=GCOzxRYcaWes8hngXRpQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14123006960245377794
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedvgdefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2017 11:32:08 -0000

On 09/12/2017 11:07 AM, Joel Stanley wrote:
> On Tue, Sep 12, 2017 at 5:26 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 09/12/2017 09:12 AM, Andrew Jeffery wrote:
>>> Hello,
>>>
>>> I've updated openbmc/qemu's master to 2.10.0. For anyone maintaining
>>> patches on top of master I've merged the old master state into 2.10.0
>>> with the --ours strategy, then applied the series Cédric is maintaining
>>> on top. This means any patches you might have on top of master should
>>> rebase easily due to shared history, whilst keeping our yet-to-be-
>>> upstreamed patches in an easily identified set.
>>
>> Here are some updates on the QEMU wiki :
>>
>>         https://github.com/openbmc/qemu/wiki
> 
> Thanks Andrew and Cedric.
> 
> I built myself openbmc/qemu master and tried to boot a dev-4.10 kernel
> with a simple busybox based userspace on it. It hangs at "Starting
> network".
> 
> I was previously using Cedric's 'aspeed' branch from a long time ago.
> 
> This is my little qemu script that I use. Can you reproduce? Or tell
> me what I'm doing wrong here?
> 
>  #!/bin/bash
> 
> : ${BMC_CS1:=/srv/tftp/flash-witherspoon}
> : ${BMC_CS2:=${BMC_CS1}}
> : ${PNOR:=/srv/tftp/witherspoon.pnor}
> 
> ~/dev/qemu/openbmc/arm-softmmu/qemu-system-arm -m 512 -M witherspoon-bmc \
> -nodefaults -nographic -serial stdio \
> -net nic -net user,hostname=qemu,hostfwd=::2222-:22,hostfwd=::2623-:623 \
> -drive file=${BMC_CS1},format=raw,if=mtd \
> -drive file=${BMC_CS2},format=raw,if=mtd \
> -drive file=${PNOR},format=raw,if=mtd \
> "$@"

I don't see any problems with the network with :

  https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=witherspoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/flash-witherspoon

[    2.200000] ftgmac100 1e660000.ethernet: Read MAC address c0:ff:ee:00:00:03 from chip
[    2.200000] ftgmac100 1e660000.ethernet: Using NCSI interface
[    2.200000] ftgmac100 1e660000.ethernet eth0: irq 20, mapped at f0060000
[    2.380000] 8021q: 802.1Q VLAN Support v1.8
[   26.990000] 8021q: adding VLAN 0 to HW filter on device eth0
[   27.520000] ftgmac100 1e660000.ethernet eth0: no vlan ids left to set
[   27.520000] ftgmac100 1e660000.ethernet eth0: NCSI interface up

network is up. the QEMU ftgmac100 model does not support VLAN though. 

May be it's your image ? 

C.
