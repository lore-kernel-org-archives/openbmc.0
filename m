Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hv7675VtzF12N
 for <openbmc@lists.ozlabs.org>; Sat,  4 Aug 2018 03:24:50 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Aug 2018 10:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,439,1526367600"; d="scan'208";a="60267815"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2018 10:24:47 -0700
Subject: Re: What is the proper way to read RTC battery voltage
To: openbmc@lists.ozlabs.org
References: <CAARXrtm64qpSkDD31+m9HGa-Bw4k0jkRizHiS9fc73JZHMfmXQ@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <fe3a6c3b-28cf-0af7-5c9d-5ac4dcaa3363@intel.com>
Date: Fri, 3 Aug 2018 10:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtm64qpSkDD31+m9HGa-Bw4k0jkRizHiS9fc73JZHMfmXQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 03 Aug 2018 17:24:52 -0000

On 08/02/2018 11:14 PM, Lei YU wrote:
> 
> 2. We could leave the GPIO for user space to control, e.g. let phosphor-hwmon
>     to control the GPIO while reading a sensor, it resolves the problem.
>     This is done by Google and the patch for phosphor-hwmon is at
>     (https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-hwmon/+/11697/)

In previous codebases, this is the option we've gone with.  In practice, 
there is some lag time so some sleeps are needed to wait for the FET to 
charge the line before initiating the reading on the ADC.  In the past 
we've simply done this with blocking sleeps, but there are likely better 
options.

> 3. We could use gpio-mux and io-channel-mux driver, that let kernel to
>     automatically pull the GPIO while reading the sensor. (See
>     https://github.com/mine260309/linux/commit/8e60647389e5400a85c705685ca2f6b875856c99
>     for example).
>     However, it requires some delay between GPIO pulled high and reading the ADC
>     channel, if the delay is too small, the ADC channel reading becomes
>     incorrect, e.g. it gets 0 or a lower value than expected.
> 

This sounds like a cleaner solution, but more difficult to execute in 
practice.  I think either 2 or 3 would solve it.  Is there an easy way 
to delay in the driver without blocking?  It doesn't need to be terribly 
deterministic to work correctly.


Another thing to note is that even with this, your battery life is 
affected by how often you poll the voltage, so in general we reduce the 
scan rate of the battery voltage readings compared to other sensors to 
keep the battery life more sustainable over the long term.
