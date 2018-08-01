Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gk1v4CDDzF1R6
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 05:31:14 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2018 12:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,433,1526367600"; d="scan'208";a="220971220"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga004.jf.intel.com with ESMTP; 01 Aug 2018 12:31:12 -0700
Date: Wed, 1 Aug 2018 12:31:12 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Lei YU <mine260309@gmail.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, wak@google.com,
 bradleyb@us.ibm.com
Subject: Re: [Maintainers] Call for maintenance
Message-ID: <20180801193112.GK105329@mauery>
References: <1F65CF12-B31E-409C-BD72-D1CF3D0CFBFC@fuzziesquirrel.com>
 <ab15c434-61ee-394a-fe89-d211018b8f3e@linux.vnet.ibm.com>
 <CAARXrt=PXyNzC21UmjDVrv3m90O+TBrKuOsEeU5HOyx=Brzb=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAARXrt=PXyNzC21UmjDVrv3m90O+TBrKuOsEeU5HOyx=Brzb=A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 01 Aug 2018 19:31:16 -0000

On 01-Aug-2018 10:13 AM, Lei YU wrote:
>On Tue, Jul 31, 2018 at 10:21 PM Tom Joseph <tomjose@linux.vnet.ibm.com> wrote:
>>
>> Hello,
>>
>> I am scrubbing the phosphor-host-ipmid to handle the SdBusError exception.
>>
>> Even though sdbusplus::exception::SdBusError is inherited from
>> std::exception,
>> my observation is that catch statement of std::exception does not catch
>> sdbusplus::exception::SdBusError exception.
>>
>> try
>> {
>>      // Statement throwing sdbusplus::exception::SdBusError exception.
>> }
>> catch (const std::exception& e) // Does not catch
>> sdbusplus::exception::SdBusError
>> {
>>
>> }
>>
>> I think the multiple inheritance from std::exception is causing this.
>>
>
>Yup, I meet the same issue.
>The root cause is multiple inheritance of std::exception:
>
>    struct exception : public std::exception;
>    struct internal_exception : public exception;
>    class SdBusError final : public internal_exception, public
>std::system_error;
>
>SdBusError inherits both internal_exception and std::system_error,
>which both inherit std::exception.
>We can not use virtual inheritance here because std::system_error
>already non-virtually inherits std::exception.
>
>So probably we should not use diamond inheritance here...

I just submitted a patch for review. This allows SdBusError to be caught 
via std::exception:

https://gerrit.openbmc-project.xyz/#/c/openbmc/sdbusplus/+/11726/

There are still packages that may not even be handling std::exceptions 
around sdbusplus calls, but that is a different problem. :)

--Vernon
