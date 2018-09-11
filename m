Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428gF70Ty8zF35s
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 19:52:25 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2018 02:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,360,1531810800"; d="scan'208";a="87754256"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.223.86.38])
 ([10.223.86.38])
 by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2018 02:51:58 -0700
Subject: Re: is_method_error versus call() errors
To: William Kennington <wak@google.com>, Patrick Venture <venture@google.com>
Cc: openbmc@lists.ozlabs.org
References: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
 <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <652edb56-b195-611e-7976-a48c02d047fb@linux.intel.com>
Date: Tue, 11 Sep 2018 15:21:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Tue, 11 Sep 2018 09:52:27 -0000

In sdbus++ generated code we end up setting error_const for any issue 
(i.e. in the D-Bus daemon / server end).

catch(sdbusplus::xyz::openbmc_project::Common::Error::InvalidArgument& e)
     {
         sd_bus_error_set_const(error, e.name(), e.description());
         return -EINVAL;
     }

and in our sdbusplus (bus.hpp.in), the code is updated to throw the error

     auto call(message::message& m, uint64_t timeout_us = 0)
     {
         sd_bus_error error = SD_BUS_ERROR_NULL;
         sd_bus_message* reply = nullptr;
         int r = _intf->sd_bus_call(_bus.get(), m.get(), timeout_us, &error,
                                    &reply);
         if (r < 0)
         {
             throw exception::SdBusError(&error, "sd_bus_call");
         }

         return message::message(reply, _intf, std::false_type());
     }

i.e. for any error thrown in the D-Bus daemon(server), the client 
application call() will just throw SdBusError, and not the message 
object. Hence there is no way to perform is_method_error() on the 
message right?

Also, i believe even before throwing SdBusError(), 
sd_bus_message_unref(reply) has to be called, to make sure that messages 
are unref even for errors thrown from D-Bus daemon.

Let me know if i misunderstand the logic in current code.

Regards,

Richard


On 9/11/2018 3:19 AM, William Kennington wrote:
> This is something that is a little confusing about the semantics of
> sdbus. When using sd_bus_call(), it will only populate the returned
> message pointer if the dbus rpc succeeds. In the case where something
> fails at the dbus level, the sd_bus_call() method fails and the
> message is never populated. If we don't check for errors on
> sd_bus_call() but use sd_bus_message_is_method_error on the NULL
> message, we get an -EINVAL and treat that as an error. This behavior
> works fine if you only care that you had an error, but don't need to
> interpret the error and perform special case handling depending on the
> type. This is why I added the exceptions to sd_bus_call() so that we
> can parse out specific errors like -EBUSY or -EINTR, but handle the
> rest differently.
>
> sd_bus_message_is_method_error() is supposed to be used for checking
> if the server we are talking to sent an error response, not if the
> dbus layer had some kind of error. These errors are application
> specific and can be parsed out of a valid message if they exist.
> sd_bus_call() will still return success even if the server method sent
> a METHOD_ERROR type of message. You can't technically rely on
> sd_bus_message_read returning an error when reading from a
> METHOD_ERROR type of message. Practically though if your METHOD_ERROR
> message never have any content the read will fail since the message
> won't contain the expected data types. Unfortunately this means we
> will should keep all of the is_method_error checks and make sure c++
> exception handling is in place for all of the daemons.On Mon, Sep 10,
> 2018 at 9:18 AM Patrick Venture <venture@google.com> wrote:
>> Given:
>>
>> _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
>> char *name) {
>>          assert_return(m, -EINVAL);
>>          if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
>>                  return 0;
>>          if (name && (!m->error.name || !streq(m->error.name, name)))
>>                  return 0;
>>          return 1;
>> }
>>
>> The failures from call() don't always set the reply (maybe don't ever,
>> but I didn't read it closely).  Which means, is_method_error() can
>> happen when the bus call itself was fine, so we need to check both IFF
>> we're going to read the response.
>>
>> I'm working on eliminating the new crashes from phosphor-host-ipmid
>> and other repositories, now that sdbusplus can except, which is not
>> caught even though there's an error case for is_method_error()
>> immediately after the call.
>>
>> In phosphor-pid-control, I dropped the is_method_error() check, but I
>> think it's still valid before trying to read() a message -- so I will
>> likely throw a patch adding that check.
>>
>> Patrick
