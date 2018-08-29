Return-Path: <richard.marian.thomaiyar@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420sRQ2fjVzF322
 for <openbmc@lists.ozlabs.org>; Thu, 30 Aug 2018 03:04:17 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2018 10:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,303,1531810800"; d="scan'208";a="70075955"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.76.226])
 ([10.252.76.226])
 by orsmga006.jf.intel.com with ESMTP; 29 Aug 2018 10:04:13 -0700
Subject: Re: Fwd: Reg libpam from yocto - destination folder
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, vernon.mauery@linux.intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <b924fad1-406b-9961-8f93-0915ae1c28f5@linux.intel.com>
 <a88ee822-6f69-534f-9f19-88b0ffeb5da9@linux.intel.com>
Message-ID: <96588000-8587-3b6d-3b6c-c02a8382c82b@linux.intel.com>
Date: Wed, 29 Aug 2018 22:34:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a88ee822-6f69-534f-9f19-88b0ffeb5da9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 29 Aug 2018 17:04:19 -0000

After further investigation, i am aligning with this implementation, and 
want to make sure that community is OK with this approach. Let me know 
community comments, else will go ahead and make changes for the same.

1. We can move all the pam modules from /lib/security to 
/usr/lib/security (i.e. from initramfs to rofs). This way, the size 
issue is going to be resolved (Hope that rofs is having some space to 
include these).

2. Catch will be, if rofs can't be mounted, then user account 
authentication can't be performed, as all pam authentication modules is 
in rofs. (In production systems this should be fine, at-least from 
security point of it), but want to make sure that we are ok with Debug 
images too (or has to update pam configuration files accordingly and 
reload).

Note: Today we enable OpenBMC as password in initramfs /etc/passwd file 
itself (instead of rwfs i.e. obmc-phosphor-image), i feel that this is 
wrong, as this can be used as a hack to corrupt rwfs, and login to linux 
shell and recover the same by using OpenBMC as password   (Even though 
user has updated this root password to different one, as the update 
happens in rwfs and not in initramfs). Will roll out a fix to add root 
password only to obmc-phosphor-image (/etc/shadow) and not in 
initramfs(etc/shadow). Let me know if it is not needed.

Regards,

Richard


On 8/20/2018 11:54 PM, Thomaiyar, Richard Marian wrote:
>
> Hi Brad / Vernon,
>
> Regarding
> https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11497/
> (extending from yocto to receipe-core (to add few more pam modules),
> which is why it is getting added by default in /lib/security, which is
> part of initramfs).
>
> Currently this breaks palmetto, zaius & romulus. Not sure, what should
> be direction in order to fix the build failure (whether to clean / steal
> from rw fs?).
>
> In today's call, there was a question about why it has to be in
> initramfs and not in rofs, and this are the following, and it can be
> changed in different way, if it is not required
>
> i.e If rofs is not mapped / any problem with it, we still need to allow
> the root user login, which require's pam_unix.so in initramfs itself
> i.e. under /lib/security
>
> if above requirement is not needed, then the the same can be pulled and
> installed under /usr/lib/security  (which will be in rofs instead of
> initramfs).
>
> Let me know your thoughts.
>
> regards,
>
> Richard
>
