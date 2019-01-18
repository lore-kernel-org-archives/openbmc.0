Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43glck19YdzDqpf
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 13:43:34 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 17 Jan 2019 21:43:54 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: archiving ipmitool fork
Message-ID: <20190118024354.3pzgsbj2yxyy4hc7@thinkpad>
References: <3BDB2E0E-E60B-4228-A522-5D5F9CE6D8FD@fuzziesquirrel.com>
 <82170eaa-90f7-7fd0-2d3a-d15e8cb14515@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82170eaa-90f7-7fd0-2d3a-d15e8cb14515@intel.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 18 Jan 2019 02:43:34 -0000

On Tue, Jan 15, 2019 at 08:43:34AM -0800, Ed Tanous wrote:
> On 1/15/19 8:02 AM, Brad Bishop wrote:
> > Hi Ed
> >
> > I=E2=80=99m looking at https://gerrit.openbmc-project.xyz/17307
> >
> > Does this mean we can archive our ipmitool fork on GitHub?
> That was the hope, but I don't want to force it if JK had plans to work
> on that repo some more.=C2=A0 At the very least this patch gets us up t=
o the
> current release of ipmitool, gets us building against 2.6, and drops an
> OpenBMC specific recipe.
Thanks.  Archived!

-brad
