Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3Nlb4WWrzDq88
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 11:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gh6EMxIT"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id a103so64329154ioj.1
 for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2017 18:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6sfXeKjD1UA7fL5kdBsQmkkebSXMzk7D/GEpvDVpH9M=;
 b=Gh6EMxITiY32At7AONjxpnmr/RgQ8/Ew2U1hFgILqtbJ0DF+x9GL+HDLRUEEhNO7C4
 AzjyKRHJKJWYfSnVv6JjJeIR+qCT+3H19n/wyfhZ0GqlRxH8786SCDQMFLHDx6mj1fXs
 lam3BQs+EHVw4JG45SZvUGNpk/uWAqVJ7CBLv5XrkH+sJRgTEWDZGMoEt8dOLtp4/qTw
 U0IWyquohWsMFOZEXbLPjaLwdtO7QtH1FIy+clyqlAw4DImTG6xLx2syVwfe5Rv4JoSs
 hBgiWM8z7M6PyWYOGwxsu8+DqFtYwsMP3xsN4hrLp5wY8Yr8bCLhaYhp9M0sa1RsBnuG
 n+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6sfXeKjD1UA7fL5kdBsQmkkebSXMzk7D/GEpvDVpH9M=;
 b=LCcBuetjLfTo6VPwPGrJK9UavmovzMpPlF7jsWTnStHL0UxwCUCdZeU7WmJ0Dn3kkE
 0Yp1lIEmak6zr9WOA/8Z4qvmDCTbCThkO7lBYr2UsHNJ/UioBnFZoprR/fecLnWzibPu
 i0vMsVS7bXIC+1Lc0SYvA58f57eq6kw6rthRgSK1/QqQ4t5Uv9CHZPAgBpaH38Wz+Jcq
 WUapCpWLnxlJn8Rvw/Z2cDVEC42ZoT0sIk+oUj/4fgvuT3pn+U1eZqrMUD+GqevX//dA
 z9YbUj3gse1z5zd7W8uRwCD6FQW8WzyC8TuEPcKuLwCubcm0SfOL2FBQg7ZEaDrGUc1x
 RZNg==
X-Gm-Message-State: AN3rC/7hwk5B4IRkRK58F2rnVsYUaGhRwGdT2YEWvxQvShkwggCzYYBi
 0sTsa9C7ouf/o5fG3QOnI0GVJowGpQ==
X-Received: by 10.36.199.197 with SMTP id t188mr25614336itg.85.1492047623693; 
 Wed, 12 Apr 2017 18:40:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.13.206 with HTTP; Wed, 12 Apr 2017 18:40:23 -0700 (PDT)
In-Reply-To: <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 13 Apr 2017 09:40:23 +0800
Message-ID: <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
Subject: Re: Running tests
To: Maxim Sloyko <maxims@google.com>
Cc: Matthew Barth <msbarth@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 13 Apr 2017 01:40:29 -0000

Hi Maxim,

After the SDK is installed, you need source the env:

# E.g. if SDK is installed in default localtion
. /opt/openbmc-phosphor/2.1/environment-setup-core2-64-openbmc-linux

And then

./bootstrap.sh
./configure --enable-oe-sdk
make test

=E2=80=94
BRs,
Lei YU

On Thu, Apr 13, 2017 at 6:51 AM, Maxim Sloyko <maxims@google.com> wrote:
> Hi Matt, thank you for your reply.
>
> So, I've done "Building the OpenBMC SDK" step from the cheatsheet:
>
> $ bitbake -c populate_sdk obmc-phosphor-image
> $ ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv=
5e-toolchain-2.1.sh
>
> Now when I do
>
> ./configure --enable-oe-sdk
>
> I get this error:
>
> checking whether we are cross compiling... configure: error: in
> `/usr/local/google/home/maxims/nong3-dev/phosphor-event':
> configure: error: cannot run C++ compiled programs.
>
> What am I doing wrong?
>
> On Wed, Apr 12, 2017 at 10:59 AM, Matthew Barth
> <msbarth@linux.vnet.ibm.com> wrote:
>> On 04/12/17 12:22 PM, Maxim Sloyko wrote:
>>>
>>> Hi all,
>>>
>>> I'm looking into ways to automate test execution for ... well ... as
>>> many things as possible. I see that some repos, like
>>> openbmc/phosphor-event for example, have tests in them, but the
>>> problem is, I can't build and run that project individually, because
>>> of missing dependencies (my libsystemd is too old).
>>
>> You can use bitbake to populate and install a x86_64 SDK environment tha=
t
>> you
>> would be able to source into allowing you to build the project and run t=
he
>> tests.
>> There is a configure flag (--enable-oe-sdk) that must be given to the
>> configure script
>> to setup some additional environment variables within the x86_64 SDK
>> environment. Here's a link with info on deploying an SDK:
>>
>> https://github.com/openbmc/docs/blob/master/cheatsheet.md
>>
>> Matt
>>
>>> So, my question is, is there a way to build and run those tests from
>>> bitbake, so that they would use the version of systemd from yocto,
>>> rather than the one installed on my machine?
>>>
>>> Hope this question makes some sense.
>>>
>>> Thank you!
>>>
>>
>
>
>
> --
> Maxim Sloyko
