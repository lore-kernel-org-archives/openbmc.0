Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LQJuVYyD"; 
 dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qCJD0N1wzDqYW
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 06:55:23 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id t15so6532418uao.5
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=S8MSseYeCcc0a2IU2j8I8P3VfAFWG6j4EcIL0oe4p00=;
 b=LQJuVYyDmpXlTTW6sbfLJWWDnchkk+jkVd96LV9t+I1T/bWs/c518X+Sk/fUDQmqjm
 u9NKLKRyROssQBrG44aQgQl7mGPxIYRRjQpXFRDXOTC7Wq2K02qQUofknrDNY2LhIZWz
 RV+uUIDjEp2N9mLq6qyQa1WxXrrktPs08SCZFUkRX0E5iT+LR/owwP9+nPqmB7Bs5JUF
 lpN20dNx+0Tbmo6LDpC/imhA1Tq+aoXeZQnCsxDwOrhS+f+2v8pZ7tgTf04kPc/fkLoB
 acMoKEHkakGZAgyF+S+s5nt0iV99/5wlIqTHl/FJDb+Wxgb3XUaP63OrgIRVFEQXAJ32
 9QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=S8MSseYeCcc0a2IU2j8I8P3VfAFWG6j4EcIL0oe4p00=;
 b=InLrOGk/TpLGIaNCu76VerOIUJguY8hyNaLAEPaqZ2WMnvTXV9tUC2QlidB4znwOnJ
 G07M8V3AfSfSqPhG0nFj50XW5pMQG21Vjurz1rqotRYJTEbxXV5kft+06ufH3Sy9l5SZ
 I+wKJVJPzIx4Pi9fjYkfEKhqFijrvhzgvvzrm2kkrl0n7HDyd0/O3igO/QGFxHafupNH
 ZLrBN7QsxCWyhqqb+Ks0gSxHzJcPwr86LYkBWujBobLs6yjmm8uoeLnX7h3PBi4CrbIl
 YoeksHfUvNrJuDp4GyIHOj5sq+Fy1lv0gbcXKJLfHll55XCJUsI/e8KCHBR5+QH8tvkM
 CtZA==
X-Gm-Message-State: APjAAAXualg0T/Ls9z9DyR1aS55BfaXdOvN/TzzCqBnicq3t0mlW+7MH
 /BXGcMmaumcp8ZtmhyxViBI/16wKi8zf0/eIG6z1NQ==
X-Google-Smtp-Source: APXvYqzWBwlsANXl4rM27cVohJknBVUEZU5vHvXkaHYWpKeT2MbBAuV64Ft3srmc3Pd97zCYVDDfYkxxQiga3m/fveE=
X-Received: by 2002:ab0:1591:: with SMTP id i17mr13774827uae.41.1556139320202; 
 Wed, 24 Apr 2019 13:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190424184012.ivtlh3ikvwkcc6j4@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190424184012.ivtlh3ikvwkcc6j4@thinkpad.dyn.fuzziesquirrel.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Wed, 24 Apr 2019 15:55:09 -0500
Message-ID: <CAG5OiwhRSjqGfQZei+7HtCgfMMWpdS4pmvSzCHXdXAm3mQNicw@mail.gmail.com>
Subject: Re: TSC announcement
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 24 Apr 2019 20:55:24 -0000

Welcome Supreeth (and ARM)!

Kurt Taylor (krtaylor)

On Wed, Apr 24, 2019 at 2:05 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> Hi Everyone
>
> Just a quick announcement - Supreeth Venkatesh from Arm was
> (unanimously) voted onto the OpenBMC project TSC at the April 9th TSC
> meeting:
>
> https://github.com/openbmc/openbmc/wiki/TSC-Meeting#4919
>
> Please join me in welcoming Supreeth and Arm to the OpenBMC project
> leadership.
>
> thx - brad
