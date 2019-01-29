Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pwFF3fBszDqLs
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 05:36:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2019 10:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,537,1539673200"; d="scan'208";a="139839496"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2019 10:36:30 -0800
Subject: Re: SNMP query
To: openbmc@lists.ozlabs.org
References: <CANT4NrJLCLwH6dW9iTD8yMUjdbw-7-ai6YEfw97s0D-sr33Vww@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <b6d75766-87ca-6ed5-6995-255cfeab3518@intel.com>
Date: Tue, 29 Jan 2019 10:38:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CANT4NrJLCLwH6dW9iTD8yMUjdbw-7-ai6YEfw97s0D-sr33Vww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2019 18:36:34 -0000

On 1/29/19 9:31 AM, susan jasinski wrote:
> 
> I am looking for feedback on whether we _should_ implement something
> similar?
It sounds like a pretty reasonable thing, and something that other types
of systems (non BMC) do today.

> 
> - If we do not get a response, then we would provide a validation
> message like "Invalid host name or IP address, or the device did not
> respond to the SNMP query"
> 

What would the backend of this look like?  I don't think we have any
example of anything that "tests" a given settings change without
actually applying it.  Would you make the settings change, then roll it
back if it didn't work?  If that's your flow, you could likely just do
it with the apply button, and drop the "test" button altogether.

The flow could look something like:
1. User clicks apply
2. Webui requests the change from the backend, then subscribes to the
log events.
3. Backend tests the new settings by "querying" the SNMP device
4. Backend logs a signal if the SNMP device didn't respond to a ping.
5. Javascript sees signal, and gives the user the appropriate message
(possibly through Rebeccas new "toast" messages, possibly through the
form validation if the page is still up.

The above flow likely saves you as lot of complexity in implementation,
as most of the infrastructure is already there, there's only a minor
interface change needed (to add the new signal type) and you don't have
to handle the rollback case.

Coming back to the test button idea, if that's the path you're looking
to follow, how would you overcome the HTTP timeout limits?  I believe
our http timeouts are set at 15 seconds, very similar to what the SNMP
timeouts are.  Would you do a "double" request and request the change,
then a second requests to see if it applied?  Would you use the
subscribe API?  How would settings be rolled back?

PS, This list tends to prefer text emails over HTML emails.  I'm not
sure how to configure that in gmail, but it must be doable.

Thanks,

-Ed
