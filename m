Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mqzw50wgzDqrN
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 13:17:16 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 74BA8129928;
 Thu,  9 Aug 2018 23:17:13 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Managing openbmc with subtree
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <fe79284e-e3d6-a71f-f055-6bcbe899fbd5@linux.intel.com>
Date: Thu, 9 Aug 2018 23:17:13 -0400
Cc: openbmc@lists.ozlabs.org, prashanth.giri@dell.com, sachit_bakshi@dell.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9DC9FBE9-FD4E-48C3-9AA8-423204DCF039@fuzziesquirrel.com>
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
 <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
 <7B99FD60-9493-4A17-ABF0-D1315D86B1CB@fuzziesquirrel.com>
 <8b4c11b3-d6d7-c586-5d10-9c028d3fefb2@linux.intel.com>
 <27F75378-E985-47F6-8516-086CF8197D85@fuzziesquirrel.com>
 <d20b9c39-38b1-dd91-4847-1a65479c0f51@linux.intel.com>
 <fe79284e-e3d6-a71f-f055-6bcbe899fbd5@linux.intel.com>
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Fri, 10 Aug 2018 03:17:17 -0000


> On Aug 9, 2018, at 8:31 PM, Dave Cobbley =
<david.j.cobbley@linux.intel.com> wrote:
>=20
>>>=20
>>> So to net these all out:
>>>=20
>>> *poky/
>>>=20
>>> *meta-openembedded/
>>> *meta-virtualization/
>>> *meta-security/
>>> *meta-arm/
>>> *meta-openpower/
>>> *meta-x86/
>>> *meta-phosphor/
>>>=20
>>> *meta-aspeed/
>>> *meta-nuvoton/
>>> *meta-raspberrypi/
>>>=20
>>> *meta-intel/
>>> *meta-mellanox/
>>> *meta-portwell/
>>> *meta-quanta/
>>> *meta-ibm/
>>> *meta-ingrasys/
>>> *meta-inventec/
>>> *meta-rackspace/
>>> *meta-qualcomm/
>> Just to clarify - *meta-intel would contain our machine specific =
configurations for particular intel platforms, while *meta-x86 would =
contain image-like things that are generic to all x86 server platforms?
>> Not sure I understand why meta-x86 exists if =
meta-intel/mellanox/portwell/quanta are all on the top level. Meta-x86 =
was simply a folder in my proposal.
> Looking at this further, I believe I understand the difference:
> meta-intel is our actual baseboard products
> meta-x86 is all things that relate specifically to baseboards that =
contain x86 processors.
>=20
> Does that sound right?

Yes, exactly.

>> -Dave
