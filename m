Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sxB4xcMA"; 
 dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yp1w0qQPzF38b
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 06:10:59 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 63-v6so18544701ljs.4
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 12:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2GlOKKO+G9vMxLVlPk2QLnXsELwOENGCQvlWv8KXWp8=;
 b=sxB4xcMAJ7So344s3lxo+d/FjyTz/h4v/LT7uKJULcddzGdG7oWgPf6B+CQNw7bkRG
 USJIQkSf4FUmW1UdJllfFIFZp8RnTsmvcM6YD8wkt5lDz11fRRVoaoUmdHqNyzAqApCD
 +EwN9Fh3WaCd33DMIE2zV6SCHKPnIwo+sLfwFxkv9ZYHH1XDZNjxcDt5J2kq+LbNOsY2
 BiQkrkbaKukXp59U40ki8O3g2Rq6EJjOd/22AKWA62XiDkfuDaE14mekltJD4gqYkJQ8
 mYCVcnN69yK3nm3QoaClX1zRYon2K2Wp+mE0Zp1OYJ7k3rRFdJWeZKLb9rfK09KQpn/G
 jRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2GlOKKO+G9vMxLVlPk2QLnXsELwOENGCQvlWv8KXWp8=;
 b=WpTl1QGcIUNXQWYaHg1R1vJIR1Rkzgz6PC5CzpQINw3dI89R/g5NI49Qn73ZoijLJp
 meInoS7hTAuvvI7apJR2sT5eg/7dnvX7XxovjWctx7SRf+TlpvVsTjaroRJbqqzf/kDB
 ASOLdjOzzODQqTr6hFG36Hw+iJXFHuMFwV+S+uzRCibrvhnIDqYQRD9PGOQQBAbsNf8S
 6z47qWb6sPNAxeFXKGmnaUix3iyo91iQTB0O+DswHAvZpZo1w+PxH1h9/1a/mJZrdTPK
 Eg67ZOistWcqkZqZ1xANdUtfpF208KJxK3xNB01DRyBfnNe99wrXfm9E/9rbgBegEw9A
 UwRQ==
X-Gm-Message-State: ABuFfog48DXtBqZXPkZyXSAbFgr9CCTlfsMkRTXe242fgZmUHEy7LExL
 nta3JOncw+XsXvGO4nwfEDvEFjxqpaJcbRd4tSYVyBfE+8jxbg==
X-Google-Smtp-Source: ACcGV60jkW4fUBvKrtmKC2+iTLLpq+g1dQiX/rkpWzyKIHkhnRsHeTOE7LVbo2gVT6mvSL63lBYQn+I9gtXaWgAFI24=
X-Received: by 2002:a2e:980f:: with SMTP id
 a15-v6mr12888636ljj.6.1539630654727; 
 Mon, 15 Oct 2018 12:10:54 -0700 (PDT)
MIME-Version: 1.0
From: William Kennington <wak@google.com>
Date: Mon, 15 Oct 2018 12:10:43 -0700
Message-ID: <CAPnigK=MHsxsJBbO4tumSaJcK++DSJLopnvFuTh9vGqfSeYcWw@mail.gmail.com>
Subject: sdbusplus: bus.call() error handling
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 15 Oct 2018 19:11:01 -0000

If you don't use the sdbusplus bus.call() function you can skip
reading this message.

We currently have lots of code that looks something like:
auto resp = b.call(req);
if (resp.is_method_error())
{
    // handle errors
    // return
}
// continue doing

This code is broken since 55d6686ff38afef6597e734a9893116bc75475c6 was
introduced to add error handling to the bus.call() routine.

Unfortunately I also recommend at the time to change it to something like:
try
{
    auto resp = b.call(req);
    if (resp.is_method_error())
    {
        // handle errors
        // return
    }
    // continue doing work
}
catch(sdbusplus::exception::SdBusError& e)
{
    // handle errors
}

As it turns out, we don't need the is_method_error() check on the
response message at all, due to the underlying behavior of
sd_bus_call(). The error handling in that if statement is impossible
to reach and should be done in the catch block.

New code should look like:
try
{
    auto resp = b.call(req);
    // continue doing work
}
catch(sdbusplus::exception::SdBusError& e)
{
    // handle errors
}
