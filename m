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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43yvx53HNPzDqXB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 05:50:17 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 11 Feb 2019 13:50:46 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Host-side tools
Message-ID: <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Feb 2019 18:50:17 -0000

On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote:
>Brad,
>
>It's my understanding that host-side tools that cooperate with bmc-side
>tools should be in the same repo,

Is this something I said at some point?  Where is this coming from?

>hence why the host-side blobs stuff is in phosphor-ipmi-flash.
>However, if I add any dependencies to the configuration for the
>BMC-side, those get in the way of configuring for the host-side.  Would
>it not make sense to sometimes have it split?  And if so, I would like
>to propose creating two repos, a blobs library host-side, and a flash
>tool host-side repo, so those can be neatly split and not have anything
>in their configuration file that's really bmc-side specific, like
>ipmid, or phosphor-dbus-interface, or something.

I can make a repo if you would like.  Just let me know what you would
like it called.

That said, I think you can also probably do this in the same repo, if
you wanted, by having different build targets - it might not make any
sense to try and build both applications with a single invocation of
configure - as you point out, they are being "configured" for vastly
different runtime environments.
