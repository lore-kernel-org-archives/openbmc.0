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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42X0nv4hXjzF3LT
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 08:09:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2018 14:09:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,374,1534834800"; d="scan'208";a="81040434"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga008.jf.intel.com with ESMTP; 12 Oct 2018 14:09:16 -0700
Subject: Re: Notion of Flakiness in Sensor Readings
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
Date: Fri, 12 Oct 2018 14:08:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
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
X-List-Received-Date: Fri, 12 Oct 2018 21:09:24 -0000

On 10/12/2018 01:53 PM, Patrick Venture wrote:
> Currently, there are a few approaches in phosphor-hwmon on how to
> handle sensors being present sometimes, or flaky on reads.  We've
> talked in the past about how to handle a read failure that should be
> ignored.  A real failure that is flaky or temporary.
> 
> I was thinking of just adding a property to the Sensor.Value interface
> to report information.  Basically, someone reading the value needs to
> know if it's valid.  The idea of a range check for validity doesn't
> work as cleanly for this specific purpose, in my opinion.  The min/max
> can be used cleanly to determine the linearization though!
> 
> I was thinking perhaps a boolean, that you can check to see if the
> value should be used or trusted.  Then, I thought, perhaps, a enum
> with a series of states, starting with the states of "Valid',
> "Invalid."  Not being able to think of a third state, I fell back onto
> a boolean.

For Valid / Invalid we've produced nan on D-Bus to know that the sensor 
is in an invalid state (like power off for tach values). Although I'm 
not sure how this would be produced using the int64 interface, for the 
double std::nan will go over d-bus correctly.

> 
> Thoughts?
> 
> Patrick
> 
