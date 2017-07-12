Return-Path: <linux@roeck-us.net>
X-Greylist: delayed 3202 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Jul 2017 02:04:12 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="vAKcpBgB";
 dkim-atps=neutral
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x73fh5mlQzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 02:04:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ESD0pIBc5VBMNWYd94DXXhfqLIZ3be7QMLX1OJAbajQ=; b=vAKcpBgB2YmphGCcWNME9FBBBe
 KYQhu8DmTPXHuPMfeq86jRAerJASf32Nm64m93MBBZ6IUZif9oAZkHvr57Y23ylzNYMpDiSKkUpjj
 7thbTASEsJOEUxoVRNKXWjPH/yUiB+Eb8tYYowM8zSpmJUFdbJqPpGeM8ShZ/C6PtkER2AQ3uc2Mb
 S2F0HEfAI99e2uCLU9F3GInU1veW2ZXpN85zyZhJpb7TMqs9X18J85eTSlOMmlvz/X6LbHum5LRAj
 Wx3UWDJArSgQzZz8rWZ76ZCmQ+Rm5L2KYKpZoaBIB41Lq6DHwLkOd8/MVklU17WpgGAWwzPg1z951
 +5lrk7UQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:35750 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dVJHq-0001mS-0x; Wed, 12 Jul 2017 15:10:46 +0000
Date: Wed, 12 Jul 2017 08:10:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-kernel@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
 mspinler@linux.vnet.ibm.com
Subject: Re: [RFC PATCH 2/4] pmbus: Add fan configuration support
Message-ID: <20170712151045.GA19238@roeck-us.net>
References: <20170710135618.13661-1-andrew@aj.id.au>
 <20170710135618.13661-3-andrew@aj.id.au>
 <196d7c83-c5fd-cb85-e7bb-2f1a5ba189ae@roeck-us.net>
 <1499819983.4935.7.camel@aj.id.au>
 <208cece7-ee95-c162-82aa-09f35a8d384f@roeck-us.net>
 <1499842869.4935.11.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499842869.4935.11.camel@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
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
X-List-Received-Date: Wed, 12 Jul 2017 16:04:13 -0000

On Wed, Jul 12, 2017 at 04:31:09PM +0930, Andrew Jeffery wrote:
> 
> Indeed. Hence RFC in case I had overlooked something :) Clearly I have.
> 
Not surprising. It isn't exceptionally well documented :-)

> > 
> > > However, the addition of the callbacks was driven by the behaviour of
> > > the MAX31785, where some values written to PMBUS_FAN_COMMAND_1 trigger
> > > automated control, while others retain manual control. Patch 4/4 should
> > > provide a bit more context, though I've also outlined the behaviour in
> > > the commit message for this patch. I don't have a lot of experience
> > > with PMBus devices so I don't have a good idea if there's a better way
> > > to capture the behaviour that isn't so unconstrained in its approach.
> > > 
> > 
> > Many pmbus commands have side effects. I don't see how an explicit callback
> > would be different to overloading a standard register or to providing a virtual
> > register/command, whichever is more convenient.
> 
> I'm going to experiment with the virtual registers. From your
> description above and looking at the comments in pmbus.h I think I can
> make something work (and drop the callbacks).
> 
Excellent.

> 
> Sure. FWIW I plan on sending a follow-up RFC based on the feedback
> you've given here, and I'll look to chop out pmbus_fan_ctrl. I was
> suspicious of needing it as well, but was after your input on the
> general approach and figured sending the patches was better than
> guessing at your potential feedback.
> 
> If a follow-up isn't of interest and you'd definitely rather take on
> the work up yourself, let me know.
> 

By all means, please go ahead. I got way too much on my plate already.

Thanks,
Guenter
