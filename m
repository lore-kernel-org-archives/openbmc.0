Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44P5ts1zLrzDqJ7
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 08:35:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 14:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="126845808"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 19 Mar 2019 14:35:13 -0700
Subject: Re: [fru-device and intel-ipmi-oem] ipmitool fru print can not output
 psu information
To: Vijay Khemka <vijaykhemka@fb.com>, John Wang <wangzqbj@inspur.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAHkHK08Otxm88OQGjG+b0QEgv_mExyObqOj6aZGSwmzMfZO_mw@mail.gmail.com>
 <BEEDBD8E-30FE-46C9-9847-C4E06A67DA49@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9a21ef4b-07af-d761-a214-03739373c762@linux.intel.com>
Date: Tue, 19 Mar 2019 14:35:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <BEEDBD8E-30FE-46C9-9847-C4E06A67DA49@fb.com>
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
X-List-Received-Date: Tue, 19 Mar 2019 21:35:18 -0000


> You need a separate configuration for your board.

This should not be needed.

> 
> Regards
> -Vijay
> 
> ﻿On 3/19/19, 4:10 AM, "openbmc on behalf of John Wang" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of wangzqbj@inspur.com> wrote:
> 
>      By checking the code, I found that fru-device seems to need to be used
>      with intel-ipmi-oem,
>      and it seems that no additional configuration is required(correct??).

Should be true.

>      
>      On my machine,there are two FRU,one is /etc/fru/baseboard.fru.bin,the
>      other is psu fru.
>      (There is only one psu).
>      
>      But,ipmitool fru print can only output the fru of baseboard.
>      $ ipmitool -I lanplus -H 100.2.76.213 -U root -P 0penBmc fru print
>      FRU Device Description : Builtin FRU Device (ID 0)
>      
>      fru-device found psu itself and had the correct output on dbus:
>      busctl tree xyz.openbmc_project.FruDevice
>      └─/xyz
>        └─/xyz/openbmc_project
>          └─/xyz/openbmc_project/FruDevice
>            ├─/xyz/openbmc_project/FruDevice/DPS_800AB_16_A
>            └─/xyz/openbmc_project/FruDevice/ON5263 >      busctl introspect xyz.openbmc_project.FruDevice
>      /xyz/openbmc_project/FruDevice/DPS_800AB_16_A:      -
>      .ADDRESS                            property  u         80
>        emits-change
>      .BUS                                property  u         5
>        emits-change
>      .Common_Format_Version              property  s         "1"
>        emits-change
>      .PRODUCT_LANGUAGE_CODE              property  s         "25"
>        emits-change
>      .PRODUCT_MANUFACTURER               property  s         "DELTA"
>        emits-change
>      .PRODUCT_PART_NUMBER                property  s         "          "
>        emits-change
>      .PRODUCT_PRODUCT_NAME               property  s         "DPS-800AB-16
>      A" emits-change
>      .PRODUCT_SERIAL_NUMBER              property  s
>      "HERD1629002309" emits-change
>      .PRODUCT_VERSION                    property  s         "S2F"
>        emits-change

This should be all that is needed. The baseboard itself works without 
any sdr data due to ipmitool implementation treading ID 0 special. It is 
probably failing somewhere with the sdr creation / reading. I would 
check that `ipmitool sdr elist fru` is returning an sdr for that fru.

https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L400 
is where the FruSDR are created. This also requires SDR commands here: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/sensorcommands.cpp#L886

- James
