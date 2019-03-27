Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gNTkP9uG"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TsyB1qZdzDqBb
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 02:54:42 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id v84so13280063oif.4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vdSf45YxB6/Ft5Gf9jgq6dHywlPhWyS3Mohr5Nxc5wo=;
 b=gNTkP9uGfwGTCnwXt2YhiKSDGs8xikUytYmeWeHJZf4jp/ubkmabJ5YKd1OboedBzo
 FVnQdYJDNDA0rB7HKtNuPWSlEyPzF7eK+frq/N7L8bdbz4oM53EqLy/LIdvoFX9oqzrh
 9TNucox33VxmLFjTDcYAySAQrhhesXMR3syiatXuuaWVFd0M7a2OAMsWmD93iQ3mbUv0
 YzS6TE8iyY3+D9VeYn3tALbubjKjVh3QwR3ZSDS7dNzUC3QeB58QDKrbK75E89fIEeiA
 v59PGLTZZCd/yZzRb8CFqtKjwMvZWPuVtkM/+pyxq7ZtY2orwDdCeYyfs8RnDVBqaa2n
 mMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vdSf45YxB6/Ft5Gf9jgq6dHywlPhWyS3Mohr5Nxc5wo=;
 b=N3Az2Uh/rtvUOySfvWZSIMOnB0RxLzNDFcCW8kmN8Qk7pa1gXrdIgH1Qek5bAkzPer
 PnONXFIV1eV5pes0XCNOnf/IWSHlxWiKVED7SI0u5gBqLfIbyQsN0jBlVUqPokPu87p4
 AgKtwBxept4c69F3xpa4kXcvbAzfcGVV+vE8QUh4J725KLSZDIh/Wv+An4uY6X7dCBhA
 jOuVy3pNZYwvr9BlP7axL3a/vy3OxgDt6nWtPhNsojlgOzmibX3j2m2JDO5u5ryEI6Nw
 HNyTSylaNsFhbTb3d55dJ0Bq+U0zwxEjtprOnObIl7/wz4uYSECdg/2HY3rpNJMB1Mo/
 SxiQ==
X-Gm-Message-State: APjAAAUsFFT6Wv8cAP3VvLxIBgpu+xdtn8ceYMVv0IhC/pOxA/7+lTL+
 hIB9sCKSzx+6Tr34OYuaoNMbu8fh
X-Google-Smtp-Source: APXvYqw/JfV1DETtAFXAGSyFvgQOzBWifQI47/Ae40R1TAUYOKOoc/nMoSF/kpXCNl62asafn0LFQg==
X-Received: by 2002:aca:4b14:: with SMTP id y20mr17819663oia.95.1553702077926; 
 Wed, 27 Mar 2019 08:54:37 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id n12sm8756525otl.22.2019.03.27.08.54.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Mar 2019 08:54:37 -0700 (PDT)
Subject: Re: Quanta CCLA Schedule A update 2019-03-27
To: =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <0542ce3208f04d4a9a86545113013035@quantatw.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <edc46bd6-a909-ce1b-2112-49bfdf2efc93@gmail.com>
Date: Wed, 27 Mar 2019 10:54:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0542ce3208f04d4a9a86545113013035@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 27 Mar 2019 15:54:43 -0000

On 3/26/19 11:52 PM, Buddy Huang (¶À¤ÑÂE) wrote:
> Hi,
> 
> Quanta CCLA Schedule A is updated as attached file.
> Please help review and approve it.

Done. Thank you for keeping this schedule updated.

Kurt Taylor (krtaylor)
