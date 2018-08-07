Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lKWm0K44zDqBx
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 02:21:07 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2018 09:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,455,1526367600"; d="scan'208";a="61332802"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2018 09:21:04 -0700
Subject: Re: Temperature Sensor and its Reading not Showing Up.
To: openbmc@lists.ozlabs.org
References: <CAE33tLFWffT5wd9La+zU-ATkbrqa4-aRH=C+t_OBnWgsSgwNdg@mail.gmail.com>
 <CAJoAoZ=VzAUp2Jg6nPy8UKBvqBw+s=xWwuMK4VG-p=t7QTwdkA@mail.gmail.com>
 <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <b3ceb4c3-00d1-f3b1-1859-19d47fce2e5a@intel.com>
Date: Tue, 7 Aug 2018 09:22:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLGrrsCBjW3Hqpe1K8__WXLwmph5KWCTUVmoA2LUoBnSCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Tue, 07 Aug 2018 16:21:08 -0000

Akash

What platform are you using?  AST2500evb?  If it's not one of the 
standard ones, is it something we can look at?

There are a couple different ways to add sensors to dbus.  Which way you 
use depends on what platform you're on.

-Ed
