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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45snC54vF3zDqSH
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 02:30:08 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 22 Jul 2019 12:30:49 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Kun Yi <kunyi@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gabriel Matute <gmatute@google.com>, Neeraj Ladkani <neladk@microsoft.com>
Subject: Re: Integrate collectd with OpenBMC
Message-ID: <20190722163049.kyupys7alq6zzq6x@thinkpad>
References: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGMNF6Xdkf8Obp8iLVajt21ZT81RAuGksper_u-w9Fvt_OrCZA@mail.gmail.com>
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
X-List-Received-Date: Mon, 22 Jul 2019 16:30:10 -0000

On Thu, Jun 27, 2019 at 10:51:03PM -0700, Kun Yi wrote:
>Hello there,
>
>In the context of reporting BMC performance metrics, my intern Gabriel
>(cc'ed here) and I have started looking at integrating collectd as a
>metrics collection tool on OpenBMC. We have got it running, which is
>trivial, but the next question is how to report the data.
>
>We have thought about it and thinks implementing a D-Bus interface to be
>the most flexible approach. At first, we could implement a snapshot
>(instantaneos read) interface. It would then be fairly straightforward to
>add them as Redfish/IPMI sensors.

Just curious in what situations DBus was required?  In the design I 
thought you had applications going right to librrd - where did that fall 
down?

>
>There are two ways to do this:
>1. Implement as a collectd "D-Bus" plugin [1]. Collectd supports writing
>custom plugins which are C files calling the internal plugin APIs. Could
>probably use sdbus to implement.
>
>+ could potentially be upstreamed to collectd
>- the code probably will live in a downstream fork first, and if it doesn't
>end up upstream, maintaining could become an issue since collectd plugin
>API is not guaranteed stable
>- C
>
>2. Implement as an interposer daemon that translates between one of the
>formats that collectd supports (unix socket, plaintext, RRDTool..) to D-Bus
>
>+ project could be purely OpenBMC
>+ can use sdbusplus
>- another daemon
>
>Any advice on this? Currently we are leaning towards the first approach,
>but do you agree the D-Bus plugin is general enough to be of interest to
>the upstream collectd community?
>
>I can definitely reach out to the collectd group but just want to ask here
>first :)
>
>[1] Collectd plugins:
>https://collectd.org/wiki/index.php/Plugin_architecture
>-- 
>Regards,
>Kun
