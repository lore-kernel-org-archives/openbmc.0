Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ShH4Y1hzDvYL
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 12:26:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t0ShH1Sgcz9s5g;
 Fri, 21 Oct 2016 12:26:55 +1100 (AEDT)
Subject: Re: [PATCH linux v5 15/18] drivers/fsi: Add GPIO FSI master
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
 <7393b875-d655-a4ea-afd7-9368ca05d90b@ozlabs.org>
 <CAA0LjjW4RHRb45XUtW-gk_g_Ro3aqwrxj9ZGFct0nG0NFYjbpQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@0zlabs.org>, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <60fa3f67-10c7-8f58-ed43-3e82a4498c57@ozlabs.org>
Date: Fri, 21 Oct 2016 09:26:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjW4RHRb45XUtW-gk_g_Ro3aqwrxj9ZGFct0nG0NFYjbpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2016 01:26:55 -0000

Hi Chris,

>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>>> index 21619fd..1875313 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>>> @@ -167,6 +167,36 @@
>>>               output-low;
>>>               line-name = "func_mode2";
>>>       };
>>> +
>>> +     pin_fsi_clk {
>>> +             gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
>>> +             output-low;
>>> +             line-name = "fsi_clk";
>>> +     };
>>> +
>>> +     pin_fsi_data {
>>> +             gpios = <ASPEED_GPIO(A, 5)  GPIO_ACTIVE_HIGH>;
>>> +             output-low;
>>> +             line-name = "fsi_data";
>>> +     };
>>> +
>>> +     pin_fsi_trans {
>>> +             gpios = <ASPEED_GPIO(H, 6)  GPIO_ACTIVE_HIGH>;
>>> +             output-low;
>>> +             line-name = "fsi_trans";
>>> +     };
>>> +
>>> +     pin_fsi_enable {
>>> +             gpios = <ASPEED_GPIO(D, 0)  GPIO_ACTIVE_HIGH>;
>>> +             output-low;
>>> +             line-name = "fsi_enable";
>>> +     };
>>> +
>>> +     pin_fsi_mux {
>>> +             gpios = <ASPEED_GPIO(A, 6)  GPIO_ACTIVE_HIGH>;
>>> +             output-low;
>>> +             line-name = "fsi_mux";
>>> +     };
>>>  };
>>
>> Do we want to add a master node too?
> 
> Don't follow what you mean by a master node.  What does that help with?

The master node is what describes the fsi master "device" (in this case,
the usage of a set of GPIOs as a functional unit).

The properties above just define some pinctl configuration to describe a
bunch of GPIOs. This doesn't actually describe anything fsi-master
related.

To do that, we need the master node too; that's the binding
specification that we're adding to Documentation/device-tree, and is the
thing that looks like:

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
         clk-gpios = <&gpio 0>
         data-gpios = <&gpio 1>
     };

or, for one of the fake masters for testing:

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-fake";
     };

That master node is what causes the master drivers to be "bound" to a
device (and multiple masters mean multiple devices instances & probes).

Does this mean you haven't yet tested with either the fake or gpio
masters? If that's the case, that should be your priority. We're at the
stage that any further code review would be redundant, as that code is
fairly likely to need changes as a result of testing.

>> We should also think about what we want to do for multiple links. There
>> are two main options here:
>>
>>   - list them as separate masters in the DT (ie, two fsi-master nodes,
>>     completely independent); or
>>
>>   - enable multiple GPIO descriptors in the gpio properties, eg:
>>
>>     fsi-master {
>>         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>>         clk-gpios = <&gpio 0 &gpio 6>;
>>         data-gpios = <&gpio 1 &gpio 7>;
>>     }
>>
>>     which describes a master with two links
>>
>> If we use the latter case, we'd want the property name to be plural
>> (*-gpios) to indicate this.
> 
> Its difficult to say how many links we'll eventually need a priori.

We don't need to - this isn't prescribed by the binding.

These *-gpios properties contain one or more "descriptors" of individual
GPIOs. While the format of a descriptor depends on how the GPIO
controller describes each GPIO, the notation we've used in that example
is fairly common, and is:

  clk-gpio = <(pointer to gpio controller) (index within controller)>

in this case, each gpio descriptor takes two cells (a cell is a u32),
and so the GPIO controller will have a #gpio-cells = <2> property.

Our vanilla master with one link would just be something like:

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
         clk-gpios = <&gpio 0>
         data-gpios = <&gpio 1>
     }

- this describes a single clock and single data line, as each *-gpios
  property is one descriptor.

Say if we have a FSI master with two links, we would have four cells
for all the *-gpios properties:

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
         clk-gpios = <&gpio 0 &gpio 6>;
         data-gpios = <&gpio 1 &gpio 7>;
     }

- and the binding would remain as is (just that we should use the plural
of gpios for the property names, to make this a little more sensible).

This could also be represented as two separate master nodes:

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
         clk-gpios = <&gpio 0>;
         data-gpios = <&gpio 1>;
     }

     fsi-master {
         compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
         clk-gpios = <&gpio 6>;
         data-gpios = <&gpio 7>;
     }

Our choice there would depend on the hardware layout. Does is make more
sense to represent this as two independent masters? Or a single one?
Would there ever be any shared state between those two masters that a
driver needs to handle?

Once we've settled that, we will need the device tree binding people to
take a look, which just involves CCing devicetree-discuss@ozlabs.org for
patches that modify Documentation/devicetree/*.

>> However, you have two serial_in() calls in the single path, can you
>> consolidate these?
>>
> 
> Ok, will change.
> 
> This type of change I would agree offers some minor performance
> gain but it does add a few lines of code to decode the slave id that weren't
> needed before.

This isn't for performance gain, it's purely for readability.

> Since I'm making changes to this file already it makes
> sense to add this one.   If all that remain though are minor changes like
> this one I'd like to be able to address those after the first core patch set
> is approved.   Would this be acceptable?

That can be a tough call. If it's a cleanup post-submission, then you've
lost the opportunity to roll that cleanup into the original inclusion,
and will need an extra patch for that cleanup (it's bad form to include
a cleanup change in something unrelated).

However, if there's minor things that don't warrant resubmission, then
that should be fine - just be aware that upstream folks may request that
you change it before submission *anyway*.

Cheers,


Jeremy
