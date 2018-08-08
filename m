Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41m4cD1QkyzDqkP
 for <openbmc@lists.ozlabs.org>; Thu,  9 Aug 2018 07:42:35 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2018 14:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,212,1531810800"; d="scan'208";a="63645959"
Received: from mauery.jf.intel.com ([10.7.150.157])
 by orsmga008.jf.intel.com with ESMTP; 08 Aug 2018 14:42:31 -0700
Date: Wed, 8 Aug 2018 14:42:31 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
Subject: Re: In-Band Firmware Update
Message-ID: <20180808214231.GB33167@mauery.jf.intel.com>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <712b9342-6458-4cc4-8c59-aeb498ca5367@intel.com>
 <8b3e02f3-92fc-678d-c580-18c76ee3692c@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8b3e02f3-92fc-678d-c580-18c76ee3692c@ozlabs.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Wed, 08 Aug 2018 21:42:36 -0000

On 08-Aug-2018 09:32 AM, Jeremy Kerr wrote:
>Hi Ed,
>
>>>We are going to investigate using the DFU protocol, as that
>>>also has host side tools already available.
>>
>>DFU doesn't completely solve the issue though, does it?  Presumably 
>>for security reasons you can't have the DFU device exposed to the 
>>host all the time.  If you did, I'm sure the penetration testers 
>>would hit it hard.  Assuming that leaving it available all the time 
>>is a non-starter, don't you need some command to activate the 
>>interface to allow the upload?
>
>Yes, we'd have an endpoint exposed all the time (the run-time descriptor
>set). This changes into the DFU mode descriptor set at the start of the
>upgrade process, when the host-side tools issue a DFU_DETACH.
>
>Does hiding the descriptor get us anything, if it can be enabled from
>the host anyway? The run-time descriptor is super simple.

I am not saying security by obscurity is good, but there is a difference 
between an unlocked door and an open one. I am sure our security team 
would not want the firmware update descriptor present at all times.

>>Assuming I'm not missing something there (I probably am) doesn't it 
>>make more sense to just expose a USB mass storage device when the 
>>"start" command is sent, as opposed to implementing the full DFU 
>>protocol?  It seems like that would require no utilities (aside from 
>>a simple nsh/bash script) and be very easy to replicate.
>
>Just that this requires more custom stuff host-side; raw IPMI commands
>for the start and stop (unless we can hook into a SCSI eject event for
>the stop perhaps). If we can use existing tools that already support
>DFU, that's less stuff that needs to be provided on the host side.
>
>That said, it does look like the current DFU spec isn't going to allow
>fast enough transfers for a BMC firmware image in reasonable times, so
>we may have to modify those *anyway*, so most of the benefit there may
>be lost...

Speed is a big thing. With firmware image sizes as big as they are, we 
cannot afford slow transfers.

>A USB-mass-storage-based solution could be okay, as long as we have a
>solid specification for what gets written to the device (a filesystem
>containing the image? raw image on the device?), secure parsing for that
>data (particularly if the BMC is reading a filesystem) and a protocol
>between BMC and host so that we can implement proper handover. If we can
>use standard tools for that, it might be a good way to go.

If the BMC exports an empty FAT filesystem, just about anything can read 
that. It is easy to parse on the inbound and can easily be done with a 
loop-mount. In this case though, it would be nice to have some sort of 
control that tells the BMC when to "plug in" and "eject" the device 
to/from the host for synchronization mechanisms. The BMC could then look 
at the volume and attempt to use each file as a firmware volume to 
prepare for activation.

--Vernon
