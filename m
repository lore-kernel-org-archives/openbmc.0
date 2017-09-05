Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xn2L43VvhzDrJ5
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 09:02:35 +1000 (AEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP; 05 Sep 2017 16:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,481,1498546800"; d="scan'208";a="145849400"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.85])
 by orsmga005.jf.intel.com with ESMTP; 05 Sep 2017 16:02:32 -0700
Date: Tue, 5 Sep 2017 16:02:32 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC for event logging mechanism
Message-ID: <20170905230232.GC69617@mauery>
References: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <066b3313-6516-2c05-6c67-4b8d26b50401@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Sep 2017 23:02:37 -0000

On 05-Sep-2017 04:54 PM, Deepak Kodihalli wrote:
> Hello,
> 
> I'm working this sprint on designing an event logging mechanism
> (https://github.com/openbmc/openbmc/issues/1856). I have a couple proposals
> below along with some questions. Hoping to hear thoughts on which might be a
> better proposal. Any other feedback is welcome.
> 
> Potential requirements
> 1) Applications should be able to log events of interest. Events could be
> used for purposes such as telemetry, analytics, debug. Examples of events
> could be changes in the power/thermal domain, such as operating temps on a
> server, boot related, user account changes, etc.
> 2a) Users should be able to query events via REST.
> 2b) Users should also be able to query events of a certain category or type.
> 3) Users should also be able to "download" events in a format such as JSON
> (This comes for free today with the rest server running on OpenBMC).
> 4) It should be possible to specify event metadata, which may have use for a
> human as well as a program.
> 5) It should be possible to persist events up to a certain cap.

6) It should be possible to parse the log to make other formats. (Some 
IPMI users still may want SEL-formatted logs instead of Redfish/REST)

 
> Proposal 1 - Leverage existing OpenBMC phosphor-logging
> 
> Phopshor-logging works as a supplement to journald - at a high level it
> makes it possible to log errors to the journal, as well as create d-bus
> objects representing the errors.
> 
> - Phosphor-logging uses the Entry interface [1] to describe an error. I have
> [2] as the proposed Event interface. It's mostly similar to [1] -
> differences being - I wasn't sure if we really need event severity and
> resolution, plus having an event Category would be handy for handling
> Requirement 2b).
> 
> - Phosphor-logging requires describing errors in yaml (error yaml and error
> metadata yaml), which are processed [3] by a script that generates an error
> log API, which clients can use. The API is part of a phosphor-logging client
> lib. The same yaml structure can be utilized for events, maybe with the yaml
> files themselves being named slightly differently to depict events and event
> metadata instead of errors. This means the client lib will have an event
> API, similar to the existing elog API [6]. Error yaml files are stored
> either in the phosphor-dbus-interfaces repo, or within an application's
> repo, based on whether the error corresponds to a d-bus interface failure or
> not. In case of events, I think the event yaml files can just be stored in
> the app that creates them.
> 
> - The event logging API, in addition to logging to journal, will call an
> internal phosphor-logging d-bus API, similar to [4], in order create a d-bus
> object depicting the event. Based on the event Category, the d-bus object
> will be placed in the right namespace, such as
> /xyz/openbmc_project/logging/events/boot/ or
> /xyz/openbmc_project/logging/events/thermal/. The phosphor-logging process,
> hence, will own these d-bus objects, do the id management (per category),
> etc.
> 

Possibly with the right metadata, it would be possible to filter and 
parse event logs this way into a SEL format. In my ideal world, I want 
to say that we would have one log that we could just 'mine' SEL entries 
from upon request so that we don't have duplicate entries in various 
logs.

> 
> Proposal 2 - Write d-bus interfaces to describe events
> 
> Couple of issues I see with Proposal 1 :
> 
> a) It's cumbersome for a BMC app to figure out that a specific event was
> reported, or to express interest in a certain category of events. The d-bus
> path namespace can help to a certain extent here though, but it's based on
> paths and properties and not interfaces being added.
> b) Both the existing Entry interface [1] and the proposed Event interface
> [2] express metadata as strings, probably not the most elegant way for an
> interested program to deal with them.

Once again, thinking of legacy IPMI interfaces,  something like PEF 
would be a natural fit for this sort of app listening for certain types 
of events. Not every user will want to be using PEF, since it is an 
IPMI-era tool, but for old-school system admin types, this is useful.

--Vernon

> Given this, it feels more natural to express an event in it's own d-bus
> interface, such as an Event.Boot or Event.Thermal interface. So, this
> proposal looks like :
> 
> - Define an Event log interface [5]. Note that this is mostly like [2],
> although it has an additional method to create the event d-bus object.
> 
> - For specific event types, define their own d-bus interfaces. I don't have
> examples for these at the moment, but like I mentioned above, we could have
> interfaces for Event.Boot and Event.Thermal to start with. These interfaces
> could be placed in the phosphor-dbus-interfaces repo. A phosphor-logging
> application will have the code to implement these well-known event
> interfaces, and to basically create d-bus objects. This app will also
> implement the "Notify" method defined in [5].
> 
> - An application interested in reporting an event will make a call to the
> "Notify" API defined in [5], stating the event category and the event
> metadata. The phosphor-logging application that implements "Notify", will
> create d-bus objects based on the event Category and metadata, and place
> them in appropriate d-bus path namespaces, similar to Proposal 1. It can
> also log the event information to the journal, though I am not sure why this
> would be required, aside from the having the need to have the journal as the
> repo of all events.
> 
> 
> 
> [1] https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml
> [2] https://gerrit.openbmc-project.xyz/#/c/6405/1
> [3]
> https://github.com/openbmc/phosphor-logging/blob/master/tools/elog-gen.py,
> error yaml example : https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Dump
> [4]
> https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L27
> [5] https://gerrit.openbmc-project.xyz/#/c/6406/1
> [6] https://github.com/openbmc/phosphor-logging/blob/master/phosphor-logging/elog.hpp#L126
> 
> Regards,
> Deepak
> 
