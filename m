Return-Path: <Sachit.Bakshi@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=sachit.bakshi@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="0KPxqTf9"; 
 dkim-atps=neutral
X-Greylist: delayed 742 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Jul 2018 05:15:28 AEST
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Zp3N2yBBzDrGC
 for <openbmc@lists.ozlabs.org>; Wed, 25 Jul 2018 05:15:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1532459311; x=1563995311;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mSH7C+/5grG5n4GF1Y4vcX/6TZafiQACqe3gVyIr9zM=;
 b=0KPxqTf9ONTzaV0wUBSiyzOQKlgPpSz3feLxz1ygsD9yZ83Hr4wbiR3X
 sEZAsNCn+CUANxF52JH+n+s+inTyQ2e/ch4lmuvnC6Fkp9VVKZIiaMAhA
 DjJLChAcS/aT7B45q4JPu5qGgpBC7nXl+DawN6dCfTocY75/yuAj9wh6s 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FqAAC4dldbh8uZ6ERcGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQwgScKg3SUQIFgLIM6lAULGAuESQKCTiE4FAECAQECAQECAQE?=
 =?us-ascii?q?CEAEBAQoLCQgpIwyCNSQBgUIsCE4BARgBAQEBAgEBIg8BLBoFCwsOCgICJgICK?=
 =?us-ascii?q?B8QBgEJAwEFAgEBgxwBgXcID68igS6KUwUJAYEBh3eBWD6BESeCaoMbBIE3gyi?=
 =?us-ascii?q?CVQKNSIQzh3UDBAICi0ODaAaBRYQTiByIBIRKgkeDDoFYgXRwgzmCM4hihVxRA?=
 =?us-ascii?q?Yt0gS6BGwEB?=
X-IPAS-Result: =?us-ascii?q?A2FqAAC4dldbh8uZ6ERcGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?wgScKg3SUQIFgLIM6lAULGAuESQKCTiE4FAECAQECAQECAQECEAEBAQoLCQgpI?=
 =?us-ascii?q?wyCNSQBgUIsCE4BARgBAQEBAgEBIg8BLBoFCwsOCgICJgICKB8QBgEJAwEFAgE?=
 =?us-ascii?q?BgxwBgXcID68igS6KUwUJAYEBh3eBWD6BESeCaoMbBIE3gyiCVQKNSIQzh3UDB?=
 =?us-ascii?q?AICi0ODaAaBRYQTiByIBIRKgkeDDoFYgXRwgzmCM4hihVxRAYt0gS6BGwEB?=
Received: from esa5.dell-outbound2.iphmx.com ([68.232.153.203])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2018 13:57:56 -0500
From: "Bakshi, Sachit" <Sachit.Bakshi@dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa5.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2018 00:57:29 +0600
X-LoopCount0: from 10.166.132.128
X-IronPort-AV: E=Sophos;i="5.51,398,1526360400"; d="scan'208";a="211946428"
Subject: Re: In-Band Firmware Update
To: Sai Dasari <sdasari@fb.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>, Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
Message-ID: <88504c68-822b-49bc-ae77-9f00242ee1dc@dell.com>
Date: Tue, 24 Jul 2018 14:02:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.137.144.16]
X-ClientProxiedBy: AUSX13MPC102.AMER.DELL.COM (10.166.132.128) To
 AUSX13MPC102.AMER.DELL.COM (10.166.132.128)
X-Mailman-Approved-At: Wed, 25 Jul 2018 10:11:12 +1000
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
X-List-Received-Date: Tue, 24 Jul 2018 19:15:30 -0000

> 
> 
> ﻿On 7/23/18, 3:19 PM, "openbmc on behalf of Vernon Mauery" <openbmc-bounces+sdasari=fb.com@lists.ozlabs.org on behalf of vernon.mauery@linux.intel.com> wrote:
> 
>     On 23-Jul-2018 11:13 AM, Patrick Venture wrote:
>     >I've started to implement the host-tool outside of google3, and
>     >started splitting up the OEM handler that corresponds with it.
>     >However, firstly, I've submitted the design for the protocol for
>     >review, please let me know if you're interested and I'll add you to
>     >the review.  IIRC, there was at least one interested party outside of
>     >us.
>     
>     I am interested in coming up with a common (OpenBMC OEM level) set of 
>     Firmware NetFn commands that will allow all users of OpenBMC to be able 
>     to use common, open-source utilities to do firmware updates. If they are 
>     IPMI commands, this would include in-band (with KCS/BT for 
>     command/control and USB for transfer) or out-of-band (over RMCP+).

This sounds good. I'd advocate for some agreement around commands we
support. Our BMC updates components besides itself, and we support
multiple transport protocols. Therefore we have commands defined to
initiate an update, transfer the image, check the status, get errors,
start the update, etc.

I'm sure others have similar support in their implementations.

>     
>     Rather than use the OEM NetFn, for firmware updates, we should be using 
>     the Firmware NetFn.  The entire Firmware NetFn is considered to be OEM 
>     per the IPMI spec. I would propose that we simply provide a common 
>     implementation for OpenBMC (as a provider library, of course, so it 
>     could be replaced if a downstream OEM doesn't want it).

Agreed.

> Any thoughts on reusing/leveraging the PICMG's hpm spec @ https://www.picmg.org/openstandards/hardware-platform-management/ . 

Thanks for sharing this, I was not familiar with it. I'll look into it,
but I know we sign our images to secure our system, not sure if HPM
format will work for things like that, just something to consider.

> One of the benefit would be the standard 'ipmitool' has native support for the update and changes are limited to BMC f/w. 
> On a downside, the firmware binary has to be repackaged as .hpm format for this protocol to do some preparation steps as it support multiple f/w components in a single package. 
>     
>     --Vernon
>     
> 

Thanks,
Sachit
