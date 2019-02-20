Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 444RSN4952zDqKJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 05:48:03 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 10:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,392,1544515200"; d="scan'208";a="123946339"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2019 10:47:53 -0800
Subject: Re: sensor->inventory associations in phosphor-hwmon
To: Patrick Venture <venture@google.com>, Matt Spinler <mspinler@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <23eeb05bb818341a140e51ff183109ba@linux.vnet.ibm.com>
 <CAO=notyk=xCUzcqJcMfvpAJx=dNgAw=_pudiTHX74iw1_eAr4w@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <ff9414df-0052-9112-5d34-0f3b8661434f@linux.intel.com>
Date: Wed, 20 Feb 2019 10:47:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAO=notyk=xCUzcqJcMfvpAJx=dNgAw=_pudiTHX74iw1_eAr4w@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Feb 2019 18:48:05 -0000

On 2/20/19 10:32 AM, Patrick Venture wrote:
> On Wed, Feb 20, 2019 at 10:31 AM Matt Spinler <mspinler@linux.ibm.com> wrote:
>>
>> Hi,
>>
>> We have a need to know which sensor objects hosted by the various
>> phosphor-hwmon
>> daemons belong to which inventory objects.  For example, we need to know
>> that
>> the /xyz/openbmc_project/sensors/power/ps1_input_power sensor belongs to
>> the
>> /xyz/openbmc_project/inventory/system/powersupply1 item.
>>
>> To accomplish this, I am proposing we add a new environment variable to
>> the
>> system specific phosphor-hwmon config files that the phosphor-hwmon code
>> can then use to create associations interfaces that will cause the
>> mapper to
>> create the appropriate association D-Bus paths.
>>
>> As an example, we could add to the power-supply1 conf file an
>> ASSOCIATIONS
>> variable for each sensor (assuming ps1_input_power is represented by
>> IN1):
>>
>>       ASSOCIATIONS_IN1=/xyz/openbmc_project/inventory/system/powersupply1
>>
>> The code would then see that and create a new org.openbmc.Associations
>> interface
>> on the /xyz/openbmc_project/sensors/power/ps1_input_power path with an
>> associations property of:
>>
>>       ["inventory",
>>        "sensors",
>>        "/xyz/openbmc_project/inventory/system/powersupply1"]
>>
>> This leads to the mapper creating:
>>
>>       /xyz/openbmc_project/sensors/power/ps1_input_power/inventory
>>
>> With an xyz.openbmc_project.Association interface with an
>> endpoints property of:
>>
>>       ["/xyz/openbmc_project/inventory/system/powersupply1"]
>>
>> And also the other association path:
>>
>>       /xyz/openbmc_project/inventory/system/powersupply1/sensors
>>
>> With an xyz.openbmc_project.Association interface with an
>> endpoints property of:
>>
>>       ["/xyz/openbmc_project/sensors/power/ps1_input_power"]
>>
>> This now allows one to both find all sensors associated with a power
>> supply, and
>> find which inventory item is associated with a particular sensor.  Note
>> that
>> the endpoints property is an array, and can get entries from multiple
>> places.
>>
>> I suppose we could also put the forward/reverse association names, in
>> this case
>> "inventory" and "sensors", into the hwmon config file, and also allow
>> creating
>> multiple associations for each sensor if there is a usecase, though I
>> would like
>> to keep it as simple as possible:
>>
>> ASSOCIATIONS1_IN1=inventory,sensors,/xyz/openbmc_project/inventory/system/powersupply1
>> ASSOCIATIONS2_IN1=chassis,contained_sensors,/xyz/openbmc_project/inventory/system/chassis
>>
>> What does everyone think?
> 
> I think it's useful and straightforward to use, and easy to test.

Have we considered the alternative of the inventory item creating the 
association? I only ask because in the past we've tried to keep 
redfish/ipmi specific things outside of the sensors. I think this 
proposal works fine btw, just seems like the alternative would work as 
well and would keep sensors as just 'sensors'.

-James

> 
>>
>> Thanks
>> Matt
>>
