Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mMl55vPvzDqNZ
 for <openbmc@lists.ozlabs.org>; Sat, 26 Jan 2019 02:05:04 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jan 2019 07:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,521,1539673200"; d="scan'208";a="128870694"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.122.130.105])
 ([10.122.130.105])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2019 07:05:01 -0800
Subject: Re: phosphor-ipmi-ipmb
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
References: <D710B092-2CBE-4954-B301-3E8DF30214CF@fb.com>
Cc: dawid.frycki@intel.com
From: James Feist <james.feist@linux.intel.com>
Message-ID: <636ecdef-c1af-ddb4-5a7c-24a51b1c3eca@linux.intel.com>
Date: Fri, 25 Jan 2019 09:05:00 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <D710B092-2CBE-4954-B301-3E8DF30214CF@fb.com>
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
X-List-Received-Date: Fri, 25 Jan 2019 15:05:06 -0000

On 1/24/2019 2:45 PM, Vijay Khemka wrote:
> Team,
> 
> Phosphor-ipmi-ipmb is not building and it is failing with below messages.
> 
> | -- Looking for linux/i2c-dev-user.h
> 
> | -- Looking for linux/i2c-dev-user.h - not found
> 
> | Could not find linux/i2c-dev-user.h: Attempting to download locally 
> for building from 
> https://raw.githubusercontent.com/openbmc/linux/dev-4.13/include/uapi/linux/i2c-dev.h

This is the deprecated version from the old version of I2C tools. It 
needs to be replaced like how it was in FruDevice:

https://github.com/openbmc/entity-manager/commit/3b860986f66e9275a411d844ded32fe84f074472

I CC'd Dawid the creator of this application.

> 
> | CMake Error at CMakeLists.txt:27 (message):
> 
> | i2c-dev-user.h missing
> 

> 
