Return-Path: <fengguang.wu@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcwML0rVyzDrJg
 for <openbmc@lists.ozlabs.org>; Thu, 24 Aug 2017 04:05:28 +1000 (AEST)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP; 23 Aug 2017 11:05:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; 
 d="gz'50?scan'50,208,50";a="303650166"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
 by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2017 11:05:18 -0700
Received: from kbuild by bee with local (Exim 4.84_2)
 (envelope-from <fengguang.wu@intel.com>)
 id 1dka6I-000Jqy-Fj; Thu, 24 Aug 2017 02:09:58 +0800
Date: Wed, 23 Aug 2017 18:02:31 +0800
From: kbuild test robot <lkp@intel.com>
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: kbuild-all@01.org, gregkh@linuxfoundation.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 joel@jms.id.au, jiri@resnulli.us, tklauser@distanz.ch,
 linux-serial@vger.kernel.org, mec@shout.net, vadimp@maellanox.com,
 system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 Oleksandr Shamray <oleksandrs@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
Subject: Re: [patch v5 1/3] drivers: jtag: Add JTAG core driver
Message-ID: <201708231747.SIlkHSak%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <1503315069-29465-2-git-send-email-oleksandrs@mellanox.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 18:05:36 -0000


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oleksandr,

[auto build test WARNING on linus/master]
[also build test WARNING on v4.13-rc6 next-20170823]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Oleksandr-Shamray/JTAG-driver-introduction/20170824-004528
config: ia64-allnoconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 6.2.0
reproduce:
        wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=ia64 

All warnings (new ones prefixed by >>):

>> ./usr/include/linux/jtag.h:14: include of <linux/types.h> is preferred over <asm/types.h>
   ./usr/include/linux/jtag.h:76: found __[us]{8,16,32,64} type without #include <linux/types.h>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--jI8keyz6grp/JLjh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
QgJH45NmG67E842G0TtjRwoGeFYAAA==

--jI8keyz6grp/JLjh--
