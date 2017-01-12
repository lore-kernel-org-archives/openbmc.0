Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzrrD2jW4zDqDT
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jan 2017 03:31:56 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v0CGVP2E023516;
 Thu, 12 Jan 2017 10:31:26 -0600
Message-ID: <1484238690.2492.47.camel@kernel.crashing.org>
Subject: Re: [PATCH 3/4] drivers/misc: Add ASpeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Cyril Bur <cyrilbur@gmail.com>, devicetree@vger.kernel.org,
 jassisinghbrar@gmail.com, arnd@arndb.de, joel@jms.id.au,
 mark.rutland@arm.com, robh+dt@kernel.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, xow@google.com, jk@ozlabs.org
Date: Thu, 12 Jan 2017 10:31:30 -0600
In-Reply-To: <20170112162619.GB10283@kroah.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-4-cyrilbur@gmail.com>
 <20170112074750.GB23943@kroah.com> <1484216163.11416.8.camel@gmail.com>
 <20170112103038.GA19239@kroah.com>
 <1484234867.2492.39.camel@kernel.crashing.org>
 <20170112160051.GB8095@kroah.com>
 <1484237253.2492.43.camel@kernel.crashing.org>
 <20170112162619.GB10283@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 12 Jan 2017 16:31:57 -0000

On Thu, 2017-01-12 at 17:26 +0100, Greg KH wrote:
> I think, you can change things after access_ok() happens, there used to
> be bugs in that area a few years ago.  I think we fixed them by moving
> the offending drivers to use copy_*() instead.

Ok, I'm surprised though, we still have a metric ton of code,
especially in filesystems, who do access_ok. Generally the idea here is
that the enforcement is done by the MMU normally via the permission in
the page tables. access_ok() is simply needed to make sure we access
the portion of the page tables representing user space, not kernel
space, and that is a pretty fixed dichotomy.

Anyway, this is academic, I agree that copy_to/from_... is nicer.

Cheers,
Ben.
