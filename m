Return-Path: <maxims@google.com>
Received: from mail-it0-x236.google.com (mail-it0-x236.google.com
 [IPv6:2607:f8b0:4001:c0b::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w4XXH2BvKzDq8M
 for <openbmc@lists.ozlabs.org>; Sat, 15 Apr 2017 08:34:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jdhGNMjy"; 
 dkim-atps=neutral
Received: by mail-it0-x236.google.com with SMTP id e132so1621151ite.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 15:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UZoGhEk1Pk6quEtqqXUhsNHhlaE3Yg1RfRXW8C9iXb8=;
 b=jdhGNMjyywffojje/3dL+2xp3/IEFBo1e+4X6weCJrJuTKPzpZrI2soj0LerH67eOv
 VIzCJvubzSa/VtB/FyUDJLvAGjYo5ZC0HyYPojy+ot8yRuI/h/59TqnHHG96i0G8JvJs
 +6dDaS/9ioR3tiFd/pa6Jr/5/lHtn5ZM+0mtkLaE36vau4iRI1KrviIq8wLLawfz1CvD
 54/FHOhf8o4XE3axrcKTwU93GTRzjWSsVFIgofvdqpycq74JjIXiPeSicM7rBqa7tSMw
 yXMRCgo1f5MDTptzb320LYMsGcZGM7dHy9t3Qfu23eZh/2aMEo1/YRbgP48964FLAAHF
 KIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UZoGhEk1Pk6quEtqqXUhsNHhlaE3Yg1RfRXW8C9iXb8=;
 b=cgkOYYvuUrKwaptjmwvUDFZOWU1tPVQCbxGgKPq03qJahVMNowwHIEopV9ihvUq8an
 DV3sd9SzfiI5254CSujng6iv2N0GPLrjvT2q2DnUh7SAu/YTR3BoQ5Yi+zNBP0RMYjtT
 4cX2Y+1XFg1zjFcsx0mChe13l9ks8uLEdh+WTfPbil9bMJXnsJebsBbelakgCJ4bayuO
 9kEb7FU2diWqJlnUpcrJvUv+2nlNvYfuYoINR29MxhWOw6f+J48dksZxgaeQhjuv1z4W
 QEReIO+gp0zAM6iDgKKHZVX6oKKL6JWUbqRQb9HoNegz25a/bE8ESjNdlgMkhh7ogTFo
 o5BQ==
X-Gm-Message-State: AN3rC/7TIS3G2IrkBWQvjtsqm6cJQlPD88EChVAoaT7cjQ4SkwpDOKC2
 4O2lHyOLUAm2dQeXQ/it7VCeOc9ZefTC
X-Received: by 10.36.76.16 with SMTP id a16mr782230itb.91.1492209276827; Fri,
 14 Apr 2017 15:34:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Fri, 14 Apr 2017 15:34:36 -0700 (PDT)
In-Reply-To: <20170414150915.p4jdh753kfcpvamt@asimov>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
 <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
 <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
 <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
 <20170414150915.p4jdh753kfcpvamt@asimov>
From: Maxim Sloyko <maxims@google.com>
Date: Fri, 14 Apr 2017 15:34:36 -0700
Message-ID: <CAFR_W8r_AmYFpqo81XfX8JCeDhAxovN70kh=DHjOYP-Bv8shsw@mail.gmail.com>
Subject: Re: Running tests
To: Patrick Williams <patrick@stwcx.xyz>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 14 Apr 2017 22:34:39 -0000

Thanks, I was able to successfully build x86 SDK with this instructions.

FWIW, the ./configure --enable-oe-sdk step was still failing with the
same error though, I had to run it as ./configure --enable-oe-sdk
--host x86_64, but make check did succeed after that.

Thanks again!

On Fri, Apr 14, 2017 at 8:09 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Maxim,
>
> I think you have two issues:
>
> 1) If you are running on an x86-host, you need to have an x86-target SDK
> in order to compile and run on the x86-host.  Typically, we use the
> qemux86-64 MACHINE.
>
> 2) When you run ./configure, you need to pass a set of options that
> OE-SDK has set up:  ./configure ${CONFIGURE_FLAGS} --enable-oe-sdk
>
> --
> Patrick Williams



-- 
Maxim Sloyko
