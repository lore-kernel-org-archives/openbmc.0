Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::22e; helo=mail-oi0-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ucAHPCeU"; 
 dkim-atps=neutral
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mXhW5dKvzDqCD
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 01:47:54 +1000 (AEST)
Received: by mail-oi0-x22e.google.com with SMTP id n21-v6so10641747oig.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 08:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MM6TQw/ECIJZhPeii2rf2WSpjjdcUsxLdXJuBT8dbTg=;
 b=ucAHPCeUwRI0iCyItPU5wdxxgDYQnVywtn6fCVdBFzwVqUs9WN02Sa2ionwsBEOQSd
 ATfL+7g0yjmJ71MwN6uKkswuLV8+E2Sex8HeMLZzalK1Eyw5uezcDUkQ3d1aB5BS23HU
 mxkzrEi8/stYN1I0PBuxMJBLgR5pXUyYnb8PnreWzahwZCkRIzLsTZQs3IZ2afITkhxs
 1dKXRj/P3CHBT3y98k7GNfRX6qGYiJUmXPRAiUwCoJKsITzvE44xH+2dhzr+Ym2XIHUQ
 FE4H3e/333wA9s/xQ29qpvEpZoTe6sxfQmPurp92FaasaJmFfSa4vDafBdMfhfGOTtkh
 OsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MM6TQw/ECIJZhPeii2rf2WSpjjdcUsxLdXJuBT8dbTg=;
 b=H6hCYDvKgFFE+qefrejgNQSS2RpTlWVxcw+pufITdbtcR7t5gFJC9IPBosj6NVG4kF
 Z0fleCUQaODJ1+Z9fhu451jgOdC3nhRUvbdfBJHDD5RdwGoQFQ5LvU+KuwtBlifHK1l2
 vrLHm+n4aVK2Blob2UTTXEsXiXNfa0Hd2HpRLeZXhDXAr8KYuiLiNvl/6RlBwFzPj8Vy
 mAUcceMy5+YSAwceR2f5d5kPaMjx0kHMMrml58OblpxNz3R2bpFYmCS+Tnh/Dsbcb5YW
 FM193zRPERqRvtBgFmBDNmfNQq7NMVI0Fq/YiMlJyz4tbhHaPSt7r8ql5lRrhYmEKznM
 LOhg==
X-Gm-Message-State: AOUpUlGSwrNU8FkxZcxs8ufsmr0KfExcge6K38UElGtXUmoigDPiSltQ
 ou+lljyHRu2cHm8dyP4dSzwOPddU
X-Google-Smtp-Source: AA+uWPw+hM6rhLjKPRRx1yfCtFFG2eIxFdc/SVCFj/9H3qqtERn0OmOCTvN0ElJ5zCCXunxQcx1/gg==
X-Received: by 2002:aca:ef87:: with SMTP id
 n129-v6mr2720775oih.161.1533829671797; 
 Thu, 09 Aug 2018 08:47:51 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local
 (cpe-72-182-100-19.austin.res.rr.com. [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id r10-v6sm6599743oif.37.2018.08.09.08.47.50
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Aug 2018 08:47:51 -0700 (PDT)
Subject: Re: Licensing Question
To: openbmc@lists.ozlabs.org
References: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <4cda5582-7307-2418-e5f2-679cc051e66a@gmail.com>
Date: Thu, 9 Aug 2018 10:47:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzP1FWobbpUhqdf8ZrGRqsNZvZHBp=8cmXZjWOL0dcCrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 09 Aug 2018 15:47:57 -0000

On 8/8/18 5:45 PM, Patrick Venture wrote:
> So, I've spent the last hour trying to submodule my way to using
> ipmitool.  I've managed to get it compiling for just the one file I
> need (or want).  However, then I try to link it and then more failures
> for things that are missing, such as helper methods.  So, then I add
> the file that has those, and then it doesn't compile because that file
> doesn't compile.  This is of course, not compiling with the -Werror
> flag among other things with gcc.
> 
> So, I can keep battling this, or I can ask -- the license for the
> ipmitool just says I need to keep a copy of the license with the
> source if I reuse it.  So, I can do that, and I can hack it up to work
> -- but where I'm curious is -- how does that impact the license of
> phosphor-ipmi-flash?

Not a legal professional. That said, it depends on the license and 
linking, packaging, etc.

I am assuming phosphor-ipmi-flash is Apachev2, so linking to any GPL may 
have viral effects. ipmitool looks to be bsd so it *should* be ok.

Kurt Taylor (krtaylor)
