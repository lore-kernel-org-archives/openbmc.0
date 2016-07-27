Return-Path: <clg@kaod.org>
Received: from 7.mo7.mail-out.ovh.net (7.mo7.mail-out.ovh.net [46.105.43.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rzvzY0Jd4zDrKG
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 22:52:57 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 782C5100CFFB
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2016 14:43:46 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 2868B5C009F;
 Wed, 27 Jul 2016 14:43:45 +0200 (CEST)
Subject: Re: [PATCH docs] Enhancing instructions on QEMU
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <20160713202012.10446-1-openbmc-patches@stwcx.xyz>
 <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <41365147-aa88-1d1c-dc76-f3dd627fdf7b@kaod.org>
Date: Wed, 27 Jul 2016 14:43:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160713202012.10446-2-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12430497923323169538
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 27 Jul 2016 12:52:57 -0000

On 07/13/2016 10:20 PM, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> 
> Added step by step details on using QEMU in both a virtual
> bridge and tap environment.  Latest features of QEMU palmetto
> integration now allow for uboot flash support and ftgmac100
> device support.  That means you can start the qemu session
> from uboot and run the real ftgmac ethernet device.
> 
> Signed-off-by: Chris Austen <austenc@us.ibm.com>
> ---
>  cheatsheet.md | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/cheatsheet.md b/cheatsheet.md
> index 873fbf9..37a9c60 100644
> --- a/cheatsheet.md
> +++ b/cheatsheet.md
> @@ -105,6 +105,65 @@ qemu-system-arm \
>  
>  To quit, type `Ctrl-a c` to switch to the QEMU monitor, and then `quit` to exit.
>  
> +## Using QEMU With Network capabilities
> +
> +In an attempt to get a palmetto working model with network capabilties a fork
> +was created.  The plan is to merge it back in to the qemu repo but for right now
> +the steps required to build, launch and verify are as follows.
> +
> +Compile a Palmetto flash image via Yocto and locate the file...
> +>build/tmp/deploy/images/palmetto/flash-palmetto
> +
> +```
> +git clone git@github.com:legoater/qemu.git

git clone  https://github.com/openbmc/qemu


> +cd qemu
> +git checkout aspeed
> +mkdir build
> +cd build
> +../configure --target-list=arm-softmmu
> +make
> +cd arm-softmmu
> +```
> +
> +### Use a bridge device
> +Using a bridge device requires a bit of root access to set it up.  The benefit
> +is your qemu session runs in the bridges subnet so no port forwarding is needed.
> +There are packages needed to yourself a virbr0 such as
> +```
> +apt-get install libvirt libvirt-bin bridge-utils uml-utilities qemu-system-common
> +```
> +
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=<path>/flash-palmetto,format=raw,if=mtd \
> +-net nic,macaddr=C0:FF:EE:00:00:02,model=ftgmac100  \

That's my preferred MAC ! :)

you will have to do a "setenv ethaddr" in u-boot for the MAC to be taken
into account like on a real system. 

> +-net bridge,id=net0,helper=/usr/lib/qemu-bridge-helper,br=virbr0
> +```

eventually add : 

	run this command :

		sudo chmod +s /usr/lib/qemu-bridge-helper

	to be able to launch the guest without being root.



I think you could even define a virt domain[1] for the ast guest and use
the virsh command to start, destroy, get the console, etc. 

Cheers,

C.

[1] http://libvirt.org/formatdomain.html


> +### Use a tap device
> +When running in an environment that does not support you having root you will
> +need to forward the model ports.
> +```
> +./qemu-system-arm -m 256 -M palmetto-bmc -nographic \
> +-drive file=<path>/flash-palmetto,format=raw,if=mtd \
> +-net nic \
> +-net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu \
> +
> +```
> +Now you just need to redirect to communicate...
> +```
> +curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST https://localhost:2443/login -d "{\"data\": [ \"root\", \"0penBmc\" ] }"
> +```
> +or
> +```
> +ssh -p 2222 root@localhost
> +```
> +
> +There are some other useful parms like that can redirect the console to another
> +window.  This results in having an easily accessible qemu command session.
> +-monitor stdio -serial pty -nodefaults
> +
> +
>  ## Booting the host
>  
>  Login:
> 
