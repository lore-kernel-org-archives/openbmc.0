Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSgKq2ZX1zDqrx
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eI7NVq3k"; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id u207so53989171ywc.3
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4g/PWCVs0lP0O4lY1ZZ8Cl2M1shw/ULKJEfyA+NZf2o=;
 b=eI7NVq3kGGjOOSkbx0KTzSNvjgWLaOkL67eBDiqaaWsK0fzzKFqlcxL+5XlENI2RAy
 zOO/Hicn//zqxjgoiNv8Bf8FS6Ask9U6sTrHM94NvLcRv6bW6Gkn+/4TYyVUajdlR8ll
 qgeb2UACsNvFk4d7QGMmQJUgyTDMz4j7JZGe1arPT1j1Zclg5kRIBuKpy0tn5rUQJvD+
 QJsIUpRukYW8mTxcLLJgkkJri9lv4KAgTSudUlHsCMeVSagHGuhGFzYBGFe/yxwMk671
 sxd1VmH0KeH5DmQnUA7o8hJsTgUkqW5b1G/Vu4gJlVH4n16ldSjrcghzMcPV3UCMbzWE
 Yk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4g/PWCVs0lP0O4lY1ZZ8Cl2M1shw/ULKJEfyA+NZf2o=;
 b=hAxbGuuzls1Jj1EZOSyPt16/dMtre900VKOQRtj+aRgxdQ7CaMs08i66AdQpv96kbz
 To7KxWiLZ0sNTLAJ6MLjGxlfzvMZeKApMpP96Rkij8itOWzE+I0LFbNsZWBJnUj6K04t
 wNwDjI28idph50GaaASc6551jAETtxfQVfkwUSm3jSg4kx6aAapWK30YVy735t+D+Qfi
 e/qfnCyS2cXVChK2tE7rYT+o7wC4ODqYBF6UERvyOpIAIDTiRGQRxWlZd+Lcmf1Er1cZ
 WcS4zNjTFR7Wh9DnLnkf8fKq5+b5Affq4fIi5etgtpI7RRYYgAcSVjkbC0mJQbTcrV3w
 opqA==
X-Gm-Message-State: AHYfb5guzDgqOV2owuiFp3TJLTNk6aRwp0CQLChAIYYZERrKz09Rc1X9
 004e/3oFQ2ZHLmcj0JzqJKCoGY26klBw
X-Received: by 10.129.31.197 with SMTP id f188mr9007495ywf.41.1502351437133;
 Thu, 10 Aug 2017 00:50:37 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Thu, 10 Aug 2017 00:50:16 -0700 (PDT)
In-Reply-To: <5121a5d2-61d0-7831-aa29-3164d3332af7@ozlabs.org>
References: <20170809191659.33078-1-cbostic@linux.vnet.ibm.com>
 <5121a5d2-61d0-7831-aa29-3164d3332af7@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Aug 2017 17:20:16 +0930
X-Google-Sender-Auth: xTXY0t-N3Yh0kvYkZGPZOXzJ1MI
Message-ID: <CACPK8XesUFrUbqHB5p7YYNQrGiK6u9mJ=Z+aRPXQq-1fMrNxPQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] fsi: core: Reduce console output during
 normal scan
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 10 Aug 2017 07:50:40 -0000

On Thu, Aug 10, 2017 at 7:27 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> To reduce amount of console output during boot / power up make
>> all good path scan related messages debug type.
>
> You beat me (and probably Joel too) to it :)
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Woot! Applied to dev-4.10.

Cheers,

Joel
