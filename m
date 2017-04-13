Return-Path: <maxims@google.com>
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3n1W4yvqzDq7g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 02:53:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X6LaoUWz"; 
 dkim-atps=neutral
Received: by mail-io0-x22f.google.com with SMTP id k87so66862057ioi.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=56Y9uaWON5mbTY+kauhUJVjjJcAB+z6LsfCuXD65W+A=;
 b=X6LaoUWzXC0HkFPBHRQd8TbGizUkkgp1/GQmlqW4RJ0EQq7d765TCwpb1q/I+iZ/m6
 Eh4wvR3gStBj9BP6QF1rsXIyqQac8YljEy2G7BoAasTtMOJiJvdgcTR8Z/8FJX23YHnR
 Ns42eDtfcaZGnkdJVJoc3E6GZdlezth1s95/RvFfm2SE/87Q96fKlFRcTf5pvhh1lWTi
 /NMTpDJP4Nm9dBNCoYUvvlQKz85xk9OfyInqAjSnRdgng2ZKukXbd8getqR0SWquz7aG
 mzsXCxJ2tHrD7aU47+q8M6tT6Vp0ybVPd/aCPAb3H9fjPTvqPm8y1/MEzNiJQntXKVjj
 q72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=56Y9uaWON5mbTY+kauhUJVjjJcAB+z6LsfCuXD65W+A=;
 b=NRfTwQGwKGu4z9NeiPeBwHJQH09xDis6lh8+DNRtSiAUiYkVOMq/c6mXGVFfthMRg5
 +OIwyBLyHHtRcmKFFn+g1Idc7ADmUviiD54ZuxcN5d0FgGJWroYL5T1RUeojQhsjMngi
 BZPJ9mLmAYF4EqnMfZwjpioXMFsdwsEQPvgAwTNvxSa6hfX+bsgck27LmBaGilb3MNrD
 GyNXIbmZO9z/Trt+vFkZRGxrN6FGB7qpjOU0Ug+s/N8V2LS0Gt7ts1aSxiE6PVVk3ot5
 sTWavNxePyZURBTpJbwlO14XzLx+Sb5Y8xmvZ0i+DH1JGDnxrHG08XwINvQlHm4Ti7rb
 cEaQ==
X-Gm-Message-State: AN3rC/5QnIHF+dIkToi/p8wsfGMyRBvhPkNVBpEBQN3crRAVMTBkfEzf
 f/oN5V8zW5QfIGosxEQ6dh6vzmIPU6xq
X-Received: by 10.107.32.199 with SMTP id g190mr4737356iog.117.1492102427685; 
 Thu, 13 Apr 2017 09:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.185.7 with HTTP; Thu, 13 Apr 2017 09:53:47 -0700 (PDT)
In-Reply-To: <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
 <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
 <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 13 Apr 2017 09:53:47 -0700
Message-ID: <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
Subject: Re: Running tests
To: vishwa <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 13 Apr 2017 16:53:52 -0000

So, I installed the SDK (by running the shell script
tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-too=
lchain-2.2.sh),
but I don't see anything named
environment-setup-core2-64-openbmc-linux (or something similar) in it.
The script that I have is named
environment-setup-armv5e-openbmc-linux-gnueabi, which I suspect is
what the problem is, because it sets up vars like

export CC=3D"arm-openbmc-linux-gnueabi-gcc  -march=3Darmv5e -marm
--sysroot=3D$SDKTARGETSYSROOT"
export CXX=3D"arm-openbmc-linux-gnueabi-g++  -march=3Darmv5e -marm
--sysroot=3D$SDKTARGETSYSROOT"
export CPP=3D"arm-openbmc-linux-gnueabi-gcc -E  -march=3Darmv5e -marm
--sysroot=3D$SDKTARGETSYSROOT"

and this does not look like what I want it to be.

On Wed, Apr 12, 2017 at 11:04 PM, vishwa <vishwa@linux.vnet.ibm.com> wrote:
> Lei has already explained the crux. Adding little bit more to what Lei
> already suggested, I see that your are missing on executing that script
>
> I would do bash
> /tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-=
toolchain-2.1.sh
>
> and then give it a location and then do the rest what Lei pointed out.
>
> !! Vishwa !!
>
>
> On 04/13/2017 07:10 AM, Lei YU wrote:
>>
>> Hi Maxim,
>>
>> After the SDK is installed, you need source the env:
>>
>> # E.g. if SDK is installed in default localtion
>> . /opt/openbmc-phosphor/2.1/environment-setup-core2-64-openbmc-linux
>>
>> And then
>>
>> ./bootstrap.sh
>> ./configure --enable-oe-sdk
>> make test
>>
>> =E2=80=94
>> BRs,
>> Lei YU
>>
>> On Thu, Apr 13, 2017 at 6:51 AM, Maxim Sloyko <maxims@google.com> wrote:
>>>
>>> Hi Matt, thank you for your reply.
>>>
>>> So, I've done "Building the OpenBMC SDK" step from the cheatsheet:
>>>
>>> $ bitbake -c populate_sdk obmc-phosphor-image
>>> $
>>> ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv=
5e-toolchain-2.1.sh
>>>
>>> Now when I do
>>>
>>> ./configure --enable-oe-sdk
>>>
>>> I get this error:
>>>
>>> checking whether we are cross compiling... configure: error: in
>>> `/usr/local/google/home/maxims/nong3-dev/phosphor-event':
>>> configure: error: cannot run C++ compiled programs.
>>>
>>> What am I doing wrong?
>>>
>>> On Wed, Apr 12, 2017 at 10:59 AM, Matthew Barth
>>> <msbarth@linux.vnet.ibm.com> wrote:
>>>>
>>>> On 04/12/17 12:22 PM, Maxim Sloyko wrote:
>>>>>
>>>>> Hi all,
>>>>>
>>>>> I'm looking into ways to automate test execution for ... well ... as
>>>>> many things as possible. I see that some repos, like
>>>>> openbmc/phosphor-event for example, have tests in them, but the
>>>>> problem is, I can't build and run that project individually, because
>>>>> of missing dependencies (my libsystemd is too old).
>>>>
>>>> You can use bitbake to populate and install a x86_64 SDK environment
>>>> that
>>>> you
>>>> would be able to source into allowing you to build the project and run
>>>> the
>>>> tests.
>>>> There is a configure flag (--enable-oe-sdk) that must be given to the
>>>> configure script
>>>> to setup some additional environment variables within the x86_64 SDK
>>>> environment. Here's a link with info on deploying an SDK:
>>>>
>>>> https://github.com/openbmc/docs/blob/master/cheatsheet.md
>>>>
>>>> Matt
>>>>
>>>>> So, my question is, is there a way to build and run those tests from
>>>>> bitbake, so that they would use the version of systemd from yocto,
>>>>> rather than the one installed on my machine?
>>>>>
>>>>> Hope this question makes some sense.
>>>>>
>>>>> Thank you!
>>>>>
>>>
>>>
>>> --
>>> Maxim Sloyko
>
>



--=20
Maxim Sloyko
