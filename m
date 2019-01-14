Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dfvD4R5mzDqSg
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 04:03:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 09:03:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,478,1539673200"; d="scan'208";a="267033147"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga004.jf.intel.com with ESMTP; 14 Jan 2019 09:03:45 -0800
Subject: Re: Redfish Software Updates in OpenBMC
To: openbmc@lists.ozlabs.org
References: <CALLMt=rZvQ_yYHA9DmpHEbjNvaJgHPOkZ1qquxJp=ZYam-K-4Q@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <eff505fb-cad7-b0a4-bf1c-42b3f79905d6@intel.com>
Date: Mon, 14 Jan 2019 09:06:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=rZvQ_yYHA9DmpHEbjNvaJgHPOkZ1qquxJp=ZYam-K-4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Mon, 14 Jan 2019 17:03:53 -0000


On 1/10/19 2:43 PM, Andrew Geissler wrote
> Redfish defines a UpdateService schema[a]. An action available on the
> UpdateService is a SimpleUpdate interface. I think the flow to use this would
> look like this:
>
> # Retrieve the URI to upload an image to
> HttpPushUri = GET  /redfish/v1/UpdateService
>
> # Upload firmware image
> ImageURI = POST HttpPushUri

As redfish is written, this is where the flow stops.  The BMC takes over
from here, and updates itself.  One enhancement I'd really like to see
made is to return a reference to a TaskService task, so we can track the
progress as the update is applied.

My understanding is that SimpleUpdate is a flow where the BMC can pull
down an image itself, so the URI is generally not something local to the
BMC, but a remote server that the BMC can connect to.

> The main issue with the above is the loss of our ability to have multiple
> firmware images of the same type in a system and to be able to change the
> priority of them to switch back and forth between them. It's also not obvious
> to me what the target is for the BIOS when doing an update of it? There are OEM
> options for both Actions and Properties if needed (but would be great to avoid).

The piece I think you're missing is the new property that was added in
redfish UpdateService 1.1.1 named HttpPushUriTargets.  It essentially
allows you to define multiple targets for the push flow you outlined
above, although I don't see anyone using it yet.

https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L224

If you want to implement SimpleUpdate, it also supports the Targets
property, which lets you direct where you would like a given payload to
be updated to:

https://github.com/openbmc/bmcweb/blob/c0eb9bd95afa900dc808dce7c2c5fa521ba828f5/static/redfish/v1/schema/UpdateService_v1.xml#L74

One design conflict I'm seeing is that Redfish wasn't really meant to
separate out the upload and activate interfaces.  Personally, I like the
Redfish approach better, as it simplifies things for the user.  Loading
a target with firmware is a single step (upload), instead of 2 (upload
then activate).  Most of the systems I know of use the single step process.

> I looked around a bit at other implementations of the UpdateService.
> SuperMicro[b] and Dell[c] created their own OEM commands for the update
> process (although Dell seems to also support the SimpleUpdate as well[d])
>
> If any of you are reading, I'd appreciate some thoughts on why you went the OEM
> route. Was it for more fine grained control? Or maybe for issues like I
> highlight above with multiple image support?

I can't speak for those companies, but I know that initially there was
no way to do component level updates using the stock schemas.  To
support their customers, a lot of companies ended up building their own
OEM upload mechanisms.  I've seen a lot of cases where Redfish schemas
initially started as an OEM definition, then were standardized later, as
people saw the utility of them.
