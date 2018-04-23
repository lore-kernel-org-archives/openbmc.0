Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40VG6j0Z1XzDqGZ
 for <openbmc@lists.ozlabs.org>; Tue, 24 Apr 2018 05:02:17 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2018 11:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,319,1520924400"; d="scan'208";a="35540708"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga007.jf.intel.com with ESMTP; 23 Apr 2018 11:47:29 -0700
Date: Mon, 23 Apr 2018 11:47:29 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Cc: MARRI DEVENDER RAO <devenrao@in.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Emily Shaffer <emilyshaffer@google.com>, Tom Joseph <tomjoseph@in.ibm.com>
Subject: Supporting insecure protocols in RMCP+
Message-ID: <20180423184729.GA130821@mauery>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
X-List-Received-Date: Mon, 23 Apr 2018 19:02:21 -0000

> Patch Set 4:
>
>> Given that RMCP+ is already insecure, unless it is a requirement to 
>> support 1, 2, 15, and 16, you may just want to support 3 and 17.
>
> 1,2,3 are marked as mandatory in the specification. It should be a 
> community decision to revoke support for 1,2. If the community is ok, 
> it will need additional code changes.

tl;dr IPMI is old; let's drop the most insecure parts

Opening this up to a wider audience. I would like some community 
consensus on how we should deal with parts of specifications that don't 
make sense anymore.

Tables in section 13.28:
(authentication algorithm support)
00h: RAKP-none        Mandatory (recommend dropping support)
01h: RAKP-HMAC-SHA1   Mandatory (good, but not best; keep for now)
02h: RAKP-HMAC-MD5    Optional (not implemented; do not implement)
03h: RAKP-HMAC-SHA256 Optional (implemented; best available)

(integrity algorithm support)
00h: none             Mandatory (recommend dropping support)
01h: HMAC-SHA1-96     Mandatory (good, but not best; keep for now)
02h: HMAC-MD5-128     Optional (not implemented; do not implement)
03h: MD5-128          Optional (not implemented; do not implement)
04h: HMAC-SHA256-128  Optional (implemented; best available)

(confidentiality algorithm support)
00h: none             Mandatory (recommend dropping support)
01h: AES-CBC-128      Mandatory (implemented; best available)
02h: xRC4-128         Optional (not implemented; do not implement)
03h: xRC4-40          Optional (not implemented; do not implement)

The IPMI spec was written in a time when computing resources were 
minimal and before some of the real security awareness started. And as 
such, it contains some legacy stuff that should really be dropped or at 
the very least deprecated.

The IPMI spec only says that we must implement certain authentication, 
integrity, and confidentiality algorithms, it does not explicitly say 
what cipher suites must be implemented. But, if we implement every 
cipher suite that is available with the required algorithms, we would 
implement cipher suites 0, 1, 2, and 3. And if we added in sha256 
integrity and authentication, we add in 15, 16, and 17.

Just for comparison, DCMI 1.5 requires only 3, with 17 as recommended 
and 8 as optional. This is a step up from IPMI's security 
recommendations, but still not best. I would say that 3 and 17 should be 
required, with the recommendation that 3 be deprecated (or disabled at 
runtime) in favor of 17 only.

I think we can all agree that cipher suite 0 is poison. It is a gaping 
open door with bright lights saying, "Hack me!" I would argue that 
cipher suites 1 and 2 are not much better. We have the computing 
resources to perform better security, so we should do it. As web 
browsers move along, they deprecate and then disable old versions of 
SSL/TLS. We should do the same. Just because at one point in history it 
was fine to authenticate with plaintext passwords, does not mean we 
should continue to do so. If you know better, do better.

Even if end users come to us and say that they MUST have cipher suite 1 
or 2, I would argue that we should tell them to update their 
infrastructure rather than re-implement old insecure protocols.


--Vernon
