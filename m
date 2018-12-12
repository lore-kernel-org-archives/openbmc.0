Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YOTF6yij"; 
 dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43F0kL3TwCzDqhl
 for <openbmc@lists.ozlabs.org>; Wed, 12 Dec 2018 13:14:33 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 81so16197535otj.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 18:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=d9Cbi4NDyxYrhMivm+Bgmhpcpw2r6Q6aUJxJjWeYaPA=;
 b=YOTF6yijAkZe49PtSiDdgyHSNZOkrxkmy24bnQf2aEodOgoSsXcW0XHk1gRgG9w58G
 XApYsI/3vqE54DxrfdD+AUmaHkGf6XGrABGmo6Qx6jw9n1tTvLfKMEl0rJtxH1Dulak+
 nDEEJtjugw0XgPl0abfkhRK/R3XBOF5R3IJHk06Yo56qFMdBKjFoF17Xb4+rNM/9pGBA
 Kqwno8PRP8AcjCLvbA/08KaN9Zc396MBE/EEkqlL3U/6MCGsBEfqSFJ96Tb5jPYqW7Pd
 CHHw4hVuSoS10wyi52e5aL/7C4CKK9WWY7RW8VeTpfUEvUyosqQHa3BsBF3zbc86AhS1
 CepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d9Cbi4NDyxYrhMivm+Bgmhpcpw2r6Q6aUJxJjWeYaPA=;
 b=p3XMSoWvZMImoEkjnzt0D6/fHi8sugvF3sm0CAVvag2MxC3rgkULI19A7b3TeTpD/v
 /D9KRdf8hkRML7m2RC5NoeZ4wWmh/XZNvFsAE9rtZVf78PSbveaTuQUiLpHBy0XsldDT
 crSFsdB0Av2MmUqINPfHcD/dVD432lB2aPKCkSovrFt8BsEBVZV3QwjzqmHy4k0CduO3
 YUA/YubEX/k1oFQ+jRjeQ2LSYibo2W6wjQ8cgrl1Ue4Kq0GawxbV1DLKAMhq4Av8UAeV
 dCM721b5WV+b3K3MRasGen5BsljTsSmmNFEzE63njMAM093QpIB7HL6DgNKwJpXFQaGQ
 /G7w==
X-Gm-Message-State: AA+aEWYvkqhcrzCC2TNGcnSEVMX5a26VChIdPr97aQHD90KfD9XOYnF+
 pbPL01lFLY1yAdaYPR12Sm0=
X-Google-Smtp-Source: AFSGD/XS0KFt8X+LwlDZ6tTwjJuQHTdbX5EG+mf7v/ErZ3JFBtpcNVvaak3Ieg0y5c/0DeAeHUhMhw==
X-Received: by 2002:a9d:a2d:: with SMTP id 42mr12048375otg.185.1544580872026; 
 Tue, 11 Dec 2018 18:14:32 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 52sm23286251oti.30.2018.12.11.18.14.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Dec 2018 18:14:31 -0800 (PST)
Subject: Re: MiTAC OpenBMC CLA application
To: ray.lue@mic.com.tw, openbmc@lists.ozlabs.org,
 "manager@lfprojects.org" <manager@lfprojects.org>
References: <AC132CC2BE8ECA4988A9953C168DE3C53AC20168@MICEXVMS02.mitacad.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <6babe9af-706f-7529-5c1c-9a8286531755@gmail.com>
Date: Tue, 11 Dec 2018 20:14:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <AC132CC2BE8ECA4988A9953C168DE3C53AC20168@MICEXVMS02.mitacad.com>
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
X-List-Received-Date: Wed, 12 Dec 2018 02:14:35 -0000

On 12/11/18 2:23 AM, ray.lue@mic.com.tw wrote:
> Dear OpenBMC maintainer,
> 
> This is BMC group of MiTAC Computing Technology Corp. http://www.mitac.com/
> 
> We¡¦ve worked on OpenBMC for around one year and now take it in some of 
> our next generation products.
> 
> We will like to be one of OpenBMC contributor to share what we developed.
> 
> Attached is MiTAC¡¦s signed CCLA file, please review and add to CCLA list.

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)

> 
> Thanks,
> 
> Ray
> 
> Firmware Design Dept.
> 
> MiTAC Computing Technology Corp.
> 
> E-Mail: ray.lue@mic.com.tw <mailto:ray.lue@mic.com.tw>
> 
> Tel: +886-3-396-2888 | ext 7512
> 
> Mobile: +886-911757655
> 
> www.mitac.com <http://www.mitac.com>
> 
