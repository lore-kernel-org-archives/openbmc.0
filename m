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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pJCr2N1gzDqN8
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 05:33:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Mon, 28 Jan 2019 13:33:40 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: David Thompson <dthompson@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Question on upstreaming and release planning
Message-ID: <20190128183340.s4ahkzcarv4ruhei@thinkpad>
References: <VI1PR0502MB38692122CA756E330804994EDD960@VI1PR0502MB3869.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0502MB38692122CA756E330804994EDD960@VI1PR0502MB3869.eurprd05.prod.outlook.com>
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
X-List-Received-Date: Mon, 28 Jan 2019 18:33:12 -0000

On Mon, Jan 28, 2019 at 03:20:41PM +0000, David Thompson wrote:
> Hello all,
> 
> I work for Mellanox Technologies and we've have been using OpenBMC
> for a while now.  We hope to upstream the code contributions that
> support our machine (called "bluewhale-ast2500") which is a hardware
> platform based on ASPEED AST2500.
> 
> We have a new meta-layer at:
> $TOP/meta-mellanox/meta-bluewhale-ast2500/
> which holds the supporting files for our machine.
> 
> What's the process to get our machine into the upstream?

You can submit a pull request to the Gerrit server.  Here is a cheat
sheet:

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes-via-gerrit-server

We already have a meta-mellanox repository for meta-msn so your pull
request would be against meta-mellanox and just be a new folder with
meta-bluewhale.

> Do I need to attend a release planning meeting and discuss?

No, not to add your platform to meta-mellanox.

The release planning meeting is where we plan the implementation of
technologies (not hardware platforms) like Redfish, MCTP, etc.  If you
plan to work on something like that and want to share it with the
broader community, it makes sense to 1 - announce that on the mailing
list and 2 - bring your intentions to the release planning meeting.

Don't get the wrong idea - we'd love to have you at the release planning
meeting even if you don't intend to do any of those things.

> I see there's a meeting on Mon 1/28, that's why I ask now.
> 
> FWIW, I have submitted a signed CCLA, and it's been accepted already.
> 
> Thanks,
> 
>   *   Dave
> 
> 
> David Thompson
> Sr. Staff Engineer, System SW
> Mellanox Technologies
> 1900 West Park Drive, Suite 290
> Westborough MA USA 01581
> Direct: +1 508-475-6375
> 
