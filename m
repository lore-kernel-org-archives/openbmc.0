Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445k5y0NJ4zDqWv
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 07:51:32 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 12:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,401,1544515200"; d="scan'208";a="140875398"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2019 12:51:29 -0800
Date: Fri, 22 Feb 2019 12:51:29 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI Channel Config Removed?
Message-ID: <20190222205129.GB44612@mauery.jf.intel.com>
References: <CAO=notwH0_2nGmWaxyr-56Tzb_SFJHmdUPeUZpjWBBVm5EArzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notwH0_2nGmWaxyr-56Tzb_SFJHmdUPeUZpjWBBVm5EArzg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Fri, 22 Feb 2019 20:51:35 -0000

On 22-Feb-2019 09:55 AM, Patrick Venture wrote:
>It looks like the channel config for IPMI was removed from the
>sources.  Instead the channel layer is doing something by checking
>with the sysfs device instances -- and there's some mapping (I haven't
>dug into it).

IPMI channels are configured with a JSON file that lives in 
/usr/share/ipmi-providers/channel_config.json on the BMC. The default 
file in yocto-land lives at 
meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json 
and can be overridden with bbappend.

>I'd like to know if I need to do anything to configure the channels
>such that eth1 is channel 1, and eth0 is channel 0?  Or Did that
>change?  Can I make eth1 channel 5?

Making your own config is as easy as overriding the default with 
bitbake.

>All our platforms were using channel configs, and quanta-q71l upstream
>was too, so I'd like some explanation as I don't remember seeing an
>email about it when it was dropped.

I don't recall if there was an email, but several months back, there 
were user/channel config reviews out that slowly got merged in.

--Vernon
