Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400zVK19dQzDqnT
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 02:36:40 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2DFZnV3016758
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 11:36:38 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gpgxm1rvg-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 11:36:37 -0400
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 15:36:32 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 15:36:29 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2DFaSbL61014098; Tue, 13 Mar 2018 15:36:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC8B842045;
 Tue, 13 Mar 2018 15:28:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A52142042;
 Tue, 13 Mar 2018 15:28:43 +0000 (GMT)
Received: from [9.77.199.212] (unknown [9.77.199.212])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Mar 2018 15:28:42 +0000 (GMT)
Subject: Re: IPMI Set LAN Configuration Parameters
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 Dave Cobbley <david.j.cobbley@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
 <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
 <20180214205327.GG113334@mauery>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 13 Mar 2018 21:06:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180214205327.GG113334@mauery>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031315-0008-0000-0000-000004DC0E30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031315-0009-0000-0000-00001E6F41E3
Message-Id: <f998fef8-0be3-8d1c-6856-768510a4cc9a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130183
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
X-List-Received-Date: Tue, 13 Mar 2018 15:36:41 -0000

Hello,

There is a patch up for applying the network settings, with this patch 
it would not require set channel access command to apply the changes.
A timer kicks in everytime set-complete happens, and the network 
settings are applied once the timer expires.

https://gerrit.openbmc-project.xyz/#/q/topic:2932

Regards,
Tom

On Thursday 15 February 2018 02:23 AM, Vernon Mauery wrote:
> On 14-Feb-2018 12:32 PM, Patrick Venture wrote:
>> I thought you had to explicitly set in_progress with the ipmitool?  My
>> own ipmitool utility is implemented as you described where it doesn't
>> assume anything about your intent, just follows the actions.
>
> Currently, ipmitool (incorrectly) sets the "set in progress" bit for 
> every lan configuration parameter it sets. Given how the CLI interface 
> only allows the user to specify a single parameter at a time, it might 
> be smart to have ipmitool also expose controls for the "set in 
> progress" bit. Alternately, providing a way to to specify multiple 
> parameters in a single call would be good. Something like:
>
> ipmitool lan set 1 ipaddr 1.2.3.4 netmask 255.255.0.0 gateway 1.2.0.1 
> dns 1.2.1.1 ipmitool lan set 1 ipsrc dhcp
>
> and it would automatically set and use the set in progress bit correctly.
>
> And ipmid could then take two actions, depending on how this bit is 
> (ab)used:
> 1) if only a single command is wrapped up in the 
> set-in-progress/set-complete, then employ a timeout so that after some 
> amount of time, all the queued commands get applied.
> 2) if multiple commands get wrapped up in the 
> set-in-progress/set-complete, then apply the command set when the 
> set-complete is received.
>
> Getting ipmitool changed to have correct behavior will take some 
> doing, so we will need to be able to deal with its incorrect behavior 
> for now. But also responding to correct behavior can make tools that 
> employ that behavior work even better (with no timeout delays).
>
> Just my $0.02.
>
> --Vernon
>
>> There's definitely the possibility of thrashing.
>>
>> On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
>> <david.j.cobbley@linux.intel.com> wrote:
>>> Do you have any concerns about ipmitool constantly flushing the 
>>> network as
>>> it sets & unsets the complete bit inbetween parameters,
>>> i.e. if you are setting 4 different parameters from a script?
>>>
>>> I'm not sure if this brings a lot of thrashing to the to the ipmi 
>>> network
>>> stack or network manager.
>>>
>>> Seems like it would be prudent to fix ipmitool upstream to allow you 
>>> to set
>>> multiple parameters, in addition to the ipmi stack.
>>>
>>>
>>>> I personally have found this non-standard implementation a bit
>>>> unpleasant, as it requires using a different command to basically
>>>> flush it.  I am planning to implement it such that setting in progress
>>>> before and complete after is how it all gets flushed instead of a
>>>> timeout, since that approach reads more correct given the
>>>> specification.  And really it's just about literally calling a
>>>> subroutine to flush everything when the in_progress bit is set to
>>>> completed, and removing the code from "access on"
>>>>
>>>> If you're interested to do what I've just described, I don't think
>>>> you'll get any push-back.
>>>>
>>>> Patrick
>>>>
>>>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
>>>> <david.j.cobbley@linux.intel.com> wrote:
>>>>>
>>>>> I noticed that when using ipmitool lan set <channel> <parameter>, the
>>>>> openbmc stack does not apply the settings. This seems like a 
>>>>> non-standard
>>>>> implementation. While using ipmitool as the standard is not quite
>>>>> correct,
>>>>> customers do expect it to work.
>>>>>
>>>>> After sending any sort of lan set command with ipmitool, the changes
>>>>> don't
>>>>> appear to stick and this message shows up in the journal:
>>>>>      "Use Set Channel Access command to apply"
>>>>>
>>>>> I know IPMI 2.0 is a little ambiguous about implementation 
>>>>> specifics, but
>>>>> I
>>>>> believe the intention was to utilize the "Set In Progress" bit 
>>>>> (Parameter
>>>>> 0)
>>>>> while doing work, and use "Set Complete" when you are finished to 
>>>>> flush
>>>>> the
>>>>> changes.
>>>>>
>>>>> To work around ipmitool constantly setting and unsetting the "Set In
>>>>> Progress" bit in between every parameter applied, some BMC stacks
>>>>> accumulate
>>>>> network changes over a period of time and apply after a timeout - 
>>>>> this is
>>>>> also compatible with ipmitool's non-standard use of the "Set In 
>>>>> Progress"
>>>>> bit.
>>>>>
>>>>>
>>>>> Is there a plan to circle back and change this functionality to 
>>>>> work with
>>>>> ipmitool in the future?
>>>>>
>>>>> Thanks,
>>>>> -Dave Cobbley
>>>>>
>>>
>
