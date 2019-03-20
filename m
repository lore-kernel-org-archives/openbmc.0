Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PZmy5sGMzDqMC
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 03:16:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2019 09:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,249,1549958400"; d="scan'208";a="135713284"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga003.jf.intel.com with ESMTP; 20 Mar 2019 09:16:46 -0700
Subject: Re: [PATCH linux dev-4.19 00/12] PECI device driver introduction
To: Henbin Chang <henbinchang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG9c7cBOEd3rD5zmgXVMx6m7sUHtt2ts4_H=8B8KxZ7iGMcvUA@mail.gmail.com>
 <CAG9c7cAkdE=EcKAMn+E0gfKbQ1eeNeZopLjgG_YEs0W7M_6Tcg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f7615ad5-e80b-f198-7fcc-3fdc33da57e1@linux.intel.com>
Date: Wed, 20 Mar 2019 09:16:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAG9c7cAkdE=EcKAMn+E0gfKbQ1eeNeZopLjgG_YEs0W7M_6Tcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 20 Mar 2019 16:16:51 -0000

Hi Henbin,

No, PECI hwmon can't be created by the udev->start_hwmon.sh.
To create PECI hwmon, you might need to use these two packages:
https://github.com/openbmc/entity-manager
https://github.com/openbmc/dbus-sensors

PECI hwmon needs runtime creation because it needs to collect CPU
package information such as core numbers and installed DIMMs.

If you want to create PECI hwmon manually, you can try:
echo 'peci-client 0x30' > /sys/bus/peci/devices/peci-0/new_device
echo 'peci-client 0x30' > /sys/bus/peci/devices/peci-0/delete_device

Make sure that the host should be powered on when you create it.

Cheers,
Jae

On 3/19/2019 10:50 PM, Henbin Chang wrote:
> Hi Jae,
> 
> Can you give some suggestion for my question?
> Thanks.
> 
> BRs
> 
> Henbin Chang <henbinchang@gmail.com <mailto:henbinchang@gmail.com>> 於 
> 2019年3月19日 週二 下午4:22寫道：
> 
>     Hi,
> 
>     We would like to create CPU temperature sensor.
>     We could see the hwmon file in the /sys/class/hwmon/
>     But we found the content of uevent file was empty.
>     That meant the sensor wasn't created through udev->start_hwmon.sh
>     Can you give some suggestion?
> 
>     root@tiogapass:/sys/class/hwmon/hwmon4# cat name
>     peci_cputemp.cpu0
>     root@tiogapass:/sys/class/hwmon/hwmon4# cat uevent
>     root@tiogapass:/sys/class/hwmon/hwmon4#
>     root@tiogapass:/sys/class/hwmon/hwmon4#
> 
