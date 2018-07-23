Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ZG9J3mYLzDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 24 Jul 2018 08:18:42 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2018 15:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,394,1526367600"; d="scan'208";a="75274776"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga001.jf.intel.com with ESMTP; 23 Jul 2018 15:18:37 -0700
Date: Mon, 23 Jul 2018 15:18:37 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: In-Band Firmware Update
Message-ID: <20180723221837.GI105329@mauery>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2018 22:18:45 -0000

On 23-Jul-2018 11:13 AM, Patrick Venture wrote:
>I've started to implement the host-tool outside of google3, and
>started splitting up the OEM handler that corresponds with it.
>However, firstly, I've submitted the design for the protocol for
>review, please let me know if you're interested and I'll add you to
>the review.  IIRC, there was at least one interested party outside of
>us.

I am interested in coming up with a common (OpenBMC OEM level) set of 
Firmware NetFn commands that will allow all users of OpenBMC to be able 
to use common, open-source utilities to do firmware updates. If they are 
IPMI commands, this would include in-band (with KCS/BT for 
command/control and USB for transfer) or out-of-band (over RMCP+).

Rather than use the OEM NetFn, for firmware updates, we should be using 
the Firmware NetFn.  The entire Firmware NetFn is considered to be OEM 
per the IPMI spec. I would propose that we simply provide a common 
implementation for OpenBMC (as a provider library, of course, so it 
could be replaced if a downstream OEM doesn't want it).

--Vernon
