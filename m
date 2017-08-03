Return-Path: <fengguang.wu@intel.com>
X-Greylist: delayed 624 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Aug 2017 00:46:43 AEST
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNXv71R6szDqjP
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 00:46:41 +1000 (AEST)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Aug 2017 07:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,316,1498546800"; d="scan'208";a="115207723"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
 by orsmga004.jf.intel.com with ESMTP; 03 Aug 2017 07:36:10 -0700
Received: from kbuild by bee with local (Exim 4.84_2)
 (envelope-from <fengguang.wu@intel.com>)
 id 1ddHIf-000Qap-PV; Thu, 03 Aug 2017 22:40:33 +0800
Date: Thu, 3 Aug 2017 22:35:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: kbuild-all@01.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 joel@jms.id.au, jiri@resnulli.us, tklauser@distanz.ch,
 linux-serial@vger.kernel.org, mec@shout.net, vadimp@maellanox.com,
 system-sw-low-level@mellanox.com,
 Oleksandr Shamray <oleksandrs@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v1 2/2] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Message-ID: <201708032250.cmVljGeY%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501679918-20486-3-git-send-email-oleksandrs@mellanox.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: fengguang.wu@intel.com
X-SA-Exim-Scanned: No (on bee); SAEximRunCond expanded to false
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Aug 2017 14:46:44 -0000

Hi Oleksandr,

[auto build test WARNING on linus/master]
[also build test WARNING on v4.13-rc3 next-20170803]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Oleksandr-Shamray/JTAG-driver-introduction/20170803-110721


coccinelle warnings: (new ones prefixed by >>)

>> drivers/jtag/jtag-aspeed.c:724:37-40: ERROR: Missing resource_size with res

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
