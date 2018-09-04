Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424fzY0kHczF37f
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 07:26:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2018 14:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,330,1531810800"; d="scan'208";a="68378735"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2018 14:26:44 -0700
Subject: Re: Re:
To: openbmc@lists.ozlabs.org
References: <CBC60E0B5DD8E642ACEAB425D566671AAFEAFCEC@ORSMSX115.amr.corp.intel.com>
 <01AB2862-40A3-4299-928E-9F39C701DD26@fuzziesquirrel.com>
 <CBC60E0B5DD8E642ACEAB425D566671AAFEAFE8D@ORSMSX115.amr.corp.intel.com>
 <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <39203846-e055-d307-e1ee-8d2948166bac@intel.com>
Date: Tue, 4 Sep 2018 14:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <A20568DE-A4DD-4CAF-99F9-C2A69CE1AFEC@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 04 Sep 2018 21:26:49 -0000

On 09/04/2018 01:46 PM, Brad Bishop wrote:
> 
> But it seems like you are proposing that every application that wants to make
> a log needs to have the logic to translate its internal data model to IPMI speak,
> so it can make a journal call with all the IPMI metadata populated.  Am I
> understanding correctly?  That doesn’t seem aligned with keeping IPMI isolated.
> 

I think a key here is that not all logs will be implicitly converted to 
IPMI logs.  Having them be identical was the design that we started 
with, and abandoned because IPMI has some requirements that don't 
cleanly map from a standard syslog/text style to IPMI.


> A concrete example - phosphor-hwmon.  How do you intend to figure out something
> like IPMI_SEL_SENSOR_PATH in the phosphor-hwmon application?  Actually it would
> help quite a bit to understand how each of the fields in your sample below would
> be determined by an arbitrary dbus application (like phosphor-hwmon).

I'm not really understanding the root of the question.  If 
phosphor-hwmon is generating a threshold crossing log that stemmed from 
the /xyz/openbmc_project/sensors/my_super_awesome_temp_sensor, then it 
would simply fill that path into the IPMI_SEL_SENSOR_PATH field.  This 
is the same kind of mapping that the associations produce today, but 
captured in journald instead of the mapper.

Our thinking was that we could build either a static library, or a dbus 
daemon to simplify producing IPMI logs.  Because of the IPMI 
requirements around unique record ids, right now we're leaning toward 
the dbus interface with a single daemon responsible for IPMI SEL creation.
While technically it could be a part of phosphor-logging, we really want 
it to be easily removable for future platforms that have no need for 
IPMI, so the thought at this time it to keep it separate.

> 
> Further, if you expand this approach to further log formats other than SEL,
> won’t the applications become a mess of translation logic from the applications
> data mode <-> log format in use?
> 

I'm not really following this question.  Are there other binary log 
formats that we expect to come in the future that aren't text based, and 
could just be a journald translation?  So far as I know, IPMI SEL is the 
only one on my road map that has weird requirements, and needs some 
translation.  I don't expect it to be a mess, and I'm running under the 
assumption that _most_ daemons won't care about or support IPMI given 
its limitations.
You're right, this isn't intended to be a general solution for all 
binary logging formats, it's intended to be a short term hack while the 
industry transitions away from IPMI and toward something easier to 
generate arbitrarily.

> 
> I’d rather have a single approach that works for everyone; although, I’m
> not sure how that would look.
> 
The single approach is where we started, and weren't able to come up 
with anything that even came close to working in a production sense.  If 
you have ideas here on how this could be built that are cleaner than 
what we're proposing, we're very much interested.

> 
> This is called top posting, please try to avoid when using the mail-list.
> It makes threaded conversation hard to follow and respond to.  thx.
> 

(Ed beats Jason with very big stick)
