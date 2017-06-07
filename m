Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjbP056wCzDqCt
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 03:37:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="UqBhaAau";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJGiXkQKzUMfdubfjTywlRwEgaFgR9eBm9FGc6qXIPY=; b=UqBhaAauNxHsuN+4y1T5qPtOwL
 0WoQnK88AvqSyl73BQ6hVR9uRkuduR6UwsSaa5C0BLeTFHijp28JWI6sTORMf3WpJkvYDZz5RlCxo
 m1s1BSGY6m59IWXO3J4EioQ62NK/NtHzv4YXohzESLSQcX9iLHCql5oOflM2U3yTwZQKF+/LV+IcQ
 1qWRtEzR98BmeJYGQYxvmV50SseCMrvc1svRf6M8ufm9g8diXr3RDl8OcnKNNunr76A5paqso2DaC
 o+0ftKBFDElJKi82MkVms7AYE40QZJa5nnw1P27acdvvuYGTDgCiYPSCHTSum8Sfa1InuwU8rp6lO
 32RtR27g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:37882 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dIeu1-0021Uq-L1; Wed, 07 Jun 2017 17:37:53 +0000
Date: Wed, 7 Jun 2017 10:37:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Matthew Barth <msbarth@linux.vnet.ibm.com>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v3] hwmon: Add support for MAX31785 intelligent fan
 controller
Message-ID: <20170607173752.GA7167@roeck-us.net>
References: <20170606070230.32669-1-andrew@aj.id.au>
 <91cbe313-7fab-5424-7274-929cc7b31732@roeck-us.net>
 <49c93415-8e92-68f5-b97a-0b270c40e3c6@linux.vnet.ibm.com>
 <CACPK8Xd4B0o_1e1L_RwNTY7rmYy-09ucgF_O2MrxL27h6z0H=g@mail.gmail.com>
 <1496817906.8159.31.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496817906.8159.31.camel@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
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
X-List-Received-Date: Wed, 07 Jun 2017 17:37:57 -0000

On Wed, Jun 07, 2017 at 04:15:06PM +0930, Andrew Jeffery wrote:
> On Wed, 2017-06-07 at 12:18 +0930, Joel Stanley wrote:
> > On Wed, Jun 7, 2017 at 1:50 AM, Matthew Barth
> > > <msbarth@linux.vnet.ibm.com> wrote:
> > > 
> > > On 06/06/17 8:33 AM, Guenter Roeck wrote:
> > > > 
> > > > On 06/06/2017 12:02 AM, Andrew Jeffery wrote:
> > > > > Over and above the features of the original patch is support for a
> > > > > secondary
> > > > > rotor measurement value that is provided by MAX31785 chips with a revised
> > > > > firmware. The feature(s) of the firmware are determined at probe time and
> > > > > extra
> > > > > attributes exposed accordingly. Specifically, the MFR_REVISION 0x3040 of
> > > > > the
> > > > > firmware supports 'slow' and 'fast' rotor reads. The feature is
> > > > > implemented by
> > > > > command 0x90 (READ_FAN_SPEED_1) providing a 4-byte response (with the
> > > > > 'fast'
> > > > > measurement in the second word) rather than the 2-bytes response in the
> > > > > original firmware (MFR_REVISION 0x3030).
> > > > > 
> > > > 
> > > > Taking the pmbus driver question out, why would this warrant another
> > > > non-standard
> > > > attribute outside the ABI ? I could see the desire to replace the 'slow'
> > > > access
> > > > with the 'fast' one, but provide two attributes ? No, I don't see the
> > > > point, sorry,
> > > > even more so without detailed explanation why the second attribute in
> > > > addition
> > > > to the first one would add any value.
> > > 
> > > In the case of counter-rotating(CR) fans which contain two rotors to provide
> > > more airflow there are then two tach feedbacks. These CR fans take a single
> > > target speed and provide individual feedbacks for each rotor contained
> > > within the fan enclosure. Providing these individual feedbacks assists in
> > > fan fault driven speed changes, improved thermal characterization among
> > > other things.
> > > 
> > > Maxim provided this as a 'slow' / 'fast' set of bytes to be user
> > > compatible(so the 'slow' rotor speed, regardless of which rotor, is in the
> > > first 2 bytes with the 'slow' version of firmware as well). In some cases,
> > > mfg systems could have a mix of these revisions.
> > 
> > Andrew, instead of creating the _fast sysfs nodes, I think you could
> > expose the extra rotors are separate fan devices in sysfs. This would
> > not introduce new ABI.
> 
> I considered this approach: I debated whether to consider the fan unit
> as a single entity with two inputs, or just separate fans, and ended up
> leaning towards the former. To go the latter path we need to consider
> whether or not to expose the writeable properties for the second input
> (given they also affect the first) and how to sensibly arrange the
> pairs given the functionality is determined at probe-time. Not rocket
> science but decisions we need to make.
> 

There are many other examples with one writeable and multiple readable
attributes. Temperature offset attributes are an excellent example.
Next question would be what exactly would be writable. pwm attributes are
commonly completely independent of fan attributes. pwm1 output doesn't
mean that fan1 is the matching input; in fact, most of the time it isn't.
The only question would be numbering (is the pair numbered fan1/2 or
fan1/fan(1+X) ?) which is just a matter of personal preference. However,
everything is better than coming up with non-standard attributes which
can not be used with any standard application beyond the application of the
person submitting the driver. It is bad enough if a non-standard attribute
describes something really driver specific. But a non-standard attribute
for a fan speed reading ? Please no. We don't use outX_output instead of
inX_input for voltage outputs either.

Guenter

> There's also the issue that the physical fan that each element of an
> input pair represents will change as the fan speeds vary, based on the
> behaviour that Matt outlined. I don't feel this maps well onto the
> expectations of the sysfs interface, but then I'm not sure there's much
> we can do to alleviate it either other than designating one of the
> input attributes of a fan pair as the fastest input.
> 
> Regardless, I'll look into it in the anticipation that this is a viable
> way forward.
> 
> Cheers,
> 
> Andrew
