Return-Path: <openbmc+bounces-1671-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201B1109318F
	for <openbmc@archiver.kernel.org>; Fri, 20 Mar 2026 08:40:58 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcbcg5Cngz2yZ8;
	Fri, 20 Mar 2026 19:40:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773996051;
	cv=none; b=hl+d/mv5Q5jMF15vEhH49rd05gqUgG/DqieVDBD9zr8tv8/s8cs3Kyul8LLYtGnI1w3r2mP0XjQAvGfNW7WhuzY5tC0y/Q8/fNhA8L0KdalKMyb9CaBCjIhan+tv/9oBesIfjOSJGpWq4HDvKuNnlJ4+5KqSEKYxd4/Ns3mVD5JxBBqAFMCOC34SzeX4FguamnLX4w816HfHBkN5PO5VqDtt/A8UytsnQUVrRHD/TjwDPG+lFVgFQ3aGTAjp90qjI6yKuBFbZMitbMfzq2ByiTUazP7Rz3eFOCVgdh2L7AmaKdpmJyLeMdhzK8Q/HY3B0I3F0/qzkqaZtarvhWHVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773996051; c=relaxed/relaxed;
	bh=1ydh8PxVpe+klVza2cSSTt4oc+3JbY4tIItQxIxh/U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noPqgoSriSz2sMKf+xnj/twF4OMhCHFh3y8RBc3ZYifmv0Mk9MgVUdLFrlSXbNq8nvTrhR9dv3/2yGVtwnGfvxUh/pqr10VIX3mGfRNpkL5xsxvHxgQZxfTqRkdEUCuhWO+6WenrHR69f6oYwNmMkCHd5USMWPy2k0ZNpB+pSW4zWgNYVmfMtWQHpjD/aJ3YDS8HbXNgEqYtEgt+DJwoO9RhJwI7rIi2WauKcQk4iVYUmhMyTFvmZQYY/PxnocvV1pGQwgSvqmrQ832iW0gHSVUSu7xcIEHh1L/ybpHfXFdRlUTt1PORrfC7vN4CidBbmAn6xm4jue/8KmysRbEkfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SK49MhWo; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SK49MhWo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcbcc6rVjz2yY9
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 19:40:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773996049; x=1805532049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pRoVm1uSlvFJ1DUaEsZAHIMkqpeZSr5DbQgK9V4VP1I=;
  b=SK49MhWo1nKpc3KY4pDX/U1Ia0GDvGvZAJ0ZNoGcUSwP1N+5IPLa/Dg0
   XzEFRocYgFg21+6xBlGvxGbhZYG/O2ykPFA4Z0VFu/u86il4HT9Ay4l6F
   Dx0sypG5sLZMRLwFPc3SnG0s3bJW6Jui/HXlF7Dgiqf8xpK2fHFc1rSpT
   GN9NkykRbVkQDhyguqK1BfkznSWPDawQhHnPXMAHI8+QJ1rm64tcVTSaK
   7UciixtUkrILzuo8X+9TrXkdeF5soPB/N9bacQiOia4HJsYEFEZi+2PyK
   /DKbMzdhGwurv/4fhA0jWoi7r+9N/bVf6eF7F786kH2dFeK7ItdbHlRfX
   w==;
X-CSE-ConnectionGUID: YPpXLxdNTlybSVX9vcZ1CQ==
X-CSE-MsgGUID: wGpeBEBxTgW7v532/dIW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75043706"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75043706"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 01:40:45 -0700
X-CSE-ConnectionGUID: UMl4ekA+SP2qinyxdLsYdQ==
X-CSE-MsgGUID: oy8/u9TvR3Kup4Vvs0GRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223210435"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 01:40:41 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3VOw-0000000029V-0Dxy;
	Fri, 20 Mar 2026 08:40:19 +0000
Date: Fri, 20 Mar 2026 16:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, broonie@kernel.org,
	Frank.Li@nxp.com, amelie.delaunay@foss.st.com
Cc: oe-kbuild-all@lists.linux.dev, Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH v5 11/17] spi: st: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <202603201638.tsz5xX5N-lkp@intel.com>
References: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>
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
In-Reply-To: <383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01@kylinos.cn>

Hi Pei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on next-20260319]
[cannot apply to atorgue-stm32/stm32-next rockchip/for-next xilinx-xlnx/master clk/clk-next shawnguo/for-next soc/for-next linus/master v7.0-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pei-Xiao/spi-axiado-Simplify-clock-management-with-devm_clk_get_enabled/20260320-025630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/383814750ad46181fd4199b3c6cec4767d480075.1773885292.git.xiaopei01%40kylinos.cn
patch subject: [PATCH v5 11/17] spi: st: Simplify clock handling with devm_clk_get_enabled()
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260320/202603201638.tsz5xX5N-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201638.tsz5xX5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201638.tsz5xX5N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-st-ssc4.c: In function 'spi_st_remove':
>> drivers/spi/spi-st-ssc4.c:365:32: warning: unused variable 'host' [-Wunused-variable]
     365 |         struct spi_controller *host = platform_get_drvdata(pdev);
         |                                ^~~~


vim +/host +365 drivers/spi/spi-st-ssc4.c

9e862375c5420a Lee Jones        2014-12-09  362  
2dd42da0b479ff Uwe Kleine-König 2023-03-03  363  static void spi_st_remove(struct platform_device *pdev)
9e862375c5420a Lee Jones        2014-12-09  364  {
e6b7e64cb11966 Yang Yingliang   2023-11-28 @365  	struct spi_controller *host = platform_get_drvdata(pdev);
9e862375c5420a Lee Jones        2014-12-09  366  
cd050abeba2a95 Chuhong Yuan     2019-11-18  367  	pm_runtime_disable(&pdev->dev);
cd050abeba2a95 Chuhong Yuan     2019-11-18  368  
9e862375c5420a Lee Jones        2014-12-09  369  	pinctrl_pm_select_sleep_state(&pdev->dev);
9e862375c5420a Lee Jones        2014-12-09  370  }
9e862375c5420a Lee Jones        2014-12-09  371  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

