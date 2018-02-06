Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="JI2cot5L"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbBCh2RLmzDqJ0
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 15:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1517890419; x=1549426419;
 h=from:date:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Qy+Y9KP/7pV1FY/cr90FHurtD83k/yvQk6BxcB21riA=;
 b=JI2cot5LhKuujDkkJJNGRpTfwCyPWwhBxsixenofRvN1889xo/i/9S+6
 yeH96JTRufy5nS8yg9+AyQ6COy15iSJcN9TjkmYFxJ3ZSpd2f++4tRf8O
 qVzsI7C9XNIdxKOeYyy1MCGMcWlCuhM1fIVp8Y63M1nai/1zL00tXXqaF o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2E1AQBvLXlamMuZ6ERdGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQnEHAog2WYVIICfI5ciggKGA2FFgKCTVgUAQEBAQEBAQECAQI?=
 =?us-ascii?q?QAQEBAQEICwsGKC+COCQBDktZAQEBAQEBIwIIYgEBAQMBARcLDwFGBQcECxEBA?=
 =?us-ascii?q?gEBAQECAgUTCwMCAg8FFB4DBg4TFIoZCBC6AIIniH+BeAEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBARgFgQ+DW4IVgz+CeDaDLwSBUwaDLTGCNAWTXIZDigkKiA+HO4YRg?=
 =?us-ascii?q?iuGJot2jXCKC4E8NoFzTSNSgjYBD4JVEAyCJVkBjFwsgh0BAQE?=
X-IPAS-Result: =?us-ascii?q?A2E1AQBvLXlamMuZ6ERdGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?nEHAog2WYVIICfI5ciggKGA2FFgKCTVgUAQEBAQEBAQECAQIQAQEBAQEICwsGK?=
 =?us-ascii?q?C+COCQBDktZAQEBAQEBIwIIYgEBAQMBARcLDwFGBQcECxEBAgEBAQECAgUTCwM?=
 =?us-ascii?q?CAg8FFB4DBg4TFIoZCBC6AIIniH+BeAEBAQEBAQEBAQEBAQEBAQEBAQEBARgFg?=
 =?us-ascii?q?Q+DW4IVgz+CeDaDLwSBUwaDLTGCNAWTXIZDigkKiA+HO4YRgiuGJot2jXCKC4E?=
 =?us-ascii?q?8NoFzTSNSgjYBD4JVEAyCJVkBjFwsgh0BAQE?=
Received: from esa5.dell-outbound2.iphmx.com ([68.232.153.203])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2018 22:13:35 -0600
From: Michael E Brown <Michael.E.Brown@dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa5.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2018 10:17:31 +0600
X-LoopCount0: from 10.9.160.254
X-IronPort-AV: E=Sophos;i="5.46,467,1511848800"; d="scan'208";a="1211761976"
X-DLP: DLP_GlobalPCIDSS
Date: Mon, 5 Feb 2018 22:23:11 -0600
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>
Cc: Michael.E.Brown@dell.com, alirhas@microsoft.com, Balaji.B.Rao@dell.com,
 bradleyb@fuzziesquirrel.com, ed.tanous@intel.com, jwcarman@us.ibm.com,
 openbmc@lists.ozlabs.org, Paul.Vancil@dell.com,
 pradeep.kumar36@tcs.com, rolfb@us.ibm.com
Subject: Re: Redfish on OpenBMC
Message-ID: <20180206042309.GA18567@wn7x64-4cggry1.aus.amer.dell.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
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
X-List-Received-Date: Tue, 06 Feb 2018 04:23:29 -0000

On Thu, Feb 01, 2018 at 02:38:57PM +0530, Hariharasubramanian Ramasubramanian wrote:
>    Hi Michael,
>    Thanks for enumerating the attributes for comparison.
>    I want to list down a few additional criteria that may be evaluated:
>    1) Data-Driven Resource Discovery:
>    - The Redfish server should ideally build it's resource model from a
>    "config file". This config file could potentially be hand-coded or
>    built out of a "system definition file". The following are examples of
>    system definition files for 2 of the systems currently running OpenBMC
>    firmware.
>    [1]https://raw.githubusercontent.com/open-power/zaius-xml/master/zaius.
>    xml
>    [2]https://raw.githubusercontent.com/open-power/witherspoon-xml/master/
>    witherspoon.xml
>    The system architecture (sled vs blade etc.), number of processors,
>    number of fans etc. can be determined from the system definition file
>    to generate the config file.
>    The intent is to make the redfish implementation as system agnostic as
>    possible.

Agreed.

I think that the intent would be for the redfish implementation to
automatically discover the system configuration based on what it finds on dbus.
If we cannot configure at runtime based on DBUS apis, then I think the
deficiency would be in the DBUS apis, but I think that ought not be a problem.

>    2) Separation of the Redfish front-end (view) and back-end
>    (infrastructure) layers. The infrastructure API exposed as dbus
>    services would be one of the means to make this separation of concerns.

Agreed.

>    3) Performance :
>    - Runtime memory foot print.This could potentially have a negative
>    impact on "how fast" the server is. Hence the trade-off should consider
>    what can be cached vs what needs to be queried from the infrastructure.

Sounds good.

>    - Michael, why did you consider SSL being separately implemented by the
>    Redfish server? Would this be in the scope of the webserver ?

It's just a data point. Some redfish servers might require us to have a
frontend webserver to handle frontend SSL and proxy, while others might be
appropriate to expose directly on the network.

>    4) Eventing: Current version of the Redfish spec has left it open for
>    the OEMs to define the specific Event Messages. i.e. there is no
>    standard / common Event Registry. Redfish server implementation on the
>    OpenBMC should define this common Event Registry and perhaps accepted
>    by DMTF. Does the Eventing support filtering of events based on the
>    event type, source resource and the message Id ?

Correct, message registry would have to be delivered as part of our
implementation. Adding feature for if redfish eventing filter is supported
would be a good thing to track.

>    5) Leverage existing open source projects:
>    - Does the implementation compose existing services and frameworks ?
>    Such as a webserver(say, nginx) and a rest framework (flask).

Good.
--
Michael

>    regards,
>    Hari !
>    Inactive hide details for ---01/31/2018 10:17:36 PM---So, I think that
>    the first thing we ought to do is get a survey of the di ---01/31/2018
>    10:17:36 PM---So, I think that the first thing we ought to do is get a
>    survey of the different implementations tha
>    From: <Michael.E.Brown@dell.com>
>    To: <bradleyb@fuzziesquirrel.com>
>    Cc: <alirhas@microsoft.com>, <Balaji.B.Rao@dell.com>,
>    <Paul.Vancil@dell.com>, <ed.tanous@intel.com>, <rolfb@us.ibm.com>,
>    <jwcarman@us.ibm.com>, <hramasub@in.ibm.com>,
>    <pradeep.kumar36@tcs.com>, <openbmc@lists.ozlabs.org>
>    Date: 01/31/2018 10:17 PM
>    Subject: RE: Redfish on OpenBMC
>    _______________________________________________________________________
> 
>    So, I think that the first thing we ought to do is get a survey of the
>    different implementations that are out there, and establish criteria
>    for judging different implementations.
>    Here would be a list of questions I would have for everybody on the
>    list. I think it would probably be best to compile all of these into a
>    wiki page somewhere.
>      - Do you have a redfish server implementation?
>      - Is it Open Source?
>    - If not, are you planning on open sourcing it?
>    - What is the license?
>    - Is it posted to github or other public source control?
>      - Does it pass the DMTF redfish service validator?
>      - What language is it written in?
>      - How big is it?
>      - Can it be easily extended/re-used by anybody else shipping
>    compliant openbmc implementations?
>    - Can you add OEM extensions to existing Redfish Resources without
>    "forking" the codebase?
>    - Can you change the implementation for a single Redfish Resource
>    Property without forking?
>    - Can you add new Redfish Resources without forking?
>      - Performance
>    - How fast is it?
>    - Does it implement SSL?
>      - Security
>    - What is the security model?
>    - Non-root support? Can it run as a non-privileged user?
>    - Does it implement basic authentication and the redfish spec
>    x-auth-token authentication?
>    - Does it implement the redfish standard privilege map model?
>      - Eventing:
>    - For writing a UI on top of redfish, something like SSE is a
>    nice-to-have to avoid polling in the browser. There are a couple of
>    proposed SSE extensions that have not yet been approved.
>    - How much work to implement SSE support to do things like watch
>    Property changes?
>    - Is the standard redfish eventing model supported?
>    - Security model integrated with eventing? Do eventing records get the
>    same security treatment as GET requests?
>      - Development: can it run outside of openbmc?
>      - Special sauce: is there anything not captured above that makes the
>    implementation special in any way?
>    --
>    Michael
>    -----Original Message-----
>    From: Brad Bishop [[3]mailto:bradleyb@fuzziesquirrel.com]
>    Sent: Tuesday, January 30, 2018 7:30 PM
>    To: Brown, Michael E <Michael_E_Brown@Dell.com>
>    Cc: alirhas@microsoft.com; Rao, Balaji B <Balaji_B_Rao@dell.com>;
>    Vancil, Paul <Paul_Vancil@Dell.com>; Tanous, Ed <ed.tanous@intel.com>;
>    rolfb@us.ibm.com; jwcarman@us.ibm.com; Hariharasubramanian
>    Ramasubramanian <hramasub@in.ibm.com>; pradeep.kumar36@tcs.com; OpenBMC
>    Maillist <openbmc@lists.ozlabs.org>
>    Subject: Redfish on OpenBMC
>    Hi Michael
>    The project could really use someone to get everyone that has expressed
>    interest in the future of Redfish support in OpenBMC rowing in the same
>    direction.  So thank you for volunteering to lead that conversation at
>    the community call yesterday.
>    I’ve CC’ed everyone that I know of that has expressed an interest.
>    OpenBMC community: feel free to speak up if you’d like to be involved
>    and I forgot you.
>    The only thing I’d ask is to please post links to any meetings,
>    minutes, or correspondence here on the list, so everyone can easily
>    keep up with how things are going or jump in to provide feedback.
>    thanks again
>    -brad
> 
> References
> 
>    1. https://raw.githubusercontent.com/open-power/zaius-xml/master/zaius.xml
>    2. https://raw.githubusercontent.com/open-power/witherspoon-xml/master/witherspoon.xml
>    3. mailto:bradleyb@fuzziesquirrel.com
