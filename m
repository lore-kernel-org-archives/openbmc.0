Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="TA4os5ZS"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhjWx0hlkzF0hC
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 15:11:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1518667543; x=1550203543;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NevAdVaZsCmnlDoeWOU3YhDPqFAMAzsPN5D3nFMdRjk=;
 b=TA4os5ZSpElu0gO8MuUvVCFg5MdP6YiGmjuganRMRhjKu4NRWFZ2lTtS
 /vrczk1mgamFjBhSmsaHu38LwT/EVwwxvqg5fNoZOyHJIktyM8PHdiGRE
 Y9Zxw5DB3fbPwMQCoyAs/pe5rbtwKEYghL/D57A+5Bl36MlldMYL9kb9O s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HFAAADB4Vah8mZ6ERcGgEBAQEBAgEBA?=
 =?us-ascii?q?QEIAQEBAYMlgQMQcIQNiiSNZR+CAoEXjkqHeBWBQEMKJYUWAoJ9VBgBAgEBAQE?=
 =?us-ascii?q?BAQIBAhABAQEKCwkIKC+COCQLBANIKS8BAQEBAQEBAQEBIAINMC4BBSMPAUYQC?=
 =?us-ascii?q?w4KAgIFEw4CAg8FSQodiiEQryCCJ4kEghMBAQEBAQUBAQEBAQEdBYEPg3MvAYF?=
 =?us-ascii?q?LK4Ztgy8CgTmDTzGCNAWLCYhckAFMCQqIFo1YgiyGKot9jgSGGIN/gTwfbGwyT?=
 =?us-ascii?q?SNfDYIcAQEBDoJkJXEBAoEYjmkBAQE?=
X-IPAS-Result: =?us-ascii?q?A2HFAAADB4Vah8mZ6ERcGgEBAQEBAgEBAQEIAQEBAYMlgQM?=
 =?us-ascii?q?QcIQNiiSNZR+CAoEXjkqHeBWBQEMKJYUWAoJ9VBgBAgEBAQEBAQIBAhABAQEKC?=
 =?us-ascii?q?wkIKC+COCQLBANIKS8BAQEBAQEBAQEBIAINMC4BBSMPAUYQCw4KAgIFEw4CAg8?=
 =?us-ascii?q?FSQodiiEQryCCJ4kEghMBAQEBAQUBAQEBAQEdBYEPg3MvAYFLK4Ztgy8CgTmDT?=
 =?us-ascii?q?zGCNAWLCYhckAFMCQqIFo1YgiyGKot9jgSGGIN/gTwfbGwyTSNfDYIcAQEBDoJ?=
 =?us-ascii?q?kJXEBAoEYjmkBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 22:05:38 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausxippc101.us.dell.com ([143.166.85.207])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Feb 2018 10:01:27 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,515,1511848800"; d="scan'208";a="1051082520"
X-DLP: DLP_GlobalPCIDSS
Date: Wed, 14 Feb 2018 22:11:32 -0600
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Subject: Re: contributor license agreement (CLA) (was: Upcoming project
 ownership changes)
Message-ID: <20180215041131.GB10667@wn7x64-4cggry1.aus.amer.dell.com>
References: <1518580396.11149.41.camel@fuzziesquirrel.com>
 <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 04:11:42 -0000

On Wed, Feb 14, 2018 at 07:54:40AM +0100, Paul Menzel wrote:
> Dear Brad,
> 
> 
> Am 14.02.2018 um 04:53 schrieb Brad Bishop:
> 
> […]
> 
> > I'm happy to report that these industry leaders have rallied around
> > your community as the meeting point.  Very soon it will get a lot more
> > busy around here.
> > 
> > To this end, IBM will be ceding stewardship of this project to the
> > Linux Foundation in the very near future.  You can find the project
> > charter here:
> > 
> > https://docs.google.com/document/d/1uBbi5rDhWqj8Al-eoNLxERZ9OK8KVMZThOuS08-cYto
> 
> (Note, the URL is wrapped in your message.)
> 
> Thank you. Cooperating is definitely a good thing. My knowledge of the goals
> and operation of the Linux Foundation is not good enough to comment on that.
> 
> > Under the new charter, contributors will be required to sign a
> > contributor license agreement.  There will be corporate (your company
> > signs once for all future contributions originating from your company)
> > and individual agreements available:
> > 
> > https://docs.google.com/document/d/1veiAjszrhgabA8XrJWjYCs7lyXIhs5rcXWgaeuW-bT8
> > https://docs.google.com/document/d/1m61YH8GSzQpYVt5YG95fb2QNy1Gs--1-oLD3znqPNQw
> > 
> > Please work with your legal team (if using the corporate CLA) or sign
> > the individual CLA now and send them to me to avoid any delays in your
> > development work flow when the transfer occurs.
> 
> Could you please elaborate, why CLAs are needed? The Linux Kernel is under
> the umbrella of the Linux Foundation, and no CLAs are needed there. CLAs are
> a great burden, as the legal department gets involved, and should be avoided
> at all costs, as contributors want to advance OpenBMC and not do paperwork.

Interesting that this immediately is flagged as a point of contention. Here is
a counterpoint from Bradley Kuhn:

https://sfconservancy.org/blog/2014/jun/09/do-not-need-cla/

For the record, I strongly oppose CLAs. However, I will submit this to our
legal team for review.

I don't envy you having to have this same conversation over and over and over
and over again over the coming years.

--
Michael
