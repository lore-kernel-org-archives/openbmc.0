Return-Path: <clg@kaod.org>
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rrS0f3Y5czDqFR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 19:28:01 +1000 (AEST)
Received: from player731.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 54004FFA15E
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jul 2016 11:27:57 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player731.ha.ovh.net (Postfix) with ESMTPSA id 44516420079;
 Fri, 15 Jul 2016 11:27:53 +0200 (CEST)
Subject: Re: openbmc qemu vs Cedric qemu is different
To: Joel Stanley <joel@jms.id.au>, Chris Austen <austenc@us.ibm.com>,
 openbmc@lists.ozlabs.org
References: <OF64094945.A9571442-ON86257FF0.00643E3F-86257FF0.00656843@notes.na.collabserv.com>
 <1468546975.5679.32.camel@jms.id.au>
Cc: Cedric Le Goater <clegoater@fr.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <125c5ffa-2c09-f93b-4fad-c37364f66752@kaod.org>
Date: Fri, 15 Jul 2016 11:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1468546975.5679.32.camel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12437816271470627681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrgeeggdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 15 Jul 2016 09:28:02 -0000

On 07/15/2016 03:42 AM, Joel Stanley wrote:
> Hello Chris,
> 
> On Thu, 2016-07-14 at 13:27 -0500, Chris Austen wrote:
>> Hi Joel, 
>> last night you indicated that our openbmc/qemu had enough for
>> networking the palmetto-bmc. I don't think that is 100% true. I
>> believe Cedric's repo has some additional changes that should be
>> integrated back in to openbmc/qemu. Hopefully you two can figure out
>> what commits are needed to get us back to one working repo. 

Here is a quick summary of the differences, my branch compared to 
openbmc/qemu:


* qemu base 

  closer to mainline.

* smc

  adds some minor code clean ups (merged in mainline now)

* vic

  misses some nice-to-have properties. 

* watchdog

  adds a fix for uboot (linux still needs fixing)
  
* timer

  in sync
  
* scu

  adds minor fixes

* ast2500

  adds more support (can boot uboot with the vbar hack)

* ftgmac100

  adds a new 'aspeed' property to change the end of ring buffer bit 
  in the network adpater model for aspeed socs. This is needed for 
  the linux 4.6 ftgmac100 network driver which uses the 'correct'
  bits. the ast2500 flash images will be fine but there is a problem 
  for older ast2400 flash images which have a 4.4 kernel using the 
  old bits definition. 

  We could need to make the 'aspeed' property configurable from the 
  qemu command line to support these. to be discussed 

So, qemu should behave the same in both branches. 


Support for ast2400/linux 4.6 is broken in my branch and a quick 
would be :

	https://github.com/legoater/qemu/commit/e14da799c81447f9a045999de454cf4490905bf4

That will drop support for the images with a 4.4 kernel. Can we ?


qemu-2.7-rc0 will have some more of our code merged. we will update
the openbmc/qemu branch at that time. 

I am mostly disconnected next week, so expect latency in the answers :)

Cheers,

C.
