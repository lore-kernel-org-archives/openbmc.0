Return-Path: <benh@kernel.crashing.org>
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHKfs4xq3zF0Tt
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 20:03:33 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w0B92sLw024661;
 Thu, 11 Jan 2018 03:02:55 -0600
Message-ID: <1515661373.31850.31.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.10 3/6] drivers/misc: Add driver for Aspeed
 PECI and generic PECI headers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Date: Thu, 11 Jan 2018 20:02:53 +1100
In-Reply-To: <20180110101840.GB5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180109223126.13093-4-jae.hyun.yoo@linux.intel.com>
 <20180110101840.GB5822@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.3 (3.26.3-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 09:03:34 -0000

On Wed, 2018-01-10 at 11:18 +0100, Greg KH wrote:
> On Tue, Jan 09, 2018 at 02:31:23PM -0800, Jae Hyun Yoo wrote:
> > This commit adds driver implementation for Aspeed PECI. Also adds
> > generic peci.h and peci_ioctl.h files to provide compatibility
> > to peci drivers that can be implemented later e.g. Nuvoton's BMC
> > SoC family.
> 
> We don't add code that could be used "sometime in the future".  Only
> include stuff that we use now.
> 
> Please fix up this series based on that and resubmit.  There should not
> be any need for any uapi file then, right?

No Greg, I think you misunderstood (unless I misread myself).

What Jae means is that since PECI is a standard and other drivers
implementing the same ioctl interface and messages will eventually go
upstream, instead of having the ioctl definitions in a driver specific
locations, they go in a generic spot, as they define a generic API for
all PECI drivers, including the one that's getting merged now.

IE. This doesn't add unused stuff, it just puts the API parts of it
into a generic location.

At least that's my understanding from a, granted cursory, look at the
patch.

That said, I do have a problem with the structure definitions of the
various packet types as they use "long" which has a variable size and
unclear alignment. It should be using __u8, __u16 and __u32...

Cheers,
Ben.
