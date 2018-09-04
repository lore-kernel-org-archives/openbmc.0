Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424jQF4k7WzF37r
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 09:16:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2018 16:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,330,1531810800"; d="scan'208";a="68401757"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2018 16:16:30 -0700
Subject: Re: Re:
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
 <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
 <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
 <434D87DA-9381-4803-94E9-749E442A0C1B@fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <7188732f-d2be-ecf9-9a1d-d27593383b14@intel.com>
Date: Tue, 4 Sep 2018 16:18:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <434D87DA-9381-4803-94E9-749E442A0C1B@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 04 Sep 2018 23:16:38 -0000

On 09/04/2018 03:34 PM, Brad Bishop wrote:
> 
> ok, then this is my ignorance of IPMI showing.  I thought IPMI_SEL_SENSOR_PATH was
> an IPMI construct...
> 
> If this is the case then why not just call it SENSOR_PATH?  Then other logging formats
> could use that metadata key without it being weird that it has ‘ipmi_sel’ in the name
> of it.  And can we apply the same logic to the other keys or do some of the other keys
> have more complicated translation logic (than none at all as in the case of the sensor
> path) ?

The thinking was that we would namespace all the parameters using 
IPMI_SEL to make it clear that was the only place they were used, and to 
avoid someone else using it inadvertently.  With that said, I could 
understand how it could be confusing.  Jason, any objections to 
un-namespacing the parameters?

> 
> Thats great!  This is similar to how the phosphor-logging daemon creates dbus error
> objects today.
> 
> Would you mind elaborating on this daemon and its dbus API?  I’m guessing it would probably
> clear up any concerns I have.
> 

Patches to phosphor-dbus-interfaces for a suggested interface are being 
put together as we speak.  Hopefully that will clarify it a little bit.

>> While technically it could be a part of phosphor-logging,
> 
> That isn’t what I was going for.  If you plan to implement a (separate) daemon that acts on
> the journald metadata I think that is right approach too.
> 
Agreed.

>> we really want it to be easily removable for future platforms that have no need for IPMI, so the thought at this time it to keep it separate.
> 
> Agreed.
> 
>>
>>> Further, if you expand this approach to further log formats other than SEL,
>>> won’t the applications become a mess of translation logic from the applications
>>> data mode <-> log format in use?
>>
>> I'm not really following this question.  Are there other binary log formats that we expect to come in the future that aren't text based, and could just be a journald translation?
> 
> Yes.  We have a binary format called PEL.  I doubt anyone would be interested in using
> it but we need a foundation in OpenBMC that enables us to use it...
> 

That makes more sense now.  A quick google on PEL makes it look like it 
could follow a similar model to what we're doing with IPMI by adding the 
extra metadata to journald when needed, while still producing the string 
versions for the basic cases.  By foundation do you mean shared code?  A 
quick skim of the implementation makes me suspect that there isn't going 
to be a lot of shared code, although they could share a similar design 
with a different implementation.

>>   So far as I know, IPMI SEL is the only one on my road map that has weird requirements, and needs some translation.
> 
> Where is the translation happening?  In the new ipmi-sel daemon?  Or somewhere else?

The translation would happen on the "addSel" IPMI command that gets used 
in-band by most BIOS implementations.  The ipmi-sel daemon will 
translate the raw bytes to a string, to be used in most modern loggers, 
along with the IPMI metadata, to be used in IPMI to source the various 
"get" SEL entry commands.

> 
>>   I don't expect it to be a mess, and I'm running under the assumption that _most_ daemons won't care about or support IPMI given its limitations.
> 
> Well _all_ daemons already support IPMI SEL today.  The problem is just that the
> implementation doesn’t scale.  I’m confused by _most_ daemons wouldn’t support
> IPMI?
> 

That should've clarified that most daemons won't care about IPMI _SEL_, 
given the extra calls and metadata that needs to be provided to 
implement it correctly.  My teams intention was to support the minimum 
subset of SEL that we can for backward compatibility, while providing 
the advanced logging (journald/syslog/redfish LogService) for a greater 
level of detail and capability.
If this assumption turns out to not be true, and we end up adding IPMI 
SEL logging to all the daemons, so be it, I think it will still scale, 
but I really hope that's not the path we go down.


>> You're right, this isn't intended to be a general solution for all binary logging formats, it's intended to be a short term hack while the industry transitions away from IPMI and toward something easier to generate arbitrarily.
>>
>>> I’d rather have a single approach that works for everyone; although, I’m
>>> not sure how that would look.
>> The single approach is where we started, and weren't able to come up with anything that even came close to working in a production sense.  If you have ideas here on how this could be built that are cleaner than what we're proposing, we're very much interested.
> 
> I’m still trying to understand what is being proposed.
> 
>>
>>> This is called top posting, please try to avoid when using the mail-list.
>>> It makes threaded conversation hard to follow and respond to.  thx.
>>
>> (Ed beats Jason with very big stick)
