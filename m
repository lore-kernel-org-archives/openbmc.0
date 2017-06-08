Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wk4gW49Y0zDqFH
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 22:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="VmF4ls2y";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8vr8033s8ug+9WqQvvAS32xg6W3q6T1KS3NvrgFzMo=; b=VmF4ls2yiO/SC6MFrCwZ2UeByn
 TlrIzLSEGfJzEpkn9caI71xhEWttUtyGtjdeOLgeUqSDMtcTjkLTMev40kI10zvH0j+lXbwBHfPQh
 Rltjmwmv9p4n11iKheV11+G4huxtbSl1gGrHnym7dafOu8kde9GDWcDPAxlWvjF5FWgrwMS6CAIL0
 NI5J0WjAi7AqL0rD7ZNB1x8EPzC8p7NMvR9/rCuHHKsJFK7iJQtWO8iOU8a/ADwzxkRyf8Y1zL70m
 8jTGAZLsBh+pqKg4y/nXID38wT0By0YugZIfHIeWnvK1aancpYLzqSiyNum2JPJGOqAo+/X3xezSD
 UeX/GbBw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:51268 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dIwgV-0037bW-Vp; Thu, 08 Jun 2017 12:37:08 +0000
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
 msbarth@linux.vnet.ibm.com, tpearson@raptorengineering.com,
 openbmc@lists.ozlabs.org
References: <20170606070230.32669-1-andrew@aj.id.au>
 <20170607155526.GA18946@roeck-us.net> <1496908393.23335.3.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <9358484b-ceb2-6fe4-deef-54372a3f12da@roeck-us.net>
Date: Thu, 8 Jun 2017 05:37:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1496908393.23335.3.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 linux@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: linux@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Thu, 08 Jun 2017 12:37:12 -0000

On 06/08/2017 12:53 AM, Andrew Jeffery wrote:
> On Wed, 2017-06-07 at 08:55 -0700, Guenter Roeck wrote:
>> On Tue, Jun 06, 2017 at 04:32:30PM +0930, Andrew Jeffery wrote:
>>> Add a basic driver for the MAX31785, focusing on the fan control
>>> features but ignoring the temperature and voltage monitoring
>>> features of the device.
>>>
>>> This driver supports all fan control modes and tachometer / PWM
>>> readback where applicable.
>>>
>>>>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>>>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>> Hello,
>>>
>>> This is a rework of Timothy Pearson's original patch:
>>>
>>>      https://www.mail-archive.com/linux-hwmon@vger.kernel.org/msg00868.html
>>>
>>> I've labelled it as v3 to differentiate from Timothy's postings.
>>>
>>> The original thread had some discussion about the MAX31785 being a PMBus device
>>> and that it should thus be a PMBus driver. The implementation still makes use
>>
>> After thinking about it, that is what it should be. If I accept it as non-PMBus
>> driver, it will be all but impossible to convert it to a PMBus driver later on,
>> and that just doesn't make any sense.
> 
> Hopefully not being too ignorant here, but can you expand on why it
> would be all but impossible to convert?
> 

I've got a lot of noise recently just for converting a driver from the old to the
new API (which changes the attribute location). Changing the driver from non-PMBus
to PMBus would very quite likely change some attributes as well.

Besides that, I think it is a bad idea to bypass an infrastructure just because
it may require a few tweaks. That generates a bad precedent, and people _would_
use that to argue that the next PMBus chip driver should not use the infrastructure
either.

Guenter

>>
>> With no one interested in writing that driver, I'll try to give it some more
>> priority myself. I do have an evaluation board somewhere, which should help.
>>
>> Note that the second fan reading should be implemented as just that, not with
>> a non-standard attribute.
> 
> Agreed.
> 
> Andrew
> 
