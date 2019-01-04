Return-Path: <yong.b.li@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=yong.b.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W6RZ1lWtzDqGl
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 12:20:41 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jan 2019 17:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,437,1539673200"; d="scan'208";a="131393207"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2019 17:20:38 -0800
Received: from [10.239.197.33] (yongli3-mobl.ccr.corp.intel.com
 [10.239.197.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5E7DC58028E;
 Thu,  3 Jan 2019 17:20:37 -0800 (PST)
Subject: Re: journal log messages are missing with latest version
To: Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 William Kennington <wak@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
 <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
 <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
 <CAO=notzkJgHAxB8xoG_2qBtnRv3-D7pUji1ykqaTSSbn-T0j6g@mail.gmail.com>
 <CAO=notwS_RHpZ-j99zwcSgFa7Prp0qDVGpEy1r3O-nPWUG5CMw@mail.gmail.com>
From: "Li, Yong B" <yong.b.li@linux.intel.com>
Message-ID: <3a1d3ae9-e067-c166-96cd-b91f984de3d5@linux.intel.com>
Date: Fri, 4 Jan 2019 09:20:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwS_RHpZ-j99zwcSgFa7Prp0qDVGpEy1r3O-nPWUG5CMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 04 Jan 2019 01:20:43 -0000

Thanks Patrick for your mails.

Will test https://gerrit.openbmc-project.xyz/17054, and update the results.

On 1/4/2019 6:33 AM, Patrick Venture wrote:
> On Thu, Jan 3, 2019 at 2:28 PM Patrick Venture <venture@google.com> wrote:
>> On Thu, Jan 3, 2019 at 11:19 AM Patrick Venture <venture@google.com> wrote:
>>> On Thu, Jan 3, 2019 at 10:07 AM Matt Spinler
>>> <mspinler@linux.vnet.ibm.com> wrote:
>>>> On 2019-01-02 13:09, Patrick Venture wrote:
>>>>> On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com>
>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> Hi Patrick,
>>>>>>
>>>>>>
>>>>>>
>>>>>> I encountered a problem after upgrade to the latest opnebmc version:
>>>>>>
>>>>>>
>>>>>>
>>>>>> These log messages in ipmid are missing with the “journalctl -f”.
>>>>> Which log messages?
>>>>
>>>> This showed up on all of our systems too, anything logged using
>>>> phosphor-logging
>>>> is missing from the journal.  I even ended up using a git bisect to also
>>>> narrow
>>>> it down to:
>>>>
>>>> phosphor-logging: srcrev bump 30047bf964..31552c05e2
>>>>
>>>>       Patrick Venture (5):
>>>>             add sdjournal interface to inject tests
>>>>             test: use only one main library
>>>>             bugfix: add fixes to mock class
>>>>             bugfix: rename method to match implementation
>>>>             test: add test to force building of sdjournal mock
>>>>
>>> William, you've been digging into sdbus a lot recently, can you take a
>>> deep look at the patchset above and see what I may have messed up?
>>> The phosphor-logging unit-tests were broken until I got it "working."
>>> Which lead me to believe that it's not correct -- and the daemons that
>>> have unit-tests that hit the log message are seeing the calls.
>>  From reading more into the var_args pass-through, that may be the
>> issue.  One cannot pass the var args down directly like this.  I
>> propose to initially snip out this extra call and then revisit so that
>> it'll resume working.
> https://gerrit.openbmc-project.xyz/17054
>> The problem is that sd_journal_send doesn't expect a va_list argument,
>> but rather strictly var args, which aren't the same.
>>
>>>>>>
>>>>>>
>>>>>> My tests shows that the blow change is related, after I revert it, I
>>>>>> can get these log messages.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Did you meet such issue, or any suggestions/comments to narrow down
>>>>>> this issue?
>>>>>>
>>>>>> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066baa6f3711c88d6a3b9a5c4d49
>>>>>>
>>>>>> add sdjournal interface to inject tests
>>>>> There were some follow-on patches for phosphor-logging that you
>>>>> shouldn't need -- it's
>>>>>
>>>>> What SHA is for your https://github.com/openbmc/phosphor-host-ipmid ?
>>>>> (so I know what version of that is in use by you).
>>>>>
>>>>> Checking the HEAD version of
>>>>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile.am,
>>>>> I see it's including the proper libs to get the full phosphor-logging
>>>>> objects.
>>>>>
>>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Yong
