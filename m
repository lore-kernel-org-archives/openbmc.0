Return-Path: <openbmc+bounces-1607-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B72F10775E4
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 17:05:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbZvm0LBQz2ymg;
	Thu, 19 Mar 2026 04:05:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773853523;
	cv=none; b=b83lqYn7p4XKhv7D5rhi/jek3Qfu1BkrITEtOE57fhKBi9sNYLi0jpyPQ0CtGMyBEf/ISrP/vUBVCiY2PlgSj0B8I7iw/G82iluHxUfBnOW1sHDPKNUzrWJ3mj25pAxJodYjMwKfVP+TowKjXji9PWL8EN9tV5drU3+eUeshrAUDus0BLdcWzznOcSfbutaSITitlMFJaWW7gkmbHMD1F+m3Bhzxr64jjTDJ29oipCUEJ1r8V63IfccU6h4b4HxKkHWCl4U+RzUUHiT+PCkZQDMxYHSPtjJnJ6U1ACX5RyEGimJ7eZUGAHrRrhUuZWwq8iIBebutsLzxanN6TJm0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773853523; c=relaxed/relaxed;
	bh=u8u7LSZca3RD8jyXgLn/1gKWfhjla4Ec5S6LSTWYmkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPfAkrPCB4bG3myW91jkYPqKzQKLKl89r3KkZK2EHHk4s+Fth7djntyTMCEgZlCnQGE/kjcwpCM4N1IyB7CWi9EGRGu0yASAtd0qTauyji6pYllX4EKg4xkvRSR4w7Xya2e5u7xC/Ek2Qk0pnTPVzpLVqYrl2BV6Pp7W+Nx8gQ8T8iB9bS9zEbafs2gUt0mqVXDiy1+lsz6QxFcSsv2wlYBM5sk9p/2xAVqPjG8kMsGAlo+vIF7aq1+FNEVb0m2hYfSU0XftOXGOLvXYoWGVcnbsZ5UnBKLQxm7SybIsHKyuKj95n0ycG8orymeWH612cx3AKNs2DdkbzN66gcnGnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQztar4o; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eQztar4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbZvk4Jdtz2yjV
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 04:05:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773853523; x=1805389523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FRwg2E9CLljwcNk6xTVAFoV/k9oE/5jF1+naOPnV9r4=;
  b=eQztar4oqO0r7HRoFlY4bz1EV3IXWlF6RGXJuReCKk08EYmg4sjIyQbM
   xKjVJsdmcqZ/tRLxQjysHFY/ahkEsfP5IWrehmDuTeJm85kI+tFRbQXsr
   hkQ8eiWI8phlx5uu8qsvYm14sjLMKbWmtoJHXFw3YMc2b+m5REIyRp2lu
   qvvFHcQhN7CMJtSSNq4ku6zFnDIrpw+wzPobHMvNj5ZrWS/CzwmoE7vbG
   tWavDTYA4V6Mphbqb9dlfKwxfZSGDHtbsIqjO8sDxXka/4MQNluF9xOy1
   zlFziyXITc2T7po4mv/dctA2TOj6KNyJKSVlp8Pot6b4djNKFK7hrX6QB
   g==;
X-CSE-ConnectionGUID: 2HPncYCQTMy3QdE5cnbHZA==
X-CSE-MsgGUID: qZcVy6nFT+qyRzJw+KNxnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74948735"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74948735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 10:05:20 -0700
X-CSE-ConnectionGUID: I4g4cbSVQxWMegfWb/0kZg==
X-CSE-MsgGUID: a8hhyyakQLmEVdfMWq0wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222740621"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2026 10:05:16 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2uKX-000000003Az-29FG;
	Wed, 18 Mar 2026 17:05:13 +0000
Date: Thu, 19 Mar 2026 01:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3 07/17] spi: orion: Use helper function
 devm_clk_get_enabled()
Message-ID: <202603190122.1OMLjae4-lkp@intel.com>
References: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01@kylinos.cn>

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260317]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/5727aa84748872059e2a39eb67f1f08c0de6206b.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 07/17] spi: orion: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190122.1OMLjae4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190122.1OMLjae4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190122.1OMLjae4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-orion.c: In function 'orion_spi_remove':
>> drivers/spi/spi-orion.c:798:27: warning: unused variable 'spi' [-Wunused-variable]
     798 |         struct orion_spi *spi = spi_controller_get_devdata(host);
         |                           ^~~


vim +/spi +798 drivers/spi/spi-orion.c

60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  793  
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  794  
2e0de1efb233ab drivers/spi/spi-orion.c Uwe Kleine-König 2023-03-03  795  static void orion_spi_remove(struct platform_device *pdev)
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  796  {
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  797  	struct spi_controller *host = platform_get_drvdata(pdev);
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18 @798  	struct orion_spi *spi = spi_controller_get_devdata(host);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  799  
5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  800  	pm_runtime_get_sync(&pdev->dev);
4574b886698dfa drivers/spi/spi-orion.c Andrew Lunn      2012-04-06  801  
08e6c5038fee47 drivers/spi/spi-orion.c Yang Yingliang   2023-08-18  802  	spi_unregister_controller(host);
5c6786945b4e04 drivers/spi/spi-orion.c Russell King     2014-06-21  803  	pm_runtime_disable(&pdev->dev);
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  804  }
60cadec9da7b6c drivers/spi/orion_spi.c Shadi Ammouri    2008-08-05  805  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

