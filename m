Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ksY22bHfzDq6t;
 Tue,  7 Aug 2018 08:20:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 15:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="61103253"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2018 15:18:34 -0700
Subject: Re: In-Band Firmware Update
To: Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Robert Lippert <rlippert@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Cc: Sai Dasari <sdasari@fb.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
 <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
 <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <5627e085-571f-02ef-306d-07874eae5109@intel.com>
Date: Mon, 6 Aug 2018 15:20:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 06 Aug 2018 22:20:39 -0000

>> The interface defines some primitives:
>> - BmcBlobGetCount: returns the number of blobs known presently
Is this blobs per object?  Blobs total for the system?

>> - BmcBlobEnumerate: returns the blob's name for an index into the
>> count (index 0 might return "/tmp/bmc-image" or something)
Could this be a well known name rather than an index?  Blob 0 is a lot 
less descriptive than Blob: bmc-image.

>> - BmcBlobOpen: opens the blob and returns a session for future actions
I'm not really following what blob open would do.  What arguments does 
it take?  Would this be on a higher level collection type interface?  is 
BmcBlobReset or BmcBlobClear a better name for the action it's performing?


>> - BmcBlobRead: returns bytes
>> - BmcBlobWrite: writes bytes
Should we put any restrictions on write/read sizes, or leave it up to 
each implementation to enforce?  I'm kind of leaning toward the later, 
although it makes the interface harder to use.
I'm thinking about in band updatable power supplies that can only accept 
writes of a very particular block sizes (I think it's 16 bytes at a time).

>> - BmcBlocCommit: any action the handler wants that basically means, do thing.
>> - BmcBlobClose: closes the file
What is the difference between commit and close?  Close seems like a 
possible implementation of commit, but not necessarily required if Blob 
doesn't represent a file.

>> - BmcBlobDelete: deletes the blob, not always possible.
>> - BmcBlobStat: returns blob metadata
What would this return?

>> - BmcBlobSessionStat: returns metadata specific to the session
? I don't see any other mention of session.  I feel like I'm missing 
part of the picture.

Overall, this looks really interesting.  We have a relatively similar 
interface for shipping SMBIOS and MDR data from BIOS that we had to 
invent to get those fields to work.  I'm not sure if they map 100%, but 
we could likely get it to work with a little massaging to our stuff.  As 
a general purpose interface, it seems very useful, especially in the 
context of firmware update, which could be implemented in any number of 
interfaces.

I'd be interested in separating out the "file like" nature from the 
interface, and keep it as just a "block level" update, that may be a 
file, or may be something else.

I'm also interested in the actual arguments, as well as the distinction 
between a Blob and a BlobSession that I'm not really understanding.

>>
>> It doesn't immediately define actions such as "abort", however, "close
>> without commit" might be equivalent.
I kind of like this about the interface.  Some updates can't really be 
reverted cleanly, so leaving it up to the implementation to decide 
(possibly based on a timeout or something) seems kinda nice to have.

>> Regardless if we want to use it for this, I'd also be willing to
>> upstream our ipmi-blobs handler infrastructure.  It has presently one
>> limitation, and that is that it doesn't support run-time loading of
>> handlers, how ipmid supports finding IPMI libraries.  It is fully
>> contained with the handlers, and they're enabled by configuration
>> flags in the build.  This limitation could be removed if desired.

 From the looks of Vernons IPMI handler rewrite document, runtime 
loading of handler libraries might be out anyway, so I don't think this 
is a non-starter, especially given the timeframes.
