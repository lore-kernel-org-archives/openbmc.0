Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Ktdb38KqzDq7d
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 02:57:38 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Mar 2019 08:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,478,1544515200"; d="scan'208";a="125469625"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Mar 2019 08:57:34 -0700
Subject: Re: How to use fru-device
To: openbmc@lists.ozlabs.org
References: <CAHkHK09KjAKpOGYySXTSB6KsrNOCCYcRVvJYFdt2O8_KPJFMDg@mail.gmail.com>
Cc: Amithash Prasad <amithash@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <1b52f199-a97f-0a78-3fe7-f57606902b5b@linux.intel.com>
Date: Thu, 14 Mar 2019 08:57:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAHkHK09KjAKpOGYySXTSB6KsrNOCCYcRVvJYFdt2O8_KPJFMDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 14 Mar 2019 15:57:40 -0000

On 3/14/19 3:41 AM, John Wang wrote:
> Hi all
> 
> I have now encountered a problem with fru-device (entity-manager).
> 
> 1 Make the fru.bin file /etc/fru/baseboard.fru.bin for
> testing,Everything looks great
> 2 dd if/etc/fru/baseboard.fru.bin of=/sys/class/i2c-dev/xxxxx/eeprom,
> busctrl tree xyz.openbmc_project.FruDevice will appear
> /xyz/openbmc_project/FruDevice/____________product_manufacturer_______________________________
> Similar path. View the properties through busctl introspect and find
> that the property values are also garbled.
> 3 Delete the eeprom node in the dts file and still have this problem.
> 
> Note:  eeprom at24c512 16bit

FruDevice has primarly been used with 8bit eeproms up to this point, 
Amithash is adding 16 bit support but I'm not sure how well it works yet.

https://gerrit.openbmc-project.xyz/#/c/openbmc/entity-manager/+/18783/


If you compile with DEBUG = true 
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L42 
you might get some better debug.

Thanks,

James

> 
> Does anyone help me to point out where I should pay attention when
> debugging, how should I solve this problem?
> 
> Best Regards
> 
> John
> 
