Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLNQj6M3mzDqZq
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 04:18:21 +1100 (AEDT)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2017 10:18:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="1234215645"
Received: from parzival.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2017 10:18:12 -0700
Subject: Re: phoshor-network manager daemon + IPMI
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <19cf3888-1eee-8e66-655e-8fba5fba166a@linux.intel.com>
Date: Mon, 23 Oct 2017 10:18:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAO=notwM=vVT6FNahQJ-U5UxMa9KRptPawVeXQbiGyMpce44Bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2017 17:18:23 -0000

I have been digging into the network manager as well.
The link local problem has been popping up on our systems as well.

I'm not sure why linklocaladdress causes our systems to get the 169.XX IP Address.
I suspect is has something to do with the way our DHCP servers are setup on the network, systemd-networkd is not recognizing that we do in fact get an IP from DHCP.

I'm assuming engineers at IBM are not seeing this behavior since the patch was accepted (please correct me if I'm wrong).
Therefore this is more likely not a bug in systemd, but something strange with the configuration of network infrastructure.
Either way, root cause needs to be identified.

To work around it, simply delete the line linklocaladdress=xxxx from /etc/systemd/networkd/00-bmc-ethx.network

Let me know if you make any more observations about the strange behavior (it would be nice to get past this issue).

Thanks,
-Dave Cobbley

On 10/23/2017 07:48 AM, Patrick Venture wrote:

> I'm curious if anyone has experience using the phosphor-network
> manager daemon. I've run into some oddities using it for instance, if
> you don't configure anything it sets up both links as LinkLocal and
> enables DHCP, etc -- and then even if DHCP fails, it doesn't update it
> (although it's aware of the failure) -- and when I then go to set the
> IP address over IPMI to a static IP, I run the two lan channel set
> commands which work (because they just set the object contents) --
> when i call "access on" over IPMI, it tries to delete all the dbus
> objects for the network, which fail because of checks in the network
> daemon that prevent this, which causes the network daemon to crash.
>
> Ultimately I'm going to enable the host ipmi daemon to support
> multiple channels -- the trick is then to map the channel to an
> ethernet device...  Some patches will be send up today to reviewing
> this type of change.
>
> I'm going through the uses cases now trying to get it working, and
> just curious what I should be doing to get it to work.
>
> Also of note, when I set the MAC address -- which works :), it doesn't
> update the configuration for the systemd network file with that
> information  -- I'll be sending a patch for that today -- but I was
> curious if that was deliberate, etc.
>
> Thanks,
> Patrick
