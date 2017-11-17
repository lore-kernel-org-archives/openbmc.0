Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydtw24CKQzDrRX
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 10:04:01 +1100 (AEDT)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Nov 2017 15:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,411,1505804400"; 
   d="scan'208";a="3524555"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 15:03:56 -0800
Date: Fri, 17 Nov 2017 15:03:56 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Xo Wang <xow@google.com>
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Mihm, James" <james.mihm@intel.com>
Subject: Re: HPM firmware update
Message-ID: <20171117230356.GF113334@mauery>
References: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
 <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
 <20171116171412.GD113334@mauery>
 <CAO=notwuzbeXZLD7HePcFJ0xqMQRh0hTcOLtjR_qD60SMdL45Q@mail.gmail.com>
 <CAPH-5w4qbYuOifX=PzUCr_7JXQvPcrKBNqocVugbTUwQoCX_0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPH-5w4qbYuOifX=PzUCr_7JXQvPcrKBNqocVugbTUwQoCX_0A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 17 Nov 2017 23:04:03 -0000

On 17-Nov-2017 02:02 PM, Xo Wang wrote:
...
>>>
>>> An overview goes something like this:
>>>
>>> 1) enter FW transfer mode
>>> 2) optionally send parameters (no-rollback, deferred reboot, debug, etc.)
>>> 3) <make a choice for either IPMI streaming or other transport>
>>>         a) for streaming
>>>                 i) write data blocks as IPMI FW command
>>>         b) for usb mass storage
>>>                 i) send plug-in IPMI command
>>>                 ii) host-side mount usb mass storage device, writes fw image
>>>                 iii) send plug-out IPMI command
>>>                 iv) send 'set uri command' (usb://...)
>>>         c) for network transport
>>>             i) send 'set uri command' (http(s)://..., tftp://..., ftp://...)
>>> 4) send transfer complete IPMI command
>>> 5) check status
>>>         status moves from download -> verify -> program -> ready
>>>         status can move to error from any state
>>> 6) once status moves to ready, firmware update is finished, ready to
>>> reboot.
>>> 7) send exit fw transfer mode IPMI command. This causes the BMC to
>>> reboot unless a deferred reboot has been selected.
>>>
>>>
>>> This mostly describes what the IPMI control does, which is pretty generic.
>>> The trickiest bit is offering multiple mechanisms for transport because IPMI
>>> is not the most efficient method to transport (unless you use 64kB payloads
>>> during the streaming phase. Even then, the TCP protocols are faster because
>>> of round-trip timing (only need an ack rather than a full trip through the
>>> IPMI command lookup and execution process.) USB is pretty fast, but not
>>> available for every system.
>>>
>>> --Vernon
>
>To add to Patrick V's comment, our concern with IPMI-only transfers
>was also with performance. We tested using a spec implementation (a
>POWER8 sample machine running AMI BMC) as well as a toy version of
>Brendan Higgins's proposed in-band transfer mechanism and both took
>way too long to transfer images.
>
>Vernon:
>The USB mechanism sounds interesting. Could you elaborate on what the
>BMC-side hardware and software looks like? I'm picturing one of the
>BMC's USB PHYs hanging off of a host hub? Is it on the board or an
>external cable? What's the backing storage for the mass storage gadget
>(assuming you are using gadget)?

Our current implementation uses a proprietary, single-use USB stack that 
we are planning on replacing with a USB-UCD + USB gadget driver. But it 
works about the same way. When the host makes a request for the USB 
device, it creates a tmpfs-backed file, formats it with FAT, and 'plugs' 
in to begin enumeration. The hardware does have a direct route to the 
host USB, which allows us to reach pretty good transfer rates over 
USB2.0. In my ideal world, using gadget, we could offer this USB mass 
storage device as well as an in-band USB ethernet device that could 
provide another hi-speed transport to the BMC.

--Vernon
