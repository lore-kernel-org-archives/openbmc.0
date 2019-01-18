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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43hD860kVgzDrBl
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jan 2019 08:08:53 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Fri, 18 Jan 2019 16:09:13 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC at the 2019 OCP Summit Hardware Management track
Message-ID: <20190118210913.a4kynzggtesqln5g@thinkpad>
References: <20190118021802.752bcjgc7oxa33m4@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118021802.752bcjgc7oxa33m4@thinkpad>
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
X-List-Received-Date: Fri, 18 Jan 2019 21:08:54 -0000

On Thu, Jan 17, 2019 at 09:18:02PM -0500, Brad Bishop wrote:
> Hi Everyone
> 
> The TSC has asked me to present at the 2019 OCP Summit on behalf of the
> OpenBMC community.  You can see the abstract here:
> 
> https://2019ocpglobalsummit.sched.com/event/Jil3/openbmc-project-update?iframe=no&w=100%&sidebar=yes&bg=no
> 
> I will be hashing the presentation out in the next day or two. If you
> have anything you think might make sense to talk about there, I'd love
> to hear about it.
> 
> Also, I intend to publish a draft once I have composed it, if you'd
> prefer to leave feedback that way as well (or instead).  Stay tuned.
> 
> thx - brad

I've put a draft here:

https://github.com/openbmc/openbmc/wiki/files/OCPGLO19_OpenBMC_Project_Update-draft.pdf

It is still very draft-y, but you can get a sense of the outline and
high level flow.  I could use help calling out any function implemented
in 2.6 and any function planned for 2.7.

thx - brad
