Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zdRr5Z85zDrTH
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 03:00:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="qGeexzcg"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 41zdRq6c1mz9s47;
 Tue, 28 Aug 2018 03:00:23 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1535389224; bh=8mXIiJ20cDO7Kx9DekXqUrMwy0kv7zp0krmZfmOR0AQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=qGeexzcgCeaa9ewnVm3CFd5UPUBmzSvkaW5RbUtK1HY+/fsyYAIpi2haKgtOoIvjQ
 748/02UWVzHVoIXUvZw/dCuJ6X9VuEYMlUAtOD0T8aKmQthF/DyvAQka4vChbyxYr3
 vmKEjzIiwNa4M9Q0glKOqluts/BfqcOgfh47teyr2E9d+ThLrhnHGo3jjY6BtgMNLZ
 GR1HylKziDLjZD5b1tckLSKRKidMiELHBcZLGHOkprQPIIMEoksyNELDmNwS6U1pLA
 GmZ0EvnjBn2VPVEQ5+Uy2JyXg9CHjDwQgc/kpk4JAbAFIHLA7XaXz+cBfRlwAwLSbc
 Q+nxQPvBFHjeg==
Subject: Re: SOL Logging
To: "Tanous, Ed" <ed.tanous@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <d94fd642-a114-1ed8-aa89-e2951848adbb@ozlabs.org>
Date: Tue, 28 Aug 2018 01:00:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
X-List-Received-Date: Mon, 27 Aug 2018 17:00:25 -0000

Hi Ed,

> Instead, other BMCs implement it as a circular buffer inside the BMC 
> itself, which allows SOL to log data all the time, not just while the 
> user is logged in.

The obmc-console infrastructure does exactly that; the circular buffer 
is available under /var/log/obmc-console.log (by default), and the 
maximum size is configurable.

We may want to augment that with some other bits, like:

  - making this file available over the web UI (including
    transparently pre-populating the scrollback buffer of the
    console interface);

    and/or

  - archiving the log on certain events (like specific host state
    changes; checkstop on OpenPOWER implementeations)

If there's anything that I can change in obmc-console to make things 
work with your plans, let me know.

Cheers,


Jeremy
