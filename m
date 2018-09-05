Return-Path: <jason.m.bills@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425GnQ6LyGzF3CV
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 07:20:06 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2018 14:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,334,1531810800"; d="scan'208";a="68685251"
Received: from jmbills-mobl4.amr.corp.intel.com (HELO [10.241.242.43])
 ([10.241.242.43])
 by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2018 14:20:03 -0700
Subject: Re:
To: openbmc@lists.ozlabs.org
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
 <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
 <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
 <434D87DA-9381-4803-94E9-749E442A0C1B@fuzziesquirrel.com>
 <7188732f-d2be-ecf9-9a1d-d27593383b14@intel.com>
 <7DC09EE6-2475-47F4-B43D-34B7FEB94DFE@fuzziesquirrel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <553f925a-5d5e-d31d-7bff-dacc322595f6@linux.intel.com>
Date: Wed, 5 Sep 2018 14:20:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <7DC09EE6-2475-47F4-B43D-34B7FEB94DFE@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 05 Sep 2018 21:20:11 -0000

>>> ok, then this is my ignorance of IPMI showing.  I thought IPMI_SEL_SENSOR_PATH was
>>> an IPMI construct...
>>> If this is the case then why not just call it SENSOR_PATH?  Then other logging formats
>>> could use that metadata key without it being weird that it has ‘ipmi_sel’ in the name
>>> of it.  And can we apply the same logic to the other keys or do some of the other keys
>>> have more complicated translation logic (than none at all as in the case of the sensor
>>> path) ?
>>
>> The thinking was that we would namespace all the parameters using IPMI_SEL to make it clear that was the only place they were used, and to avoid someone else using it inadvertently.
>> With that said, I could understand how it could be confusing.  Jason, any objections to un-namespacing the parameters?
> 
> Thanks for being flexible on this but lets wait until we are on the same page before
> changing anything.  Why would you want to discourage it from being used in another
> context?
> 
Except for the sensor path, all of the proposed IPMI metadata is 
specific for IPMI:
"IPMI_SEL_RECORD_ID" = Two byte unique ID number for each SEL entry
"IPMI_SEL_RECORD_TYPE" = The type of SEL entry (system or OEM) which 
determines the definition of the remaining bytes
"IPMI_SEL_GENERATOR_ID" = The IPMI Generator ID (usually the IPMB Slave 
Address) of the SEL entry requester
"IPMI_SEL_SENSOR_PATH" = Path of the sensor used to find IPMI data (such 
as sensor number) for the sensor
"IPMI_SEL_EVENT_DIR" = Whether the sensor is asserting or de-asserting
"IPMI_SEL_DATA" = Raw binary data included in the SEL entry

I named them all as IPMI_SEL as a group so they would be clearly 
separate and easy to remove in the future.  However, if any of the 
metadata would be useful elsewhere, the names can be more generic.

>>
>>> Thats great!  This is similar to how the phosphor-logging daemon creates dbus error
>>> objects today.
>>> Would you mind elaborating on this daemon and its dbus API?  I’m guessing it would probably
>>> clear up any concerns I have.
>>
>> Patches to phosphor-dbus-interfaces for a suggested interface are being put together as we speak.  Hopefully that will clarify it a little bit.
> 
> Great, thank you.
> 
I have pushed a suggestion for the interface here: 
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/12494/

>>
>>>> While technically it could be a part of phosphor-logging,
>>> That isn’t what I was going for.  If you plan to implement a (separate) daemon that acts on
>>> the journald metadata I think that is right approach too.
>> Agreed.
>>
>>>> we really want it to be easily removable for future platforms that have no need for IPMI, so the thought at this time it to keep it separate.
>>> Agreed.
>>>>
>>>>> Further, if you expand this approach to further log formats other than SEL,
>>>>> won’t the applications become a mess of translation logic from the applications
>>>>> data mode <-> log format in use?
>>>>
>>>> I'm not really following this question.  Are there other binary log formats that we expect to come in the future that aren't text based, and could just be a journald translation?
>>> Yes.  We have a binary format called PEL.  I doubt anyone would be interested in using
>>> it but we need a foundation in OpenBMC that enables us to use it...
>>
>> That makes more sense now.  A quick google on PEL makes it look like it could follow a similar model to what we're doing with IPMI by adding the extra metadata to journald when needed, while still producing the string versions for the basic cases.  By foundation do you mean shared code?  A quick skim of the implementation makes me suspect that there isn't going to be a lot of shared code, although they could share a similar design with a different implementation.
> 
> By foundation I simply mean we need a way to support multiple logging formats that doesn’t
> require every OpenBMC application to know how to translate from its internal data model
> (usually dbus) to N logging formats.
> 
>>
>>>>   So far as I know, IPMI SEL is the only one on my road map that has weird requirements, and needs some translation.
>>> Where is the translation happening?  In the new ipmi-sel daemon?  Or somewhere else?
>>
>> The translation would happen on the "addSel" IPMI command that gets used in-band by most BIOS implementations.  The ipmi-sel daemon will translate the raw bytes to a string, to be used in most modern loggers, along with the IPMI metadata, to be used in IPMI to source the various "get" SEL entry commands.
> 
> That all sounds fine.  But what about applications on the BMC creating SELs for their
> own errors?  Do you want to do that?  How will that work?
> 

An application on the BMC that needs to create a SEL can call the 
IpmiSelAdd method to request a new SEL entry in the journal.
>>
>>>>   I don't expect it to be a mess, and I'm running under the assumption that _most_ daemons won't care about or support IPMI given its limitations.
>>> Well _all_ daemons already support IPMI SEL today.  The problem is just that the
>>> implementation doesn’t scale.  I’m confused by _most_ daemons wouldn’t support
>>> IPMI?
>>
>> That should've clarified that most daemons won't care about IPMI _SEL_, given the extra calls and metadata that needs to be provided to implement it correctly.  My teams intention was to support the minimum subset of SEL that we can for backward compatibility, while providing the advanced logging (journald/syslog/redfish LogService) for a greater level of detail and capability.
>> If this assumption turns out to not be true, and we end up adding IPMI SEL logging to all the daemons, so be it, I think it will still scale, but I really hope that's not the path we go down.
> 
> Oh.  Does this mean you intend for code like Jason originally proposed to _only_ appear in
> the ipmi-sel daemon?  And not in applications like phosphor-hwmon?
> 

Yes, the original proposed code:
             sd_journal_send("MESSAGE=%s", message.c_str(),
                             "PRIORITY=%i", selPriority,
                             "MESSAGE_ID=%s", selMessageId,
                             "IPMI_SEL_RECORD_ID=%d", recordId,
                             "IPMI_SEL_RECORD_TYPE=%x", selSystemType,
                             "IPMI_SEL_GENERATOR_ID=%x", genId,
                             "IPMI_SEL_SENSOR_PATH=%s", path.c_str(),
                             "IPMI_SEL_EVENT_DIR=%x", assert,
                             "IPMI_SEL_DATA=%s", selDataStr,
                             NULL);
will only be in the ipmi-sel daemon.  Applications like phosphor-hwmon 
would use the IpmiSelAdd method to request SEL entries.	
