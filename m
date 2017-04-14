Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w44zp03fDzDq7c
 for <openbmc@lists.ozlabs.org>; Fri, 14 Apr 2017 14:53:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WAAzcORU"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id k87so81760187ioi.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 21:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9FFPmM04uzYOLIf/Tncenl2IsVEZGRLBMj8NySRD+Xs=;
 b=WAAzcORUO3ThRt3u6jSJGRc8zYxx7JkzDOfD2f9m+IaGP+pQjMgKp4KSAZemYZY0JY
 lWtD7AS6c1Dfr3jUhXq8XDW8AN1k86DR5zFmnA61sURXShD0jgVGsofHsla45yFJL4RJ
 eFQeCiO4OrLpiZdTzqdsMqvXwy1iubgLPDHJwACsiga7MAdddS1jC8upkV7AzHCjNIHL
 xxFbkKZbOcJyOudA3dTPcdwFyq8UCbHLkMNAthhkmFiCuosj5mcual/OQBhGYT8vCqMD
 AfMvzeyMusmSlrafLwarHI+bsTngVGIx+RxCFuWoZHis+hNelZysdQpdlH1kjd7I6j8v
 wbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9FFPmM04uzYOLIf/Tncenl2IsVEZGRLBMj8NySRD+Xs=;
 b=HX5lWrIr9HZImlPpD9Vp4R4sj5mWKwRXVaLOJIIkLQOy/1UpyA+EqWaFvDIKikV8lB
 DcX49bUfmR9vMXKhcygaxGp+7c04lnyUAvpl/nxny7uttsHzolUbYKx4zxio5sIX8EZ7
 T7z6nY2dLKz/i+2rVKqf0cE5nMy/DzpuRN7W5eTLQevRVKQOQjD3HDY74MBNCU6zDfIG
 u6q2hBTEJEvWRbOEstii1PxURmZV5tb8wOiyXzdQsFg6n6bRjXbR3m+xMUfNIIp6TdRT
 TmW1sNNSntQdY/LHJSflM8JON3D76RHKUti0yChW19bOEgCjLl/o7B4cRV+Cpw+lMgSK
 oEXw==
X-Gm-Message-State: AN3rC/6ltLmJsS9pTJjI+TDEmIHYgRu3C/8j+TPzqGMDq1otsX6WyOHD
 2GeX6+MGJsKePTHGtdCsDAx74baIJA==
X-Received: by 10.107.9.221 with SMTP id 90mr8281092ioj.191.1492145601815;
 Thu, 13 Apr 2017 21:53:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.13.206 with HTTP; Thu, 13 Apr 2017 21:53:21 -0700 (PDT)
In-Reply-To: <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
 <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
 <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
 <CAFR_W8pr6i4q0kma2eLTkGNG+Jzha6_pAFUqsnt5a+jJ0e7y_g@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 14 Apr 2017 12:53:21 +0800
Message-ID: <CAARXrtmOu49PO4kHb8O8fMTnVXMRyQHNT6RtK+s2VsW_+PzUqA@mail.gmail.com>
Subject: Re: Running tests
To: Maxim Sloyko <maxims@google.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
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
X-List-Received-Date: Fri, 14 Apr 2017 04:53:27 -0000

Hi Maxim,

The SDK you installed is armv5e, it can be used to build targets for
armv5, but it=E2=80=99s not for running tests on your host.

To build and install host SDK:

TEMPLATECONF=3D . oe-init-build-env # Set default build target
# Manually edit `conf/local.conf` to
MACHINE ??=3D "qemux86-64"  # x86-64 SDK
# or
MACHINE ??=3D "qemux86"  # x86 SDK
# Build SDK
bitbake -c populate_sdk obmc-phosphor-image
# Then you get ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor=
-image-core2-64-toolchain-2.2.sh

After you installed the x86 host SDK, you can run tests on host as my
previous mail.

Thanks!

=E2=80=94
BRs,
Lei YU

On Fri, Apr 14, 2017 at 12:53 AM, Maxim Sloyko <maxims@google.com> wrote:
> So, I installed the SDK (by running the shell script
> tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-t=
oolchain-2.2.sh),
> but I don't see anything named
> environment-setup-core2-64-openbmc-linux (or something similar) in it.
> The script that I have is named
> environment-setup-armv5e-openbmc-linux-gnueabi, which I suspect is
> what the problem is, because it sets up vars like
>
> export CC=3D"arm-openbmc-linux-gnueabi-gcc  -march=3Darmv5e -marm
> --sysroot=3D$SDKTARGETSYSROOT"
> export CXX=3D"arm-openbmc-linux-gnueabi-g++  -march=3Darmv5e -marm
> --sysroot=3D$SDKTARGETSYSROOT"
> export CPP=3D"arm-openbmc-linux-gnueabi-gcc -E  -march=3Darmv5e -marm
> --sysroot=3D$SDKTARGETSYSROOT"
>
> and this does not look like what I want it to be.
>
> On Wed, Apr 12, 2017 at 11:04 PM, vishwa <vishwa@linux.vnet.ibm.com> wrot=
e:
>> Lei has already explained the crux. Adding little bit more to what Lei
>> already suggested, I see that your are missing on executing that script
>>
>> I would do bash
>> /tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e=
-toolchain-2.1.sh
>>
>> and then give it a location and then do the rest what Lei pointed out.
>>
>> !! Vishwa !!
>>
>>
>> On 04/13/2017 07:10 AM, Lei YU wrote:
>>>
>>> Hi Maxim,
>>>
>>> After the SDK is installed, you need source the env:
>>>
>>> # E.g. if SDK is installed in default localtion
>>> . /opt/openbmc-phosphor/2.1/environment-setup-core2-64-openbmc-linux
>>>
>>> And then
>>>
>>> ./bootstrap.sh
>>> ./configure --enable-oe-sdk
>>> make test
>>>
>>> =E2=80=94
>>> BRs,
>>> Lei YU
>>>
>>> On Thu, Apr 13, 2017 at 6:51 AM, Maxim Sloyko <maxims@google.com> wrote=
:
>>>>
>>>> Hi Matt, thank you for your reply.
>>>>
>>>> So, I've done "Building the OpenBMC SDK" step from the cheatsheet:
>>>>
>>>> $ bitbake -c populate_sdk obmc-phosphor-image
>>>> $
>>>> ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-arm=
v5e-toolchain-2.1.sh
>>>>
>>>> Now when I do
>>>>
>>>> ./configure --enable-oe-sdk
>>>>
>>>> I get this error:
>>>>
>>>> checking whether we are cross compiling... configure: error: in
>>>> `/usr/local/google/home/maxims/nong3-dev/phosphor-event':
>>>> configure: error: cannot run C++ compiled programs.
>>>>
>>>> What am I doing wrong?
>>>>
>>>> On Wed, Apr 12, 2017 at 10:59 AM, Matthew Barth
>>>> <msbarth@linux.vnet.ibm.com> wrote:
>>>>>
>>>>> On 04/12/17 12:22 PM, Maxim Sloyko wrote:
>>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> I'm looking into ways to automate test execution for ... well ... as
>>>>>> many things as possible. I see that some repos, like
>>>>>> openbmc/phosphor-event for example, have tests in them, but the
>>>>>> problem is, I can't build and run that project individually, because
>>>>>> of missing dependencies (my libsystemd is too old).
>>>>>
>>>>> You can use bitbake to populate and install a x86_64 SDK environment
>>>>> that
>>>>> you
>>>>> would be able to source into allowing you to build the project and ru=
n
>>>>> the
>>>>> tests.
>>>>> There is a configure flag (--enable-oe-sdk) that must be given to the
>>>>> configure script
>>>>> to setup some additional environment variables within the x86_64 SDK
>>>>> environment. Here's a link with info on deploying an SDK:
>>>>>
>>>>> https://github.com/openbmc/docs/blob/master/cheatsheet.md
>>>>>
>>>>> Matt
>>>>>
>>>>>> So, my question is, is there a way to build and run those tests from
>>>>>> bitbake, so that they would use the version of systemd from yocto,
>>>>>> rather than the one installed on my machine?
>>>>>>
>>>>>> Hope this question makes some sense.
>>>>>>
>>>>>> Thank you!
>>>>>>
>>>>
>>>>
>>>> --
>>>> Maxim Sloyko
>>
>>
>
>
>
> --
> Maxim Sloyko
