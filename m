Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jB05x0L2"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BGJJ1vhRzDsSm
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 02:15:59 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id x23so3631570oix.3
 for <openbmc@lists.ozlabs.org>; Fri, 07 Dec 2018 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VSHk4KeIo6dyDXJjpENKcruErjrG3Ng8jTvq4lMWMbE=;
 b=jB05x0L2OuRfcrJq+FnY11baoNjT9xl/SswbNqKLfgRNCRh1tcZKhcowTMMbnBQ8oU
 x9gvmQTpY/mMO9zts48sNEmIGdjfd4ioVNZ4Fo+92F8S9GIFqbiVoCSYA0/qiTvWHjI3
 7JI9TcyydJM2EsG4o53shyhTA94JYZQpT+lT9cMWNxQa6MjJJbrSANXsfUfEEIqHrifA
 RHsbh23OeHipsDH/UJt65RCzp5kl3hhG+wo0lybGom2dsWXV0Vwy4anjtbOJDBvsjpNn
 ZDqEziGLRZ3UAgUs4mkaVnclh1kBTu9rwQ93/bOMj4jLuZtTRSoGvPj+QkbQCQg1QuLa
 K+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSHk4KeIo6dyDXJjpENKcruErjrG3Ng8jTvq4lMWMbE=;
 b=VN34LuQaD8j5R3yvyGHrvH5b9vDnXn3b35qe1NKQwQBK5lGro2ksUMKlGFpfhWoXDh
 kG2OXhyyLkxxkXKBJnD8HqyuqmWVW2fv5OYBzu/E2c5Ru/PMba5hq2ZmzOx2kFVfBOIO
 SOYTzEU0R+yH6d1CfTrgoqQuadgs6Q3y/b0lSFZJ1S2vQ31Ft5yYZeTHDlnbJwceTjSL
 x2U6sJYyNhNvXhZZhXr5OGKGft1Nr1vf8JKB0G12ls9JxUn1GcZzYHP/xNULGBWYFIUh
 NJJPDVCZ2vPdC3zOkekbLpgFp0zPtjFAYRJ4Z4hwesp6mEon6x7JI9ZcVBtsPU3xJ1vU
 Zijg==
X-Gm-Message-State: AA+aEWb25jg8IWcf0U9gBuy4DC7gDzcvMIujaDTNYOXzbRV3nlFHITBy
 CD0KjG3oSASGF8GfxANHkZI=
X-Google-Smtp-Source: AFSGD/V9l+GzpwqJR32SGeQA+HW4YB8yRnoJW5tFZCmXuK+i811sOYgRR1y4cjwMtdwOTnYrPG/43Q==
X-Received: by 2002:aca:62d7:: with SMTP id w206mr1501861oib.121.1544195757617; 
 Fri, 07 Dec 2018 07:15:57 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 4sm1730886otw.39.2018.12.07.07.15.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 07:15:56 -0800 (PST)
Subject: Re: Signed CCLA from ASSET InterTech
To: Alan Sguigna <asguigna@asset-intertech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "manager@lfprojects.org" <manager@lfprojects.org>
References: <0be69282480b4609ae01277685f8bb9f@MBX083-E1-VA-4.EXCH083.serverpod.net>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <49bc8f32-b14b-409c-9d2c-d40dde7744e2@gmail.com>
Date: Fri, 7 Dec 2018 09:15:55 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.2
MIME-Version: 1.0
In-Reply-To: <0be69282480b4609ae01277685f8bb9f@MBX083-E1-VA-4.EXCH083.serverpod.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 07 Dec 2018 15:16:01 -0000

On 12/6/18 2:18 PM, Alan Sguigna wrote:
> Please find attached the signed CLA from ASSET, for approval.
> 
> Thanks,
> 
> Alan.
> 

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)
