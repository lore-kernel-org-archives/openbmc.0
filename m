Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVhjH3C7pzDqpD
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 08:00:02 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2018 12:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="13967827"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by orsmga008.jf.intel.com with ESMTP; 29 Jan 2018 12:59:59 -0800
Date: Mon, 29 Jan 2018 12:59:59 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Simon Glass <sjg@chromium.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180129205959.GA113334@mauery>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <CAPnjgZ3_ZfbnDfjq1zPM6eAN5_3aTzNn8OcFqOgVoKYwu+9=Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3_ZfbnDfjq1zPM6eAN5_3aTzNn8OcFqOgVoKYwu+9=Hg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 21:00:04 -0000

On 29-Jan-2018 08:50 AM, Simon Glass wrote:
>Hi,
>
>On 28 January 2018 at 23:30, Andrew Jeffery <andrew@aj.id.au> wrote:
>> Hi Alexander,
>>
>> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
>>> Hi, Anoo!
>>>
>>> The thoughts are as follows:
>>>
>>> 1. BMC usually runs in a secured environment where probability of
>>> tampering with flash IC contents by means other than BMC's firmware
>>> itself is negligible.
>>
>> This does bring up the issue of developing a threat model to develop
>> against; we should probably do that. However, without one, I feel like
>> we should design *for* defense in depth and allow people to remove
>> protections as they see fit for their environment, rather than make
>> potentially compromising assumptions about what that environment is at
>> the outset.
>>
>> For instance, whilst BMCs might typically be isolated from customer
>> traffic on a separate LAN, there's still the in-band interface which
>> can be used to poke at the BMC. Vulnerabilities in the IPMI stack could
>> lead to BMC compromise and undesirable flash writes*. Therefore BMC
>> flash integrity remains a valid concern despite network isolation.
>>
>> * This ties into Michael Brown's talks of isolating daemons to their
>> own user/group and enforcing SELinux policy against them.

We would prefer that no environment is used for any action of 
consequence. It is completely untrusted, and only used for things like 
hints of preferences. For example, we would store the last preferred 
image (A or B), but ultimately, the one chosen would have to be 
authenticated before booting anyway; it is just the preferred image 
would be checked first and only fall back to the other one if 
verification failed.

Along the same lines, if the user stopped the BMC from automatically 
booting, we are now in a situation where the Linux runtime's root of 
trust could be compromised (specifically by forcing a boot of something 
that does not verify or by passing custom kernel command line 
arguments). I would prefer if there was a way that if stopped in u-boot, 
you would have to reset the BMC to actually boot to the kernel.

>>>
>>> 2. U-Boot already performs image checksum validation before booting a
>>> FIT image
>>
>> Typically the rootfs is not part of the FIT, so it will not be checked.
>>     Some systems supported by OpenBMC directly mount the rootfs rather
>> than booting through an initrd, which makes rootfs authentication
>> somewhat tricky. Regardless, with signed images we should expand the
>> FIT hash check to be a full signature check.
>
>If you use an initrd in the FIT, it can be checked in the same way as
>the kernel. FIT supports a full signature check.
>
>If you use a separate rootfs, verity can be used if it is read-only.
>Otherwise I am not sure.

Historically, we have just booted with an initramfs (squashfs) that is 
the root filesystem. This means that it is possible to update in place 
without worrying about corrupting the current runtime. Normally our 
updates are A->B->A, but we do have one mode that is always in place.

Our current plan was to have our FIT include U-Boot, Linux, rootfs (as 
squashfs), and DTB, with a signature on U-Boot individually, and then 
another signature on all the parts. We would use an SPL to verify the 
signature of U-Boot and then boot it, and then U-Boot would verify the 
signature of the full FIT before booting Linux.

--Vernon

>>>
>>> 3. User input really needs validation, at least to make the system
>>> fool-proof
>>>
>>> Having said that, I suggest that the only thing that really needs doing
>>> is signing (and checking) of the overall firmware image file that is
>>> supplied by the user (admin) during the firmware upgrade procedure.
>>> Applying asymmetric cryptography to a digest hash looks to me like a
>>> good idea as it indeed allows for verifying the supplier of the firmware
>>> image.
>>
>> Agreed - do Yadro do this already? If so, what did you do to integrate
>> image signing into the build process? If not, then I'd be keen to keep
>> the discussion alive on how we can achieve it.
>>
>> Cheers,
>>
>> Andrew
>
>Regards,
>Simon
