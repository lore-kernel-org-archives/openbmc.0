Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.42.102; helo=4.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4202 seconds by postgrey-1.36 at bilbo;
 Thu, 25 Oct 2018 21:13:44 AEDT
Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net
 [46.105.42.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42gjdN73VmzDrQ1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 21:13:41 +1100 (AEDT)
Received: from player786.ha.ovh.net (unknown [10.109.160.226])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 5FBD831C35
 for <openbmc@lists.ozlabs.org>; Thu, 25 Oct 2018 10:58:00 +0200 (CEST)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
 [90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 17E033800A6;
 Thu, 25 Oct 2018 10:57:58 +0200 (CEST)
Subject: Re: Qemu tree for ASPEED testing
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACPK8XcQVomeBogf95fjBWXwgiR5vUVWKJBQ7B+XMCt+f4r9FQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cd979321-e97d-bbc6-ae31-ec013f4e3c94@kaod.org>
Date: Thu, 25 Oct 2018 10:57:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcQVomeBogf95fjBWXwgiR5vUVWKJBQ7B+XMCt+f4r9FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9626444205573704549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrgeelgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 25 Oct 2018 10:13:45 -0000

On 10/22/18 9:53 PM, Joel Stanley wrote:
> Hello Cedric,
> 
> OpenBMC CI runs the flash image on a Qemu Romulus machine type. Recent
> changes cause this to fail to boot to a prompt, as it is booting
> really slowly causing services to timeout and crash, which causes
> further timeouts, etc.
> 
> I think we suggested at the OpenBMC meetup in Amsterdam that we
> recommend using upstream Qemu for general testing and CI, as it
> supports most features that developers working on the BMC require.
> Booting the kernel works great, but the userspace doesn't fare so
> well.
> 
> This week's dev-4.18 changes make it much worse (I suspect the timer
> bugfix). I did some testing:
> 
>  - v3.0.0 tag: fail
>  - upstream master (b312532fd034): fail
>  - openbmc/qemu (c69dbf6af2c1): fail
>  - legoater/qemu aspeed-3.1 (0652f2642195): pass
>
> What would you recommend?

Switching to mainline. 3.1-rc0 is programmed for the first week of 
November :

	https://wiki.qemu.org/Planning/3.1

> What do we need to get upstream from your tree to have 3.1 work well?

yes. I had to fix the ADC patchset which did not apply anymore btw

Cheers,

C.
