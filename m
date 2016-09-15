Return-Path: <clg@kaod.org>
Received: from 5.mo177.mail-out.ovh.net (5.mo177.mail-out.ovh.net
 [46.105.39.154])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZVcb1jyzzDsTX
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 17:37:35 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5BB191004113
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 09:37:28 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id A5848240094;
 Thu, 15 Sep 2016 09:37:22 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
To: Joel Stanley <joel@jms.id.au>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>, Jeremy Kerr <jk@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
Date: Thu, 15 Sep 2016 09:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5744341327883438934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeeggdduvddtucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 15 Sep 2016 07:37:35 -0000

On 09/15/2016 09:09 AM, Joel Stanley wrote:
> On Thu, Sep 15, 2016 at 4:02 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> From: Alistair Popple <alistair@popple.id.au>
>>
>> This patch adds a simple device driver to expose the iBT interface on
>> Aspeed SOCs (AST2400 and AST2500) as a character device :
>> /dev/ipmi-bt-bmc.
>>
>> The BT (Block Transfer) interface is used to perform in-band IPMI
>> communication from a BMC to the host. Entire messages are buffered
>> before sending a notification to the host, or the BMC when on the
>> other side, that there is data to be read. The driver implements the
>> BMC side of the BT interface.
>>
>> Signed-off-by: Alistair Popple <alistair@popple.id.au>
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> [clg: - did some checkpatch fixes
>>       - added a devicetree binding documentation
>>       - renamed 'bt_host' to 'bt_bmc' to reflect that the driver is
>>         the BMC side of the IPMI BT interface
>>       - remaned the device name to 'ipmi-bt-bmc'
> 
> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
> device?

Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc makes 
more sense or just '/dev/ipmi-bt' because we won't have multiple hosts
to control.

C.
