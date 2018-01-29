Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 693 seconds by postgrey-1.36 at bilbo;
 Tue, 30 Jan 2018 08:19:19 AEDT
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVj7W58SFzDqmy
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 08:19:19 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2018 13:07:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,432,1511856000"; d="scan'208";a="199600127"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.164])
 by fmsmga005.fm.intel.com with ESMTP; 29 Jan 2018 13:07:33 -0800
Date: Mon, 29 Jan 2018 13:07:33 -0800
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: anoo <anoo@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: BMC Image Signing Proposal
Message-ID: <20180129210733.GB113334@mauery>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <1517205405.21006.5.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1517205405.21006.5.camel@aj.id.au>
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
X-List-Received-Date: Mon, 29 Jan 2018 21:19:20 -0000

On 29-Jan-2018 04:26 PM, Andrew Jeffery wrote:
>On Thu, 2018-01-25 at 15:15 -0600, anoo wrote:
>> Hi all,
>>
>> During the hackaton meetup, we touched on BMC image verification and
>> signing and concluded that the community would like to see two
>> verification steps, one prior to writing the image to flash (via digital
>> signature verification), and another one by checking FIT in U-Boot prior
>> to booting from the new image.
>>
>> The proposal would be to implement the digital signature verification
>> first.
>>
>> At a high level, during the build:
>> * A SHA-256 hash would be calculated over tbd files that make up the
>> firmware image.
>> * The hash would be signed by a private key that's part of the
>> repository (community key). Companies could overwrite it with their own
>> private key when building production images.

Can we not store any key in the tree at all, please. If we do, somebody 
will inevitably use that key for production images and be totally 
insecure. Generate a key by default and print a big warning that it is 
being signed by a local (insecure) key and that they should set up keys 
according to some documentation.

Provide a script that can be used to (somewhat) securely store openssl 
keys (with a passphrase) and then request the passphrase for each build. 
This could also be used to securely store keys on an HSM that openssl 
has ENGINE support for.

>> * The encrypted hash (digital signature) and corresponding public key
>> would be added to the firmware image.
>> * Yocto may already provide a way to sign images and generate keys.
>
>I'm starting to look into signing of artefacts as part of the build
>process. Some quick searching suggests Yocto doesn't have support for
>it out of the box, but there is the swupdate project[1] and the
>corresponding meta-swupdate[2] Yocto layer that sound interesting.
>However, it may require a rework of how we manage image updates if we
>were to make use of it. I'll keep poking around, but if anyone has any
>other pointers please let me know.
>
>[1] https://github.com/sbabic/swupdate
>[2] https://github.com/sbabic/meta-swupdate

Whatever mechanism is used to generate the signature should be able to 
be overridden by an environment variable or something. We already do 
something like this for our pre-openbmc generations where a common 
developer key is stored outside the tree, then the image gets re-signed 
with the new key to turn it into a production-signed image. This way, we 
can use different mechanisms for generating the development and 
production signatures (openssl and a remote signing service).

--Vernon


>>
>> On the BMC:
>> * The hash would be calculated on the image files that were uploaded to
>> the BMC.
>> * The signature would be decrypted using an existing public key on the
>> BMC (this validates the new public key delivered with the image is also
>> valid).
>> * Accept image if both values are the same.
>>
>> Any thoughts or comments?
>
>Can you take a look at swupdate and reply with your thoughts?
>
>Cheers,
>
>Andrew
