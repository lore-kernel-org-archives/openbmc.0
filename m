Return-Path: <clg@kaod.org>
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
 [46.105.36.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZg8M5R5LzDrfR
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 00:02:11 +1000 (AEST)
Received: from player699.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id E457210044C4
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 16:02:07 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id B88EC240076;
 Thu, 15 Sep 2016 16:02:03 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.7 4/6] misc: Add Aspeed BT IPMI BMC driver
To: Patrick Williams <patrick@stwcx.xyz>
References: <1473921146-19509-1-git-send-email-clg@kaod.org>
 <1473921146-19509-5-git-send-email-clg@kaod.org>
 <CACPK8XeB+y5SVzJvoWSAr5hsufZw0hVm6RKUGVNtocawBWPQ7A@mail.gmail.com>
 <38b843b7-24ec-7089-154c-262106afd50c@kaod.org>
 <22bc13ba-5bf7-3e94-6df1-62d33b50c7cc@kaod.org>
 <20160915105129.GC25351@heinlein.lan>
 <a376797d-bb53-678a-be60-3c7188f0d3cc@kaod.org>
 <20160915113320.GD25351@heinlein.lan>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <69190503-56f4-5164-1900-c39ba9690821@kaod.org>
Date: Thu, 15 Sep 2016 16:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20160915113320.GD25351@heinlein.lan>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12239939362800438018
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrjeehgdeileculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 15 Sep 2016 14:02:12 -0000

On 09/15/2016 01:33 PM, Patrick Williams wrote:
> On Thu, Sep 15, 2016 at 01:22:50PM +0200, Cédric Le Goater wrote:
>> On 09/15/2016 12:51 PM, Patrick Williams wrote:
>>> On Thu, Sep 15, 2016 at 10:36:46AM +0200, Cédric Le Goater wrote:
>>>>>> I'm not sure there. When I open /dev/ttyUSB0 I'm talking to the USB0
>>>>>> serial device. When I open /dev/mtd0, I'm talking to the mtd0 device.
>>>>>> So when I open /dev/ipmi-bt-bmc, I would expect to talk to the BMC
>>>>>> device?
>>>>>
>>>>> Yes. I went a little too far in the global rename. /dev/ipmi-bt-bmc makes 
>>>>
>>>> I meant /dev/ipmi-bt-host ! :)
>>>
>>> Does it make sense to have these numbered?  I thought Brenden proposed
>>> an emulated bt-over-i2c.  We could also conceive of an SOC that had
>>> multiple LPC (+bt) engines to facilitate multiple nodes, or an off-board
>>> FPGA to do it.
>>>
>>
>> If we expect to have multiple btbridged process running, we will 
>> need multiple device nodes. How we should name them depends partly 
>> on the driver I think. 
>>
>> We could keep the prefix 'ipmi-bt' because it identifies the BT 
>> interface described in the IPMI specs and use node /dev/ipmi-bt-host 
>> for the original bt_bmc, (used be bt_host) driver. This one will be 
>> unique. 
>>
>> The others could use : 
>> 	
>> 		/dev/ipmi-bt-lpc
>> 		/dev/ipmi-bt-i2c-<bus>
> 
> I was thinking along the lines of /dev/ipmi-bt-hostN.  Maybe we do this
> through udev rules though?

yes. this look like the best approach. 

C.
