Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhR0p1mhtzF0ny
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 04:17:10 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2018 09:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,513,1511856000"; d="scan'208";a="20021950"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2018 09:17:07 -0800
Date: Wed, 14 Feb 2018 09:17:07 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Liz Kammer <eakammer@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: sdbusplus port for host-ipmid
Message-ID: <20180214171707.GF113334@mauery>
References: <CAEOv9APgYZ=Yzs4tjYad+tg0CupqyTx5M1cpzN3LcnBPBwj_LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEOv9APgYZ=Yzs4tjYad+tg0CupqyTx5M1cpzN3LcnBPBwj_LA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 14 Feb 2018 17:17:14 -0000

On 12-Feb-2018 11:01 PM, Liz Kammer wrote:
>Hi Everyone,
>
>Is anyone working on the sd_bus.h -> sdbusplus port for host-ipmid? I am
>hoping to work on this issue
>https://github.com/openbmc/phosphor-host-ipmid/issues/109, but I don't want
>to step on toes.

I am happy to hear you are working on this. I don't know if anyone else 
is working on it or not, but I do know that host-ipmid is under very 
active development. You will have fewer collisions with others if you 
make and push incremental changes (like for one file at a time). If you 
push one big patchset, it will likely conflict with every other commit 
in review.

--Vernon
