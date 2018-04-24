Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VsHT0567zF24D
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 04:26:59 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Apr 2018 11:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,324,1520924400"; d="scan'208";a="50470369"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2018 11:26:56 -0700
Date: Tue, 24 Apr 2018 11:26:56 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>,
 OpenBMC Development <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjoseph@in.ibm.com>
Subject: Re: Supporting insecure protocols in RMCP+
Message-ID: <20180424182656.GE130821@mauery>
References: <20180423184729.GA130821@mauery>
 <89D77F3D-487B-4FF6-B9B6-5528B8E297B7@fuzziesquirrel.com>
 <20180424153711.GD130821@mauery>
 <DC4DAAAA-D206-435B-94FE-2A82C5AB125D@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DC4DAAAA-D206-435B-94FE-2A82C5AB125D@fuzziesquirrel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 24 Apr 2018 18:27:01 -0000

On 24-Apr-2018 01:41 PM, Brad Bishop wrote:
>
>> On Apr 24, 2018, at 11:37 AM, Vernon Mauery <vernon.mauery@linux.intel.c=
om> wrote:
>>
>> On 24-Apr-2018 09:39 AM, Brad Bishop wrote:
>>>
>>>> On Apr 23, 2018, at 2:47 PM, Vernon Mauery <vernon.mauery@linux.intel.=
com> wrote:
>>>>
>>>>> Patch Set 4:
>>>>>
>>>>>> Given that RMCP+ is already insecure, unless it is a requirement to =
support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>>>
>>>>> 1,2,3 are marked as mandatory in the specification. It should be a co=
mmunity decision to revoke support for 1,2. If the community is ok, it will=
 need additional code changes.
>>>>
>>>> tl;dr IPMI is old; let's drop the most insecure parts
>>>>
>>>> Opening this up to a wider audience. I would like some community conse=
nsus on how we should deal with parts of specifications that don't make sen=
se anymore.
>>>>
>>>
>>> I agree.
>>>
>>> However, if someone came along and tried to add this back in
>>> (proving that there is at least one user in the world),
>>> I would let them (provided its opt-in behavior).
>>
>> I would push back.
>
>Why?  What does the project (or anyone) have to gain by making it harder
>for someone to use OpenBMC to meet their needs by requiring them to have
>out-of-tree patches or forks?

Why would we want to support insecure protocols? This doesn't make any=20
sense. We happily move on to the next version of web browser or openssl=20
when a new vulnerability is found. Nobody would insist that we must=20
support ROT13 as a symmetric cipher because they know it is nonsense. =20
And thus my next point.

>> Education is the fix, not less security.
>
>The fix to what exactly?  Customer requirements?  Not everyone is willing
>to say no to their customers.  I don=E2=80=99t think it is always (or even=
 usually)
>ignorance that leads to these kind of shortcuts.

Sometimes customers do need to understand that their requirements are=20
unsafe. It is up to the engineers who understand the security=20
implications that may not be obvious to the people who write the=20
requirements.

>> Call me an idealist.
>
>And call me a pragmatic.  I think if you apply this mode of thinking too
>often, there won=E2=80=99t be anyone left working on your code with you.  =
But hey,
>at least it will be _impossible_ for anyone to ever use it in an insecure
>manner.

No, I don't believe that is true. People want quality and security. Now=20
more than ever. No company wants their name in the headlines saying they=20
suffered a security breach. The BMC is in that fray and OpenBMC needs to=20
be at the front of the drive for secure coding and security standards. I=20
want people to use OpenBMC because they can trust it.

>> Even then, if they just could not live without it, it would have to be d=
one in a way that it can be compiled out by default.
>
>Of course this is reasonable.  There is a _huge_ difference between default
>behavior and no choice in behavior.

And yes, I would accept code that was compiled out by default if someone=20
really needed it. But first, I would take the time to talk them off the=20
edge first.

--Vernon
