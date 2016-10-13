Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svXrT6SkZzDsxd
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 12:16:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3svXrS3H9Tz9s9c;
 Thu, 13 Oct 2016 12:16:56 +1100 (AEDT)
Subject: Re: [PATCH linux v3 17/18] drivers/fsi: Add GPIO master functionality
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
 <337bc0ed-9f0c-afb3-d35d-3962ab7a17b7@ozlabs.org>
 <CAA0LjjV8OJFNesgcebxwhWBJkT_i2ZLnG-8HFzp8nE7WqP+3qQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <3e7c44ea-9433-73d5-9231-aac37594e6a3@ozlabs.org>
Date: Thu, 13 Oct 2016 09:16:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjV8OJFNesgcebxwhWBJkT_i2ZLnG-8HFzp8nE7WqP+3qQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 01:16:58 -0000

Hi Chris,

>>> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
>>
>> Can we have the number of bits to receive a separate parameter? This
>> means we don't need a dual-use *cmd argument, and won't have subtle bugs
>> arise where a caller has not initialised it.
>>
> 
> Would you suggest having a separate buffer passed in as well to store the
> serialized in data or use the struct fsi_gpio_msg  msg field?

Yeah, store the data in the existing struct fsi_gpio_msg (otherwise
there'd be no need for that struct). Something like:

 static void serial_in(struct fsi_master_gpio *master, int bits,
 	struct fsi_gpio_msg *msg)

where, on return of this function, msg->bits == bits, and msd->data is
the clocked-in data.

>>> +/*
>>> + * Store information on master errors so handler can detect and clean
>>> + * up the bus
>>> + */
>>> +static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
>>> +{
>>> +
>>> +}
>>
>> I know this is a todo, but where are you planning to 'store' this
>> information? Shouldn't errors just be returned immediately?
> 
> This is intended to be the entry point for the bus error handling code.
> I could return the failing rc to the caller right there but ultimately the
> error handler needs to be invoked somewhere in the call chain
> anyway.  As it is here the error condition is cleaned up as early as
> possible.
> 
> Even if the error is of a master type - such as master
> time out errors (MTOE) there is still a possibility that the connected
> slave is in some latched failed state which requires recovery to
> resume normal bus communications (issue a terminate command
> to slave, etc...)

OK, makes sense. Would this logic be repeated for all masters? If so, we
may want the core to manage common error recovery that involves the
slaves.

>>> @@ -100,11 +416,28 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>>>               return PTR_ERR(gpio);
>>>       master->gpio_data = gpio;
>>>
>>> +     gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
>>> +     if (IS_ERR(gpio))
>>> +             return PTR_ERR(gpio);
>>> +     master->gpio_trans = gpio;
>>> +
>>> +     gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
>>> +     if (IS_ERR(gpio))
>>> +             return PTR_ERR(gpio);
>>> +     master->gpio_enable = gpio;
>>> +
>>> +     gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
>>> +     if (IS_ERR(gpio))
>>> +             return PTR_ERR(gpio);
>>> +     master->gpio_mux = gpio;
>>> +
>>
>> trans, enable and mux should be optional, right?
>>
> 
> Right, I had sent a question via slack to you regarding how to code this up.

I'd suggest:

	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
	if (!IS_ERR(gpio))
		master->gpio_trans = gpio;
		
Then, since these are optional, we would make any interactions on this
gpio conditional on

 	if (master->gpio_trans) {

> Should the mandatory and optional specifics be placed in the dev tree code
> in arch/arm/boot/*dts  ?

They'd be described in the device tree binding spec, in
Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt . That only
contains an example at the moment, we would need to expand on that
before submission. Check out the i2c-gpio spec for something similar, at
Documentation/devicetree/bindings/i2c/i2c-gpio.txt . Something like:


  Device-tree bindings for gpio-based FSI master driver
  -----------------------------------------------------

  Required properties:
  	- compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
	- clk-gpio: GPIO descriptor for FSI clock
	- data-gpio: GPIO descriptor for FSI data
	
  Optional properties:
  	- enable-gpio: GPIO descriptor for enable line
  	- trans-gpio: ...
  	- mux-gpio: ...

  fsi-master {
  	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
  	clk-gpio = <&gpio 0>;
  	data-gpio = <&gpio 1>;
  }

Again though, we'd need to review which of those really make sense to
use in the gpio node, and which are just gpios that need to be set in a
static configuration for specific hardware.

> Also any basic examples you could point me to
> would be appreciated.  Which of the platforms would you recommend I
> adjust this for?  I suppose just Witherspoon for now.

Whatever platforms have this capability (and would be useful to enable
it). But yes, I'd suggest enabling it on whatever you're testing with.

Cheers,


Jeremy
