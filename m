Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41g46Y3RB2zF14l
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 04:03:00 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2018 11:02:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,428,1526367600"; d="scan'208";a="244879718"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga005.jf.intel.com with ESMTP; 31 Jul 2018 11:02:57 -0700
Date: Tue, 31 Jul 2018 11:02:57 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Virtual Media
Message-ID: <20180731180257.GJ105329@mauery>
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
 <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <eb74222a-737f-92cb-66a3-8d023b5962dc@ozlabs.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2018 18:03:02 -0000

On 27-Jul-2018 05:06 PM, Jeremy Kerr wrote:
>Hi Matt & all,
>
>>I hope to send out a high level design for RFC soon, or people can
>>chime in now with any ideas they have for it.

In past BMC implementations, we offered up to four virtual devices to be 
mounted remotely. I can't remember if this included the one used for 
firmware updates or not. But we will probably need more than one.

>So, as part of working on that design, I've been doing some prototyping
>with the virtual media code, and just got some experiments working
>yesterday, that expose a file from my local browser to the host machine
>(as a USB mass-storage device).
>
>The overall architecture looks like this:
>
> - the BMC kernel has a network block device (nbd) driver; this
>   provides a block device, where read & write operations on the block
>   device end up being sent as requests over a socket interface.
>
> - the nbd infrastructure allows us to use a unix domain socket (rather
>   than a network socket) for that interface.
>
> - so, I wrote a little proxy that does a some setup and then just
>   forwards data between that unix domain socket and stdin/stdout.
>
> - Using a websocket proxy, we can connect that process' stdio to a
>   websocket.
>
> - I wrote a little javascript nbd server to connect to that websocket
>   from a browser session, and serve nbd read requests by reading from
>   a local file. This gives us a block device on the BMC, that's backed
>   by a file accessed by the browser.
>
> - On the BMC, we create a USB mass-storage gadget (using the ASPEED
>   UDC device), that uses the nbd device as the underlying storage.

That sounds pretty good from a high level. Nice job using off-the-self 
parts.

>Using that, I was able to forward an .iso image from my webbrowser on
>one side of the country to a machine in our lab on the other. Speed
>wasn't fantastic, but should be fine for most cases.
>
>Let me know what you think. The main caveat of this is that this method
>isn't able to serve writeable images, as sensible browsers won't allow
>served javascript code to modify files.

RO files should really be the biggest use case for this -- host OS 
installs and such. I really don't know how much people will complain if 
we take their RW files away. We are also not requiring them to install 
Java, so they win one and lose one.

--Vernon

>If you're curious, here's the prototype code for the nbd channel (proxy
>+ javascript server):
>
>  https://github.com/jk-ozlabs/jsnbd
>
>This isn't necessarily the code that we'll want to run on OpenBMC, more
>a proof-of-concept to make sure that all the parts work.
>
>In order to implement this on OpenBMC, we'd still need a few things:
>
> - integrating the nbd-proxy into the proper http server framework
>
> - integration into the actual OpenBMC web UI
>
> - adding hooks to automatically start/stop the USB mass-storage gadget
>   on nbd session setup
>
>Cheers,
>
>
>Jeremy
