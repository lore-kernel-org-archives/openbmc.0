Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428Jkk6xcLzF37j
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 05:58:21 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2018 12:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,356,1531810800"; d="scan'208";a="71871396"
Received: from mauery.jf.intel.com ([10.54.51.74])
 by orsmga007.jf.intel.com with ESMTP; 10 Sep 2018 12:58:05 -0700
Date: Mon, 10 Sep 2018 12:57:42 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: C++17 support?
Message-ID: <20180910195742.GA21308@mauery.jf.intel.com>
References: <CAARXrtk8AMsdTfAszZQozpsMUU-JckZmx6Pa7cvYnyD5cgLzVw@mail.gmail.com>
 <5BCE42E5-A136-480D-846D-7E201AC7734D@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5BCE42E5-A136-480D-846D-7E201AC7734D@fuzziesquirrel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 19:58:23 -0000

On 10-Sep-2018 09:00 AM, Brad Bishop wrote:
>
>
>> On Sep 10, 2018, at 3:06 AM, Lei YU <mine260309@gmail.com> wrote:
>>
>> Now we are using GCC 7.3 and it has full C++17 support, although it is
>> [experimental][1]
>>
>> Is it suitable for a product to use C++17 instead of C++14 in repos?
>
>It depends on your tolerance for risk and support structure.  So likely
>the answer depends on who you ask.

The rework of the IPMI daemon queue/registration/handler stuff I am=20
working on is moving onto using c++17 only.

Keep in mind that although the compiler has support for the new c++17=20
language constructs, the header library support still has not moved=20
everything over from experimental to the std namespace. So even if you=20
are specifying -std=3Dc++17 on the command line, you may need to include=20
the experimental header files for now.

>> So I would like to use C++17 in this repo, which then does not require a=
ny
>> code change to enable LinkTimeOptimization.
>
>I don=E2=80=99t have any problem with this.  In fact I much prefer we are =
at the
>bleeding edge.  I know that makes it hard for our users (system integrator=
s)
>to be confident but soon-ish we=E2=80=99ll have a stable release for those=
 with lower
>risk tolerance.

I like moving to c++17 and would suggest that we urge maintainers to=20
move sooner rather than later to catch and differences during=20
development rather than during a release cycle.

--Vernon
