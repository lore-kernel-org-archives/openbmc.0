Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VnT66KGPzF1RV
 for <openbmc@lists.ozlabs.org>; Wed, 25 Apr 2018 01:35:02 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Apr 2018 08:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,323,1520924400"; d="scan'208";a="50423459"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga001.jf.intel.com with ESMTP; 24 Apr 2018 08:34:56 -0700
Date: Tue, 24 Apr 2018 08:34:56 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>,
 MARRI DEVENDER RAO <devenrao@in.ibm.com>, Tom Joseph <tomjoseph@in.ibm.com>
Subject: Re: Supporting insecure protocols in RMCP+
Message-ID: <20180424153456.GC130821@mauery>
References: <20180423184729.GA130821@mauery> <20180423193027.GB130821@mauery>
 <EA662B0F-9F97-49FA-9D9B-8545CBFD3E3B@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <EA662B0F-9F97-49FA-9D9B-8545CBFD3E3B@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 24 Apr 2018 15:35:07 -0000

On 24-Apr-2018 09:17 AM, Brad Bishop wrote:
>
>> On Apr 23, 2018, at 3:30 PM, Vernon Mauery <vernon.mauery@linux.intel.com> wrote:
>>
>> On 23-Apr-2018 11:47 AM, Vernon Mauery wrote:
>>>> Patch Set 4:
>>>>
>>>>> Given that RMCP+ is already insecure, unless it is a requirement to support 1, 2, 15, and 16, you may just want to support 3 and 17.
>>>>
>>>> 1,2,3 are marked as mandatory in the specification. It should be a community decision to revoke support for 1,2. If the community is ok, it will need additional code changes.
>>>
>>> tl;dr IPMI is old; let's drop the most insecure parts
>>
>> While I am at it, can we agree
>
>I agree with all your points.  But why is consensus necessary?

Consensus is best when we are intentionally going against the IPMI 
standard. With IPMI, there may be several of these things where we might 
want to break the standard in order to provide better security. But I 
don't think we can do that unilaterally.

--Vernon

>> that anonymous and nameless accounts are dangerous. I know that the IPMI spec says that having an account with no name is mandatory, I think this is another case of security trumps the standard.
>>
>> I would at least like a way to disable this at build time so we CANNOT have this exploited.
>
>That sounds like a reasonable way to make the code do what you need.
>
>>
>> --Vernon
