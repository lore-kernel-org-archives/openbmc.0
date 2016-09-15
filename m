Return-Path: <clg@kaod.org>
Received: from 7.mo177.mail-out.ovh.net (7.mo177.mail-out.ovh.net
 [46.105.61.149])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZZkG3FYNzDsGT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 20:42:45 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 9C9A11000EDF
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 12:42:41 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 66C71240082;
 Thu, 15 Sep 2016 12:42:40 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
To: Joel Stanley <joel@jms.id.au>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
 <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
 <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
 <CACPK8XcBd3jHNWjiO5_+hX_odhrwN=hqcAKRCGnQgjAaA4G8WQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b99fc7a1-cd2a-ad8e-d970-934ce421ca22@kaod.org>
Date: Thu, 15 Sep 2016 12:42:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcBd3jHNWjiO5_+hX_odhrwN=hqcAKRCGnQgjAaA4G8WQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8872372743463930626
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeehgddvleculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 15 Sep 2016 10:42:47 -0000

On 09/15/2016 12:03 PM, Joel Stanley wrote:
> On Thu, Sep 15, 2016 at 6:06 PM, Cédric Le Goater <clg@kaod.org> wrote:
>>>> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
>>>> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
>>>> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
>>>> device?
>>>
>>> Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc makes
>>
>> I meant /dev/ipmi-bt-host ! :)
> 
> Hah good! I didn't follow at all. That makes a lot more sense.
>
> Thanks for sending the patches out. I will hold off applying them
> until you've got support from upstream.

yes. This is better. I am realizing that I will have to change 
the ipmi Makefile, so the location of the driver is not certain 
yet.

C.
