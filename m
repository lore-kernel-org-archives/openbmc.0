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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QpBj4zklzDqSy
 for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2019 02:54:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Mar 2019 08:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="127749123"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2019 08:54:47 -0700
Subject: Re: Some problems about FruDevice in the entity-manager
To: Henbin Chang <henbinchang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
Cc: Vijay Khemka <vijaykhemka@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <bee0622c-8ae6-3db3-b7f7-9d48651cf907@linux.intel.com>
Date: Fri, 22 Mar 2019 08:54:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAG9c7cDQc=o_=vEFRAjRRq9bV2Fz6ZD7Osp+vkd2QRgxmGcXGg@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Mar 2019 15:54:54 -0000

On 3/21/19 10:41 PM, Henbin Chang wrote:
> Hi James,
> 
> There is EEPROM (AT24C64) with the valid FRU data on my board.
> 
> But the FruDevice would fail to format it.
> 
> I added some debug information to determine what's wrong with it.
> 
> Then I found the flag variable returned by isDevice16Bit() was equal 0.
> That's, the FruDevice could think it's 8-bit EEPROM.
> /* Check for Device type if it is 8 bit or 16 bit */
> int flag = isDevice16Bit(file);
> 
> There is the below comment in the isDevice16Bit().

Vijay, can you comment on this?

I believe the logic here was that the 16bit eeproms Vijay was using 
auto-increment the address, so reading twice over the header should give 
different answers, as the checksum is in the header. That being said I 
don't have any 16bit eeproms in my system so I haven't tried this 
branch. Vijay authored this so he might have a better idea of what is 
going on.

Thanks,

James


> 
> /* Read 7 more bytes, it will read same first byte in case of
>   * 8 bit but it will read next byte in case of 16 bit
> */
> But the rule isn't applicable to my EEPROM (AT24C64) .
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile# i2ctransfer -f -y 6 w1@0x50 0 r1
> 0x00
> root@henbin:/var/volatile#
> 
> Could you give some suggestion?
> 
> Thanks.
