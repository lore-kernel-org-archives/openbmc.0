Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6bbf5PPDzDvW8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 11:59:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t6bbf24rlz9ryk;
 Mon, 31 Oct 2016 11:59:10 +1100 (AEDT)
Subject: Re: [PATCH linux v5 15/18] drivers/fsi: Add GPIO FSI master
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
 <7393b875-d655-a4ea-afd7-9368ca05d90b@ozlabs.org>
 <CAA0LjjW4RHRb45XUtW-gk_g_Ro3aqwrxj9ZGFct0nG0NFYjbpQ@mail.gmail.com>
 <60fa3f67-10c7-8f58-ed43-3e82a4498c57@ozlabs.org>
 <CAA0LjjVhUqySVUPwCGFfHZB24ay_1OSTOoj5RR27zxrL6cP4rw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 Jeremy Kerr <jk@0zlabs.org>, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <259bdf92-b6f2-5615-e889-cd7b98cdae75@ozlabs.org>
Date: Mon, 31 Oct 2016 08:59:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjVhUqySVUPwCGFfHZB24ay_1OSTOoj5RR27zxrL6cP4rw@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 00:59:10 -0000

Hi Chris,

>> Say if we have a FSI master with two links, we would have four cells
>> for all the *-gpios properties:
>>
>>      fsi-master {
>>          compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>>          clk-gpios = <&gpio 0 &gpio 6>;
>>          data-gpios = <&gpio 1 &gpio 7>;
>>      }
>>
> 
> Hi Jeremy,
> 
> One thing I don't understand is the numbering conventions.   What does
> 6 and 7 represent in this case?
> There are five pins total 0-4 for the existing gpio master.

This is only an example node, and the format of those example *-gpios
properties isn't really relevant here - what I'm illustrating is that
we could have multiple GPIOs described by each property.

The actual format of those *-gpios properties depends on the GPIO
controller that they're referring to, and is completely opaque to the
consumer of those nodes (in our case, that's the fsi master driver).

Here's how it works:

The GPIO controller driver has its own way of referencing an
individual GPIO, as a tuple of cells. This could be something as
simple as:

  (gpio-number)

or, typically they may have flags (like active-low, etc) too:

  (gpio-number,flags)

but more complex controllers can use any format, which could better
reference their hardware layout. To make up an example:

  (controller-bank,bank-index,flags)

The device tree node for the GPIO controller will have a #gpio-cells
property. This tells us how many cells are required for a tuple that
describes an individual GPIO.

When we want to reference an individual GPIO from elsewhere in the
device tree, we use one of these *-gpios properties, which contains:

  1) a pointer to the controller node
  2) the tuple describing the GPIO within that controller

(1) is always a phandle (a single cell that references the phandle
property of another node). This is how we know which controller we're
referring to.

Once we have the controller, we can look at its #gpio-cells property -
this tells us how many cells are needed for (2), which allows the GPIO
core code to construct that tuple from a DT property.

We request GPIOs using this tuple - the controller driver (and only that
driver) knows how to interpret the tuple, and returns the selected tuple
to our fsi master.

[The term "tuple" isn't standard here - I'm just using it for the
purposes of this email. The whole construct (ie, (1) and (2)) is called
a descriptor though].

However, the fsi driver doesn't need to care about *any* of that - we
just do a devm_gpiod_get() and out pops the correct GPIO.

We do need to know that format when constructing the device tree though,
and that will vary from platform to platform. Using the palmetto board
as an example, we would have something that looks like:

  fsi-master {
      compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
      clk-gpios = <&gpio ASPEED_GPIO(A,4) GPIO_ACTIVE_LOW>;
      data-gpios = <&gpio ASPEED_GPIO(A,5) GPIO_ACTIVE_LOW>;
  }

- using GPIOs A4 and A5, Assuming my reading of the schematic is
correct.

> Up until now, all available FSI masters in hardware,  FSP, P8 "hub",
> P8 cascade, P7 cascade, have all had multiple links controlled by one
> master.   It would make sense I think to continue this.

I'm only referring to separate "top-level" masters here (ie, simply the
groups of GPIOs themselves). There are a couple of considerations here:

  a) Using one-link-per-GPIO-master keeps the driver code a little simpler;
     it doesn't need to manage multiple links

  b) There is a little more scope for complexity & error in the *-gpios
      properties, if multiple clk/data/etc lines are described (say, if
      one FSI link of a multi-master doesn't have a separate mux line..)
     
- so I'm slightly preferring the single-link-per-master idea at present
(of course, that could cascade to other masters behind slave engines,
but the master driver doesn't need to care about that).

> There is no direct sharing of information between masters other than
> what's required by the firmware to start at the beginning master in
> the chain and walk down each link  and checking 'sub' master states to
> determine where an interrupt or error was sourced.

Again, this only references how we handle the top-level masters.

Regards,


Jeremy
