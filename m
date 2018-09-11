Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tCl+YBkP"; 
 dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428cPG1NSrzF31l
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 17:44:17 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id m84-v6so20041542lje.10
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rmzE73QHfHa50edod927l9/HynixgsLLTIU9EAC/ucE=;
 b=tCl+YBkPjwu0KhGsuWatHsPx9v6ktg2cnC0om4GFgeRqBDsRwgaE9v1QWoicQwsYel
 L2+NTw+XN3KSmyjVzi66dQ/gB3lKFHeUQyXDl4tPIuP8ZQmU8aYi7/9IuvHNTVgbNHG3
 14Vc1E84tx0AN+md81nL/OLcs6+mUqb4uYbRlPdmF+fITvf03LSGfzsu2Bk33G5FflYQ
 6uZBoje1+t3N3dD+LU0MbCzkwpskUrVga+XXy5O5ASnM0eOpCTVbQc/rrrSArdrKhe/f
 w2y4wV6u6TGhCEJXaDv9OAN4zsLUyOVrRKzU8YTL9wv1PmdYfbQiQOMLo0auKPgYv9lc
 xAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rmzE73QHfHa50edod927l9/HynixgsLLTIU9EAC/ucE=;
 b=F3V9+2Zp5nvsNB3GiDuf0TA6a5yvagwUhhDevLJMBNydmcLbEnirGdSKslgOwQi9Q9
 IN/ZvVV0iBbMjxFwKfNRqrS48rLh95ImGHeE6cg7t+nI6l45oYitexssn4q8DUfYgeT+
 i31lNxDtaHZluCBey8nUIDeD8OdM9sEInnX1sgu/XJc+Ac95hhk6B6GHFcVw3v1iyavJ
 ItV8NOrl1xm6A/XGbZLlBp3MZlpwQ8n2xziZ9tM/jofS1PXMf/e8PPhgN99cpWvzQJMo
 MCJY4SbOExX4dAxjuKMHnvCiy0Xez6oe3nFu9J/95ao1eYNJ090P7QkpvNQlAzc0dljC
 n/UA==
X-Gm-Message-State: APzg51BVPPOUTznOOgWwWFNrVBu6/L7P4fNtAdRa6V6E2b1K2Jks1P2r
 HmBiviDi83nwKOKTaAMLND2XJcCYmMLV40GTv39Z0Q==
X-Google-Smtp-Source: ANB0VdYVS8F32+1l9b4RAFBmnsHumOCIcBbCQi5TQtpwGHc9Jls7yVA3tJ8PNRFFNV5A9VjeGBD1kx+8iSrnRZIF68o=
X-Received: by 2002:a2e:971a:: with SMTP id
 r26-v6mr14817314lji.30.1536651853080; 
 Tue, 11 Sep 2018 00:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
 <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
 <CAGMNF6Wc6PF7+g-pn5htbnmajBP+Ax4pNSHhFRgLua-zTTYb7w@mail.gmail.com>
In-Reply-To: <CAGMNF6Wc6PF7+g-pn5htbnmajBP+Ax4pNSHhFRgLua-zTTYb7w@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 11 Sep 2018 00:44:01 -0700
Message-ID: <CAPnigK=uWpu_9obev=PrGDOwHgDw9eB6V1J90+TAkd_LCb+JqA@mail.gmail.com>
Subject: Re: is_method_error versus call() errors
To: Kun Yi <kunyi@google.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 07:44:19 -0000

Personally, I'd be more inclined to create helpers that wrap those
common paradigms expressively. I wrote a quick patch series that adds
these helpers. Let me know what you think.
https://gerrit.openbmc-project.xyz/#/c/openbmc/sdbusplus/+/12670/On
Mon, Sep 10, 2018 at 5:14 PM Kun Yi <kunyi@google.com> wrote:
>
> I think correspondingly we should start adding unit tests that checks our code are exception safe.
>
> Meanwhile, in some cases we don't really care from which level the error originates. Does it make sense to have a macro like:
>
> #define IS_ERROR_OR_EXCEPTION(dbus_call) \
>   try { \
>     return (dbus_call).is_method_error(); \
>   } catch (const sdbusplus::exception::SdBusError& ex) { \
>     return true; \
>   }
>
> On Mon, Sep 10, 2018 at 2:50 PM William Kennington <wak@google.com> wrote:
>>
>> This is something that is a little confusing about the semantics of
>> sdbus. When using sd_bus_call(), it will only populate the returned
>> message pointer if the dbus rpc succeeds. In the case where something
>> fails at the dbus level, the sd_bus_call() method fails and the
>> message is never populated. If we don't check for errors on
>> sd_bus_call() but use sd_bus_message_is_method_error on the NULL
>> message, we get an -EINVAL and treat that as an error. This behavior
>> works fine if you only care that you had an error, but don't need to
>> interpret the error and perform special case handling depending on the
>> type. This is why I added the exceptions to sd_bus_call() so that we
>> can parse out specific errors like -EBUSY or -EINTR, but handle the
>> rest differently.
>>
>> sd_bus_message_is_method_error() is supposed to be used for checking
>> if the server we are talking to sent an error response, not if the
>> dbus layer had some kind of error. These errors are application
>> specific and can be parsed out of a valid message if they exist.
>> sd_bus_call() will still return success even if the server method sent
>> a METHOD_ERROR type of message. You can't technically rely on
>> sd_bus_message_read returning an error when reading from a
>> METHOD_ERROR type of message. Practically though if your METHOD_ERROR
>> message never have any content the read will fail since the message
>> won't contain the expected data types. Unfortunately this means we
>> will should keep all of the is_method_error checks and make sure c++
>> exception handling is in place for all of the daemons.On Mon, Sep 10,
>> 2018 at 9:18 AM Patrick Venture <venture@google.com> wrote:
>> >
>> > Given:
>> >
>> > _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
>> > char *name) {
>> >         assert_return(m, -EINVAL);
>> >         if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
>> >                 return 0;
>> >         if (name && (!m->error.name || !streq(m->error.name, name)))
>> >                 return 0;
>> >         return 1;
>> > }
>> >
>> > The failures from call() don't always set the reply (maybe don't ever,
>> > but I didn't read it closely).  Which means, is_method_error() can
>> > happen when the bus call itself was fine, so we need to check both IFF
>> > we're going to read the response.
>> >
>> > I'm working on eliminating the new crashes from phosphor-host-ipmid
>> > and other repositories, now that sdbusplus can except, which is not
>> > caught even though there's an error case for is_method_error()
>> > immediately after the call.
>> >
>> > In phosphor-pid-control, I dropped the is_method_error() check, but I
>> > think it's still valid before trying to read() a message -- so I will
>> > likely throw a patch adding that check.
>> >
>> > Patrick
>
>
>
> --
> Regards,
> Kun
