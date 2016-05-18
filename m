Return-Path: <clg@kaod.org>
Received: from 13.mo6.mail-out.ovh.net (13.mo6.mail-out.ovh.net
 [188.165.56.124])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8zkk3gSKzDqCQ
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 02:13:01 +1000 (AEST)
Received: from player693.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id B1F07FFC936
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 15:46:29 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id E44B9440094;
 Wed, 18 May 2016 15:46:22 +0200 (CEST)
Subject: Re: [PATCH qemu 2/3] ast2400: add a rtc device on I2C bus 0
To: Joel Stanley <joel@jms.id.au>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-3-git-send-email-clg@kaod.org>
 <CACPK8XdKaan0TN38dhonHWs=mZhn=0=Oqw10Wcqg6h7J_4Xtzg@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <573C7223.10002@kaod.org>
Date: Wed, 18 May 2016 15:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdKaan0TN38dhonHWs=mZhn=0=Oqw10Wcqg6h7J_4Xtzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8228357998122666923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrfedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 18 May 2016 16:13:02 -0000

On 05/18/2016 03:33 PM, Joel Stanley wrote:
> Hey Cedric,
> 
> On Wed, May 18, 2016 at 4:55 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
>> a ds1338 instead.
>>
>> The aspeed-bmc-opp-palmetto dts file needs to be changed consequently
>> with :
>>
>>         rtc@68 {
>>                 compatible = "dallas,ds1338";
>>                 reg = <0x68>;
>>         };
> 
> Please see my comments for the tmp device.
> 
> How much does the register layout differ between the 1338 and the 3231?

Will tell you soon.

But on my palmetto running OpenBMC, I see : 

	[    5.630000] rtc-ds1307: probe of 0-0068 failed with error -5

So do we really have a RTC available on this bus ? 

	root@palmetto:~# i2cdetect -y 0
	     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
	00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
	10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	50: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
	70: -- -- -- -- -- -- -- --                         

There are plenty of other devices on the other busses though, but 
none with Ox68.

There is also a RTC directly connected to APB bus. I guess we need a 
model for this one also. 

Cheers, 

C.
