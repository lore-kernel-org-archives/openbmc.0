Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sKMs4WkkzF1R9
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 05:34:46 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2018 12:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,437,1520924400"; d="scan'208";a="44515525"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga006.jf.intel.com with ESMTP; 24 May 2018 12:34:40 -0700
Date: Thu, 24 May 2018 12:34:40 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180524193440.GF105329@mauery>
References: <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
 <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
 <20180518210254.GC105329@mauery>
 <CAARXrtnTfgsFNvB4UTBw0_3QodeuCdmG51kAbtdEAMBffffsFQ@mail.gmail.com>
 <20180522153024.GD105329@mauery> <20180522182824.GE105329@mauery>
 <e852980c650798a5b6b431324d9918a4@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e852980c650798a5b6b431324d9918a4@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 24 May 2018 19:34:50 -0000

On 24-May-2018 12:12 PM, Adriana Kobylak wrote:
>On 2018-05-22 13:28, Vernon Mauery wrote:
>>
>>One other thought I had was that we could make the manifest a JSON
>>file which makes for very simple parsing (since the parser is already
>>written).  Then we could go with something like this:
>>
>
>That's a good option, at least for the write to flash piece. We could
>even extend the manifest to include the names of the service files to
>delete/clean up the flash. Most of the rest of the code manages the
>D-Bus objects so that'd be common with all flash layouts.
>
>Another option, or combination with a json manifest, would be to have
>different repos or different subdirectories for specific 
>implementations.

I would prefer not to need to split the implementation, but that may not 
always be possible.

One thing along this line of thinking is that Intel's BMCs don't have 
the notion of field mode, which is baked into the software manager. So 
it might be helpful to have some way to deal with this.

One thought was that external service files executed from the manifest 
could deal with this (keep the OEM service files in external 
repositories).

--Vernon

>
>Lei, thinking we could convert Romulus to ubi, and use the PNOR chip
>to store the alternate BMC version. I think that'd be more straight fwd
>and the advantage would be that the interfaces are tested and verified.
>And on the side we can continue this discussion on how to make the
>code more modular to support other layouts and we can start making
>the changes but at least we can get Romulus using signature validation
>in the mean time.
>
