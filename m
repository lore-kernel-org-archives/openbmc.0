Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44bP1g1Kz4zDqVS
 for <openbmc@lists.ozlabs.org>; Sat,  6 Apr 2019 02:31:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Apr 2019 08:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,313,1549958400"; d="scan'208";a="131769668"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 05 Apr 2019 08:31:45 -0700
Subject: Re: gpis definition in entity manager
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <24E07121-9DA2-4A65-878C-1D7C906A04C6@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <cbf4da18-9d4c-1fca-42ec-85386df0f0ed@linux.intel.com>
Date: Fri, 5 Apr 2019 08:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <24E07121-9DA2-4A65-878C-1D7C906A04C6@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Fri, 05 Apr 2019 15:31:52 -0000

On 4/4/19 4:17 PM, Vijay Khemka wrote:
> Hi James,
> 
> There are gpio definition in json files under configuration. How are we 
> using it. Are these gpios being initialized based on configurations here 
> and where are these being used.

There's two answers. 1. The entity-manager can export gipos:
https://github.com/openbmc/entity-manager/blob/master/include/devices.hpp#L43

2. There is a gpio daemon that can configure gpios: 
https://github.com/Intel-BMC/provingground/tree/master/gpiodaemon but 
it's not completely ready yet.

Current usages include dbus-sensors 
https://github.com/openbmc/dbus-sensors/blob/master/src/TachSensor.cpp#L201 
https://github.com/openbmc/dbus-sensors/blob/master/src/ChassisIntrusionSensor.cpp#L175 

and power control I believe. Theres also some ongoing work for fault 
leds https://gerrit.openbmc-project.xyz/c/openbmc/intel-ipmi-oem/+/19709

-James

> 
> Regards
> 
> -Vijay
> 
