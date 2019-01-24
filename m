Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.1; helo=3.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1202 seconds by postgrey-1.36 at bilbo;
 Thu, 24 Jan 2019 21:52:22 AEDT
Received: from 3.mo173.mail-out.ovh.net (3.mo173.mail-out.ovh.net
 [46.105.34.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lf9y5lKrzDqGY
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 21:52:20 +1100 (AEDT)
Received: from player792.ha.ovh.net (unknown [10.109.143.189])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 11B55EAF8B
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 11:16:23 +0100 (CET)
Received: from kaod.org (lfbn-1-10603-25.w90-89.abo.wanadoo.fr [90.89.194.25])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 4FF242119598;
 Thu, 24 Jan 2019 10:16:21 +0000 (UTC)
Subject: Re: Flashing host SPI NOR
To: openbmc@lists.ozlabs.org
References: <13232291.bT86dyEiza@flash>
Cc: Alexander Amelkin <a.amelkin@yadro.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0901c04e-1a22-0511-9a66-20d0d01c737a@kaod.org>
Date: Thu, 24 Jan 2019 11:16:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <13232291.bT86dyEiza@flash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10409507591322307516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledriedvgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 24 Jan 2019 10:52:23 -0000

Hello,

On 1/24/19 11:09 AM, Aaron Williams wrote:
> Hi all,
> 
> I've run into a problem when it comes to flashing our host SPI NOR. If I boot 
> our host then the SPI NOR is put in a different mode and I am unable to write 
> to it from OpenBMC. The only way I can update our host SPI NOR is if I first 
> power down the host then reboot OpenBMC. Is there some way I can force OpenBMC 
> to re-initialize the SPI NOR before writing to it? I can read from the SPI nor 
> just fine from the BMC after the host has accessed it, I just can't erase or 
> write to it without everything getting corrupted. The device is a Macronix 
> MX25L25645GMI-08G. Note that on the host side we are using QREAD and 4PP mode 
> and 4 bit mode whereas for OpenBMC we only have 1 bit mode wired up. 

Could you give us a little more information on the platform, host and BMC ? 

which host FW and version ? Which version of OpenBMC ?

Thanks,

C.  
  

> Ideally I'd love to be able to make use of the GPIO arbitration we have 
> between the host and the BMC. We have two GPIO pins, one where the host 
> requests access to the SPI NOR and the other where the BMC grants access.
> 
> -Aaron
> 
> 
