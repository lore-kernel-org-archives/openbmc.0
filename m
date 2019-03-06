Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F55R5RTjzDqBW
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 07:31:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2019 12:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,448,1544515200"; d="scan'208";a="139720994"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga002.jf.intel.com with ESMTP; 06 Mar 2019 12:31:30 -0800
Subject: Re: PID control configuration usage
To: openbmc@lists.ozlabs.org
References: <39398601-6181-ac24-991c-528e0b0f70f2@linux.ibm.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <c304d042-3b25-6e80-7722-6fe3b3946182@intel.com>
Date: Wed, 6 Mar 2019 12:31:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <39398601-6181-ac24-991c-528e0b0f70f2@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 06 Mar 2019 20:31:40 -0000

On 3/6/19 11:36 AM, Matthew Barth wrote:
> I'm investigating the functionality and use of pid-control to what is
> currently being used on IBM's witherspoon system.
Sweeeeeet.

> Is there a PID control
> configuration being used that's upstream? I am unable to find any
> systems in the meta layers using pid-control that provides a direct
> configuration example. It looks to be used in the Intel layer that pulls
> a config together from entity-manager and presents it on dbus to
> pid-control, but I dont follow how the entity-manager json transforms to
> the consumable pid-control json.
It doesn't.  When using the entity manager configs, the DBUS data
structures are read directly by pid-control, and converted into the C
data structures that the JSON would've been encoded to at build time.
no json is created or destroyed.

> Could someone point me to a functional
> (possibly in-use) example or show the json config produced from
> entity-manager?
I thought the Quanta system used it, but I'm not seeing the JSON.
Patrick checked in a basic example here:
https://github.com/openbmc/phosphor-pid-control/blob/master/examples/fan-info.json
But I'm guessing you already found that.

I'm not sure if it helps, but here's a dump of the entity-manager dbus
interfaces, on a system with a dozen or so add in fru devices detected.
Each fru device has its own thermal controllers installed and exposed to
dbus.

https://pastebin.com/jaKw5TJa

-Ed
