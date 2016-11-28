Return-Path: <clg@kaod.org>
X-Greylist: delayed 8464 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Nov 2016 20:52:48 AEDT
Received: from 18.mo4.mail-out.ovh.net (18.mo4.mail-out.ovh.net
 [188.165.54.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS26S142XzDvWt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 20:52:48 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0C9891F8A7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 10:52:45 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id B45FB1800B1;
 Mon, 28 Nov 2016 10:52:37 +0100 (CET)
Subject: Re: [PATCH qemu 29/38] aspeed: add a rtc device on I2C bus 0
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alastair D'Silva <alastair@au1.ibm.com>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-30-git-send-email-clg@kaod.org>
 <1480298737.2503.72.camel@aj.id.au> <1480298963.2503.73.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <81e0c526-0ab5-4331-5812-9e171f62c86f@kaod.org>
Date: Mon, 28 Nov 2016 10:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480298963.2503.73.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18331620809495841611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 09:52:48 -0000

On 11/28/2016 03:09 AM, Andrew Jeffery wrote:
> On Mon, 2016-11-28 at 12:35 +1030, Andrew Jeffery wrote:
>> On Fri, 2016-11-18 at 15:22 +0100, Cédric Le Goater wrote:
>>> The palmetto platform has a ds3231 RTC device but not qemu. Let's
>>> use
>>> a ds1338 instead which provides enough basic RTC features. Only
>>> alarms
>>> will be missing
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
> With the caveat that we move it to the board file. Evo needs an 'undo
> send' option like gmail.

we could use Alastair's RTC device also which is more complete.

C. 
