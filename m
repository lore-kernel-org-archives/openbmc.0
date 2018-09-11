Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iWonPkTX"; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428yys4kDKzF38g
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 07:41:08 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id p6-v6so22093216ljc.5
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 14:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Bww5j4biLTnCdyTleM/So6bPqHqpCQ+AbSy1R+3ZCg=;
 b=iWonPkTXTY28bnixBVkm28Ew/9UF/Yz6kElVFYDmsqgGxlagkVnaeMf7ijzxr7EyQa
 8w1b5HOHXb/kOioMMX2EJ0zYyCZhAhWrA7DS6Sy5LNpRHKiMLOVbvIWAfgxXQtM0iGaR
 hG1AN7yQ43Ltb9CXS0z3o/ZImVKMlGl+0xQKgza1l0N7NjqQuM5iMmC2ISUprcMwpi8K
 2qXZg9b5umrjOOMo82l1EIgfVxjH7BmkYYb96aGSM3E2RqLnpMoT8toK9JnWjUCWo2I7
 BoHxulQTEdgDmgjelQzR3HWjbjygKTIRb2QseP6KcQIK7xNfmcqGsocThTNFQ6suWLQl
 fc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Bww5j4biLTnCdyTleM/So6bPqHqpCQ+AbSy1R+3ZCg=;
 b=JiLNkX8Q7DV2ebxEQOirae9geXXk7X2qLQzLi0yEfDCMJNQLxoogPYgFHc5hcJVtg8
 Y5N69HPyZEe0hcAoCEZ9lAdj7JCUw8+qe639QRIMVjqN2XdwSqgjwV82xxBIUEdVEGRU
 JSUgQhUuIbqHbRwwGAw+oRtnIosXQCXVW+y5ON2JRXKGyNnHanrlf4/VxQ2EluygIeYc
 zEKdGcjteCsiLf2KjNRj55O3wmcfHoWmh6y+nXOcJnF9cvvbpBzK6OEma3c3HG43bDGj
 7Gf1oiSzsnMurMnntzu6tggPfXDbD7GWyB6TcV7dJUO7jmCbSt9EBI/fKpfsaU9sOo6L
 9TCA==
X-Gm-Message-State: APzg51CPh6hepZ0LunOb5vmf8oF7XrivNZ0q3m9CR5AY0r0SiC4Y3Gcl
 qN5se/wIuedtQQfSVwNmyCmQRi3Hscy9SLtt75DrLQ==
X-Google-Smtp-Source: ANB0VdYEQqewrSpJ0mPMY9n4wobbWgmpJMYH/xPru7Re0B/25gZ+A2PtcF9ahHdaBOMasdaCMlaKo2aN/3GWnU/V7ng=
X-Received: by 2002:a2e:9941:: with SMTP id r1-v6mr4942112ljj.53.1536702064643; 
 Tue, 11 Sep 2018 14:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
 <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
 <652edb56-b195-611e-7976-a48c02d047fb@linux.intel.com>
In-Reply-To: <652edb56-b195-611e-7976-a48c02d047fb@linux.intel.com>
From: William Kennington <wak@google.com>
Date: Tue, 11 Sep 2018 14:40:52 -0700
Message-ID: <CAPnigKnoSU_tnZVtyBvhqBHEK68mjSuwAEiua5-tXJp+YHxp7g@mail.gmail.com>
Subject: Re: is_method_error versus call() errors
To: richard.marian.thomaiyar@linux.intel.com
Cc: Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 11 Sep 2018 21:41:11 -0000

I should have looked at the code prior to misremembering how sd_bus
handles method errors during sd_bus_call(). If you look at the code,
it does in fact return sd_bus_errors for method errors automaticaly.

https://github.com/systemd/systemd/blob/v237/src/libsystemd/sd-bus/sd-bus.c#L2130

You can ignore the previous patchset I sent adding the method_error
checks as they are superfluous. It looks like the only missing
convenience is the ignore errors variant of the call_noreply_noexcept.
On Tue, Sep 11, 2018 at 2:52 AM Thomaiyar, Richard Marian
<richard.marian.thomaiyar@linux.intel.com> wrote:
>
> In sdbus++ generated code we end up setting error_const for any issue
> (i.e. in the D-Bus daemon / server end).
>
> catch(sdbusplus::xyz::openbmc_project::Common::Error::InvalidArgument& e)
>      {
>          sd_bus_error_set_const(error, e.name(), e.description());
>          return -EINVAL;
>      }
>
> and in our sdbusplus (bus.hpp.in), the code is updated to throw the error
>
>      auto call(message::message& m, uint64_t timeout_us = 0)
>      {
>          sd_bus_error error = SD_BUS_ERROR_NULL;
>          sd_bus_message* reply = nullptr;
>          int r = _intf->sd_bus_call(_bus.get(), m.get(), timeout_us, &error,
>                                     &reply);
>          if (r < 0)
>          {
>              throw exception::SdBusError(&error, "sd_bus_call");
>          }
>
>          return message::message(reply, _intf, std::false_type());
>      }
>
> i.e. for any error thrown in the D-Bus daemon(server), the client
> application call() will just throw SdBusError, and not the message
> object. Hence there is no way to perform is_method_error() on the
> message right?
>
> Also, i believe even before throwing SdBusError(),
> sd_bus_message_unref(reply) has to be called, to make sure that messages
> are unref even for errors thrown from D-Bus daemon.
>
> Let me know if i misunderstand the logic in current code.
>
> Regards,
>
> Richard
>
>
> On 9/11/2018 3:19 AM, William Kennington wrote:
> > This is something that is a little confusing about the semantics of
> > sdbus. When using sd_bus_call(), it will only populate the returned
> > message pointer if the dbus rpc succeeds. In the case where something
> > fails at the dbus level, the sd_bus_call() method fails and the
> > message is never populated. If we don't check for errors on
> > sd_bus_call() but use sd_bus_message_is_method_error on the NULL
> > message, we get an -EINVAL and treat that as an error. This behavior
> > works fine if you only care that you had an error, but don't need to
> > interpret the error and perform special case handling depending on the
> > type. This is why I added the exceptions to sd_bus_call() so that we
> > can parse out specific errors like -EBUSY or -EINTR, but handle the
> > rest differently.
> >
> > sd_bus_message_is_method_error() is supposed to be used for checking
> > if the server we are talking to sent an error response, not if the
> > dbus layer had some kind of error. These errors are application
> > specific and can be parsed out of a valid message if they exist.
> > sd_bus_call() will still return success even if the server method sent
> > a METHOD_ERROR type of message. You can't technically rely on
> > sd_bus_message_read returning an error when reading from a
> > METHOD_ERROR type of message. Practically though if your METHOD_ERROR
> > message never have any content the read will fail since the message
> > won't contain the expected data types. Unfortunately this means we
> > will should keep all of the is_method_error checks and make sure c++
> > exception handling is in place for all of the daemons.On Mon, Sep 10,
> > 2018 at 9:18 AM Patrick Venture <venture@google.com> wrote:
> >> Given:
> >>
> >> _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
> >> char *name) {
> >>          assert_return(m, -EINVAL);
> >>          if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
> >>                  return 0;
> >>          if (name && (!m->error.name || !streq(m->error.name, name)))
> >>                  return 0;
> >>          return 1;
> >> }
> >>
> >> The failures from call() don't always set the reply (maybe don't ever,
> >> but I didn't read it closely).  Which means, is_method_error() can
> >> happen when the bus call itself was fine, so we need to check both IFF
> >> we're going to read the response.
> >>
> >> I'm working on eliminating the new crashes from phosphor-host-ipmid
> >> and other repositories, now that sdbusplus can except, which is not
> >> caught even though there's an error case for is_method_error()
> >> immediately after the call.
> >>
> >> In phosphor-pid-control, I dropped the is_method_error() check, but I
> >> think it's still valid before trying to read() a message -- so I will
> >> likely throw a patch adding that check.
> >>
> >> Patrick
>
