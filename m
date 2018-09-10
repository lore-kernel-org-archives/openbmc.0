Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lYel/KHa"; 
 dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428MBq5y5MzF38f
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 07:49:23 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id l26-v6so18699446lfc.8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5FkkkB64p/lErzwxN4U2u0FDjtcnRtU5aZBBaKtFjrE=;
 b=lYel/KHaxzzLdeDRFuBXSyYyjySqxAydXlj7/ZzCu7FB4Sv1ytghZwgPI50YicuMwO
 g44Yc0C3jocPujvDx5FVjhR6ilI/v6r0YFZ+38jUb8n89I1zMzu4F4pH8FB7nBtam7Mh
 eFKa+ObkggwTYto+PTQ2GIliku+QbZJOFjNd8bZdzAMZZZCuxRasttp+nBGWhzHo/jXn
 4pwsnB8q0Zm5xdRW9ecIx5M09TcSEW/n0uyqKrc5YSk6DDW/ogb5dIoFwbQ3V33yXLDq
 p/KeubRH27B7u5+KAnbL9PMq8bmXcR2yUBSo3bJZk1//MdUp5MhR2v0BgJiQSQ07FQf1
 Ez6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FkkkB64p/lErzwxN4U2u0FDjtcnRtU5aZBBaKtFjrE=;
 b=m9Q+FK2XCVsPlOBeSC/wPFOsw3AiNPq/6wxpBNAWK1JTIFU4oce1vMeGud1wCP6Z9D
 T3QYR73RsKFepjozpdBxUbO+emWDnNSMy4xqgcBMG4EOcR1vwampOjShueC6y6p3XU5h
 nBOw/EYaWmb1qgaA00ss1P9zm56R6lb5lW0mjWWeFqbqvwW3WaF0NSEqp8Ecm9l2u8zg
 D2vUZqlRcNHMlmK4TbxF33JviFV/id6T+fZfhOdPo2Kifi07E9lRrCh7Xor8AwCfWVQB
 cBHWtybGG4QFNc6ziXe4/umxE5EHQwOjOzktruttax9tQe7ipPDzkmcdGeEKSqF6Kiah
 8/zQ==
X-Gm-Message-State: APzg51AREZiOVEhVPXx0DI89JCMZQhs1r2HZoB3t6wU2BQObB68XTkmW
 VNsTRljdeszl+lLHvClP7pR0xRF/ECIgu4FmOAJfFw==
X-Google-Smtp-Source: ANB0VdZ/Z4dpyQD9vXfKGsjV5BnmOyj5roiMZ//UjG0V4kHfxWQ2gznVFKDR4885S8JGlimIU8RaWHYBDgNup/QPEiY=
X-Received: by 2002:a19:655d:: with SMTP id
 c29-v6mr13418999lfj.138.1536616159203; 
 Mon, 10 Sep 2018 14:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
In-Reply-To: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Mon, 10 Sep 2018 14:49:07 -0700
Message-ID: <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
Subject: Re: is_method_error versus call() errors
To: Patrick Venture <venture@google.com>
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 10 Sep 2018 21:49:25 -0000

This is something that is a little confusing about the semantics of
sdbus. When using sd_bus_call(), it will only populate the returned
message pointer if the dbus rpc succeeds. In the case where something
fails at the dbus level, the sd_bus_call() method fails and the
message is never populated. If we don't check for errors on
sd_bus_call() but use sd_bus_message_is_method_error on the NULL
message, we get an -EINVAL and treat that as an error. This behavior
works fine if you only care that you had an error, but don't need to
interpret the error and perform special case handling depending on the
type. This is why I added the exceptions to sd_bus_call() so that we
can parse out specific errors like -EBUSY or -EINTR, but handle the
rest differently.

sd_bus_message_is_method_error() is supposed to be used for checking
if the server we are talking to sent an error response, not if the
dbus layer had some kind of error. These errors are application
specific and can be parsed out of a valid message if they exist.
sd_bus_call() will still return success even if the server method sent
a METHOD_ERROR type of message. You can't technically rely on
sd_bus_message_read returning an error when reading from a
METHOD_ERROR type of message. Practically though if your METHOD_ERROR
message never have any content the read will fail since the message
won't contain the expected data types. Unfortunately this means we
will should keep all of the is_method_error checks and make sure c++
exception handling is in place for all of the daemons.On Mon, Sep 10,
2018 at 9:18 AM Patrick Venture <venture@google.com> wrote:
>
> Given:
>
> _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
> char *name) {
>         assert_return(m, -EINVAL);
>         if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
>                 return 0;
>         if (name && (!m->error.name || !streq(m->error.name, name)))
>                 return 0;
>         return 1;
> }
>
> The failures from call() don't always set the reply (maybe don't ever,
> but I didn't read it closely).  Which means, is_method_error() can
> happen when the bus call itself was fine, so we need to check both IFF
> we're going to read the response.
>
> I'm working on eliminating the new crashes from phosphor-host-ipmid
> and other repositories, now that sdbusplus can except, which is not
> caught even though there's an error case for is_method_error()
> immediately after the call.
>
> In phosphor-pid-control, I dropped the is_method_error() check, but I
> think it's still valid before trying to read() a message -- so I will
> likely throw a patch adding that check.
>
> Patrick
