Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lYmP1pQNzDqC8
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 11:32:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="QqlCdgWe"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41lYmN1W7mz9s2g;
 Wed,  8 Aug 2018 11:32:52 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1533691972; bh=6BHUmNp3ZGPSKCWIWemmFmVwC+6Ce9U/M6NfBWU/P2A=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=QqlCdgWe9TWpZw4st5j1mEfcRnuthFkcSjhMNDXiRwmH22QLArXNVOLYMYKciQ/AK
 fa3pMmQnUBRpOn71xc5eMxvO7nK81eWM/1ItVdUvy0HFtIyLIrl9sNUOcud/Un5AEk
 pD9zFRC7kxXPiXy+VemxC8yDP22EJtvbc1paC5tHLTGU5wQWdtIznwD14UMqnXYgCh
 JmzhoYJLT5TXl06M5qm9jhWX79ntprqHIRnEX6DsUDF3jM4S+MudHlGkXy5pYwm+Ed
 oCslSTMk0mBG0GYU+uqRZgCTd1zg/qkoPXzJKiZjpq/I+jGetsirp2gHPWpntwJJPr
 3nf3J2xZgY2vg==
Subject: Re: In-Band Firmware Update
To: Ed Tanous <ed.tanous@intel.com>, openbmc@lists.ozlabs.org
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <712b9342-6458-4cc4-8c59-aeb498ca5367@intel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <8b3e02f3-92fc-678d-c580-18c76ee3692c@ozlabs.org>
Date: Wed, 8 Aug 2018 09:32:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <712b9342-6458-4cc4-8c59-aeb498ca5367@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 08 Aug 2018 01:32:54 -0000

Hi Ed,

>> We are going to investigate using the DFU protocol, as that
>> also has host side tools already available.
> 
> DFU doesn't completely solve the issue though, does it?  Presumably for 
> security reasons you can't have the DFU device exposed to the host all 
> the time.  If you did, I'm sure the penetration testers would hit it 
> hard.  Assuming that leaving it available all the time is a non-starter, 
> don't you need some command to activate the interface to allow the upload?

Yes, we'd have an endpoint exposed all the time (the run-time descriptor
set). This changes into the DFU mode descriptor set at the start of the
upgrade process, when the host-side tools issue a DFU_DETACH.

Does hiding the descriptor get us anything, if it can be enabled from
the host anyway? The run-time descriptor is super simple.

> Assuming I'm not missing something there (I probably am) doesn't it make 
> more sense to just expose a USB mass storage device when the "start" 
> command is sent, as opposed to implementing the full DFU protocol?  It 
> seems like that would require no utilities (aside from a simple nsh/bash 
> script) and be very easy to replicate.

Just that this requires more custom stuff host-side; raw IPMI commands
for the start and stop (unless we can hook into a SCSI eject event for
the stop perhaps). If we can use existing tools that already support
DFU, that's less stuff that needs to be provided on the host side.

That said, it does look like the current DFU spec isn't going to allow
fast enough transfers for a BMC firmware image in reasonable times, so
we may have to modify those *anyway*, so most of the benefit there may
be lost...

A USB-mass-storage-based solution could be okay, as long as we have a
solid specification for what gets written to the device (a filesystem
containing the image? raw image on the device?), secure parsing for that
data (particularly if the BMC is reading a filesystem) and a protocol
between BMC and host so that we can implement proper handover. If we can
use standard tools for that, it might be a good way to go.

Cheers,


Jeremy
