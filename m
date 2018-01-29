Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVhKy40bMzDqsf
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 07:43:17 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2018 12:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="170090065"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga004.jf.intel.com with ESMTP; 29 Jan 2018 12:43:14 -0800
Date: Mon, 29 Jan 2018 12:43:14 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC redundancy
Message-ID: <20180129204314.GZ113334@mauery>
References: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <AFD7FFE5-8EA8-41FF-85C9-71AF312D4775@fuzziesquirrel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 20:43:19 -0000

On 29-Jan-2018 10:52 AM, Brad Bishop wrote:
>I know we have a lot of work to do with the basics before tackling something
>like supporting multiple BMCs in a single system, but its never too early to
>brainstorm.
>
>Quick community poll:  Please share any thoughts you may have around supporting
>systems with multiple BMCs.  Does your organization care?  Thoughts on how it
>could/should be done?  System designs that are a non-starter for OpenBMC?

Intel has supported systems like this in the past, and it is likely that 
we will have need of multi-node/multi-bmc systems in the future.

Our systems in the past have been sled-based with four sleds (BMC+host) 
per chassis and the BMCs connected via I2C over the backplane.  One of 
the BMCs was elected (based on availability and ID) to be the master for 
the system to control the shared resources (power supplies and other 
common stuff). 

Each BMC was individually accessible in the normal ways (KCS from host 
or RMCP/web over the network).

Is this the sort of stuff that you are looking for or were you thinking 
of BMC redundancy for a single system?

--Vernon
