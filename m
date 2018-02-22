Return-Path: <fengguang.wu@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=fengguang.wu@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zn4zS4nwWzF0ph
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 18:02:11 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2018 23:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="206045988"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
 by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2018 23:02:05 -0800
Received: from kbuild by bee with local (Exim 4.84_2)
 (envelope-from <fengguang.wu@intel.com>)
 id 1eoktT-0009ZE-4C; Thu, 22 Feb 2018 15:02:15 +0800
Date: Thu, 22 Feb 2018 15:01:10 +0800
From: kbuild test robot <lkp@intel.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: kbuild-all@01.org, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, jdelvare@suse.com, linux@roeck-us.net,
 benh@kernel.crashing.org, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI
 bus driver core
Message-ID: <201802221429.9znwFmb7%fengguang.wu@intel.com>
References: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: fengguang.wu@intel.com
X-SA-Exim-Scanned: No (on bee); SAEximRunCond expanded to false
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Feb 2018 07:02:13 -0000

Hi Jae,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.16-rc2 next-20180221]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jae-Hyun-Yoo/PECI-device-driver-introduction/20180222-054545
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/peci/peci-core.c:773:29: sparse: symbol 'peci_match_id' was not declared. Should it be

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
