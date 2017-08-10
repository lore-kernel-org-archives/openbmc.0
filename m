Return-Path: <dkodihal@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSj2l25xNzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:07:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7A94sNq130249
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 05:07:41 -0400
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c8kxcj72w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 05:07:40 -0400
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Thu, 10 Aug 2017 19:07:37 +1000
Received: from d23relay07.au.ibm.com (202.81.31.226)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 10 Aug 2017 19:07:37 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7A97atd25690228
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:07:36 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v7A97Rdi002514
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:07:27 +1000
Received: from Deepaks-MacBook-Pro.local ([9.202.55.23])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v7A97QxE002463
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:07:26 +1000
Subject: Re: phosphor-net-ipmid
To: openbmc@lists.ozlabs.org
References: <201706230720.v5N7K755030029@mactruck.svl.corp.google.com>
 <CAFd5g47f6Cd3GYnrZPKZ+Hnamm1narto9zmGffDpfyKdtAu-7g@mail.gmail.com>
 <595F2772.1020602@linux.vnet.ibm.com>
 <e480ae55aed543da94febf325a0c8713@yadro.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Thu, 10 Aug 2017 14:37:34 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <e480ae55aed543da94febf325a0c8713@yadro.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17081009-0008-0000-0000-00000152E740
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081009-0009-0000-0000-000009853ADB
Message-Id: <8f296825-df12-e95e-ce33-3368f0c95a55@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-10_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708100149
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
X-List-Received-Date: Thu, 10 Aug 2017 09:07:43 -0000

On 10/08/17 5:46 am, Vlad Vochenko wrote:
> Hello,
>
> I'm gonna implement issue #1855. Is it already assigned to someone?

No it isn't. Thanks for volunteering.

> Have a nice day!
>
>
> Regards,
>
> Vladislav
>
> ------------------------------------------------------------------------
> *From:* tomjose <tomjose@linux.vnet.ibm.com>
> *Sent:* Friday, July 7, 2017 9:17:22 AM
> *To:* Ilya Kuznetsov
> *Cc:* Vlad Vochenko; openbmc@lists.ozlabs.org; Patrick Williams
> *Subject:* Re: phosphor-net-ipmid
>
>
> Hello Ilya,
>
> Appreciate your interest in contributing to OpenBMC project!
>
> There is some good progress with the Sensor & SEL commands. The review
> is up in the
> gerrit server, please feel free to take a look.
>
> https://gerrit.openbmc-project.xyz/#/c/5048/
> https://gerrit.openbmc-project.xyz/#/c/4162/8
>
> We have started off with the implementation of the DCMI specification
> which is closely related to IPMI.
>
> https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/dcmi-v1-5-rev-spec.pdf
>
> It would be great if you would be able to lend a helping hand with this
> epic. The stories are getting
> broken down for this epic. If you are interested in this area, i would
> assign the following issue.
> The issue is updated with the necessary information to carry out the task.
>
> https://github.com/openbmc/openbmc/issues/1855
>
> We can catch up on IRC or on the mailing list to discuss further.
>
> Regards,
> Tom
>
> On Saturday 24 June 2017 12:02 AM, Brendan Higgins wrote:
>> Whoops, looks like you already hopped on the IRC. Anyways, welcome!
>>
>> On Fri, Jun 23, 2017 at 12:20 AM
>> <<mailto:brendanhiggins@google.com>brendanhiggins@google.com> wrote:
>>
>>     > Hello,
>>     > we would like to help with phosphor-net-ipmid and have
>>     volunteer. For us main
>>     > priorities are sensors and sel. Obviously work is in progress
>>     there and we don't
>>     > want to duplicate it, so please share tasks with us and tell how
>>     we can
>>     > contribute?
>>     > Thanks!
>>
>>     Awesome! Always great to see more people getting involved!
>>
>>     The first thing to do would be to hop on the IRC channel: #openbmc on
>>     freenode.net <http://freenode.net> and say hi to everyone.
>>
>>     Next, in order to see what tasks we have going on, install Zenhub:
>>     https://www.zenhub.com/. Then look at
>>     https://github.com/openbmc/openbmc#boards
>>
>>     Probably also a good idea to talk to Patrick and Tom (I CC'ed
>>     them). I am pretty
>>     sure they are more familiar with that codebase than anyone else.
>>
>>     Once you know what you want to work on, or even if you just need
>>     some help,
>>     either start a conversation on the IRC channel or send an email to
>>     the list.
>>
>>     phosphor-net-ipmid is not something I work on or am likely to work
>>     on in the
>>     near future, but I think I know most of the people on the list, so
>>     feel free to
>>     CC me on future emails and I will try to make sure the right
>>     people are involved
>>     in the conversation.
>>
>>     Cheers!

Regards,
Deepak
