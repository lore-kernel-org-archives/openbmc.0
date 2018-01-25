Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zS1Qr6cxJzDqpQ
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2018 23:23:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2018 04:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,412,1511856000"; d="scan'208";a="24655962"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2018 04:23:11 -0800
Message-ID: <1516882990.7000.1250.camel@linux.intel.com>
Subject: Re: [PATCH arm/aspeed/ast2500 v1] eSPI: add Aspeed AST2500 eSPI
 driver to boot a host with PCH runs on eSPI
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, arnd@arndb.de, openbmc@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 25 Jan 2018 14:23:10 +0200
In-Reply-To: <b1584518-2938-7faa-cd83-d0245d1ba88f@linux.intel.com>
References: <1516103552-19601-1-git-send-email-haiyue.wang@linux.intel.com>
 <20180123084457.GE21463@kroah.com>
 <b1584518-2938-7faa-cd83-d0245d1ba88f@linux.intel.com>
Organization: Intel Finland Oy
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.3-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 27 Jan 2018 13:15:28 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jan 2018 12:23:17 -0000

On Thu, 2018-01-25 at 10:29 +0800, Wang, Haiyue wrote:
> 
> On 2018-01-23 16:44, Greg KH wrote:
> > On Tue, Jan 16, 2018 at 07:52:32PM +0800, Haiyue Wang wrote:

> > > +	depends on ARCH_ASPEED || COMPILE_TEST
> > > +	select REGMAP_MMIO
> > 
> > Select or depend?
> 
> Before, I used "depends on". I was told to to change "select". I'm
> not 
> sure which is more better by practice ?

git grep will answer to this question, but also documentation is good to
read.

REGMAP API is selected by users.

One case where it's not so looks like a bug.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
