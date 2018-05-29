Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VTSuDAfC"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40wKqK1jLgzDr43
 for <openbmc@lists.ozlabs.org>; Wed, 30 May 2018 03:05:32 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id f13-v6so19550813qtp.10
 for <openbmc@lists.ozlabs.org>; Tue, 29 May 2018 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=M1EBDq5OQRhn7NVPI0M6Nav4eGEpp+WJV7ut5buZi70=;
 b=VTSuDAfCjCkbTNgdwWItbBkCpvkRnTwhM1jfxglQmnRSrqkIURdd58HCdlB9OyAD3+
 L6vzoxp41Niee1XVGHWNlVLS7+goC6JdZTd5dNgr/aDsr3q5eToEJdK+XKPGB55DU8DW
 PAhK523Huh7GBD9FL/b+a0ZpxZ0xaWzy0kRA4iLeIp0qTGIInLAWLS09ctoEQWhvvNNF
 3W+/W3hqp/SU8YPKM3B+zMrySwpckYgygno4OXug4zi9Gx880x0Cm5aiOPIRmG+ZCPL3
 DeYhO9m7ol58H0p+BxexIectBcM0wHFg5Nynfe4BeW5wBjS/wtmEQlnSMdNYHQFrGjb5
 hG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=M1EBDq5OQRhn7NVPI0M6Nav4eGEpp+WJV7ut5buZi70=;
 b=AxlIdmASmUqVqV7FZXUF4/vUloemxIg04ZPXfd/QP5/i4Fx7N1rKEsBSiifUOdSNKC
 P8XeAFRMd8lG7+4ysFct+i3+3/qNzwSAyijNFiYWHhXGcLcrvgqYGl1zL2kZf5horod5
 +A+KKQMpvHRVQr0Cci/bhwjgCmRJ/IFp/ILGBDCrhntQrW3yJJaVCETEc8LOhXKQqb8w
 VZhTIhrhzeZ1oFQK5O8+RzeEttx12GzNLYhAZ4oMT5wEMPRCvt0f5jprotLD2p9bsB1d
 +EyC0GoIAH6lLRA6ME07xh8CYydX8luEYBMPrV9WDSsz264GkXkzcZntycOYi71NwHcs
 T4yQ==
X-Gm-Message-State: ALKqPwec/B0BT0Mg1PYuMYKIL7V+jRVvD/66AJ42vXoP45RA0MLKBSrA
 n9W6tEtnX0Z5qntCvt1V6SGL7KMFnjKjDW6HSwk=
X-Google-Smtp-Source: ADUXVKKzYesiZxKhE8vGektWyZ8pT3g0Xf7Ut/d13keAhOJLl2GC7Zt9X+cS3ddNyAlOl4/Z0qftz5wLN7ulPAT8UmU=
X-Received: by 2002:aed:23d0:: with SMTP id
 k16-v6mr17876073qtc.20.1527613529656; 
 Tue, 29 May 2018 10:05:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:04:59
 -0700 (PDT)
In-Reply-To: <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
 <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:04:59 -0700
Message-ID: <CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame
 recipe
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 May 2018 09:05:36 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 17:05:34 -0000

On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Ping - is there anything I need to revise for this patch or the following two?
>

There was a review comment for you to adress, see

https://patchwork.openembedded.org/patch/150467/

if you have addressed that please send a v3 for whole series.

> Cheers,
>
> Andrew
>
>> ---
>>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
>>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
>>  2 files changed, 13 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
>> meta-python/recipes-devtools/python/python-pyflame.inc
>> new file mode 100644
>> index 000000000000..3b84a7e8f8e3
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
>> +HOMEPAGE = "https://github.com/uber/pyflame"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://${S}/
>> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> +DEPENDS = "python"
>> +
>> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig autotools
>> +
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> new file mode 100644
>> index 000000000000..96f03305f883
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> @@ -0,0 +1 @@
>> +require python-pyflame.inc
>> --
>> 2.14.1
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
