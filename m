Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w3VbR2CF6zDq7g
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 16:03:46 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3D5wudo019317
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 02:03:44 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29sx7r2e0v-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 02:03:44 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 13 Apr 2017 16:03:41 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 13 Apr 2017 16:03:39 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3D63VUx8323182
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 16:03:39 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v3D6377b025272
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 16:03:07 +1000
Received: from [9.193.99.166] (vishwa.in.ibm.com [9.193.99.166])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v3D6363s024895
 for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2017 16:03:06 +1000
Subject: Re: Running tests
To: openbmc@lists.ozlabs.org
References: <CAFR_W8po-K8Jjfd=qHzA=hO88stnQQDWEbNz2htm6b2DBqyHAg@mail.gmail.com>
 <57675cff-8d30-e550-0b45-d810f3c64426@linux.vnet.ibm.com>
 <CAFR_W8pc_AkHDxC_Tkr1ziShFDzCG2Ew_F-Ei-CquPPZmJGmWQ@mail.gmail.com>
 <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 13 Apr 2017 11:34:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtmFhWN3FhXnWD0AH6U1pDZcLM_K66L28PMZWQKF1J3j1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
x-cbid: 17041306-0040-0000-0000-00000306B696
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17041306-0041-0000-0000-00000C7E73DC
Message-Id: <0a092fda-9523-b33c-8879-314cfabc7a3c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1704130048
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
X-List-Received-Date: Thu, 13 Apr 2017 06:03:48 -0000

Lei has already explained the crux. Adding little bit more to what Lei 
already suggested, I see that your are missing on executing that script

I would do bash 
/tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-toolchain-2.1.sh

and then give it a location and then do the rest what Lei pointed out.

!! Vishwa !!

On 04/13/2017 07:10 AM, Lei YU wrote:
> Hi Maxim,
>
> After the SDK is installed, you need source the env:
>
> # E.g. if SDK is installed in default localtion
> . /opt/openbmc-phosphor/2.1/environment-setup-core2-64-openbmc-linux
>
> And then
>
> ./bootstrap.sh
> ./configure --enable-oe-sdk
> make test
>
> —
> BRs,
> Lei YU
>
> On Thu, Apr 13, 2017 at 6:51 AM, Maxim Sloyko <maxims@google.com> wrote:
>> Hi Matt, thank you for your reply.
>>
>> So, I've done "Building the OpenBMC SDK" step from the cheatsheet:
>>
>> $ bitbake -c populate_sdk obmc-phosphor-image
>> $ ./tmp/deploy/sdk/openbmc-phosphor-glibc-x86_64-obmc-phosphor-image-armv5e-toolchain-2.1.sh
>>
>> Now when I do
>>
>> ./configure --enable-oe-sdk
>>
>> I get this error:
>>
>> checking whether we are cross compiling... configure: error: in
>> `/usr/local/google/home/maxims/nong3-dev/phosphor-event':
>> configure: error: cannot run C++ compiled programs.
>>
>> What am I doing wrong?
>>
>> On Wed, Apr 12, 2017 at 10:59 AM, Matthew Barth
>> <msbarth@linux.vnet.ibm.com> wrote:
>>> On 04/12/17 12:22 PM, Maxim Sloyko wrote:
>>>> Hi all,
>>>>
>>>> I'm looking into ways to automate test execution for ... well ... as
>>>> many things as possible. I see that some repos, like
>>>> openbmc/phosphor-event for example, have tests in them, but the
>>>> problem is, I can't build and run that project individually, because
>>>> of missing dependencies (my libsystemd is too old).
>>> You can use bitbake to populate and install a x86_64 SDK environment that
>>> you
>>> would be able to source into allowing you to build the project and run the
>>> tests.
>>> There is a configure flag (--enable-oe-sdk) that must be given to the
>>> configure script
>>> to setup some additional environment variables within the x86_64 SDK
>>> environment. Here's a link with info on deploying an SDK:
>>>
>>> https://github.com/openbmc/docs/blob/master/cheatsheet.md
>>>
>>> Matt
>>>
>>>> So, my question is, is there a way to build and run those tests from
>>>> bitbake, so that they would use the version of systemd from yocto,
>>>> rather than the one installed on my machine?
>>>>
>>>> Hope this question makes some sense.
>>>>
>>>> Thank you!
>>>>
>>
>>
>> --
>> Maxim Sloyko
