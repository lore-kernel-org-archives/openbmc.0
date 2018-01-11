Return-Path: <benh@kernel.crashing.org>
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHdLd5QBczF0VK
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jan 2018 07:50:33 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w0BKntou005592;
 Thu, 11 Jan 2018 14:49:56 -0600
Message-ID: <1515703795.31850.45.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, jdelvare@suse.com,
 arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, linux@roeck-us.net,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 12 Jan 2018 07:49:55 +1100
In-Reply-To: <20180111095923.GA29233@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com> <1515661011.31850.27.camel@au1.ibm.com>
 <20180111095923.GA29233@kroah.com>
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
X-List-Received-Date: Thu, 11 Jan 2018 20:50:34 -0000

On Thu, 2018-01-11 at 10:59 +0100, Greg KH wrote:
> And, if you use it in a device, it's still totally unsupported and
> insecure.  Seriously, does no one actually pay attention to the patches
> I merge in the stable trees anymore?

Yeah not sure why we aren't picking an LTC here, it could be that it's
just a dev branch, not release, Joel, what's the process in that case ?

For anything going into products, if we're going to maintain a non-
upstream branch, we should definitely stick it to an LTS release or
we'll be missing a ton of security fixes.

Cheers,
Ben.
