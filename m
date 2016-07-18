Return-Path: <clg@kaod.org>
Received: from 1.mo179.mail-out.ovh.net (1.mo179.mail-out.ovh.net
 [178.33.111.220])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rtYft4qBLzDqMc
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2016 05:49:57 +1000 (AEST)
Received: from player698.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id E5E2D1008788
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2016 21:49:52 +0200 (CEST)
Received: from localhost.localdomain
 (AClermont-Ferrand-158-1-148-215.w86-207.abo.wanadoo.fr [86.207.19.215])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 97088520073;
 Mon, 18 Jul 2016 21:49:48 +0200 (CEST)
Subject: Re: [PATCH docs] Enhancing instructions on QEMU
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 Chris Austen <austenc@us.ibm.com>
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
 <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
 <1468797898.954.35.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4df82344-5f6a-b578-d2c1-988f3475890b@kaod.org>
Date: Mon, 18 Jul 2016 21:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468797898.954.35.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3665930096889072430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrgeelgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 19:49:59 -0000

On 07/18/2016 01:24 AM, Andrew Jeffery wrote:
> On Wed, 2016-07-13 at 15:20 -0500, OpenBMC Patches wrote:
>> From: Chris Austen <austenc@us.ibm.com>
>>
>> Added step by step details on using QEMU in both a virtual
>> bridge and tap environment.  Latest features of QEMU palmetto
>> integration now allow for uboot flash support and ftgmac100
>> device support.  That means you can start the qemu session
>> from uboot and run the real ftgmac ethernet device.
>>
>> Signed-off-by: Chris Austen <austenc@us.ibm.com>
>> ---
>>  cheatsheet.md | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>
>> diff --git a/cheatsheet.md b/cheatsheet.md
>> index 873fbf9..37a9c60 100644
>> --- a/cheatsheet.md
>> +++ b/cheatsheet.md
>> @@ -105,6 +105,65 @@ qemu-system-arm \
>>  
>>  To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
>>  
>> +## Using QEMU With Network capabilities
>> +
>> +In an attempt to get a palmetto working model with network capabilties a fork
>> +was created.  The plan is to merge it back in to the qemu repo but for right now
>> +the steps required to build, launch and verify are as follows.
>> +
>> +Compile a Palmetto flash image via Yocto and locate the file...
>> +>build/tmp/deploy/images/palmetto/flash-palmetto
>> +
>> +```
>> +git clone git@github.com:legoater/qemu.git
> 
> I agree with Joel here, I don't think we should be patching the docs to
> point at someone's "private" tree. It's not great that openbmc/qemu
> isn't yet suitable for you, but I'll try to resolve that as soon as I
> can.
> 
>> +cd qemu
>> +git checkout aspeed
>> +mkdir build
>> +cd build
>> +../configure --target-list=arm-softmmu
>> +make
>> +cd arm-softmmu
>> +```
>> +
>> +### Use a bridge device
>> +Using a bridge device requires a bit of root access to set it up.  The benefit
>> +is your qemu session runs in the bridges subnet so no port forwarding is needed.
>> +There are packages needed to yourself a virbr0 such as
>> +```
>> +apt-get install libvirt libvirt-bin bridge-utils uml-utilities qemu-system-common
>> +```
>> +
>> +```
>> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
>> +-drive file=/flash-palmetto,format=raw,if=mtd \
>> +-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100  \
>> +-net bridge,id=net0,helper=/usr/lib/qemu-bridge-helper,br=virbr0
>> +```
>> +
>> +### Use a tap device
>> +When running in an environment that does not support you having root you will
>> +need to forward the model ports.
>> +```
>> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
>> +-drive file=/flash-palmetto,format=raw,if=mtd \
>> +-net nic \
>> +-net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu \
>> +
>> +```
>> +Now you just need to redirect to communicate...
>> +```
>> +curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://localhost:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
>> +```
>> +or
>> +```
>> +ssh -p 2222 root@localhost
>> +```
>> +
>> +There are some other useful parms like that can redirect the console to another
>> +window.  This results in having an easily accessible qemu command session.
>> +-monitor stdio -serial pty -nodefaults
>> +
>> +
> 
> At face value I don't think all of this information belongs in the
> cheatsheet (I haven't tried out the commandlines or verified their
> behaviour against the text, so I may send a follow-up email along those
> lines). I'd suggest a separate qemu document if this is the type of
> content you want to add. My aim with the existing cheatsheet entry was
> to provide the least amount of supporting words for the commandline to
> have context, and explicitly avoided step-by-step instructions like
> "how to build".
> 
> Given the openbmc/qemu repository supports booting from the flash image
> the existing cheatsheet commandline should be updated. Again, I hope to
> address the differences between openbmc/qemu and legoater/qemu soon.

I will have more time next week to do a resync of openbmc/qemu if you 
don't. 2.7-rc should be out then, so it will be the moment to rebase.

I would also like to merge the ast2400 and ast2500 soc model. They share 
enough code to have a common base, configured by a cpu model property 
and a silicon revision property. It shouldn't be too complex to push 
at the same time.

Thanks,

C.



 


C.
