Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Tl2F5vXkzDqNj
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 21:42:44 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 27 Mar 2019 06:43:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: usr/sbin vs usr/bin
Message-ID: <20190327104316.j5xst4akmdm3dxww@thinkpad.dyn.fuzziesquirrel.com>
References: <CAO=notxq+sAhdN5kJ2BFYreCDeSo633KPZM1-f-M9LXdUJzS3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notxq+sAhdN5kJ2BFYreCDeSo633KPZM1-f-M9LXdUJzS3w@mail.gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2019 10:42:46 -0000

Hi Patrick

On Tue, Mar 26, 2019 at 10:33:01AM -0700, Patrick Venture wrote:
>Brad,
>
>Reading the anti-pattern, I was going to start moving some things out
>of sbin and into bin, 
Thank you!

>I had considered why not just leave out the path in the service file
>(as a step 1) - since systemd which just load the first match in path, 
Actually systemd doesn't go to the environment for this.  The
directories searched are described in systemd.service(5).

>but the anti-pattern above indicates we should use the full path in the
>service file, to make sure it runs the correct one -- at least that's
>how I am paraphrasing it.
Just because this is the recommendation in the systemd.service man page:

"it is thus safe to use just the executable name in case of executables
located in any of the "standard" directories, and an absolute path must
be used in other cases. Using an absolute path is recommended to avoid
ambiguity."

Also fully qualified paths seem to be the convention when I look at
other linux distros.

thx - brad
