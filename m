Return-Path: <openbmc+bounces-1608-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0451077604
	for <openbmc@archiver.kernel.org>; Wed, 18 Mar 2026 19:02:49 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fbdW61P5nz2yl2;
	Thu, 19 Mar 2026 06:02:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773860561;
	cv=none; b=KOS/2BgeYejzO8uHvpkFpXalspiggLmI9KQKeBh2WaTTmhr+mZUT+ZC6mZvP+0vAtrOpgDJ9bfqjcCbYDl9ZaZe2WEtq5N39j3XlgvdKrGzVywiDINWn1CpJ1HFTmE9avQSEpAJ2pw7KIGeS8UoIZTkKKHVwyFJBSZeeofvEucjnvNsD2gFQaMwepmp9+R77p1Hzhy2cG59CyHcKg9IpUz9RvuDAgu4Qd10IESAXY/EM/eDfCo8UMLUCe/uny0PPIN4b+zzCA7M1duCopL2JN2SNxTf2B3i/0w3cIoZlIwv5Tummvv3jfm5n9ZOdimTV7p+3wYEHKxGawVbP/XJ+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773860561; c=relaxed/relaxed;
	bh=1G+0hc/VQL0gHqw5qxzFpOxuCLuK6qRVVjosnlUP3J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUuvD5aMS9+M3KnPr/B8asgRaYCcUJsIcdNEPTbPASK5EeseUGEtJpDHsMz5/6bqvrRSrsVevbvp/KYXMfTeqluIRRRvE1Q38lv2eYswfBwtd0B8Upglc8VGJcC5ipcM78DmVk9Ba3oGEWqnED++nvtpXZXaWcrMBSTx+L/4d3amlc3SdFtXzAZ/9hH0Kop+7oiPpfmCkhgJLpWgVqJLQ5yKiu0UrtZfhPUovYetsrIIvprne+uVxa2GiDCYIUpjYD7ZK26+Ohq0bjdRb8jbXLoFIRtuqBR19LRlAhXB19VB+C7NU6uC1UOa+ndfLMYtXlxpHxKingcyOMg4R57fUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bf7Aawhc; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bf7Aawhc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fbdW31JJyz2yjV
	for <openbmc@lists.ozlabs.org>; Thu, 19 Mar 2026 06:02:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773860559; x=1805396559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XIwaunvaQN5MSz2DPfNECpeDO+PYa3DzRiYLu9KKQpA=;
  b=bf7Aawhc0hL60+kRq2BAV8eJMKg5yvUe50xuYJNc5dEZniOq4EsX05Nf
   WfdmOc70324lPLR5PmFkQuyxscndgu9I7sbiI9s50NRcKWGvVfvaVkYNI
   5FX3AqAc3jBVJv05itgToH1YbwrAdlKvYvBBQnhLztIUApWR8lq8uUVAc
   NjbwcsjIT7AEf0IQ+fQri64UH/BRQK4HZDi8BFU0McCRbALuGJoIQzFmB
   pOGQ63dDpXYiLFuw3QRfz3z2QxlYQZ2hCAMpq1sVnZfdtBaXfFEseh/ok
   twV8B6uEI36eRsqOEhwlFX7yJKJaW4CXauF7P94XpWzik80u3RXgeYwSe
   A==;
X-CSE-ConnectionGUID: E1/qdTqGQZW/KHy4OWT6uQ==
X-CSE-MsgGUID: pdulcRVPQmyuNkQtTBciMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74839289"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74839289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 12:02:34 -0700
X-CSE-ConnectionGUID: r+qX+cIKSd+zOG1mKDXMNQ==
X-CSE-MsgGUID: rqrMMi0WQPux3KNMprNQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247147805"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 12:02:31 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2wA0-000000003Hh-2Dvy;
	Wed, 18 Mar 2026 19:02:28 +0000
Date: Thu, 19 Mar 2026 03:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3 11/17] spi: st: Use helper function
 devm_clk_get_enabled()
Message-ID: <202603190255.yJJehgKm-lkp@intel.com>
References: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>
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
In-Reply-To: <96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01@kylinos.cn>

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260318]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Use-helper-function-devm_clk_get_enabled/20260318-110300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/96c8fbf6840c71f29ebcf37d7ffc68f297601c8a.1773733017.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v3 11/17] spi: st: Use helper function devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260319/202603190255.yJJehgKm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190255.yJJehgKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190255.yJJehgKm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:366:24: warning: unused variable 'spi_st' [-Wunused-variable]
     366 |         struct spi_st *spi_st = spi_controller_get_devdata(host);
         |                        ^~~~~~


vim +/spi_st +366 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  
2dd42da0b479ff Uwe Kleine-König 2023-03-03  363  static void spi_st_remove(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28  365  	struct spi_controller *host = platform_get_drvdata(pdev);
e6b7e64cb11966 Yang Yingliang   2023-11-28 @366  	struct spi_st *spi_st = spi_controller_get_devdata(host);
9e862375c5420a Lee Jones        2014-12-09  367  
cd050abeba2a95 Chuhong Yuan     2019-11-18  368  	pm_runtime_disable(&pdev->dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  369  
9e862375c5420a Lee Jones        2014-12-09  370  	pinctrl_pm_select_sleep_state(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  371  }
9e862375c5420a Lee Jones        2014-12-09  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

