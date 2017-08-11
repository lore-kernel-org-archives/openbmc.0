Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x231.google.com (mail-oi0-x231.google.com
 [IPv6:2607:f8b0:4003:c06::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT6K75mtWzDr2T
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 11:06:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MHQqK3NH"; 
 dkim-atps=neutral
Received: by mail-oi0-x231.google.com with SMTP id f11so22004201oic.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 18:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7AgVHfoL4ooTlPHCIImUcfroKNJaUJvY5TxhQrrR668=;
 b=MHQqK3NHM5XIYA3RsibDAIovqAbP6Ze2rFc9i77I+GGnxaEFPg9BdfehjHtS3ABB3r
 TuDGPvg9+Q6ezPWaeuvlPeg4c34T3p9k+RP+SQnLkS5+hqigU8DT4F5UDx8tfCzZw5DV
 fzFtooEJlTniM8eEiugWHo7iT5Fw9lk2DwsWEqdERAlUJrrmveK9EPw5q/RPrDCnqHlm
 toyu1hArdrmBPsAntwIyf8Uf0Yq/A2Mx/5Fx6xxRXRpWFG77JqG62jrKIV7LLX2FHkVr
 3jhaMWYNvuR65qRHH2yzAkAAPDZnR+RqErTtU28xMW8AVzUtbCsW5PkJ9EXLiG5cc35+
 7hdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7AgVHfoL4ooTlPHCIImUcfroKNJaUJvY5TxhQrrR668=;
 b=FM9Q+TG4VqwoXZXACKco7bJra5s6P5NqkaUp3rzIj16ibW7BIRIroWK+Fs1PFqY6Gx
 SUGwvFbpzgYw4dSsRrZx7AzrItCutrlJohp8eSGtO0/pjMYz/+ke2Bh+F5fNYQ76VIvP
 xrwf1rA1sW/zqplxMuWYHrTDuYI/3L3xfzn8Eo3HAN4gYOq9wRZqR1K7GCikWYrvskjI
 qs3sr0kxMEZgj06zVzE7n8Rb2oYNv1iTXs9gQkyh3soaxFmo9uwJfSeUKj68KY8Lf/Y1
 m5eYmkcc9qlzyUfjlXwz3phunvL0FPe0tCWTB2sHqWbDPu3T3F6myKZw40KEs26mboLr
 8TMA==
X-Gm-Message-State: AHYfb5hdZoYtHuxe0YDSH9hRw9xnWg7HA4CfxfbOjRKLnpnfrQGVE64w
 Ih4yrpLCuZuAUl7k5uajWo+aLcikUJux
X-Received: by 10.202.244.129 with SMTP id s123mr16311897oih.318.1502413592821; 
 Thu, 10 Aug 2017 18:06:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Thu, 10 Aug 2017 18:06:32 -0700 (PDT)
In-Reply-To: <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-2-brendanhiggins@google.com>
 <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 10 Aug 2017 18:06:32 -0700
Message-ID: <CAFd5g44QFPGV+P_RCMreM4GWarOYJ8+iLREALFwiJ3JtiLvYyQ@mail.gmail.com>
Subject: Re: [RFC v1 1/4] ipmi_bmc: framework for BT IPMI on BMCs
To: Corey Minyard <minyard@acm.org>
Cc: Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 11 Aug 2017 01:06:36 -0000

On Thu, Aug 10, 2017 at 6:58 AM, Corey Minyard <minyard@acm.org> wrote:
> On 08/07/2017 10:52 PM, Brendan Higgins wrote:
>>
>> From: Benjamin Fair <benjaminfair@google.com>
>>
>> This patch introduces a framework for writing IPMI drivers which run on
>> a Board Management Controller. It is similar in function to OpenIPMI.
>> The framework handles registering devices and routing messages.
>
>
> Ok, I think I understand this.  I have a few nitpicky comments inline.  The
> RCU usage
> looks correct, and the basic design seems sound.

Sweet

>
> This piece of code takes a communication interface, called a bus, and
> muxes/demuxes
> messages on that bus to various users, called devices.  The name "devices"
> confused
> me for a bit, because I was thinking they were physical devices, what Linux
> would
> call a device.  I don't have a good suggestion for another name, though.

We could maybe do "*_interface" instead of "*_bus" and "*_handler" instead
of "*_device"; admittedly, it is not the best name ever: handler has some
connotations.

>
>
>
> I assume you would create one of these per bus for handling multiple busses,
> which
> you will obviously need to do in the future when IPMB comes.

Yep, that is the intention. I was planning on adding support to use the device
infrastructure so that multiple busses could be declared using device tree, etc.
I do not have that now, but I thought that was a lot of work and I would want
to get general buy-in before doing that. We just did enough to make code
that achieves feature parity to what we have now and the core of the new
proposed features.

>
> I can see two big problems with the way the "match_request" is done:
> * If multiple users want to handle the same request, only one of them will
> get it
>   and they will not know they have conflicted.
> * Doing this for userland interfaces will be hard.
> The other way to do this is for each user to register for each request type
> and
> manage it all in this code, which is kind of messy to use, but avoids the
> above problems.

Right, we considered this; however, I thought this is best because we also
want to handle routing of OEM messages; I suppose we could register a
type for OEM messages and then have a secondary set of handlers there;
this would have some drawbacks though, the default handler interface would
become a lot more complicated.

On the other hand, now that I am thinking about it; having a common kernel
interface for OEM messages could be really useful; this has definitely
caused us some grief.

>
> In thinking about the bigger picture here, you will need something like this
> for every
> communication interface the BMC supports: the system interface, LAN, IPMB,
> ICMB
> (let's hope not), and serial/modem interfaces (let's hope not, too, but
> people really
> use these in the field).  Maybe ICMB and serial aren't on your radar, but
> I'd expect
> LAN is pretty important, and you have already mentioned IPMB.

Right, we are thinking about IPMB right now; I agree that the other stuff should
be considered, but we don't really have a need for it now.

My hope would be to make a similar interface for IPMB.

>
> If you are thinking you will have a separate one of these for LAN in
> userspace, I
> would say just do it all in userspace.  For LAN you will have something that
> has
> to mux/demux all the messages from the LAN interface to the various users,
> the
> same code could sit on top of the current BT interface (and IPMB, etc.).

So right now we do have handlers for a lot of basic commands in user space;
this is why I have the default device file interface. However, it is incomplete
and I am starting to look at commands that make more sense being
implemented in the kernel.

I have kind of danced around your point so far, for LAN, as far as I know we
only support a REST interface right now; we should have the option of the
LAN interface, but I don't think anyone has really tackled that yet.

Basically, the way I see this now is sort of a mirror of what is done
on the host
side, we will have a kernel and a userland interface and then we will evolve it
as necessary.

In any case, I think there is probably a lot of room for additional discussion
here.

>
> I guess I'm trying to figure out how you expect all this work out in the
> end.  What
> you have now is a message mux/demux that can only have on thing underneath
> it and one thing above it, which obviously isn't very useful.  Are you
> thinking you
> can have other in-kernel things that can handle specific messages? I'm
> having
> a hard time imagining that's the case.  Or are you thinking that you will

Yes, I as I mentioned above, having handlers in the kernel is a prime motivator
for this. I have been working on an interface for doing flash updates over IPMI.
IPMI is not really a great way to do this in terms of performance or
the interface
it provides; however, IPMI is great in the sense that all platforms
have it, so I
want to have alternative backends for this flash interface and provide an IPMI
OEM command implementation as a lowest common denominator option. I
have some other examples, but i think this is one of the most interesting.

> create
> a userland interface to create a bus and then when a LAN connection comes
> in you create one of these BMC contexts and route the LAN traffic through
> this
> code?  That's kind of clever, but I'm wondering if there would be better
> ways
> to do this than this design.

Well, I think that is up for discussion; my main goal here is starting a
conversation.

As far as this being a complete design; I do not consider what I have
presented as being complete. I mentioned some things above that I would like
to add and some people have already chimed in asking for some changes.
I just wanted to get some feedback before I went *too* far.

>
> -corey
>
>> Signed-off-by: Benjamin Fair <benjaminfair@google.com>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>>   drivers/char/ipmi_bmc/Makefile   |   1 +
>>   drivers/char/ipmi_bmc/ipmi_bmc.c | 294
>> +++++++++++++++++++++++++++++++++++++++
>>   include/linux/ipmi_bmc.h         | 184 ++++++++++++++++++++++++
>>   3 files changed, 479 insertions(+)
>>   create mode 100644 drivers/char/ipmi_bmc/ipmi_bmc.c
>>
>> diff --git a/drivers/char/ipmi_bmc/Makefile
>> b/drivers/char/ipmi_bmc/Makefile
>> index 8bff32b55c24..9c7cd48d899f 100644
>> --- a/drivers/char/ipmi_bmc/Makefile
>> +++ b/drivers/char/ipmi_bmc/Makefile
>> @@ -2,5 +2,6 @@
>>   # Makefile for the ipmi bmc drivers.
>>   #
>>   +obj-$(CONFIG_IPMI_BMC) += ipmi_bmc.o
>>   obj-$(CONFIG_IPMI_BMC_BT_I2C) += ipmi_bmc_bt_i2c.o
>>   obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += ipmi_bmc_bt_aspeed.o
>> diff --git a/drivers/char/ipmi_bmc/ipmi_bmc.c
>> b/drivers/char/ipmi_bmc/ipmi_bmc.c
>> new file mode 100644
>> index 000000000000..c1324ac9a83c
>> --- /dev/null
>> +++ b/drivers/char/ipmi_bmc/ipmi_bmc.c
>
>
> This is not really a BMC, it's a BMC message router, or something like that.

How about ipmi_bmc_core.c or ipmi_slave_core.c ?

>
>
>> @@ -0,0 +1,294 @@
>> +/*
>> + * Copyright 2017 Google Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/export.h>
>> +#include <linux/init.h>
>> +#include <linux/ipmi_bmc.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/rculist.h>
>> +#include <linux/rcupdate.h>
>> +
>> +#define PFX "IPMI BMC core: "
>> +
>> +struct ipmi_bmc_ctx *ipmi_bmc_get_global_ctx()
>> +{
>> +       static struct ipmi_bmc_ctx global_ctx;
>> +
>> +       return &global_ctx;
>> +}
>> +
>> +int ipmi_bmc_send_response(struct ipmi_bmc_ctx *ctx,
>> +                          struct bt_msg *bt_response)
>> +{
>> +       struct ipmi_bmc_bus *bus;
>> +       int ret = -ENODEV;
>> +
>> +       rcu_read_lock();
>> +       bus = rcu_dereference(ctx->bus);
>> +
>> +       if (bus)
>> +               ret = bus->send_response(bus, bt_response);
>> +
>> +       rcu_read_unlock();
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_send_response);
>> +
>> +bool ipmi_bmc_is_response_open(struct ipmi_bmc_ctx *ctx)
>> +{
>> +       struct ipmi_bmc_bus *bus;
>> +       bool ret = false;
>> +
>> +       rcu_read_lock();
>> +       bus = rcu_dereference(ctx->bus);
>> +
>> +       if (bus)
>> +               ret = bus->is_response_open(bus);
>> +
>> +       rcu_read_unlock();
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_is_response_open);
>> +
>> +int ipmi_bmc_register_device(struct ipmi_bmc_ctx *ctx,
>> +                            struct ipmi_bmc_device *device_in)
>> +{
>> +       struct ipmi_bmc_device *device;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       /* Make sure it hasn't already been registered. */
>> +       list_for_each_entry(device, &ctx->devices, link) {
>> +               if (device == device_in) {
>> +                       mutex_unlock(&ctx->drivers_mutex);
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>> +       list_add_rcu(&device_in->link, &ctx->devices);
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_register_device);
>> +
>> +int ipmi_bmc_unregister_device(struct ipmi_bmc_ctx *ctx,
>> +                              struct ipmi_bmc_device *device_in)
>> +{
>> +       struct ipmi_bmc_device *device;
>> +       bool found = false;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       /* Make sure it is currently registered. */
>> +       list_for_each_entry(device, &ctx->devices, link) {
>> +               if (device == device_in) {
>> +                       found = true;
>> +                       break;
>> +               }
>> +       }
>> +       if (!found) {
>> +               mutex_unlock(&ctx->drivers_mutex);
>> +               return -ENXIO;
>> +       }
>> +
>> +       list_del_rcu(&device_in->link);
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +       synchronize_rcu();
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_unregister_device);
>> +
>> +int ipmi_bmc_register_default_device(struct ipmi_bmc_ctx *ctx,
>> +                                    struct ipmi_bmc_device *device)
>> +{
>> +       int ret;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       if (!ctx->default_device) {
>> +               ctx->default_device = device;
>> +               ret = 0;
>> +       } else {
>> +               ret = -EBUSY;
>> +       }
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_register_default_device);
>> +
>> +int ipmi_bmc_unregister_default_device(struct ipmi_bmc_ctx *ctx,
>> +                                      struct ipmi_bmc_device *device)
>> +{
>> +       int ret;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       if (ctx->default_device == device) {
>> +               ctx->default_device = NULL;
>> +               ret = 0;
>> +       } else {
>> +               ret = -ENXIO;
>> +       }
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +       synchronize_rcu();
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_unregister_default_device);
>> +
>> +static u8 errno_to_ccode(int errno)
>> +{
>> +       switch (errno) {
>> +       case EBUSY:
>> +               return 0xC0; /* Node Busy */
>> +       case EINVAL:
>> +               return 0xC1; /* Invalid Command */
>> +       case ETIMEDOUT:
>> +               return 0xC3; /* Timeout while processing command */
>> +       case ENOMEM:
>> +               return 0xC4; /* Out of space */
>> +       default:
>> +               return 0xFF; /* Unspecified error */
>
>
> Instead of the hard-coded constants, you can use
> include/uapi/linux/ipmi_msgdefs.h
> and add things there as needed.  You probably knew that, but these numbers
> should
> all be the same.  Same for other constant that might apply.

Noted.

>
>
>> +       }
>> +}
>> +
>> +static void ipmi_bmc_send_error_response(struct ipmi_bmc_ctx *ctx,
>> +                                        struct bt_msg *bt_request,
>> +                                        u8 ccode)
>> +{
>> +       struct bt_msg error_response;
>> +       int ret;
>> +
>> +       /* Payload contains 1 byte for completion code */
>> +       error_response.len = bt_msg_payload_to_len(1);
>> +       error_response.netfn_lun = bt_request->netfn_lun |
>> +                                  IPMI_NETFN_LUN_RESPONSE_MASK;
>> +       error_response.seq = bt_request->seq;
>> +       error_response.cmd = bt_request->cmd;
>> +       error_response.payload[0] = ccode;
>> +
>> +       /*
>> +        * TODO(benjaminfair): Retry sending the response if it fails. The
>> error
>> +        * response might fail to send if another response is in progress.
>> In
>> +        * that case, the request will timeout rather than getting a more
>> +        * specific completion code. This should buffer up responses and
>> send
>> +        * them when it can. Device drivers will generally handle error
>> +        * reporting themselves; this code is only a fallback when that's
>> not
>> +        * available or when the drivers themselves fail.
>> +        */
>> +       ret = ipmi_bmc_send_response(ctx, &error_response);
>> +       if (ret)
>> +               pr_warn(PFX "Failed to reply with completion code %u:
>> ipmi_bmc_send_response returned %d\n",
>> +                       (u32) ccode, ret);
>> +}
>> +
>> +void ipmi_bmc_handle_request(struct ipmi_bmc_ctx *ctx,
>> +                            struct bt_msg *bt_request)
>> +{
>> +       struct ipmi_bmc_device *default_device;
>> +       struct ipmi_bmc_device *device;
>> +       int ret = -EINVAL;
>> +
>> +       rcu_read_lock();
>> +       list_for_each_entry_rcu(device, &ctx->devices, link) {
>> +               if (device->match_request(device, bt_request)) {
>> +                       ret = device->handle_request(device, bt_request);
>> +                       goto out;
>> +               }
>> +       }
>> +
>> +       /* No specific handler found. Use default handler instead */
>> +       default_device = rcu_dereference(ctx->default_device);
>> +       if (default_device)
>> +               ret = default_device->handle_request(default_device,
>> +                                                    bt_request);
>> +
>> +out:
>> +       rcu_read_unlock();
>> +       if (ret)
>> +               ipmi_bmc_send_error_response(ctx, bt_request,
>> +                                            errno_to_ccode(-ret));
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_handle_request);
>> +
>> +void ipmi_bmc_signal_response_open(struct ipmi_bmc_ctx *ctx)
>> +{
>> +       struct ipmi_bmc_device *default_device;
>> +       struct ipmi_bmc_device *device;
>> +
>> +       rcu_read_lock();
>> +       list_for_each_entry_rcu(device, &ctx->devices, link) {
>> +               device->signal_response_open(device);
>> +       }
>> +
>> +       default_device = rcu_dereference(ctx->default_device);
>> +       if (default_device)
>> +               default_device->signal_response_open(default_device);
>> +
>> +       rcu_read_unlock();
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_signal_response_open);
>> +
>> +int ipmi_bmc_register_bus(struct ipmi_bmc_ctx *ctx,
>> +                         struct ipmi_bmc_bus *bus_in)
>> +{
>> +       int ret;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       if (!ctx->bus) {
>> +               ctx->bus = bus_in;
>> +               ret = 0;
>> +       } else {
>> +               ret = -EBUSY;
>> +       }
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_register_bus);
>> +
>> +int ipmi_bmc_unregister_bus(struct ipmi_bmc_ctx *ctx,
>> +                           struct ipmi_bmc_bus *bus_in)
>> +{
>> +       int ret;
>> +
>> +       mutex_lock(&ctx->drivers_mutex);
>> +       /* Tried to unregister when another bus is registered */
>> +       if (ctx->bus == bus_in) {
>> +               ctx->bus = NULL;
>> +               ret = 0;
>> +       } else {
>> +               ret = -ENXIO;
>> +       }
>> +       mutex_unlock(&ctx->drivers_mutex);
>> +       synchronize_rcu();
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(ipmi_bmc_unregister_bus);
>> +
>> +static int __init ipmi_bmc_init(void)
>> +{
>> +       struct ipmi_bmc_ctx *ctx = ipmi_bmc_get_global_ctx();
>> +
>> +       mutex_init(&ctx->drivers_mutex);
>> +       INIT_LIST_HEAD(&ctx->devices);
>> +       return 0;
>> +}
>> +module_init(ipmi_bmc_init);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Benjamin Fair <benjaminfair@google.com>");
>> +MODULE_DESCRIPTION("Core IPMI driver for the BMC side");
>> diff --git a/include/linux/ipmi_bmc.h b/include/linux/ipmi_bmc.h
>> index d0885c0bf190..2b494a79ec14 100644
>> --- a/include/linux/ipmi_bmc.h
>> +++ b/include/linux/ipmi_bmc.h
>> @@ -20,6 +20,13 @@
>>   #include <linux/types.h>
>>     #define BT_MSG_PAYLOAD_LEN_MAX 252
>> +#define BT_MSG_SEQ_MAX 255
>> +
>> +/*
>> + * The bit in this mask is set in the netfn_lun field of an IPMI message
>> to
>> + * indicate that it is a response.
>> + */
>> +#define IPMI_NETFN_LUN_RESPONSE_MASK (1 << 2)
>>     /**
>>    * struct bt_msg - Block Transfer IPMI message.
>> @@ -42,6 +49,84 @@ struct bt_msg {
>>         u8 payload[BT_MSG_PAYLOAD_LEN_MAX];
>>   } __packed;
>>   +/**
>> + * struct ipmi_bmc_device - Device driver that wants to receive ipmi
>> requests.
>> + * @link: Used to make a linked list of devices.
>> + * @match_request: Used to determine whether a request can be handled by
>> this
>> + *                 device. Note that the matchers are checked in an
>> arbitrary
>> + *                 order.
>> + * @handle_request: Called when a request is received for this device.
>> + * @signal_response_open: Called when a response is done being sent and
>> another
>> + *                        device can send a message. Make sure to check
>> that the
>> + *                        bus isn't busy even after this is called,
>> because all
>> + *                        devices receive this call and another one may
>> have
>> + *                        already submitted a new response.
>> + *
>> + * This collection of callback functions represents an upper-level
>> handler of
>> + * IPMI requests.
>> + *
>> + * Note that the callbacks may be called from an interrupt context.
>> + */
>> +struct ipmi_bmc_device {
>> +       struct list_head link;
>> +
>> +       bool (*match_request)(struct ipmi_bmc_device *device,
>> +                             struct bt_msg *bt_request);
>> +       int (*handle_request)(struct ipmi_bmc_device *device,
>> +                             struct bt_msg *bt_request);
>> +       void (*signal_response_open)(struct ipmi_bmc_device *device);
>> +};
>> +
>> +/**
>> + * struct ipmi_bmc_bus - Bus driver that exchanges messages with the
>> host.
>> + * @send_response: Submits the given response to be sent to the host. May
>> return
>> + *                 -EBUSY if a response is already in progress, in which
>> case
>> + *                 the caller should wait for the response_open()
>> callback to be
>> + *                 called.
>> + * @is_response_open: Determines whether a response can currently be
>> sent. Note
>> + *                    that &ipmi_bmc_bus->send_response() may still fail
>> with
>> + *                    -EBUSY even after this returns true.
>> + *
>> + * This collection of callback functions represents a lower-level driver
>> which
>> + * acts as a connection to the host.
>> + */
>> +struct ipmi_bmc_bus {
>> +       int (*send_response)(struct ipmi_bmc_bus *bus,
>> +                            struct bt_msg *bt_response);
>> +       bool (*is_response_open)(struct ipmi_bmc_bus *bus);
>> +};
>> +
>> +/**
>> + * struct ipmi_bmc_ctx - Context object used to interact with the IPMI
>> BMC
>> + *                       core driver.
>> + * @bus: Pointer to the bus which is currently registered, or NULL for
>> none.
>> + * @default_device: Pointer to a device which will receive messages that
>> match
>> + *                  no other devices, or NULL if none is registered.
>> + * @devices: List of devices which are currently registered, besides the
>> default
>> + *           device.
>> + * @drivers_mutex: Mutex which protects against concurrent editing of the
>> + *                 bus driver, default device driver, and devices list.
>> + *
>> + * This struct should only be modified by the IPMI BMC core code and not
>> by bus
>> + * or device drivers.
>> + */
>> +struct ipmi_bmc_ctx {
>> +       struct ipmi_bmc_bus __rcu       *bus;
>> +       struct ipmi_bmc_device __rcu    *default_device;
>> +       struct list_head                devices;
>> +       struct mutex                    drivers_mutex;
>
>
> Since it does all it does, "drivers_mutex" IMHO is too specific a name.

Makes sense.

>
>
>> +};
>> +
>> +/**
>> + * ipmi_bmc_get_global_ctx() - Get a pointer to the global ctx.
>> + *
>> + * This function gets a reference to the global ctx object which is used
>> by
>> + * bus and device drivers to interact with the IPMI BMC core driver.
>> + *
>> + * Return: Pointer to the global ctx object.
>> + */
>> +struct ipmi_bmc_ctx *ipmi_bmc_get_global_ctx(void);
>> +
>>   /**
>>    * bt_msg_len() - Determine the total length of a Block Transfer
>> message.
>>    * @bt_msg: Pointer to the message.
>> @@ -73,4 +158,103 @@ static inline u8 bt_msg_payload_to_len(u8
>> payload_len)
>>         return payload_len + 3;
>>   }
>>   +/**
>> + * ipmi_bmc_send_response() - Send an IPMI response on the current bus.
>> + * @bt_response: The response message to send.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_send_response(struct ipmi_bmc_ctx *ctx,
>> +                          struct bt_msg *bt_response);
>> +/**
>> + * ipmi_bmc_is_response_open() - Check whether we can currently send a
>> new
>> + *                               response.
>> + *
>> + * Note that even if this function returns true, ipmi_bmc_send_response()
>> may
>> + * still fail with -EBUSY if a response is submitted in the time between
>> the two
>> + * calls.
>> + *
>> + * Return: true if we can send a new response, false if one is already in
>> + *         progress.
>> + */
>> +bool ipmi_bmc_is_response_open(struct ipmi_bmc_ctx *ctx);
>> +/**
>> + * ipmi_bmc_register_device() - Register a new device driver.
>> + * @device: Pointer to the struct which represents this device,
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_register_device(struct ipmi_bmc_ctx *ctx,
>> +                            struct ipmi_bmc_device *device);
>> +/**
>> + * ipmi_bmc_unregister_device() - Unregister an existing device driver.
>> + * @device: Pointer to the struct which represents the existing device.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_unregister_device(struct ipmi_bmc_ctx *ctx,
>> +                              struct ipmi_bmc_device *device);
>> +/**
>> + * ipmi_bmc_register_default_device() - Register a new default device
>> driver.
>> + * @device: Pointer to the struct which represents this device,
>> + *
>> + * Make this device the default device. If none of the other devices
>> match on a
>> + * particular message, this device will receive it instead.  Note that
>> only one
>> + * default device may be registered at a time.
>> + *
>> + * This functionalisty is currently used to allow messages which aren't
>> directly
>> + * handled by the kernel to be sent to userspace and handled there.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_register_default_device(struct ipmi_bmc_ctx *ctx,
>> +                                    struct ipmi_bmc_device *device);
>> +/**
>> + * ipmi_bmc_unregister_default_device() - Unregister the existing default
>> device
>> + *                                        driver.
>> + * @device: Pointer to the struct which represents the existing device.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_unregister_default_device(struct ipmi_bmc_ctx *ctx,
>> +                                      struct ipmi_bmc_device *device);
>> +/**
>> + * ipmi_bmc_handle_request() - Handle a new request that was received.
>> + * @bt_request: The request that was received.
>> + *
>> + * This is called by the bus driver when it receives a new request
>> message.
>> + *
>> + * Note that it may be called from an interrupt context.
>> + */
>> +void ipmi_bmc_handle_request(struct ipmi_bmc_ctx *ctx,
>> +                           struct bt_msg *bt_request);
>> +/**
>> + * ipmi_bmc_signal_response_open() - Notify the upper layer that a
>> response can
>> + *                                   be sent.
>> + *
>> + * This is called by the bus driver after it finishes sending a response
>> and is
>> + * ready to begin sending another one.
>> + */
>> +void ipmi_bmc_signal_response_open(struct ipmi_bmc_ctx *ctx);
>> +/**
>> + * ipmi_bmc_register_bus() - Register a new bus driver.
>> + * @bus: Pointer to the struct which represents this bus.
>> + *
>> + * Register a bus driver to handle communication with the host.
>> + *
>> + * Only one bus driver can be registered at any time.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_register_bus(struct ipmi_bmc_ctx *ctx,
>> +                         struct ipmi_bmc_bus *bus);
>> +/**
>> + * ipmi_bmc_unregister_bus() - Unregister an existing bus driver.
>> + * @bus: Pointer to the struct which represents the existing bus.
>> + *
>> + * Return: 0 on success, negative errno otherwise.
>> + */
>> +int ipmi_bmc_unregister_bus(struct ipmi_bmc_ctx *ctx,
>> +                           struct ipmi_bmc_bus *bus);
>> +
>>   #endif /* __LINUX_IPMI_BMC_H */
>
>
>

Thanks!
