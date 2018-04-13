Return-Path: <james.feist@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40N28W4TshzDqRV
 for <openbmc@lists.ozlabs.org>; Sat, 14 Apr 2018 01:42:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Apr 2018 08:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,446,1517904000"; d="scan'208";a="47661624"
Received: from skyhawk.jf.intel.com (HELO [10.7.150.62]) ([10.7.150.62])
 by orsmga001.jf.intel.com with ESMTP; 13 Apr 2018 08:41:06 -0700
Subject: Re: Sensor readings as 1-byte
To: guhan balasubramanian <guhan.sac@gmail.com>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
References: <CAMNAJg36J-8BjiKpHRaDJYTw0pJEnwTG=2+PKgzgNDAb_w6K9g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <22ff8f1f-1973-2bb1-dbfe-2c441b00568c@linux.intel.com>
Date: Fri, 13 Apr 2018 08:41:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMNAJg36J-8BjiKpHRaDJYTw0pJEnwTG=2+PKgzgNDAb_w6K9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2018 15:42:20 -0000

There is an RFC I posted that calculates the M, B, and exponents from
the D-Bus sensor endpoints: https://gerrit.openbmc-project.xyz/#/c/8521/

We were hoping to roll this into host-ipmi sometime in future.

Thanks,

James Feist

On 04/12/2018 07:41 PM, guhan balasubramanian wrote:
> Hi Tom,
> 
> Thanks for the explanation. But I still see some concerns in this 
> conversion logic.
> 
> For input, we have 4 given parameters as
>      1. Min and Max values of the sensor (y)
>      2. the Min and Max values of the byte value (x - assuming this is 
> always 0 to 255).
> 
> For output, we have 4 paramters to calculate
>      1. multiplierM (M)
>      2. offsetB (B)
>      3. bExp (k1)
>      4. rExp (k2)
> 
> We have two equations to compute 4 variables in this logic.
> 
> 
> On Sat, Mar 10, 2018 at 9:45 AM, Tom Joseph <tomjose@linux.vnet.ibm.com 
> <mailto:tomjose@linux.vnet.ibm.com>> wrote:
> 
>     Hello Guhan,
> 
>     The updated sensor-example.yaml has the Rexp field as well. These
>     values are  calculated based on the minimum and maximum value of the
>     sensor.
> 
>     If a temperature sensor has a range of -127 - +128, means y is -127
>     to +128 and the range of x is 0-255.
>     By substituting x = 0 and y = -127 (k2 is the decimal precision and
>     assume in this case as whole nos) implies Bexp = -127.
>     Similarly substitute x = 255 and y = 128 and M is evaluated as 1.
> 
> 
> In the above example, with 2 values [(0, -127) and (255, 128)] for (x,y) 
> we were able to calculate M and B. We are assuming k2 as 0 since we are 
> taking only whole numbers for our ranges (y values). But we are still 
> assuming the values for k1 as 0.
> 
> 
>     Regards,
>     Tom
> 
> 
>     On Saturday 10 March 2018 08:01 AM, guhan balasubramanian wrote:
>>     Hi,
>>
>>     According to the IPMI spec, we represent all sensor readings
>>     (Volt, Temp, Amp, etc.) as 1-byte.
>>
>>     Since we represent them as 1-byte, we use a linearization formula
>>     to convert to actual value as follows:
>>
>>     y = (M*x + B*10^(k1))*10^(k2)
>>
>>     where x is the 1-byte value that is filled in the get sensor
>>     reading command.
>>
>>     We see in the ipmitool example on how an example of 3.36 V is
>>     represented as 1-byte.
>>     https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor
>>     <https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor>
>>
>>     Can any one please help on how the values for M, B, k1 and k2 are
>>     populated for each sensor?
>>
>>     In the openbmc repo, I believe these values are present in the
>>     config.yaml of phosphor-ipmi-sensor-inventory (based on the
>>     following sample).
>>
>>     0xF1:
>>       sensorType: 0x01
>>       path: /xyz/openbmc_project/sensors/temperature/temp1
>>       sensorReadingType: 0x01
>>     *multiplierM*: 511
>>     *offsetB*: 0
>>     *bExp*: 0
>>       mutability: Mutability::Write|Mutability::Read
>>       serviceInterface: org.freedesktop.DBus.Properties
>>       readingType: readingData
>>       interfaces:
>>         xyz.openbmc_project.Sensor.Value:
>>           Value:
>>             Offsets:
>>               0x0:
>>                 type: int64_t
>>
>>
>>     Thanks,
>>     Guhan
>>
> With the given information, do you think there is a generic way 
> (algorithm) where we can compute all the 4 variables M, B, k1 and k2?
> 
> Thanks,
> Guhan
> 
