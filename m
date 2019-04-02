Return-Path: <jae.hyun.yoo@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44YfHN5zpczDqMM
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 06:22:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 12:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,301,1549958400"; d="scan'208";a="147460944"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.149])
 ([10.7.153.149])
 by orsmga002.jf.intel.com with ESMTP; 02 Apr 2019 12:22:36 -0700
Subject: Re: [cpusensor] pingTimer and creationTimer are conflict??
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: John Wang <wangzqbj@inspur.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAHkHK0_fLLvzQi-PNdH1nxjJZJ0XC9097nf0QZ8ViijYY6bhEg@mail.gmail.com>
 <14ecb13a-bc32-123e-5fd4-9b1a631068dc@linux.intel.com>
Message-ID: <18ca50ec-9f37-ba2f-b45c-5f45a85fc2d9@linux.intel.com>
Date: Tue, 2 Apr 2019 12:22:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <14ecb13a-bc32-123e-5fd4-9b1a631068dc@linux.intel.com>
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
X-List-Received-Date: Tue, 02 Apr 2019 19:22:41 -0000

On 4/2/2019 9:17 AM, Jae Hyun Yoo wrote:
> On 4/1/2019 11:14 PM, John Wang wrote:
>> Hi Jae,
>>
>> When two cpus are configured in the entity-manager and there is only 
>> one cpu on the motherboard, the cpusensor service cannot expose cpu 
>> sensor information to dbus.
>> Before [this 
>> change](https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/18963), 
>> cpu sensor information can be exposed to dbus.
>>
>> By checking the code,I found that pingTimer causes detectCpu to be 
>> executed every 1s, and the detectCpu function calls 
>> creationTimer.expires_from_now(3s/5s), which causes the callback of 
>> creationTimer to only enter the cancel 
>> state(boost::asio::error::operation_aborted).
>>
>> Only when all the cpu configured in the entity-mangaer are detected 
>> will stop pinging.
>>
>> Is this a bug ?
> 
> Hi John,
> 
> Ah, yeah, there is. That's a bug. In that case, detectCpu() will be
> repeatedly called every second and resets the 3s creationTimer so
> createSensors() will never be called.
> 
> Thanks for reporting the issue. I'll submit a patch soon.

I made a patch. Please try this patch:
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/20056

Thanks,

Jae
